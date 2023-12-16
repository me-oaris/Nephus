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

local Toggle = Tabs.Main:AddToggle("auto_guess", {Title = "Auto Guess", Default = false })

Toggle:OnChanged(function()
    print("Auto Guess Turned:", Options.auto_guess.Value)
end)

Options.auto_guess:SetValue(false)

local SpeedSlider = Tabs.Misc:AddSlider("Slider", {
    Title = "Speed Increase",
    Description = "Set the speed value of the player",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 1,
    Callback = function(Value)
       local playerName = game.Players.LocalPlayer.Name
       local playerFilePath = game.Workspace:WaitForChild(playerName, math.huge)

       if playerFilePath then
                local humanoid = playerFilePath:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = Value
                end
            end
})

SpeedSlider:OnChanged(function(Value)
    print("Slider changed:", Value)
end)

SpeedSlider:SetValue(16)
