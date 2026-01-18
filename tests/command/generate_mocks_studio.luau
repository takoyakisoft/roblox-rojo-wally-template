-- generate_mocks_studio.lua
-- Complete mock generation script to run in Roblox Studio
-- Outputs all Engine APIs including WaitForChild polyfill

local HttpService = game:GetService("HttpService")

-- Comprehensive Roblox service list
local SERVICES = {
	-- Container Services
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

	-- Execution Services
	"RunService",
	"TestService",
	"NetworkService",
	"PhysicsService",

	-- Data Services
	"DataStoreService",
	"MemoryStoreService",
	"MessagingService",

	-- Player Services
	"Players",
	"UserInputService",
	"ContextActionService",

	-- Content Services
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

	-- UI Services
	"GuiService",

	"CoreGui",

	-- Audio Services

	"VoiceChatService",

	-- Other Services
	"CollectionService",
	"PathfindingService",
	"ProximityPromptService",
	"HttpService",
	"TeleportService",
	"SocialService",
	"StudioService",
}

-- Common Instance Methods
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

-- Common Instance Properties
local INSTANCE_PROPERTIES = {
	"Name",
	"Parent",
	"Archivable",
	"ClassName",
	"RobloxLocked",
}

-- WaitForChild Polyfill Implementation
local function createWaitForChildPolyfill()
	return function(parent, childName, timeout)
		-- Argument Validation
		if typeof(parent) ~= "Instance" then
			error("WaitForChild: parent must be an Instance", 2)
		end

		if type(childName) ~= "string" then
			error("WaitForChild: childName must be a string", 2)
		end

		-- Check immediately
		local child = parent:FindFirstChild(childName)
		if child then
			return child
		end

		-- Timeout setup
		local startTime = tick()
		local timeoutSeconds = timeout or 30

		-- Listen for ChildAdded
		local foundChild = nil
		local connection
		connection = parent.ChildAdded:Connect(function(child)
			if child.Name == childName then
				foundChild = child
				if connection then
					connection:Disconnect()
					connection = nil
				end
			end
		end)

		-- Wait until child is found
		while not foundChild do
			-- Timeout check
			if timeoutSeconds > 0 and (tick() - startTime) >= timeoutSeconds then
				connection:Disconnect()
				return nil
			end

			task.wait(0.1)

			-- Re-check for safety
			local checkChild = parent:FindFirstChild(childName)
			if checkChild then
				foundChild = checkChild
				break
			end
		end

		-- Cleanup
		if connection then
			connection:Disconnect()
		end

		return foundChild
	end
end

