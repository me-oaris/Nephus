local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nephus Hub",
   LoadingTitle = "Starting Nephus Hub!",
   LoadingSubtitle = "by Sakchem",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Nephus Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Nephus Keysystem",
      Subtitle = "Enter an key to use Nephus!",
      Note = "Key can be obtained from the discord server.",
      FileName = "nephuskey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"areyougay"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "Nephus Notification",
   Content = "Thank You For Using Nephus!",
   Duration = 6.5,
   Image = nil,
   Actions = nil
})

local MainTab = Window:CreateTab("Main", nil) -- Title, Image

local MainSection = MainTab:CreateSection("Status")
local Label = MainTab:CreateLabel("Playing Song : NaN")

local SecondSection = MainTab:CreateSection("Farm")
local Toggle = MainTab:CreateToggle({
   Name = "Auto Guess",
   CurrentValue = false,
   Flag = "aguess", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            if Value == false then
            game.StarterGui:SetCore("SendNotification", {
            Title = "Nephus Hub",
            Text = "This function is disabled",
            Duration = 5
                    })
            end
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})

local ThirdSection = MainTab:CreateSection("Misc")

