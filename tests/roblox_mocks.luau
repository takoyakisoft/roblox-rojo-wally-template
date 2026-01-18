-- Auto-generated Roblox API mocks for Studio
-- Includes WaitForChild polyfill
-- Generated on: 2026-01-18 21:04:45
-- WaitForChild Polyfill Implementation
local function createWaitForChildPolyfill()
	return function(parent, childName, timeout)
		-- Relaxed check for mock environment
		if typeof(parent) ~= "Instance" and type(parent) ~= "table" and type(parent) ~= "userdata" then
			error("WaitForChild: parent must be an Instance, table, or userdata", 2)
		end

		if type(childName) ~= "string" then
			error("WaitForChild: childName must be a string", 2)
		end

		local child = parent:FindFirstChild(childName)
		if child then
			return child
		end

		local startTime = os.clock()
		local timeoutSeconds = timeout or 30
		local foundChild = nil
		local connection
		local childAdded = (parent :: any).ChildAdded
		if childAdded and type(childAdded) == "table" and type(childAdded.Connect) == "function" then
			connection = childAdded:Connect(function(child)
				if child.Name == childName then
					foundChild = child
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
					connection = nil
				end
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

local serviceMocks = {}
serviceMocks.BadgeService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "BadgeService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "BadgeService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.CoreGui = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "CoreGui",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "CoreGui",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.GroupService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "GroupService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "GroupService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.ReplicatedFirst = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "ReplicatedFirst",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ReplicatedFirst",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.StarterPack = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "StarterPack",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "StarterPack",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.Chat = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "Chat",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "Chat",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.ServerStorage = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "ServerStorage",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ServerStorage",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.Workspace = {
	Terrain = {
		CellCount = 512,
		MaxCellSize = 4,
	},
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	CurrentCamera = {
		CFrame = nil,
		FieldOfView = 70,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "Workspace",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "Workspace",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.StarterGui = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "StarterGui",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "StarterGui",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.TeleportService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "TeleportService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "TeleportService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.Players = {
	PlayerRemoving = {
		Connect = function(...) end,
	},
	PlayerAdded = {
		Connect = function(...) end,
	},
	Archivable = true,
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetPlayers = function(...) end,
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	LocalPlayer = {
		GetCharacter = function(...) end,
		WaitForChild = createWaitForChildPolyfill(),
		GetMouse = function(...) end,
	},
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "Players",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "Players",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.AssetService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "AssetService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "AssetService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.PathfindingService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "PathfindingService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "PathfindingService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.LeaderboardService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "LeaderboardService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "LeaderboardService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.RunService = {
	FindFirstChild = function(...) end,
	IsClient = function(...) end,
	GetDescendants = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	IsStudio = function(...) end,
	IsServer = function(...) end,
	RenderStepped = {
		Connect = function(...) end,
		Wait = function(...) end,
	},
	Destroy = function(...) end,
	GetAttribute = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	GetPropertyChangedSignal = function(...) end,
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Stepped = {
		Connect = function(...) end,
		Wait = function(...) end,
	},
	ClassName = "RunService",
	GetAttributes = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetChildren = function(...) end,
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	IsDescendantOf = function(...) end,
	Archivable = true,
	Heartbeat = {
		Connect = function(...) end,
		Wait = function(...) end,
	},
	GetFullName = function(...) end,
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	IsRunMode = function(...) end,
	IsRunning = function(...) end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	RobloxLocked = false,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	SetAttribute = function(...) end,
	FindFirstAncestor = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	IsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "RunService",
}
serviceMocks.VoiceChatService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "VoiceChatService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "VoiceChatService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.TestService = {
	Checkpoint = function(...) end,
	Message = function(...) end,
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	Error = function(...) end,
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "TestService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "TestService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.ProximityPromptService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "ProximityPromptService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ProximityPromptService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.Lighting = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "Lighting",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "Lighting",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.ServerScriptService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "ServerScriptService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ServerScriptService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.AvatarEditorService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "AvatarEditorService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "AvatarEditorService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.NetworkService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "NetworkService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "NetworkService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.MarketplaceService = {
	PromptPurchase = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	Name = "MarketplaceService",
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	PlayerOwnsAsset = function(...) end,
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	GetProductInfo = function(self, assetId)
		return {
			Name = "Mock Asset",
			Description = "Mock Description",
			Creator = { Name = "Mock Creator" },
			PriceInRobux = 0,
		}
	end,
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "MarketplaceService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.StudioService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "StudioService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "StudioService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.MessagingService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "MessagingService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "MessagingService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.SocialService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "SocialService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "SocialService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.UserInputService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "UserInputService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "UserInputService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.HttpService = {
	JSONDecode = function(self, str)
		return HttpService:JSONDecode(str)
	end,
	GetAsync = function(...) end,
	PostAsync = function(...) end,
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	JSONEncode = function(self, obj)
		return HttpService:JSONEncode(obj)
	end,
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "HttpService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "HttpService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.CollectionService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "CollectionService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "CollectionService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.StarterPlayer = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "StarterPlayer",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "StarterPlayer",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.GuiService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "GuiService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "GuiService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.GamePassService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "GamePassService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "GamePassService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.LocalizationService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "LocalizationService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "LocalizationService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.SoundService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "SoundService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "SoundService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.InsertService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "InsertService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "InsertService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.MemoryStoreService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "MemoryStoreService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "MemoryStoreService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.DataStoreService = {
	GetGlobalDataStore = function(...) end,
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDataStore = function(...) end,
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "DataStoreService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "DataStoreService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.FriendService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "FriendService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "FriendService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.Teams = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "Teams",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "Teams",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.ContextActionService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "ContextActionService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ContextActionService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.PointsService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "PointsService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "PointsService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.TweenService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "TweenService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "TweenService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.PhysicsService = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "PhysicsService",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "PhysicsService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
}
serviceMocks.ReplicatedStorage = {
	FindFirstChild = function(...) end,
	DescendantAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	GetDescendants = function(...) end,
	GetChildren = function(...) end,
	FindFirstAncestorOfClass = function(...) end,
	ChildRemoved = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	ChildAdded = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	RobloxLocked = false,
	IsDescendantOf = function(...) end,
	SetAttribute = function(...) end,
	GetAttribute = function(...) end,
	Destroy = function(...) end,
	Archivable = true,
	GetFullName = function(...) end,
	WaitForChild = createWaitForChildPolyfill(),
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	Name = "ReplicatedStorage",
	GetAttributeChangedSignal = function(...) end,
	GetPropertyChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ReplicatedStorage",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
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