-- Generate Service Mock
local function generateServiceMock(serviceName)
	local mock = {}

	-- Add common methods
	for _, method in ipairs(INSTANCE_METHODS) do
		if method == "WaitForChild" then
			mock[method] = createWaitForChildPolyfill()
		else
			mock[method] = function() end
		end
	end

	-- Add common properties
	-- Add common properties
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

	-- Service-specific implementation
	if serviceName == "RunService" then
		mock.IsStudio = function()
			return true
		end
		mock.IsRunning = function()
			return false
		end
		mock.IsRunMode = function()
			return false
		end
		mock.IsClient = function()
			return false
		end
		mock.IsServer = function()
			return true
		end
		mock.Heartbeat = {
			Wait = function()
				task.wait()
			end,
			Connect = function()
				return { Disconnect = function() end }
			end,
		}
		mock.Stepped = {
			Wait = function()
				task.wait()
			end,
			Connect = function()
				return { Disconnect = function() end }
			end,
		}
		mock.RenderStepped = {
			Wait = function()
				task.wait()
			end,
			Connect = function()
				return { Disconnect = function() end }
			end,
		}
	elseif serviceName == "TestService" then
		mock.Error = function(_, message)
			warn("[TestService Error] " .. tostring(message))
		end
		mock.Message = function(_, message)
			print("[TestService Message] " .. tostring(message))
		end
		mock.Checkpoint = function() end
	elseif serviceName == "Players" then
		mock.GetPlayers = function()
			return {}
		end
		mock.LocalPlayer = {
			GetMouse = function()
				return {}
			end,
			GetCharacter = function()
				return nil
			end,
			WaitForChild = createWaitForChildPolyfill(),
		}
		mock.PlayerAdded = {
			Connect = function()
				return {}
			end,
		}
		mock.PlayerRemoving = {
			Connect = function()
				return {}
			end,
		}
	elseif serviceName == "DataStoreService" then
		mock.GetDataStore = function()
			return {
				GetAsync = function()
					return nil
				end,
				SetAsync = function() end,
				UpdateAsync = function()
					return nil
				end,
				RemoveAsync = function()
					return nil
				end,
			}
		end
		mock.GetGlobalDataStore = function()
			return mock.GetDataStore()
		end
	elseif serviceName == "HttpService" then
		mock.JSONEncode = function(obj)
			return HttpService:JSONEncode(obj)
		end
		mock.JSONDecode = function(str)
			return HttpService:JSONDecode(str)
		end
		mock.GetAsync = function()
			return {}
		end
		mock.PostAsync = function()
			return ""
		end
	elseif serviceName == "Workspace" then
		mock.CurrentCamera = {
			CFrame = CFrame.new(),
			FieldOfView = 70,
			CameraSubject = nil,
		}
		mock.Terrain = {
			MaxCellSize = 4,
			CellCount = 512,
		}
	elseif serviceName == "ReplicatedStorage" or serviceName == "ServerStorage" then
		mock.WaitForChild = createWaitForChildPolyfill()
	end

	return mock
end

-- Generate Complete Mock System
local function generateMockSystem()
	local serviceMocks = {}

	-- Generate mocks for all services
	for _, serviceName in ipairs(SERVICES) do
		serviceMocks[serviceName] = generateServiceMock(serviceName)
	end

	-- Instance wrapper (with WaitForChild polyfill)
	local REAL_INSTANCE = newproxy()
	local waitForChildPolyfill = createWaitForChildPolyfill()

	local function wrapInstance(instance)
		if typeof(instance) ~= "Instance" then
			return instance
		end

		local proxy = newproxy(true)
		local meta = getmetatable(proxy)

		meta.__index = function(_, key)
			if key == REAL_INSTANCE then
				return instance
			end

			if key == "WaitForChild" then
				return waitForChildPolyfill
			elseif key == "GetService" and instance:IsA("DataModel") then
				return function(_, serviceName)
					if serviceMocks[serviceName] then
						return serviceMocks[serviceName]
					end
					return wrapInstance(instance:GetService(serviceName))
				end
			end

			local val = instance[key]
			if typeof(val) == "function" then
				return function(_, ...)
					local args = { ... }
					for i, v in ipairs(args) do
						if typeof(v) == "userdata" then
							local m = getmetatable(v)
							if m and m.__index then
								local real = v[REAL_INSTANCE]
								if real then
									args[i] = real
								end
							end
						end
					end
					local results = { val(instance, unpack(args)) }
					for i, v in ipairs(results) do
						results[i] = wrapInstance(v)
					end
					return unpack(results)
				end
			end
			return wrapInstance(val)
		end

		meta.__tostring = function()
			return tostring(instance)
		end

		return proxy
	end

	-- Enum Mock
	local MockEnum = setmetatable({}, {
		__index = function(self, serviceName)
			local serviceEnums = setmetatable({}, {
				__index = function(self2, itemName)
					local item = newproxy(true)
					getmetatable(item).__tostring = function()
						return "Enum." .. serviceName .. "." .. itemName
					end
					rawset(self2, itemName, item)
					return item
				end,
			})
			rawset(self, serviceName, serviceEnums)
			return serviceEnums
		end,
	})

	return {
		serviceMocks = serviceMocks,
		wrapInstance = wrapInstance,
		MockEnum = MockEnum,
		REAL_INSTANCE = REAL_INSTANCE,
		WaitForChild = waitForChildPolyfill,
	}
end

