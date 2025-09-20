-- https://eryn.io/Cmdr/guide/Setup.html

-- This is a script you would create in ServerScriptService, for example.
local ServerScriptService = game:GetService("ServerScriptService")
local Cmdr = require(ServerScriptService.ServerPackages.Cmdr)

Cmdr:RegisterDefaultCommands() -- This loads the default set of commands that Cmdr comes with. (Optional)
-- Cmdr:RegisterCommandsIn(script.Parent.CmdrCommands) -- Register commands from your own folder. (Optional)
