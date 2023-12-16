local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Nephus Hub V1",
    SubTitle = "by Sakchem",
    TabWidth = 100,
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

Tabs.Main:AddParagraph({
    Title = "Currently Playing:",
    Content = " NaN"
})

local Toggle = Tabs.Main:AddToggle("auto_guess", {Title = "AutoGuess", Default = false })

Toggle:OnChanged(function()
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    while Options.auto_guess.Value == true do
        wait(0.3)
        rootPart.CFrame = CFrame.new(-28.8715343, 10.38292503, -140.642776, -1, 0, 0, 0, 1, 0, 0, 0, -1)
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
        wait(2)  -- Add a delay of 2 seconds before printing again
    end
end

 SpeedToggle:OnChanged(ToggleChanged)