-- Output mocks to file
local function outputMocksToFile()
	local mockSystem = generateMockSystem()

	-- Create output ModuleScript
	local outputScript = Instance.new("ModuleScript")
	outputScript.Name = "RobloxMocks"
	outputScript.Parent = game.ServerScriptService

	-- Generate Lua code
	local code = [[
-- Auto-generated Roblox API mocks for Studio
-- Includes WaitForChild polyfill
-- Generated on: ]] .. os.date("%Y-%m-%d %H:%M:%S") .. [[

-- WaitForChild Polyfill Implementation
local function createWaitForChildPolyfill()
    return function(parent, childName, timeout)
        if typeof(parent) ~= "Instance" then
            error("WaitForChild: parent must be an Instance", 2)
        end

        if type(childName) ~= "string" then
            error("WaitForChild: childName must be a string", 2)
        end

        local child = parent:FindFirstChild(childName)
        if child then
            return child
        end

        local startTime = tick()
        local timeoutSeconds = timeout or 30
        local foundChild = nil
        local connection = parent.ChildAdded:Connect(function(child)
            if child.Name == childName then
                foundChild = child
                connection:Disconnect()
            end
        end)

        while not foundChild do
            if timeoutSeconds > 0 and (tick() - startTime) >= timeoutSeconds then
                connection:Disconnect()
                return nil
            end

            wait(0.1)
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

local serviceMocks = {}]]

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

	-- Output service mocks
	for serviceName, mock in pairs(mockSystem.serviceMocks) do
		code = code .. "\nserviceMocks." .. serviceName .. " = {"
		for key, value in pairs(mock) do
			local serialized
			if key == "WaitForChild" and type(value) == "function" then
				serialized = "createWaitForChildPolyfill()"
			else
				serialized = serializeValue(value, "  ")
			end
			code = code .. "\n  " .. key .. " = " .. serialized .. ","
		end
		code = code .. "\n}"
	end

	-- Add Instance wrapper and Enum mock
	code = code
		.. [[

local REAL_INSTANCE = newproxy()
local waitForChildPolyfill = createWaitForChildPolyfill()

local function wrapInstance(instance)
    if typeof(instance) ~= "Instance" then
        return instance
    end

    local proxy = newproxy(true)
    local meta = getmetatable(proxy)

    meta.__index = function(_, key)
        if key == REAL_INSTANCE then
            return instance
        end

        if key == "WaitForChild" then
            return waitForChildPolyfill
        elseif key == "GetService" and instance:IsA("DataModel") then
            return function(_, serviceName)
                if serviceMocks[serviceName] then
                    return serviceMocks[serviceName]
                end
                return wrapInstance(instance:GetService(serviceName))
            end
        end

        local val = instance[key]
        if typeof(val) == "function" then
            return function(_, ...)
                local args = {...}
                for i, v in ipairs(args) do
                    if typeof(v) == "userdata" then
                        local m = getmetatable(v)
                        if m and m.__index then
                            local real = v[REAL_INSTANCE]
                            if real then
                                args[i] = real
                            end
                        end
                    end
                end
                local results = {val(instance, unpack(args))}
                for i, v in ipairs(results) do
                    results[i] = wrapInstance(v)
                end
                return unpack(results)
            end
        end
        return wrapInstance(val)
    end

    meta.__tostring = function()
        return tostring(instance)
    end

    return proxy
end

local MockEnum = setmetatable({}, {
    __index = function(self, serviceName)
        local serviceEnums = setmetatable({}, {
            __index = function(self2, itemName)
                local item = newproxy(true)
                getmetatable(item).__tostring = function()
                    return "Enum." .. serviceName .. "." .. itemName
                end
                rawset(self2, itemName, item)
                return item
            end
        })
        rawset(self, serviceName, serviceEnums)
        return serviceEnums
    end
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
	print("Roblox mocks with WaitForChild polyfill generated!")
	print("Saved to: ServerScriptService.RobloxMocks")
	print("Services covered: " .. #SERVICES)
end

-- Execute
outputMocksToFile()
