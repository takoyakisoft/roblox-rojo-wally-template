-- generate_mocks_studio.lua
-- Complete mock generation script to run in Roblox Studio
-- Outputs all Engine APIs including WaitForChild polyfill

local HttpService = game:GetService("HttpService")

-- Comprehensive Roblox service list
local SERVICES = {
	"Workspace",
	"Lighting",
	"ReplicatedStorage",
	"ReplicatedFirst",
	"ServerScriptService",
	"ServerStorage",
	"StarterGui",
	"StarterPack",
	"StarterPlayer",
	"Teams",
	"SoundService",
	"Chat",
	"LocalizationService",
	"RunService",
	"TestService",
	"NetworkService",
	"PhysicsService",
	"DataStoreService",
	"MemoryStoreService",
	"MessagingService",
	"Players",
	"UserInputService",
	"ContextActionService",
	"TweenService",
	"MarketplaceService",
	"AssetService",
	"InsertService",
	"AvatarEditorService",
	"BadgeService",
	"FriendService",
	"GroupService",
	"LeaderboardService",
	"PointsService",
	"GamePassService",
	"GuiService",
	"CoreGui",
	"VoiceChatService",
	"CollectionService",
	"PathfindingService",
	"ProximityPromptService",
	"HttpService",
	"TeleportService",
	"SocialService",
	"StudioService",
}

local INSTANCE_METHODS = {
	"FindFirstChild",
	"WaitForChild",
	"GetChildren",
	"GetDescendants",
	"IsA",
	"Clone",
	"Destroy",
	"FindFirstAncestor",
	"FindFirstAncestorOfClass",
	"FindFirstAncestorWhichIsA",
	"FindFirstChildOfClass",
	"FindFirstChildWhichIsA",
	"GetFullName",
	"GetPropertyChangedSignal",
	"IsAncestorOf",
	"IsDescendantOf",
	"SetAttribute",
	"GetAttribute",
	"GetAttributes",
	"GetAttributeChangedSignal",
}

local INSTANCE_PROPERTIES = {
	"Name",
	"Parent",
	"Archivable",
	"ClassName",
	"RobloxLocked",
}

local INSTANCE_EVENTS = {
	"ChildAdded",
	"ChildRemoved",
	"DescendantAdded",
	"DescendantRemoving",
}

-- WaitForChild Polyfill Implementation
local function createWaitForChildPolyfill()
	return function(parent, childName, timeout)
		if typeof(parent) ~= "Instance" and type(parent) ~= "table" and type(parent) ~= "userdata" then
			error(`WaitForChild: parent must be an Instance, table, or userdata. Got: {typeof(parent)}`, 2)
		end
		if type(childName) ~= "string" then
			error(`WaitForChild: childName must be a string. Got: {type(childName)}`, 2)
		end

		local child = parent:FindFirstChild(childName)
		if child then
			return child
		end

		local startTime = os.clock()
		local timeoutSeconds = timeout or 5 -- Reduced default for tests to fail faster

		local foundChild = nil
		local connection
		local childAdded = (parent :: any).ChildAdded

		if childAdded and type(childAdded) == "table" and type(childAdded.Connect) == "function" then
			connection = childAdded:Connect(function(c)
				if c.Name == childName then
					foundChild = c
					if connection then
						connection:Disconnect()
						connection = nil
					end
				end
			end)
		end

		while not foundChild do
			if timeoutSeconds > 0 and (os.clock() - startTime) >= timeoutSeconds then
				if connection then
					connection:Disconnect()
				end
				-- Return nil instead of checking infinite yield to allow asserting existence
				return nil
			end
			task.wait(0.1)
			local checkChild = parent:FindFirstChild(childName)
			if checkChild then
				foundChild = checkChild
				break
			end
		end

		if connection then
			connection:Disconnect()
		end
		return foundChild
	end
end

