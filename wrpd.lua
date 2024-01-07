local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Luxware-UI-Library/main/Source.lua"))()
local Luxt = Luxtl.CreateWindow("Nephus Hub", 15894229415)

-- Declarations
local songButton = workspace.Settings.selectedsong
local answergui = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.AnswerGui
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = game:GetService("Players").LocalPlayer.PlayerGui

local customAssetID = "15894229415"
local button = Instance.new("ImageButton")
button.Size = UDim2.new(0, 50, 0, 50) 
button.Position = UDim2.new(0.5, -300, 0.5, -100) 
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.Image = "rbxassetid://" .. customAssetID
button.Parent = gui
button.BackgroundColor3 = Color3.new(0, 0, 0) 

-- Functions
function autoguess_normal(a)
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
end

function autolevel(a)
    while a == true do
        local args = {
            [1] = songButton:GetAttribute("Title")
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayAnimation"):FireServer(unpack(args))
        wait(0.1)
    end
end

-- Ui elements

local main = Luxt:Tab("Main", 15894850807)
local misc = Luxt:Tab("Misc", 15894856117)
local credits = Luxt:Tab("Credits", 15894861533)
local sc = credits:Section("Script Credits")
sc:Credit("Sakchem (@me_oaris) -- Discord")
local auto = main:Section("Auto Tasks")
auto:Label("Welcome to Nephus Hub")

auto:Toggle("Auto Guess (Normal)", function(a)
    autoguess_normal(a)
end)

auto:Toggle("Auto Guess (Advanced)", function(a)
    print("In Dev!")
end)

auto:Toggle("Auto Levels *RISKY*", function(a)
    autolevel(a)
end)

button.MouseButton1Click:Connect(function()
    game:GetService('VirtualInputManager'):SendKeyEvent(true,'LeftAlt', false, yes)
end)
