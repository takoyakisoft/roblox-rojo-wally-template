-- Auto-generated Roblox API mocks for Studio
-- Generated on: 2026-01-18 22:51:32
local function createWaitForChildPolyfill()
	return function(parent, childName, timeout)
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
		local timeoutSeconds = timeout or 5
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
				warn("WaitForChild('" .. childName .. "') timed out in Mock environment.")
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

serviceMocks["BadgeService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "BadgeService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "BadgeService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["CoreGui"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "CoreGui",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "CoreGui",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["GroupService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "GroupService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "GroupService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["ReplicatedFirst"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "ReplicatedFirst",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ReplicatedFirst",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["StarterPack"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "StarterPack",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "StarterPack",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["Chat"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "Chat",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "Chat",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["ServerStorage"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "ServerStorage",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ServerStorage",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["Workspace"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "Workspace",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "Workspace",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["StarterGui"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "StarterGui",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "StarterGui",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["TeleportService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "TeleportService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "TeleportService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["Players"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "Players",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "Players",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["AssetService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "AssetService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "AssetService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["PathfindingService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "PathfindingService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "PathfindingService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["LeaderboardService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "LeaderboardService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "LeaderboardService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["RunService"] = {
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
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
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
	GetFullName = function(...) end,
	DescendantRemoving = {
		Wait = function(...) end,
		Connect = function(...) end,
	},
	Heartbeat = {
		Connect = function(...) end,
		Wait = function(...) end,
	},
	GetPropertyChangedSignal = function(...) end,
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
serviceMocks["VoiceChatService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "VoiceChatService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "VoiceChatService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["TestService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "TestService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "TestService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["ProximityPromptService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "ProximityPromptService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ProximityPromptService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["Lighting"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "Lighting",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "Lighting",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["ServerScriptService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "ServerScriptService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ServerScriptService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["AvatarEditorService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "AvatarEditorService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "AvatarEditorService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["NetworkService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "NetworkService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "NetworkService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["MarketplaceService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "MarketplaceService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "MarketplaceService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["StudioService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "StudioService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "StudioService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["MessagingService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "MessagingService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "MessagingService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["SocialService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "SocialService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "SocialService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["UserInputService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "UserInputService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "UserInputService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["HttpService"] = {
	JSONDecode = function(self, str)
		return HttpService:JSONDecode(str)
	end,
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
	GetPropertyChangedSignal = function(...) end,
	Name = "HttpService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "HttpService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["CollectionService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "CollectionService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "CollectionService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["StarterPlayer"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "StarterPlayer",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "StarterPlayer",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["GuiService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "GuiService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "GuiService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["GamePassService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "GamePassService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "GamePassService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["LocalizationService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "LocalizationService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "LocalizationService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["SoundService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "SoundService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "SoundService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["InsertService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "InsertService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "InsertService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["MemoryStoreService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "MemoryStoreService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "MemoryStoreService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["DataStoreService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "DataStoreService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "DataStoreService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["FriendService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "FriendService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "FriendService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["Teams"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "Teams",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "Teams",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["ContextActionService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "ContextActionService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ContextActionService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["PointsService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "PointsService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "PointsService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["TweenService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "TweenService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "TweenService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["PhysicsService"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "PhysicsService",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "PhysicsService",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
serviceMocks["ReplicatedStorage"] = {
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
	GetPropertyChangedSignal = function(...) end,
	Name = "ReplicatedStorage",
	GetAttributeChangedSignal = function(...) end,
	FindFirstAncestorWhichIsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildOfClass = function(...) end,
	IsAncestorOf = function(...) end,
	Clone = function(...) end,
	ClassName = "ReplicatedStorage",
	FindFirstAncestor = function(...) end,
	GetAttributes = function(...) end,
	IsA = function(self, className)
		return self.ClassName == className
	end,
	FindFirstChildWhichIsA = function(self, className)
		return self.ClassName == className
	end,
}
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
	mock.FindFirstChild = function()
		return nil
	end
	mock.FindFirstChildOfClass = function()
		return nil
	end
	mock.FindFirstChildWhichIsA = function()
		return nil
	end
	mock.FindFirstAncestor = function()
		return nil
	end
	mock.FindFirstAncestorOfClass = function()
		return nil
	end
	mock.FindFirstAncestorWhichIsA = function()
		return nil
	end
	mock.GetChildren = function()
		return {}
	end
	mock.GetDescendants = function()
		return {}
	end
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
	serviceMocks.RunService.IsStudio = function()
		return true
	end
	serviceMocks.RunService.IsServer = function()
		return true
	end
	serviceMocks.RunService.IsClient = function()
		return false
	end
	serviceMocks.RunService.Heartbeat = createMockSignal()
	serviceMocks.RunService.RenderStepped = createMockSignal()
	serviceMocks.RunService.Stepped = createMockSignal()
end

-- HttpService: at least prevent crash if called
if serviceMocks.HttpService then
	-- NOTE: If you need full JSONEncode/Decode, implement here or replace later.
	-- Keeping simple "not implemented" is better than referencing nil HttpService.
	serviceMocks.HttpService.JSONEncode = function()
		error(
			"HttpService:JSONEncode is not implemented in this mock. Provide an implementation if your tests need it.",
			2
		)
	end
	serviceMocks.HttpService.JSONDecode = function()
		error(
			"HttpService:JSONDecode is not implemented in this mock. Provide an implementation if your tests need it.",
			2
		)
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
	createWaitForChildPolyfill = createWaitForChildPolyfill,
}
