--!native
--!optimize 2
-- https://ffrostfall.github.io/ByteNet/api/functions/definePacket/

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ByteNet = require(ReplicatedStorage.Packages.ByteNet)

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
