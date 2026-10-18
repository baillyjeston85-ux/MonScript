local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local noclip = false

local gui = Instance.new("ScreenGui")
gui.Name = "MobileNoclip"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 140, 0, 50)
button.Position = UDim2.new(0.7, 0, 0.6, 0)
button.Text = "Noclip : OFF"
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
button.Parent = gui

button.Activated:Connect(function()
    noclip = not noclip
    button.Text = noclip and "Noclip : ON" or "Noclip : OFF"
    button.BackgroundColor3 = noclip
        and Color3.fromRGB(50, 180, 80)
        or Color3.fromRGB(200, 50, 50)
end)

local connection
connection = RunService.Stepped:Connect(function()
    if not noclip then return end

    local character = player.Character
    if not character then return end

    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end)
