-- https://roblox.github.io/testez/getting-started/running-tests/

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local TestEZ = require(Packages.TestEZ)

TestEZ.TestBootstrap:run({
	game:GetService("ReplicatedStorage").Examples.TestEZ,
})
