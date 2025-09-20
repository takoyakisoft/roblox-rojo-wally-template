--!native
--!optimize 2
-- https://roblox.github.io/testez/getting-started/running-tests/

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TestEZ = require(ReplicatedStorage.DevPackages.TestEZ)

TestEZ.TestBootstrap:run({
	game:GetService("ReplicatedStorage").Examples.TestEZ,
})
