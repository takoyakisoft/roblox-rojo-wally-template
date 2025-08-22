-- https://howmanysmall.github.io/Janitor/api/Janitor#LinkToInstance

local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Janitor = require(Packages.Janitor)

local obliterator = Janitor.new()

obliterator:Add(function()
	print("Janitor: Cleaning up!")
end, true)

do
	local folder = Instance.new("Folder")
	folder.Parent = Workspace
	obliterator:LinkToInstance(folder)

	local part = Instance.new("Part")
	part.Parent = folder
	part.Position = Vector3.new(0, 20, 0)

	task.wait(5)
	folder:Destroy()
end
