local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Luxware-UI-Library/main/Source.lua"))()
local Luxt = Luxtl.CreateWindow("Nephus Hub | WRPD 💃", 6105620301)

-- Declarations
local songButton = workspace.Settings.selectedsong
local answergui = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.AnswerGui

-- Ui elements

local main = Luxt:Tab("Main", 6087485864)
local misc = Luxt:Tab("Misc")
local credits = Luxt:Tab("Credits")
local sc = credits:Section("Script Credits")
sc:Credit("Sakchem (@me_oaris) -- Discord")
local auto = main:Section("Auto Tasks")
auto:Label("Welcome to Nephus Hub")

auto:Toggle("Auto Guess (Normal)", function(a)
    while a == true do
        if answergui.Visible == true then
            local args = {
                [1] = songButton:GetAttribute("Title")
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayAnimation"):FireServer(unpack(args))
            answergui.Visible = false
        end
        wait(1)
    end
end)

auto:Toggle("Auto Guess (Advanced)", function(a)
    while a == true do
        -- Add your "Auto Guess (Advanced)" logic here
        wait(0.1)
    end
end)

auto:Toggle("Auto Levels *RISKY*", function(a)
    while a == true do
        local args = {
            [1] = songButton:GetAttribute("Title")
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayAnimation"):FireServer(unpack(args))
        wait(0.1)
    end
end)
