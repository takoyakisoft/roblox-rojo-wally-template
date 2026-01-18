-- Auto-generated Complete Roblox API mocks for Studio
-- Includes WaitForChild polyfill
-- Generated on: 2026-01-18 18:58:10

-- WaitForChild Polyfill Implementation
local function createWaitForChildPolyfill()
	return function(parent, childName, timeout)
		-- Validate arguments
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
		local foundChild = nil

		-- Listen for ChildAdded
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

		-- Wait loop
		while not foundChild do
			if timeoutSeconds > 0 and (tick() - startTime) >= timeoutSeconds then
				if connection then
					connection:Disconnect()
				end
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

		if connection then
			connection:Disconnect()
		end

		return foundChild
	end
end

local serviceMocks = {}

serviceMocks.Workspace = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "Workspace",
	Parent = "Workspace",
	Archivable = "Workspace",
	ClassName = "Workspace",
	RobloxLocked = "Workspace",
	CurrentCamera = {
		CFrame = CFrame.new(),
		FieldOfView = 70,
		CameraSubject = nil,
	},
	Terrain = {
		MaxCellSize = 4,
		CellCount = 512,
	},
}

serviceMocks.Lighting = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "Lighting",
	Parent = "Lighting",
	Archivable = "Lighting",
	ClassName = "Lighting",
	RobloxLocked = "Lighting",
}

serviceMocks.ReplicatedStorage = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "ReplicatedStorage",
	Parent = "ReplicatedStorage",
	Archivable = "ReplicatedStorage",
	ClassName = "ReplicatedStorage",
	RobloxLocked = "ReplicatedStorage",
}

serviceMocks.ReplicatedFirst = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "ReplicatedFirst",
	Parent = "ReplicatedFirst",
	Archivable = "ReplicatedFirst",
	ClassName = "ReplicatedFirst",
	RobloxLocked = "ReplicatedFirst",
}

serviceMocks.ServerScriptService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "ServerScriptService",
	Parent = "ServerScriptService",
	Archivable = "ServerScriptService",
	ClassName = "ServerScriptService",
	RobloxLocked = "ServerScriptService",
}

serviceMocks.ServerStorage = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "ServerStorage",
	Parent = "ServerStorage",
	Archivable = "ServerStorage",
	ClassName = "ServerStorage",
	RobloxLocked = "ServerStorage",
}

serviceMocks.StarterGui = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "StarterGui",
	Parent = "StarterGui",
	Archivable = "StarterGui",
	ClassName = "StarterGui",
	RobloxLocked = "StarterGui",
}

serviceMocks.StarterPack = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "StarterPack",
	Parent = "StarterPack",
	Archivable = "StarterPack",
	ClassName = "StarterPack",
	RobloxLocked = "StarterPack",
}

serviceMocks.StarterPlayer = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "StarterPlayer",
	Parent = "StarterPlayer",
	Archivable = "StarterPlayer",
	ClassName = "StarterPlayer",
	RobloxLocked = "StarterPlayer",
}

serviceMocks.Teams = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "Teams",
	Parent = "Teams",
	Archivable = "Teams",
	ClassName = "Teams",
	RobloxLocked = "Teams",
}

serviceMocks.SoundService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "SoundService",
	Parent = "SoundService",
	Archivable = "SoundService",
	ClassName = "SoundService",
	RobloxLocked = "SoundService",
}

serviceMocks.Chat = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "Chat",
	Parent = "Chat",
	Archivable = "Chat",
	ClassName = "Chat",
	RobloxLocked = "Chat",
}

serviceMocks.LocalizationService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "LocalizationService",
	Parent = "LocalizationService",
	Archivable = "LocalizationService",
	ClassName = "LocalizationService",
	RobloxLocked = "LocalizationService",
}

serviceMocks.RunService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "RunService",
	Parent = "RunService",
	Archivable = "RunService",
	ClassName = "RunService",
	RobloxLocked = "RunService",
	IsStudio = function()
		return true
	end,
	IsRunning = function()
		return false
	end,
	IsRunMode = function()
		return false
	end,
	IsClient = function()
		return false
	end,
	IsServer = function()
		return true
	end,
	Heartbeat = {
		Wait = function()
			task.wait()
		end,
		Connect = function()
			return { Disconnect = function() end }
		end,
	},
	Stepped = {
		Wait = function()
			task.wait()
		end,
		Connect = function()
			return { Disconnect = function() end }
		end,
	},
	RenderStepped = {
		Wait = function()
			task.wait()
		end,
		Connect = function()
			return { Disconnect = function() end }
		end,
	},
}

