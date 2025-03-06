local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SEV Hub || Ninja Time",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "SEV hub",
   LoadingSubtitle = "by 4bigguys445",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Config SEV || Ninja Time", -- Create a custom folder for your hub/game
      FileName = "SEV || 4BigGuys"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

_G.InfSpin = false

function infspin()
	if _G.InfSpin == false then
		local args = {
    [1] = "CustomizeSave",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = {
            ["Value\192"] = workspace,
            ["Saturation\255"] = workspace,
            ["Hue\140"] = workspace
        },
        [7] = 1
    }
}

game:GetService("ReplicatedStorage")._remotes.SaveDataFunction:InvokeServer(unpack(args))
	else
		local args = {
    [1] = "CustomizeSave",
    [2] = {
        [1] = 2,
        [2] = 3,
        [3] = 20,
        [4] = 1,
        [5] = 1,
        [6] = {
            ["Hue"] = 0,
            ["Saturation"] = 0,
            ["Value"] = 0
        },
        [7] = 1
    }
}

game:GetService("ReplicatedStorage")._remotes.SaveDataFunction:InvokeServer(unpack(args))
end
end

--local AutoSpinTab = Window:CreateTab("AutoSpin", "book-open")
local Tab = Window:CreateTab("Main", 0)

local Paragraph = Tab:CreateParagraph({Title = "READ ME", Content = "READ BEFORE USE!! If you do not read this guide I will not help you. This script rollsback data so it is not specifically 'Infinite spins'. You need to turn off infinite spins after getting your desired whatever if not, keep it on and rejoin after using all spins. If you get kicked for a data error just keep on rejoining. Be patient, If it takes too long to load just rejoin."})

local Toggle = Tab:CreateToggle({
   Name = "Infinite Spin",
   CurrentValue = false,
   Flag = "InfSpinToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
	infspin()
   	_G.InfSpin = Value
   end,
})

local Rejoin = Tab:CreateButton({
   Name = "Rejoin",
   Callback = function()
   	local ts = game:GetService("TeleportService")
	ts:Teleport(game.PlaceId, game.Players.LocalPlayer)
   end,
})


Rayfield:LoadConfiguration()