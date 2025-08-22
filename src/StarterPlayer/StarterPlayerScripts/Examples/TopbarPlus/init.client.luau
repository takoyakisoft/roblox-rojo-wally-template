-- https://1foreverhd.github.io/TopbarPlus/features/#one-click-icons

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Icon = require(Packages.TopbarPlus)

local visible = true

Icon.new()
	:setImage(13568966069)
	:bindEvent("deselected", function()
		if visible then
			visible = false
		else
			visible = true
		end
		print(`TopbarPlus: {visible}`)
	end)
	:oneClick()
