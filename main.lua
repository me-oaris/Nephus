local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Assuming http and json are properly loaded

local function sendhook(Action)
    local player = game.Players.LocalPlayer

    if player then
        -- Fetch user information from Roblox API
        local success, userData = pcall(function()
            return game.Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100), player.DisplayName
        end)

        if success then
            -- Discord webhook URL
            local webhookUrl = "https://discord.com/api/webhooks/1185179760452702309/ZrCPGRXnsQkAA6RCB2NXHZXZfVOvgm7opEwQts_wARfCmKAai2z1eQPI2TdZWBlscLbd"

            -- Create payload with content, embed, and thumbnail
            local payload = {
                content = Action,
                embeds = {
                    {
                        author = {
                            name = userData,
                        },
                        thumbnail = {
                            url = userData,
                        },
                        description = Action,
                        fields = {
                            {
                                name = "Additional Field",
                                value = "You can add more fields here.",
                            },
                        },
                    },
                },
            }

            -- Send payload to Discord webhook
            local success, response = pcall(function()
                return game.HttpService:PostAsync(webhookUrl, game.HttpService:JSONEncode(payload), Enum.HttpContentType.ApplicationJson, false)
            end)

            if success and response then
                print("Webhook message sent successfully")
            else
                print("Failed to send webhook message. Response:", response)
            end
        else
            print("Failed to fetch Roblox user data.")
        end
    else
        print("Local player not found.")
    end
end

-- Assuming Fluent and other libraries are loaded

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