-- Generate Service Mock
local function generateServiceMock(serviceName)
	local mock = {}
	for _, method in ipairs(INSTANCE_METHODS) do
		if method == "WaitForChild" then
			mock[method] = createWaitForChildPolyfill()
		elseif method == "IsA" then
			mock[method] = function(_, className)
				return mock.ClassName == className
			end
		else
			mock[method] = function() end
		end
	end
	for _, prop in ipairs(INSTANCE_PROPERTIES) do
		if prop == "Parent" then
			mock.Parent = nil
		elseif prop == "Archivable" then
			mock.Archivable = true
		elseif prop == "RobloxLocked" then
			mock.RobloxLocked = false
		else
			mock[prop] = serviceName == "Workspace" and "Workspace" or serviceName
		end
	end
	for _, event in ipairs(INSTANCE_EVENTS) do
		mock[event] = {
			Connect = function()
				return { Disconnect = function() end, Connected = true }
			end,
			Wait = function()
				task.wait(0.1)
			end,
		}
	end

	-- Service Specific Overrides (Brief check)
	if serviceName == "RunService" then
		mock.IsStudio = function()
			return true
		end
		mock.IsServer = function()
			return true
		end
		mock.IsClient = function()
			return false
		end
		mock.Heartbeat = {
			Wait = function()
				task.wait()
			end,
			Connect = function()
				return { Disconnect = function() end }
			end,
		}
		mock.RenderStepped = mock.Heartbeat
		mock.Stepped = mock.Heartbeat
	elseif serviceName == "HttpService" then
		mock.JSONEncode = function(_, o)
			return HttpService:JSONEncode(o)
		end
		mock.JSONDecode = function(_, s)
			return HttpService:JSONDecode(s)
		end
	end

	return mock
end

