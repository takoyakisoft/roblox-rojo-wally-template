local luneFs = require("@lune/fs")
local luneRoblox = require("@lune/roblox")
local luneLuau = require("@lune/luau")
local luneProcess = require("@lune/process")
local luneTask = require("@lune/task")
local luneStdio = require("@lune/stdio")

-- -----------------------------------------------------------------------------
-- Pretty output / fatal
-- -----------------------------------------------------------------------------

local function writeColor(colorName: string)
	if luneStdio and luneStdio.color and luneStdio.write then
		luneStdio.write(luneStdio.color(colorName))
	end
end

local function resetColor()
	writeColor("reset")
end

local function fatal(message: string, details: any?)
	writeColor("red")
	print(message)
	if details ~= nil then
		print(details)
	end
	resetColor()
	luneProcess.exit(1)
end

local function traceback(err: any): string
	if debug and debug.traceback then
		return debug.traceback(tostring(err), 2)
	end
	return tostring(err)
end

-- -----------------------------------------------------------------------------
-- 1. Load mocks module (roblox_mocks.luau) with a stable environment
-- -----------------------------------------------------------------------------

local MOCKS_FILE = "tests/roblox_mocks.luau"
if not luneFs.isFile(MOCKS_FILE) then
	fatal(`Error: {MOCKS_FILE} not found. Generate/copy roblox_mocks.luau first.`)
end

local mocksSource = luneFs.readFile(MOCKS_FILE)
local okCompileMocks, mocksBytecodeOrErr = pcall(function()
	return luneLuau.compile(mocksSource)
end)
if not okCompileMocks then
	fatal(`Failed to compile {MOCKS_FILE}`, mocksBytecodeOrErr)
end

local function fallbackNewproxy(withMetatable: boolean?)
	local obj = {}
	if withMetatable then
		return setmetatable(obj, {})
	end
	return obj
end

local mocksEnv = {
	-- basics
	assert = assert,
	error = error,
	pcall = pcall,
	xpcall = xpcall,

	tostring = tostring,
	tonumber = tonumber,
	type = type,
	typeof = typeof,

	pairs = pairs,
	ipairs = ipairs,
	next = next,
	select = select,

	getmetatable = getmetatable,
	setmetatable = setmetatable,
	rawequal = rawequal,
	rawget = rawget,
	rawset = rawset,

	-- libs
	math = math,
	string = string,
	table = table,
	os = os,
	utf8 = utf8,
	bit32 = bit32,
	debug = debug,

	-- IMPORTANT: provide task
	task = luneTask,
	wait = luneTask.wait,

	warn = warn,
	print = print,

	-- newproxy may not exist in Lune
	newproxy = newproxy or fallbackNewproxy,
}

local mocksChunk = luneLuau.load(mocksBytecodeOrErr, {
	environment = mocksEnv,
	chunkname = MOCKS_FILE,
})

local okRunMocks, mocksOrErr = xpcall(mocksChunk, traceback)
if not okRunMocks then
	fatal("Failed to execute mocks module (roblox_mocks.luau).", mocksOrErr)
end
local mocks = mocksOrErr

-- -----------------------------------------------------------------------------
-- 2. Load place
-- -----------------------------------------------------------------------------

local PLACE_FILE = "test.rbxl"
if not luneFs.isFile(PLACE_FILE) then
	fatal(`Error: {PLACE_FILE} not found. Build your project before running tests.`)
end

local placeFileContents = luneFs.readFile(PLACE_FILE)
local gameReal = luneRoblox.deserializePlace(placeFileContents)

-- -----------------------------------------------------------------------------
-- 3. Sandbox globals
-- -----------------------------------------------------------------------------

local hostTypeof = typeof

local function tryUnwrap(value: any): any?
	if value == nil then
		return nil
	end

	local tv = type(value)
	if tv ~= "table" and hostTypeof(value) ~= "userdata" then
		return nil
	end

	local ok, real = pcall(function()
		return value[mocks.REAL_INSTANCE]
	end)

	if ok and real ~= nil and hostTypeof(real) == "Instance" then
		return real
	end

	return nil
end

-- Make wrappers look like Instances to code that does typeof(x) == "Instance"
local function sandboxTypeof(value: any): string
	local unwrapped = tryUnwrap(value)
	if unwrapped ~= nil then
		return "Instance"
	end

	if type(value) == "table" and rawget(value, "__isRobloxMockInstance") == true then
		return "Instance"
	end

	return hostTypeof(value)
end

-- Wrap Instance.new so newly created instances are also proxies.
-- This prevents "real Instance" vs "proxy Instance" mixing when setting Parent.
local RealInstanceLib = luneRoblox.Instance
local Instance = setmetatable({}, { __index = RealInstanceLib })
Instance.new = function(className: string, parent: any?)
	local inst = RealInstanceLib.new(className)
	local wrapped = mocks.wrapInstance(inst)
	if parent ~= nil then
		wrapped.Parent = parent
	end
	return wrapped
end

local game = mocks.wrapInstance(gameReal)

