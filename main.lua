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


    local SpeedToggle = Tabs.Misc:AddToggle("Toggle", {Title = "Increase Speed", Default = false })

    SpeedToggle:OnChanged(function()
        option = Options.Toggle.Value
        print("Speed :",option)
    end)

    
    
