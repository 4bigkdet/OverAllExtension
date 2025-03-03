local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SEV Hub || Blue Lock Rivals",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "SEV hub",
   LoadingSubtitle = "by 4bigguys445",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ConfigSEV", -- Create a custom folder for your hub/game
      FileName = "SEV | 4BigGuys"
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
_G.NoCD = false
_G.InfStamina = false
_G.PowerBool = false
_G.Power = 110
_G.AutoSpin = false
_G.DesiredStyle = {"Isagi",}

function infspin()
	if _G.InfSpin == false then
		local args ={
    [1]="Emotes",
    [2] = "HypeHype\255",
    [3] = "3"
}

game:GetService("ReplicatedStorage").Packages.Knit.Services.CustomizationService.RE.Customize:FireServer(unpack(args))
	else
		local args ={
    [1]="Emotes",
    [2] = "HypeHype",
    [3] = "3"
}

game:GetService("ReplicatedStorage").Packages.Knit.Services.CustomizationService.RE.Customize:FireServer(unpack(args))
end
end

function nocd()
	if _G.NoCD == true then
		local Mod = require(game.ReplicatedStorage.Controllers.AbilityController)
		local abilitycool = Mod.AbilityCooldown
		local old; old = hookfunction(abilitycool, function(...)
    		return nil
	end)
	else
		local Mod = require(game.ReplicatedStorage.Controllers.AbilityController)
		local abilitycool = Mod.AbilityCooldown
		hookfunction(abilitycool, abilitycool)
	end
end

function infstamina()
		local stam = game:GetService("Players").LocalPlayer.PlayerStats.Stamina
		local stamh;
		stamh = hookmetamethod(game, "__index", function(self,v)
			if self == stam and v == "Value" and _G.InfStamina == true then
				return 9e9
			end
		return stamh(self, v)
		end)
end

function Powaaa()
	local shothook
shothook = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    -- Ensure it only intercepts the correct remote event
    if self.Name == "Shoot" and method == "FireServer" and _G.PowerBool == true then 
        return shothook(self, _G.Power) -- Call the original function with modified args
    end

    return shothook(self, unpack(args)) -- Call the original function normally
end)
end



--local AutoSpinTab = Window:CreateTab("AutoSpin", "book-open")
local Tab = Window:CreateTab("Main", 0)
local Eee = Window:CreateTab("Gameplay", "gamepad-2")
------------------------------------------ AUTOSPIN TAB -------------------------------------
--[[local Desired = AutoSpinTab:CreateDropdown({
   Name = "Desired Style",
   Options = {"Isagi", "Chigiri", "Bachira", "Otoya", "Hiori", "Gagamaru", "King", "Nagi", "Reo", "Karasu", "Shidou", "Yukimiya", "Sae", "Aiku", "Rin", "Kunigami"},
   CurrentOption = {"Isagi"},
   MultipleOptions = true,
   Flag = "Desired Style", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
   	_G.DesiredStyle = Options
		print("e", Options)
   end,
})
local AutoSpinInf = AutoSpinTab:CreateToggle({
	Name = "Auto Spin Style",
	CurrentValue = false,
	Flag = "AutoSpin",
	Callback = function(Value)
	if Value == true then
infspin()
	_G.AutoSpin = Value
	AutoSpin()
	_G.InfSpin = Value
end
	
end,

})

function AutoSpin()
	while _G.AutoSpin == true do
		if table.find(_G.DesiredStyle, game:GetService("Players").LocalPlayer.PlayerStats.Style.Value) then
		AutoSpinInf:Set(false)
		break
else
wait(1)
game:GetService("ReplicatedStorage").Packages.Knit.Services.StyleService.RE.Spin:FireServer()
game:GetService("ReplicatedStorage").Packages.Knit.Services.StyleService.RE.Spin:FireServer(true)
		end
	end
end]]

-------------------------------------------- MAIN TAB ---------------------------------------
local Paragraph = Tab:CreateParagraph({Title = "READ ME", Content = "READ BEFORE USE!! If you do not read this guide I will not help you. This script rollsback data so it is not specifically 'Infinite spins'. You need to turn off infinite spins after getting your desired style if not, keep it on and rejoin after using all spins. If you get kicked for a data error just keep on rejoining."})

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

local StyleSection = Tab:CreateSection("Style")

local NormalS = Tab:CreateButton({
   Name = "Normal Style Spin",
   Callback = function()
		game:GetService("ReplicatedStorage").Packages.Knit.Services.StyleService.RE.Spin:FireServer()
   end,
})

local LuckyS = Tab:CreateButton({
   Name = "Lucky Style Spin",
   Callback = function()
   	game:GetService("ReplicatedStorage").Packages.Knit.Services.FlowService.RE.Spin:FireServer(true)
   end,
})

local Label = Tab:CreateLabel(game:GetService("Players").LocalPlayer.PlayerStats.Style.Value,4483362458, Color3.fromRGB(100, 100, 100), false) -- Title, Icon, Color, IgnoreTheme

game:GetService("Players").LocalPlayer.PlayerStats.Style.Changed:Connect(function(newval)
	Label:Set(newval, 4483362458, Color3.fromRGB(100, 100, 100), false) -- Title, Icon, Color, IgnoreTheme
end)

local FlowSection = Tab:CreateSection("Flow")

local NormalF = Tab:CreateButton({
   Name = "Normal Flow Spin",
   Callback = function()
   	game:GetService("ReplicatedStorage").Packages.Knit.Services.FlowService.RE.Spin:FireServer()
   end,
})

local LuckyF = Tab:CreateButton({
   Name = "Lucky Flow Spin",
   Callback = function()
   	game:GetService("ReplicatedStorage").Packages.Knit.Services.FlowService.RE.Spin:FireServer(true)
   end,
})

local Label = Tab:CreateLabel(game:GetService("Players").LocalPlayer.PlayerStats.Flow.Value,4483362458, Color3.fromRGB(100, 100, 100), false) -- Title, Icon, Color, IgnoreTheme

game:GetService("Players").LocalPlayer.PlayerStats.Flow.Changed:Connect(function(newval)
	Label:Set(newval,4483362458, Color3.fromRGB(100, 100, 100), false) -- Title, Icon, Color, IgnoreTheme
end)
------------------------------------------- GAMEPLAY TAB ---------------------------------------
local NoCd = Eee:CreateToggle({
   Name = "No Cooldown",
   CurrentValue = false,
   Flag = "NoCDToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		_G.NoCD = Value
		nocd()
   end,
})

local InfStamina = Eee:CreateToggle({
   Name = "Infinite Stamina",
   CurrentValue = false,
   Flag = "InfStaminaToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		_G.InfStamina = Value
		infstamina()
   end,
})

local PowerShot = Eee:CreateToggle({
   Name = "Power Shot",
   CurrentValue = false,
   Flag = "PowershotToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		_G.PowerBool = Value
		Powaaa()
   end,
})

local Slider = Eee:CreateSlider({
   Name = "Power Shoot",
   Range = {0, 999},
   Increment = 10,
   Suffix = "",
   CurrentValue = 110,
   Flag = "SliderToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   	_G.Power = Value
   end,
})

Rayfield:LoadConfiguration()