local baseEnv = {
	-- Roblox datatypes from Lune
	CFrame = luneRoblox.CFrame,
	Vector3 = luneRoblox.Vector3,
	Vector2 = luneRoblox.Vector2,
	Color3 = luneRoblox.Color3,
	UDim2 = luneRoblox.UDim2,
	UDim = luneRoblox.UDim,
	Instance = Instance,

	Ray = luneRoblox.Ray,
	Rect = luneRoblox.Rect,
	Region3 = luneRoblox.Region3,
	Region3int16 = luneRoblox.Region3int16,
	Vector2int16 = luneRoblox.Vector2int16,
	Vector3int16 = luneRoblox.Vector3int16,
	BrickColor = luneRoblox.BrickColor,
	PathWaypoint = luneRoblox.PathWaypoint,
	Random = luneRoblox.Random,
	TweenInfo = luneRoblox.TweenInfo,
	Axes = luneRoblox.Axes,
	Faces = luneRoblox.Faces,
	NumberRange = luneRoblox.NumberRange,
	NumberSequence = luneRoblox.NumberSequence,
	NumberSequenceKeypoint = luneRoblox.NumberSequenceKeypoint,
	ColorSequence = luneRoblox.ColorSequence,
	ColorSequenceKeypoint = luneRoblox.ColorSequenceKeypoint,
	PhysicalProperties = luneRoblox.PhysicalProperties,

	-- Standard Lua/Luau
	assert = assert,
	error = error,
	getmetatable = getmetatable,
	setmetatable = setmetatable,
	ipairs = ipairs,
	pairs = pairs,
	next = next,
	pcall = pcall,
	xpcall = xpcall,
	print = print,
	warn = warn,
	rawequal = rawequal,
	rawget = rawget,
	rawset = rawset,
	select = select,
	tonumber = tonumber,
	tostring = tostring,
	type = type,
	typeof = sandboxTypeof,
	coroutine = coroutine,

	unpack = table.unpack,
	_VERSION = _VERSION,

	-- libs
	math = math,
	table = table,
	string = string,
	bit32 = bit32,
	utf8 = utf8,
	os = os,
	debug = debug,

	-- scheduler
	task = luneTask,
	wait = luneTask.wait,
	delay = luneTask.delay,
	spawn = luneTask.spawn,
	tick = os.clock,

	-- mocks
	Enum = mocks.MockEnum,
	newproxy = newproxy or fallbackNewproxy,

	game = game,
}

local sharedG = {}
baseEnv._G = sharedG
baseEnv.shared = sharedG

-- workspace global like Roblox
baseEnv.workspace = baseEnv.game:GetService("Workspace")

-- -----------------------------------------------------------------------------
-- 4. require() implementation with better errors
-- -----------------------------------------------------------------------------

local moduleCache = {}
local MODULE_RETURNS_NIL = {}
local requireStack = {}

local function safeFullName(inst)
	local ok, name = pcall(function()
		return inst:GetFullName()
	end)
	return ok and name or tostring(inst)
end