serviceMocks.TestService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "TestService",
	Parent = "TestService",
	Archivable = "TestService",
	ClassName = "TestService",
	RobloxLocked = "TestService",
	Error = function(_, message)
		warn("[TestService Error] " .. tostring(message))
	end,
	Message = function(_, message)
		print("[TestService Message] " .. tostring(message))
	end,
	Checkpoint = function() end,
}

serviceMocks.NetworkService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "NetworkService",
	Parent = "NetworkService",
	Archivable = "NetworkService",
	ClassName = "NetworkService",
	RobloxLocked = "NetworkService",
}

serviceMocks.PhysicsService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "PhysicsService",
	Parent = "PhysicsService",
	Archivable = "PhysicsService",
	ClassName = "PhysicsService",
	RobloxLocked = "PhysicsService",
}

serviceMocks.DataStoreService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "DataStoreService",
	Parent = "DataStoreService",
	Archivable = "DataStoreService",
	ClassName = "DataStoreService",
	RobloxLocked = "DataStoreService",
	GetDataStore = function()
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
	end,
	GetGlobalDataStore = function()
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
	end,
}

serviceMocks.MemoryStoreService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "MemoryStoreService",
	Parent = "MemoryStoreService",
	Archivable = "MemoryStoreService",
	ClassName = "MemoryStoreService",
	RobloxLocked = "MemoryStoreService",
}

serviceMocks.MessagingService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "MessagingService",
	Parent = "MessagingService",
	Archivable = "MessagingService",
	ClassName = "MessagingService",
	RobloxLocked = "MessagingService",
}

serviceMocks.Players = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "Players",
	Parent = "Players",
	Archivable = "Players",
	ClassName = "Players",
	RobloxLocked = "Players",
	GetPlayers = function()
		return {}
	end,
	LocalPlayer = {
		GetMouse = function()
			return {}
		end,
		GetCharacter = function()
			return nil
		end,
		WaitForChild = createWaitForChildPolyfill(),
	},
	PlayerAdded = {
		Connect = function()
			return {}
		end,
	},
	PlayerRemoving = {
		Connect = function()
			return {}
		end,
	},
}

serviceMocks.UserInputService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "UserInputService",
	Parent = "UserInputService",
	Archivable = "UserInputService",
	ClassName = "UserInputService",
	RobloxLocked = "UserInputService",
}

serviceMocks.ContextActionService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "ContextActionService",
	Parent = "ContextActionService",
	Archivable = "ContextActionService",
	ClassName = "ContextActionService",
	RobloxLocked = "ContextActionService",
}

serviceMocks.TweenService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "TweenService",
	Parent = "TweenService",
	Archivable = "TweenService",
	ClassName = "TweenService",
	RobloxLocked = "TweenService",
}

serviceMocks.MarketplaceService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "MarketplaceService",
	Parent = "MarketplaceService",
	Archivable = "MarketplaceService",
	ClassName = "MarketplaceService",
	RobloxLocked = "MarketplaceService",
}

serviceMocks.AssetService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "AssetService",
	Parent = "AssetService",
	Archivable = "AssetService",
	ClassName = "AssetService",
	RobloxLocked = "AssetService",
}

serviceMocks.InsertService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "InsertService",
	Parent = "InsertService",
	Archivable = "InsertService",
	ClassName = "InsertService",
	RobloxLocked = "InsertService",
}

serviceMocks.AvatarEditorService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "AvatarEditorService",
	Parent = "AvatarEditorService",
	Archivable = "AvatarEditorService",
	ClassName = "AvatarEditorService",
	RobloxLocked = "AvatarEditorService",
}

serviceMocks.BadgeService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "BadgeService",
	Parent = "BadgeService",
	Archivable = "BadgeService",
	ClassName = "BadgeService",
	RobloxLocked = "BadgeService",
}

serviceMocks.FriendService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "FriendService",
	Parent = "FriendService",
	Archivable = "FriendService",
	ClassName = "FriendService",
	RobloxLocked = "FriendService",
}

