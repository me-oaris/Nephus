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