local function outputMocksToFile()
	local mockSystem = { serviceMocks = {} }
	for _, serviceName in ipairs(SERVICES) do
		mockSystem.serviceMocks[serviceName] = generateServiceMock(serviceName)
	end

	local outputScript = Instance.new("ModuleScript")
	outputScript.Name = "RobloxMocks"
	outputScript.Parent = game.ServerScriptService

	local code = [[
-- Auto-generated Roblox API mocks for Studio
-- Generated on: ]] .. os.date("%Y-%m-%d %H:%M:%S") .. [[

local function createWaitForChildPolyfill()
	return function(parent, childName, timeout)
		if typeof(parent) ~= "Instance" and type(parent) ~= "table" and type(parent) ~= "userdata" then
			error("WaitForChild: parent must be an Instance, table, or userdata", 2)
		end
		if type(childName) ~= "string" then
			error("WaitForChild: childName must be a string", 2)
		end
		local child = parent:FindFirstChild(childName)
		if child then return child end

		local startTime = os.clock()
		local timeoutSeconds = timeout or 5
		local foundChild = nil
		local connection
		local childAdded = (parent :: any).ChildAdded

		if childAdded and type(childAdded) == "table" and type(childAdded.Connect) == "function" then
			connection = childAdded:Connect(function(c)
				if c.Name == childName then
					foundChild = c
					if connection then connection:Disconnect() connection = nil end
				end
			end)
		end

		while not foundChild do
			if timeoutSeconds > 0 and (os.clock() - startTime) >= timeoutSeconds then
				if connection then connection:Disconnect() end
				warn("WaitForChild('"..childName.."') timed out in Mock environment.")
				return nil
			end
			task.wait(0.1)
			local checkChild = parent:FindFirstChild(childName)
			if checkChild then foundChild = checkChild break end
		end
		if connection then connection:Disconnect() end
		return foundChild
	end
end

local serviceMocks = {}
]]

	local function serializeValue(val, indent)
		indent = indent or "  "
		local t = type(val)
		if t == "function" then
			return "function(...) end"
		elseif t == "string" then
			return string.format("%q", val)
		elseif t == "number" or t == "boolean" then
			return tostring(val)
		elseif t == "nil" then
			return "nil"
		elseif t == "table" then
			local res = "{"
			for k, v in pairs(val) do
				local valStr
				if k == "WaitForChild" and type(v) == "function" then
					valStr = "createWaitForChildPolyfill()"
				elseif k == "IsA" and type(v) == "function" then
					valStr = "function(self, className) return self.ClassName == className end"
				else
					valStr = serializeValue(v, indent .. "  ")
				end
				res = res .. "\n" .. indent .. "  " .. k .. " = " .. valStr .. ","
			end
			res = res .. "\n" .. indent .. "}"
			return res
		end
		return "nil"
	end

	for serviceName, mock in pairs(mockSystem.serviceMocks) do
		code = code .. "\nserviceMocks[" .. string.format("%q", serviceName) .. "] = {"
		for key, value in pairs(mock) do
			local serialized
			if key == "WaitForChild" and type(value) == "function" then
				serialized = "createWaitForChildPolyfill()"
			elseif (key == "IsA" or key:find("WhichIsA$")) and type(value) == "function" then
				serialized = "function(self, className) return self.ClassName == className end"
			elseif key == "JSONEncode" and serviceName == "HttpService" then
				serialized = "function(self, obj) return HttpService:JSONEncode(obj) end"
			elseif key == "JSONDecode" and serviceName == "HttpService" then
				serialized = "function(self, str) return HttpService:JSONDecode(str) end"
			else
				serialized = serializeValue(value, "  ")
			end
			code = code .. "\n  " .. key .. " = " .. serialized .. ","
		end
		code = code .. "\n}"
	end

	code = code
		.. [[

-- -----------------------------------------------------------------------------
-- Runtime helpers (Lune compatible)
-- -----------------------------------------------------------------------------

local pack = table.pack
local unpack = table.unpack

-- newproxy is available in Roblox, but not guaranteed in Lune. Provide fallback.
local function createProxy(withMetatable)
	if type(newproxy) == "function" then
		return newproxy(withMetatable)
	end
	local obj = {}
	if withMetatable then
		return setmetatable(obj, {})
	end
	return obj
end

-- Key used to unwrap wrapped Instances: proxy[REAL_INSTANCE] -> real Instance
local REAL_INSTANCE = {}

local waitForChildPolyfill = createWaitForChildPolyfill()

local function isWrapped(value)
	if value == nil then
		return false
	end
	local t = type(value)
	if t ~= "table" and t ~= "userdata" then
		return false
	end
	local ok, real = pcall(function()
		return value[REAL_INSTANCE]
	end)
	return ok and typeof(real) == "Instance"
end

local function unwrap(value)
	if isWrapped(value) then
		return value[REAL_INSTANCE]
	end
	return value
end

-- Minimal RBXScriptSignal mock
local function createMockSignal()
	local listeners = {}
	local signal = {}

	function signal:Connect(fn)
		if type(fn) ~= "function" then
			error("Signal:Connect expects a function", 2)
		end
		table.insert(listeners, fn)

		local conn = { Connected = true }
		function conn:Disconnect()
			if not self.Connected then
				return
			end
			self.Connected = false
			for i, cb in ipairs(listeners) do
				if cb == fn then
					table.remove(listeners, i)
					break
				end
			end
		end

		return conn
	end

	function signal:Wait()
		task.wait()
	end

	function signal:Fire(...)
		for _, cb in ipairs(listeners) do
			cb(...)
		end
	end

	return signal
end

-- Patch all generated service mocks so common patterns don't crash (GetChildren, signals, etc.)
local function patchServiceMock(mock)
	if type(mock) ~= "table" then
		return
	end

	mock.__isRobloxMockInstance = true

	-- Instance-y methods (return safe defaults)
	mock.IsA = function(self, className)
		return self.ClassName == className
	end
	mock.FindFirstChild = function() return nil end
	mock.FindFirstChildOfClass = function() return nil end
	mock.FindFirstChildWhichIsA = function() return nil end
	mock.FindFirstAncestor = function() return nil end
	mock.FindFirstAncestorOfClass = function() return nil end
	mock.FindFirstAncestorWhichIsA = function() return nil end
	mock.GetChildren = function() return {} end
	mock.GetDescendants = function() return {} end
	mock.GetFullName = function(self)
		return tostring(self.Name or self.ClassName or "MockInstance")
	end

	-- WaitForChild should exist everywhere in this mock environment
	mock.WaitForChild = waitForChildPolyfill

	-- Common events/signals
	mock.ChildAdded = createMockSignal()
	mock.ChildRemoved = createMockSignal()
	mock.DescendantAdded = createMockSignal()
	mock.DescendantRemoving = createMockSignal()

	mock.GetPropertyChangedSignal = function()
		return createMockSignal()
	end
	mock.GetAttributeChangedSignal = function()
		return createMockSignal()
	end
end

for _, mock in pairs(serviceMocks) do
	patchServiceMock(mock)
end

-- RunService specific (commonly used)
if serviceMocks.RunService then
	serviceMocks.RunService.IsStudio = function() return true end
	serviceMocks.RunService.IsServer = function() return true end
	serviceMocks.RunService.IsClient = function() return false end
	serviceMocks.RunService.Heartbeat = createMockSignal()
	serviceMocks.RunService.RenderStepped = createMockSignal()
	serviceMocks.RunService.Stepped = createMockSignal()
end

-- HttpService: at least prevent crash if called
if serviceMocks.HttpService then
	-- NOTE: If you need full JSONEncode/Decode, implement here or replace later.
	-- Keeping simple "not implemented" is better than referencing nil HttpService.
	serviceMocks.HttpService.JSONEncode = function()
		error("HttpService:JSONEncode is not implemented in this mock. Provide an implementation if your tests need it.", 2)
	end
	serviceMocks.HttpService.JSONDecode = function()
		error("HttpService:JSONDecode is not implemented in this mock. Provide an implementation if your tests need it.", 2)
	end
end

-- -----------------------------------------------------------------------------
-- Instance wrapper
-- -----------------------------------------------------------------------------

local WRAPPER_CACHE = setmetatable({}, { __mode = "k" })
local OVERLAYS = setmetatable({}, { __mode = "k" })

local function wrapInstance(instance, overlay)
	-- already wrapped? -> return as-is
	if isWrapped(instance) then
		return instance
	end

	if typeof(instance) ~= "Instance" then
		return instance
	end

	local cached = WRAPPER_CACHE[instance]
	if cached then
		if overlay ~= nil then
			OVERLAYS[instance] = overlay
		end
		return cached
	end

	if overlay ~= nil then
		OVERLAYS[instance] = overlay
	end

	local proxy = createProxy(true)
	local meta = getmetatable(proxy)

	meta.__index = function(_, key)
		if key == REAL_INSTANCE then
			return instance
		end

		if key == "WaitForChild" then
			return waitForChildPolyfill
		end

		-- DataModel:GetService override (prefer real service, fallback to mocks)
		if key == "GetService" and instance:IsA("DataModel") then
			return function(_, serviceName)
				-- 1. Try real service from the place (pcall safely)
				--    Usage: game:GetService("TestService")
				local ok, realService = pcall(function()
					return instance:GetService(serviceName)
				end)

				if ok and realService ~= nil then
					return wrapInstance(realService, serviceMocks[serviceName])
				end

				-- 2. Fallback to service mock
				local mock = serviceMocks[serviceName]
				if mock ~= nil then
					return mock
				end

				-- 3. If neither, we error or return nil.
				--    Standard Roblox errors if service not found, but we can be nicer or strict.
				error(
					"Mock for service '"
						.. tostring(serviceName)
						.. "' is missing and it does not exist in the .rbxl file.",
					2
				)
			end
		end

		local overlayTable = OVERLAYS[instance]

		-- Safely try to get value from real instance
		local ok, val = pcall(function()
			return instance[key]
		end)
		if not ok then
			val = nil
		end

		local fromOverlay = false

		if val == nil and overlayTable ~= nil then
			val = overlayTable[key]
			if val ~= nil then
				fromOverlay = true
			end
		end

		if typeof(val) == "function" then
			return function(_, ...)
				local args = pack(...)
				for i = 1, args.n do
					args[i] = unwrap(args[i])
				end

				local selfToUse = instance
				if fromOverlay and overlayTable ~= nil then
					selfToUse = overlayTable
				end

				-- Call actual method
				local results = pack(val(selfToUse, unpack(args, 1, args.n)))

				-- Wrap results
				for i = 1, results.n do
					results[i] = wrapInstance(results[i])
				end
				return unpack(results, 1, results.n)
			end
		end

		return wrapInstance(val)
	end

	-- IMPORTANT: allow property assignment like instance.Parent = ...
	meta.__newindex = function(_, key, value)
		-- Unwrapping is critical if we are assigning other wrapped Instances
		instance[key] = unwrap(value)
	end

	meta.__tostring = function()
		return tostring(instance)
	end

	WRAPPER_CACHE[instance] = proxy
	return proxy
end

-- -----------------------------------------------------------------------------
-- Enum mock (cached)
-- -----------------------------------------------------------------------------

local MockEnum = {}
local enumCache = {}

setmetatable(MockEnum, {
	__index = function(_, enumName)
		local existing = enumCache[enumName]
		if existing then
			return existing
		end

		local itemCache = {}
		local enumTable = {}

		setmetatable(enumTable, {
			__index = function(_, itemName)
				local item = itemCache[itemName]
				if item then
					return item
				end

				local enumItem = createProxy(true)
				local mt = getmetatable(enumItem)

				mt.__tostring = function()
					return "Enum." .. tostring(enumName) .. "." .. tostring(itemName)
				end

				itemCache[itemName] = enumItem
				return enumItem
			end,
		})

		enumCache[enumName] = enumTable
		return enumTable
	end,
})

return {
	serviceMocks = serviceMocks,
	wrapInstance = wrapInstance,
	MockEnum = MockEnum,
	REAL_INSTANCE = REAL_INSTANCE,
	WaitForChild = waitForChildPolyfill,
	createWaitForChildPolyfill = createWaitForChildPolyfill
}
]]
	outputScript.Source = code
	print("Roblox mocks generated!")
end

outputMocksToFile()