serviceMocks.GroupService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "GroupService",
	Parent = "GroupService",
	Archivable = "GroupService",
	ClassName = "GroupService",
	RobloxLocked = "GroupService",
}

serviceMocks.LeaderboardService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "LeaderboardService",
	Parent = "LeaderboardService",
	Archivable = "LeaderboardService",
	ClassName = "LeaderboardService",
	RobloxLocked = "LeaderboardService",
}

serviceMocks.PointsService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "PointsService",
	Parent = "PointsService",
	Archivable = "PointsService",
	ClassName = "PointsService",
	RobloxLocked = "PointsService",
}

serviceMocks.GamePassService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "GamePassService",
	Parent = "GamePassService",
	Archivable = "GamePassService",
	ClassName = "GamePassService",
	RobloxLocked = "GamePassService",
}

serviceMocks.GuiService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "GuiService",
	Parent = "GuiService",
	Archivable = "GuiService",
	ClassName = "GuiService",
	RobloxLocked = "GuiService",
}

serviceMocks.StarterGui = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "StarterGui",
	Parent = "StarterGui",
	Archivable = "StarterGui",
	ClassName = "StarterGui",
	RobloxLocked = "StarterGui",
}

serviceMocks.CoreGui = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "CoreGui",
	Parent = "CoreGui",
	Archivable = "CoreGui",
	ClassName = "CoreGui",
	RobloxLocked = "CoreGui",
}

serviceMocks.SoundService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "SoundService",
	Parent = "SoundService",
	Archivable = "SoundService",
	ClassName = "SoundService",
	RobloxLocked = "SoundService",
}

serviceMocks.VoiceChatService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "VoiceChatService",
	Parent = "VoiceChatService",
	Archivable = "VoiceChatService",
	ClassName = "VoiceChatService",
	RobloxLocked = "VoiceChatService",
}

serviceMocks.CollectionService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "CollectionService",
	Parent = "CollectionService",
	Archivable = "CollectionService",
	ClassName = "CollectionService",
	RobloxLocked = "CollectionService",
}

serviceMocks.PathfindingService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "PathfindingService",
	Parent = "PathfindingService",
	Archivable = "PathfindingService",
	ClassName = "PathfindingService",
	RobloxLocked = "PathfindingService",
}

serviceMocks.ProximityPromptService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "ProximityPromptService",
	Parent = "ProximityPromptService",
	Archivable = "ProximityPromptService",
	ClassName = "ProximityPromptService",
	RobloxLocked = "ProximityPromptService",
}

serviceMocks.HttpService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "HttpService",
	Parent = "HttpService",
	Archivable = "HttpService",
	ClassName = "HttpService",
	RobloxLocked = "HttpService",
	JSONEncode = function(obj)
		return game:GetService("HttpService"):JSONEncode(obj)
	end,
	JSONDecode = function(str)
		return game:GetService("HttpService"):JSONDecode(str)
	end,
	GetAsync = function()
		return {}
	end,
	PostAsync = function()
		return ""
	end,
}

serviceMocks.TeleportService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "TeleportService",
	Parent = "TeleportService",
	Archivable = "TeleportService",
	ClassName = "TeleportService",
	RobloxLocked = "TeleportService",
}

serviceMocks.SocialService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "SocialService",
	Parent = "SocialService",
	Archivable = "SocialService",
	ClassName = "SocialService",
	RobloxLocked = "SocialService",
}

serviceMocks.StudioService = {
	FindFirstChild = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetChildren = function(...) end,
	GetDescendants = function(...) end,
	IsA = function(...) end,
	Clone = function(...) end,
	Destroy = function(...) end,
	FindFirstAncestor = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	FindFirstAncestorWhichIsA = function(...) end,
	FindFirstChildOfClass = function(...) end,
	FindFirstChildWhichIsA = function(...) end,
	GetFullName = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	IsAncestorOf = function(...) end,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	GetAttributes = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	Name = "StudioService",
	Parent = "StudioService",
	Archivable = "StudioService",
	ClassName = "StudioService",
	RobloxLocked = "StudioService",
}

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
	createWaitForChildPolyfill = createWaitForChildPolyfill,
}
