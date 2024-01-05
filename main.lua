local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

-- Custom AssetID for the image you want to use
local customAssetID = "15619828392"

-- Create the ImageButton
local button = Instance.new("ImageButton")
button.Size = UDim2.new(0, 50, 0, 50) -- Set your desired size
button.Position = UDim2.new(0.5, -300, 0.5, -100) -- Center on the screen
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.Image = "rbxassetid://" .. customAssetID
button.Parent = gui

local Window = Fluent:CreateWindow({
    Title = "Nephus Hub V1",
    SubTitle = "by Sakchem",
    TabWidth = 50,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "diamond" })
}

local Options = Fluent.Options
local Toggle = Tabs.Main:AddToggle("auto_guess", {Title = "AutoGuess", Default = false })

Toggle:OnChanged(function()
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    while Options.auto_guess.Value == true do
        wait(0.3)
        
    end
end)

Options.auto_guess:SetValue(false)

local Slider = Tabs.Misc:AddSlider("Slider", {
        Title = "Speed Increase",
        Description = "Increase your walkspeed",
        Default = 16,
        Min = 16,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            if player then
                local playerName = player.Name
                local playerFilePath = game.Workspace:WaitForChild(playerName, math.huge)
        
                if playerFilePath then
                    local humanoid = playerFilePath:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = Value
                    end
                end
            end
        end
    })        


    local SpeedToggle = Tabs.Misc:AddToggle("HyperSpeed", {Title = "Hyper Speed", Default = false })

local function ToggleChanged()
    local player = game.Players.LocalPlayer
    local playerName = player.Name
    local playerFilePath = game.Workspace:WaitForChild(playerName, math.huge)
    local humanoid = playerFilePath:FindFirstChild("Humanoid")
    while Options.HyperSpeed.Value == true do
        humanoid.WalkSpeed = 300
        wait(2)  
    end
end

 SpeedToggle:OnChanged(ToggleChanged)

button.MouseButton1Click:Connect(function()
    game:GetService('VirtualInputManager'):SendKeyEvent(true,'LeftControl', false, yes)
end)
