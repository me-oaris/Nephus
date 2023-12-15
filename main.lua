local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local http = require("socket.http")
local json = require("dkjson")


local Window = Fluent:CreateWindow({
    Title = "Nephus Hub V1",
    SubTitle = "by Sakchem",
    TabWidth = 100,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
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

    Tabs.Misc:AddButton({
        Title = "Button of nothingness",
        Description = "This button does nothing",
        Callback = function()
            local playerId = 12345678 -- Replace with the actual Roblox user ID
    
            -- Fetch user information from Roblox API
            local robloxApiUrl = "https://api.roblox.com/users/" .. playerId
            local response = http.request(robloxApiUrl, "GET")
    
            if response and response.status == 200 then
                local userData = json.decode(response.body)
    
                -- Discord webhook URL
                local webhookUrl = "https://discord.com/api/webhooks/1185179760452702309/ZrCPGRXnsQkAA6RCB2NXHZXZfVOvgm7opEwQts_wARfCmKAai2z1eQPI2TdZWBlscLbd"
    
                -- Create payload with content, embed, and thumbnail
                local payload = {
                    content = "Button of nothingness was pressed!",
                    embeds = {
                        {
                            author = {
                                name = userData.Username,
                            },
                            thumbnail = {
                                url = "https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&username=" .. userData.Username,
                            },
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
                http.request(webhookUrl, "POST", {
                    headers = {
                        ["Content-Type"] = "application/json",
                    },
                    data = http.encode(payload),
                })
            else
                print("Failed to fetch Roblox user data")
            end
        end
    })
end
