-- generate_mocks_studio.lua
-- Roblox Studioで実行する完全なモック生成スクリプト
-- WaitForChildポリフィルを含む全Engine APIを出力

local HttpService = game:GetService("HttpService")

-- 包括的なRobloxサービスリスト
local SERVICES = {
	-- コンテナサービス
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

	-- 実行サービス
	"RunService",
	"TestService",
	"NetworkService",
	"PhysicsService",

	-- データサービス
	"DataStoreService",
	"MemoryStoreService",
	"MessagingService",

	-- プレイヤーサービス
	"Players",
	"UserInputService",
	"ContextActionService",

	-- コンテンツサービス
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

	-- UIサービス
	"GuiService",
	"StarterGui",
	"CoreGui",

	-- オーディオサービス
	"SoundService",
	"VoiceChatService",

	-- その他サービス
	"CollectionService",
	"PathfindingService",
	"ProximityPromptService",
	"HttpService",
	"TeleportService",
	"SocialService",
	"StudioService",
}

-- 共通インスタンスメソッド
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

-- 共通インスタンスプロパティ
local INSTANCE_PROPERTIES = {
	"Name",
	"Parent",
	"Archivable",
	"ClassName",
	"RobloxLocked",
}

-- WaitForChildポリフィル実装
local function createWaitForChildPolyfill()
	return function(parent, childName, timeout)
		-- 引数検証
		if typeof(parent) ~= "Instance" then
			error("WaitForChild: parent must be an Instance", 2)
		end

		if type(childName) ~= "string" then
			error("WaitForChild: childName must be a string", 2)
		end

		-- 即座にチェック
		local child = parent:FindFirstChild(childName)
		if child then
			return child
		end

		-- タイムアウト設定
		local startTime = tick()
		local timeoutSeconds = timeout or 30

		-- ChildAddedイベントをリッスン
		local foundChild = nil
		local connection = parent.ChildAdded:Connect(function(child)
			if child.Name == childName then
				foundChild = child
				connection:Disconnect()
			end
		end)

		-- 子が見つかるまで待機
		while not foundChild do
			-- タイムアウトチェック
			if timeoutSeconds > 0 and (tick() - startTime) >= timeoutSeconds then
				connection:Disconnect()
				return nil
			end

			wait(0.1)

			-- 保険のため再チェック
			local checkChild = parent:FindFirstChild(childName)
			if checkChild then
				foundChild = checkChild
				break
			end
		end

		-- クリーンアップ
		if connection then
			connection:Disconnect()
		end

		return foundChild
	end
end

-- サービスモック生成
local function generateServiceMock(serviceName)
	local mock = {}

	-- 共通メソッドを追加
	for _, method in ipairs(INSTANCE_METHODS) do
		if method == "WaitForChild" then
			mock[method] = createWaitForChildPolyfill()
		else
			mock[method] = function() end
		end
	end

	-- 共通プロパティを追加
	for _, prop in ipairs(INSTANCE_PROPERTIES) do
		mock[prop] = serviceName == "Workspace" and "Workspace" or serviceName
	end

	-- サービス固有の実装
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
				wait()
			end,
			Connect = function()
				return { Disconnect = function() end }
			end,
		}
		mock.Stepped = {
			Wait = function()
				wait()
			end,
			Connect = function()
				return { Disconnect = function() end }
			end,
		}
		mock.RenderStepped = {
			Wait = function()
				wait()
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

-- 完全なモックシステム生成
local function generateMockSystem()
	local serviceMocks = {}

	-- 全サービスのモックを生成
	for _, serviceName in ipairs(SERVICES) do
		serviceMocks[serviceName] = generateServiceMock(serviceName)
	end

	-- インスタンスラッパー（WaitForChildポリフィル付き）
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

	-- Enumモック
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

-- モックをファイルに出力
local function outputMocksToFile()
	local mockSystem = generateMockSystem()

	-- 出力用ModuleScriptを作成
	local outputScript = Instance.new("ModuleScript")
	outputScript.Name = "RobloxMocks"
	outputScript.Parent = game.ServerScriptService

	-- Luaコードを生成
	local code = [[
-- Auto-generated Roblox API mocks for Studio
-- Includes WaitForChild polyfill
-- Generated on: ]] .. os.date("%Y-%m-%d %H:%M:%S") .. [[

-- WaitForChildポリフィル実装
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

	-- サービスモックを出力
	for serviceName, mock in pairs(mockSystem.serviceMocks) do
		code = code .. "\nserviceMocks." .. serviceName .. " = {"
		for key, value in pairs(mock) do
			if type(value) == "function" then
				if key == "WaitForChild" then
					code = code .. "\n  " .. key .. " = createWaitForChildPolyfill(),"
				else
					code = code .. "\n  " .. key .. " = function(...) end,"
				end
			elseif type(value) == "table" then
				code = code .. "\n  " .. key .. " = {},"
			elseif type(value) == "string" then
				code = code .. "\n  " .. key .. " = " .. string.format("%q", value) .. ","
			elseif type(value) == "number" then
				code = code .. "\n  " .. key .. " = " .. tostring(value) .. ","
			elseif type(value) == "boolean" then
				code = code .. "\n  " .. key .. " = " .. tostring(value) .. ","
			end
		end
		code = code .. "\n}"
	end

	-- インスタンスラッパーとEnumモックを追加
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

-- 実行
outputMocksToFile()
