--!native
--!optimize 2
-- https://eryn.io/roblox-lua-promise/docs/Tour

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Promise = require(ReplicatedStorage.Packages.Promise)

local function myFunction()
	return Promise.new(function(resolve, _reject, _onCancel)
		resolve("Promise: Hello world!")
	end)
end

myFunction():andThen(print)