local function formatRequireStack()
	if #requireStack == 0 then
		return ""
	end
	local lines = { "Require stack (most recent last):" }
	for i, inst in ipairs(requireStack) do
		lines[#lines + 1] = `  {i}: {safeFullName(inst)}`
	end
	return table.concat(lines, "\n")
end

local function tracebackWithRequireStack(err)
	local tb = traceback(err)
	local req = formatRequireStack()
	if req ~= "" then
		tb = tb .. "\n\n" .. req
	end
	return tb
end

local envRequire

local function createEnv(scriptInstance)
	-- Use table.clone to ensure all globals are directly present.
	local env = table.clone(baseEnv)

	env.script = mocks.wrapInstance(scriptInstance)
	env.require = function(module)
		return envRequire(module)
	end
	return env
end

envRequire = function(moduleTarget: any)
	local realInstance = tryUnwrap(moduleTarget) or moduleTarget

	if sandboxTypeof(realInstance) ~= "Instance" or not realInstance:IsA("ModuleScript") then
		error(`Attempted to require a non-ModuleScript: {tostring(realInstance)} ({sandboxTypeof(realInstance)})`, 2)
	end

	local cached = moduleCache[realInstance]
	if cached ~= nil then
		if cached == MODULE_RETURNS_NIL then
			return nil
		end
		return cached
	end

	-- Circular dependency check
	for _, m in ipairs(requireStack) do
		if m == realInstance then
			error("Recursive require detected: " .. safeFullName(realInstance), 2)
		end
	end
	table.insert(requireStack, realInstance)

	local function cleanup()
		if requireStack[#requireStack] == realInstance then
			table.remove(requireStack)
		end
	end

	-- Compile
	local okCompile, bytecodeOrErr = pcall(function()
		return luneLuau.compile(realInstance.Source)
	end)
	if not okCompile then
		local msg = ("Failed to compile %s:\n%s"):format(safeFullName(realInstance), tostring(bytecodeOrErr))
		cleanup()
		error(msg, 2)
	end

	local env = createEnv(realInstance)
	local fn = luneLuau.load(bytecodeOrErr, {
		environment = env,
		chunkname = safeFullName(realInstance),
	})

	-- Run with traceback
	local okRun, resultOrTrace = xpcall(fn, tracebackWithRequireStack)
	cleanup()

	if not okRun then
		-- already contains traceback + require stack
		error(resultOrTrace, 0)
	end

	local result = resultOrTrace
	if hostTypeof(result) == "Instance" then
		result = mocks.wrapInstance(result)
	end

	moduleCache[realInstance] = (result == nil and MODULE_RETURNS_NIL or result)
	return result
end

-- -----------------------------------------------------------------------------
-- 5. Find TestEZ (robustly resolve Folder -> init/index)
-- -----------------------------------------------------------------------------

local function resolveToModuleScript(obj)
	if obj == nil then
		return nil
	end
	obj = tryUnwrap(obj) or obj
	if sandboxTypeof(obj) ~= "Instance" then
		return nil
	end

	if obj:IsA("ModuleScript") then
		return obj
	end

	if obj:IsA("Folder") then
		local init = obj:FindFirstChild("init")
		if init and init:IsA("ModuleScript") then
			return init
		end
		local index = obj:FindFirstChild("index")
		if index and index:IsA("ModuleScript") then
			return index
		end

		local src = obj:FindFirstChild("src")
		local resolved = resolveToModuleScript(src)
		if resolved then
			return resolved
		end

		local out = obj:FindFirstChild("out")
		resolved = resolveToModuleScript(out)
		if resolved then
			return resolved
		end

		for _, child in ipairs(obj:GetChildren()) do
			if child:IsA("ModuleScript") then
				return child
			end
		end
	end

	return nil
end

local function findTestEZ()
	local ReplicatedStorage = gameReal:GetService("ReplicatedStorage")

	-- rbxts_include
	local include = ReplicatedStorage:FindFirstChild("rbxts_include")
	if include then
		local nodeModules = include:FindFirstChild("node_modules")
		if nodeModules then
			local rbxts = nodeModules:FindFirstChild("@rbxts")
			if rbxts then
				local pkg = rbxts:FindFirstChild("testez")
				if pkg then
					return resolveToModuleScript(pkg)
				end
			end
		end
	end

	-- Wally/Packages
	local packagesFolders = { "Packages", "DevPackages" }
	for _, folderName in ipairs(packagesFolders) do
		local packages = ReplicatedStorage:FindFirstChild(folderName)
		if packages then
			local direct = packages:FindFirstChild("TestEZ") or packages:FindFirstChild("testez")
			local resolved = resolveToModuleScript(direct)
			if resolved then
				return resolved
			end

			local indexFolder = packages:FindFirstChild("_Index")
			if indexFolder then
				for _, child in ipairs(indexFolder:GetChildren()) do
					if string.lower(child.Name):find("testez") then
						resolved = resolveToModuleScript(child)
						if resolved then
							return resolved
						end
					end
				end
			end
		end
	end

	return nil
end

-- -----------------------------------------------------------------------------
-- 6. Run tests
-- -----------------------------------------------------------------------------

local function run()
	print("--> Starting Test Runner...")

	local testEZModule = findTestEZ()
	if not testEZModule then
		fatal("Could not find TestEZ module in ReplicatedStorage. Ensure packages are installed and built.")
	end

	local TestEZ = envRequire(testEZModule)
	if type(TestEZ) ~= "table" then
		fatal("TestEZ module did not return a table. Package may be broken.")
	end

	local TestBootstrap = TestEZ.TestBootstrap
	if not TestBootstrap then
		fatal("TestEZ.TestBootstrap not found. TestEZ layout/version may have changed.")
	end

	-- test roots
	local testRoots = {}

	local function addRoot(serviceName: string, name: string)
		local service = baseEnv.game:GetService(serviceName)
		local folder = service and service:FindFirstChild(name)
		if folder then
			table.insert(testRoots, folder)
		end
	end

	addRoot("ReplicatedStorage", "Examples")

	if #testRoots == 0 then
		warn("No 'TS' or 'Tests' folders found. Nothing to test.")
		luneProcess.exit(0)
	end

	print(`--> Found {#testRoots} test root(s). Running tests...`)

	local reporter = nil
	if type(TestEZ.Reporters) == "table" then
		reporter = TestEZ.Reporters.TextReporter
	end

	local ok, resultsOrErr = xpcall(function()
		if reporter then
			return TestBootstrap:run(testRoots, reporter)
		end
		return TestBootstrap:run(testRoots)
	end, tracebackWithRequireStack)

	if not ok then
		fatal("TestEZ Critical Error:", resultsOrErr)
	end

	local results = resultsOrErr
	if results and type(results) == "table" then
		if results.failureCount and results.failureCount > 0 then
			print(`\nFAILED: {results.failureCount} test(s) failed.`)
			luneProcess.exit(1)
		end
		if results.errors and #results.errors > 0 then
			print(`\nERROR: {#results.errors} error(s) occurred during testing.`)
			for _, err in ipairs(results.errors) do
				print(err)
			end
			luneProcess.exit(1)
		end
	end

	print("\n--> All tests passed!")
	luneProcess.exit(0)
end

local ok, err = xpcall(run, tracebackWithRequireStack)
if not ok then
	fatal("Unhandled test runner error.", err)
end
