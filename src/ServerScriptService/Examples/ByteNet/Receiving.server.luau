-- https://ffrostfall.github.io/ByteNet/api/functions/definePacket/

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packets = require(ReplicatedStorage.Examples.ByteNet:WaitForChild("Packets"))

Packets.printSomething.listen(function(data, player)
	print(`ByteNet: {player.UserId} says {data.message}`)
end)
