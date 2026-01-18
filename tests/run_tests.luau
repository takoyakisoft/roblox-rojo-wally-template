local lune = require("@lune/fs")
local roblox = require("@lune/roblox")
local luau = require("@lune/luau")
local process = require("@lune/process")
local task = require("@lune/task")

-- 0. Inject Roblox Globals into _G for general usage
_G.CFrame = roblox.CFrame
_G.Vector3 = roblox.Vector3
_G.Vector2 = roblox.Vector2
_G.Color3 = roblox.Color3
_G.UDim2 = roblox.UDim2
_G.UDim = roblox.UDim
_G.Instance = roblox.Instance
_G.Enum = roblox.Enum
_G.task = task
_G.wait = task.wait
_G.tick = os.clock

-- 1. Load the mock system MANUALLY to guarantee environment injection
-- Standard 'require' might not propagate _G or env changes as expected directly to top-level code in the module
local mocksSource = lune.readFile("tests/roblox_mocks.luau")
local mocksEnv = setmetatable({}, { __index = _G })

-- Explicitly inject types into the mocks environment
mocksEnv.CFrame = roblox.CFrame
mocksEnv.Vector3 = roblox.Vector3
mocksEnv.Instance = roblox.Instance
mocksEnv.Enum = roblox.Enum
mocksEnv.task = task
mocksEnv.wait = task.wait

local mocksBytecode = luau.compile(mocksSource)
local mocksFn = luau.load(mocksBytecode, { environment = mocksEnv })
local mocks = mocksFn()

-- 2. Load DataModel
local file = lune.readFile("test.rbxl")
local gameReal = roblox.deserializePlace(file)

-- 3. Create a more intelligent Proxy
local function smartWrap(instance)
	if typeof(instance) ~= "Instance" then
		return instance
	end

	local proxy = newproxy(true)
	local meta = getmetatable(proxy)

	meta.__index = function(_, key)
		if key == mocks.REAL_INSTANCE then
			return instance
		end

		-- Intercept GetService to prefer real storage services over empty mocks
		if key == "GetService" and instance:IsA("DataModel") then
			return function(_, serviceName)
				if mocks.serviceMocks[serviceName] then
					return mocks.serviceMocks[serviceName]
				end
				return smartWrap(instance:GetService(serviceName))
			end
		end

		-- Polyfill for methods missing in Lune's Instance
		if key == "WaitForChild" then
			return function(_, name)
				return smartWrap(instance:FindFirstChild(name))
			end
		elseif key == "GetPropertyChangedSignal" then
			return function()
				return {
					Connect = function()
						return { Disconnect = function() end }
					end,
				}
			end
		end

		-- Forward to real instance properties/methods
		local val = instance[key]
		if typeof(val) == "function" then
			return function(_, ...)
				local args = { ... }
				for i, v in ipairs(args) do
					if typeof(v) == "userdata" then
						local m = getmetatable(v)
						if m and m.__index then
							local real = v[mocks.REAL_INSTANCE]
							if real then
								args[i] = real
							end
						end
					end
				end
				local success, results = pcall(function()
					return { val(instance, table.unpack(args)) }
				end)
				if not success then
					-- Fallback for common missing methods in Lune
					if key == "IsA" then
						return false
					end
					error(results) -- results is error message string if failed
				end
				for i, r in ipairs(results) do
					results[i] = smartWrap(r)
				end
				return table.unpack(results)
			end
		end

		-- Ensure traversal methods also return wrapped instances
		if key == "FindFirstChild" or key == "FindFirstChildOfClass" then
			return function(_, name)
				local child = instance[key](instance, name)
				return smartWrap(child)
			end
		elseif key == "GetChildren" or key == "GetDescendants" then
			return function()
				local list = instance[key](instance)
				for i, v in ipairs(list) do
					list[i] = smartWrap(v)
				end
				return list
			end
		end

		return smartWrap(val)
	end

	meta.__tostring = function()
		return tostring(instance)
	end
	return proxy
end

local GameProxy = smartWrap(gameReal)

-- 4. Module Loader
local loadedModules = {}
local NULL_SENTINEL = newproxy()

local function requireInstance(moduleScript)
	if typeof(moduleScript) == "userdata" then
		local real = moduleScript[mocks.REAL_INSTANCE]
		if real then
			moduleScript = real
		end
	end

	if typeof(moduleScript) ~= "Instance" or not moduleScript:IsA("ModuleScript") then
		error("Attempted to require a non-ModuleScript: " .. tostring(moduleScript))
	end

	if loadedModules[moduleScript] then
		local cached = loadedModules[moduleScript]
		if cached == NULL_SENTINEL then
			return nil
		end
		return cached
	end

	local env = setmetatable({}, { __index = _G })
	env.game = GameProxy
	env.workspace = GameProxy.Workspace
	env.script = smartWrap(moduleScript)
	env.Enum = mocks.MockEnum
	env.task = task
	env.tick = os.clock
	env.require = function(target)
		local realTarget = target
		if typeof(target) == "userdata" then
			local real = target[mocks.REAL_INSTANCE]
			if real then
				realTarget = real
			end
		end
		if typeof(realTarget) == "Instance" and realTarget:IsA("ModuleScript") then
			return requireInstance(realTarget)
		end
		return require(target)
	end

	local bytecode = luau.compile(moduleScript.Source)
	local fn = luau.load(bytecode, { environment = env })
	local result = fn()

	loadedModules[moduleScript] = if result == nil then NULL_SENTINEL else result
	return result
end

-- 5. Execution
local ReplicatedStorage = gameReal:GetService("ReplicatedStorage")
local testezFolder = ReplicatedStorage.rbxts_include.node_modules["@rbxts"].testez
local TestEZModule = testezFolder:FindFirstChild("init") or testezFolder:FindFirstChild("src")

if not TestEZModule then
	error("TestEZ module not found!")
end

local TestEZ = requireInstance(TestEZModule)

_G.game = GameProxy
_G.workspace = GameProxy.Workspace
_G.Enum = mocks.MockEnum

local results = TestEZ.TestBootstrap:run({
	GameProxy.ServerScriptService.TS,
	GameProxy.ReplicatedStorage.TS,
})

if results.failureCount > 0 or #results.errors > 0 then
	process.exit(1)
end
