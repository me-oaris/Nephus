local Flux = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt")()


-- Functions
_G.autolevel = false
_G.autoguess_normal = false

-- Declatarions
local songButton = workspace.Settings.selectedsong
local answergui = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.AnswerGui
-- UI elements
local win = Flux:Window("Nephus Hub", "By Sakchem", Color3.fromRGB(62, 180, 137), Enum.KeyCode.LeftControl)
local Main = win:Tab("Main", "http://www.roblox.com/asset/?id=6023426915")
Main:Toggle("Autofarm Levels", "*Warn* Only Use In Private", function(t)
       _G.autolevel = t
       print(t)
end)
Main:Toggle("AutoGuess Normal", "Auto guesses song when you enter stage", function(t)
       _G.autoguess_normal = t
       print(t)
end)

--Scripts 
while _G.autolevel == true do
	local args = {
    [1] = songButton:GetAttribute("Title")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayAnimation"):FireServer(unpack(args))
Wait(0.1)
end

while _G.autoguess_normal == true do
 if answergui.Visible == true then
    local args = {
    [1] = songButton:GetAttribute("Title")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayAnimation"):FireServer(unpack(args))
answergui.Visible = false
 end
wait(1)
end

-- Toggle script button
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

local customAssetID = "15619828392"

local button = Instance.new("ImageButton")
button.Size = UDim2.new(0, 50, 0, 50) 
button.Position = UDim2.new(0.5, -300, 0.5, -100) 
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.Image = "rbxassetid://" .. customAssetID
button.Parent = gui


button.MouseButton1Click:Connect(function()
game:GetService('VirtualInputManager'):SendKeyEvent(true, 'LeftControl', false, yes)
end)
    
