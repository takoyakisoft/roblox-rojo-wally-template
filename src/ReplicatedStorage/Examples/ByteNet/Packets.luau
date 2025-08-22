-- https://ffrostfall.github.io/ByteNet/api/functions/definePacket/

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local ByteNet = require(Packages.ByteNet)

return ByteNet.defineNamespace("messaging", function()
	return {
		printSomething = ByteNet.definePacket({
			-- This value field is very important!
			value = ByteNet.struct({
				message = ByteNet.string,
			}),
			reliabilityType = "reliable",
		}),
	}
end)
