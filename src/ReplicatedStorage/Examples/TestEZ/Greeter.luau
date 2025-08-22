-- https://roblox.github.io/testez/getting-started/writing-tests/

local Greeter = {}

function Greeter:greet(person)
	return "Hello, " .. person
end

return Greeter
