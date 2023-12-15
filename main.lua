local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Nephus Hub V1",
    SubTitle = "by Sakchem",
    TabWidth = 100,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Misc", Icon = "diamond" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Nephus Hub",
        Content = "Thankyou for using Nephus!",
        SubContent = "By Sakchem", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })

    Tabs.Main:AddParagraph({
        Title = "Currently Playing:",
        Content = " NaN"
    })

    local Toggle = Tabs.Main:AddToggle("auto_guess", {Title = "Auto Guess", Default = false })

    Toggle:OnChanged(function()
        print("Auto Guess Turned:", Options.auto_guess.Value)
    end)

    Options.auto_guess:SetValue(false)
end
