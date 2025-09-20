--!native
--!optimize 2
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)

local function CounterWithClose()
	local count, setCount = React.useState(0)
	local isVisible, setIsVisible = React.useState(true)

	if not isVisible then
		return nil
	end

	return React.createElement("ScreenGui", {}, {
		MainFrame = React.createElement("Frame", {
			Size = UDim2.new(0, 300, 0, 200),
			Position = UDim2.new(0.5, -150, 0.5, -100),
			BackgroundColor3 = Color3.fromRGB(240, 240, 240),
		}, {
			CounterLabel = React.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 50),
				Position = UDim2.new(0, 0, 0, 20),
				Text = string.format("Count: %d", count),
				TextSize = 24,
				BackgroundTransparency = 1,
			}),

			IncrementButton = React.createElement("TextButton", {
				Size = UDim2.new(0, 100, 0, 40),
				Position = UDim2.new(0, 50, 0, 80),
				Text = "+1",
				TextSize = 18,
				[React.Event.Activated] = function()
					setCount(count + 1)
				end,
			}),

			DecrementButton = React.createElement("TextButton", {
				Size = UDim2.new(0, 100, 0, 40),
				Position = UDim2.new(0, 150, 0, 80),
				Text = "-1",
				TextSize = 18,
				[React.Event.Activated] = function()
					setCount(count - 1)
				end,
			}),

			CloseButton = React.createElement("TextButton", {
				Size = UDim2.new(0, 80, 0, 30),
				Position = UDim2.new(1, -90, 0, 10),
				Text = "X",
				TextSize = 16,
				BackgroundColor3 = Color3.fromRGB(255, 100, 100),
				[React.Event.Activated] = function()
					setIsVisible(false)
				end,
			}),
		}),
	})
end

local container = Instance.new("Folder")
container.Parent = Players.LocalPlayer.PlayerGui

local root = ReactRoblox.createRoot(container)
root:render(React.createElement(CounterWithClose))
