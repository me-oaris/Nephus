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
            local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

            Rayfield:Notify({
   Title = "Nephus Notification",
   Content = "This Function is disabled!!",
   Duration = 6.5,
   Image = nil,
   Actions = nil
})
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})

local ThirdSection = MainTab:CreateSection("Misc")
local NoClipButton = MainTab:CreateButton({
   Name = "No Clip",
   Callback = function()
      -- Toggles the no-clip state between on or off on every button click
      _G.noClip = not _G.noClip

      if _G.noClip then
         -- Enable No Clip
         local player = game:GetService("Players").LocalPlayer
         local character = player.Character

         if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")

            if humanoid then
               humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
               humanoid:GetPropertyChangedSignal("Parent"):Connect(function()
                  if not humanoid.Parent then
                     humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
                  end
               end)
            end
         end
      else
         -- Disable No Clip
         local player = game:GetService("Players").LocalPlayer
         local character = player.Character

         if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")

            if humanoid then
               humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
            end
         end
      end

      -- Optionally, you can provide a notification to indicate the state change
      local notificationText = _G.noClip and "No Clip Activated!" or "No Clip Deactivated!"
      game.StarterGui:SetCore("SendNotification", {Title = "Nephus Hub", Text = notificationText, Duration = 5})
   end,
})

local GiantButton = MainTab:CreateButton({
   Name = "Become Giant",
   Callback = function()
      -- Set the scale factor for the giant size
      local scaleFactor = 2  -- You can adjust this value as needed

      -- Get the player's character
      local player = game:GetService("Players").LocalPlayer
      local character = player.Character

      if character then
         -- Adjust the entire character's size
         for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
               part.Size = part.Size * scaleFactor
               part.Position = part.Position * scaleFactor
            end
         end

         -- Optionally, you can provide a notification to indicate the size change
         game.StarterGui:SetCore("SendNotification", {
            Title = "Nephus Hub",
            Text = "You've Become Giant!",
            Duration = 5
         })
      end
   end,
})


local WalkSpeedSlider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100}, -- Adjust the range as needed
   Increment = 1,
   Suffix = " speed",
   CurrentValue = 16, -- Default value
   Flag = "WalkSpeedSlider", -- Unique flag for configuration saving
   Callback = function(Value)
      -- The function that takes place when the slider changes
      local player = game:GetService("Players").LocalPlayer
      local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

      if humanoid then
         -- Set the player's walk speed
         humanoid.WalkSpeed = Value
      end
   end,
})
