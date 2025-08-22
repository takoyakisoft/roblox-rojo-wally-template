-- https://ffrostfall.github.io/ByteNet/api/functions/definePacket/

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packets = require(ReplicatedStorage.Examples.ByteNet:WaitForChild("Packets"))

task.wait(1)

Packets.printSomething.sendToAll({
	message = "Hello, players!",
})
