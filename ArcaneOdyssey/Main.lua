if getgenv().PMAO == true then return end
getgenv().PMAO = true

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Idktbh12z/cheapmilk/main/UiLib/Main.lua"))()
local Veynx = lib.new("Potatoman/Snowy | Arcane Odyssey")
local themes = {
    Background = Color3.fromRGB(45, 45, 185),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),
    TextColor = Color3.fromRGB(255, 255, 255)
}

local remotes = {
    "DealAttackDamage",
    "DealStrengthDamage",
    "DealWeaponDamage",
    "DealMagicDamage"
}

local Camera = workspace.CurrentCamera
local Map = workspace:WaitForChild("Map", 10)

local DropdownTpList = {}

for _, Folder in Map:GetChildren() do
    if not Folder:FindFirstChild("Center") then continue end
    table.insert(DropdownTpList, Folder.Name)
end

local var = {
    dmgValue = false,
    dmgMulti = 1,
    godmode = false,
    NPCBlock = false,
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local uiPages = {}
local uiSecs = {}
local TpDebounce = false

uiPages.Main = Veynx:addPage("Main")
uiPages.Travel = Veynx:addPage("Teleports")

uiSecs.Godmode = uiPages.Main:addSection("Godmode")
uiSecs.TP = uiPages.Travel:addSection("Teleports")
uiSecs.NPCE = uiPages.Main:addSection("NPC Exploits")
uiSecs.dmgExploits = uiPages.Main:addSection("Damage Exploits")
uiSecs.UI = uiPages.Main:addSection("UI")

uiSecs.Godmode:addToggle("Godmode", false, function(value)
    var["godmode"] = value
end)

uiSecs.NPCE:addToggle("No NPC Aggro", false, function(value)
    var["NPCBlock"] = value
end)

uiSecs.dmgExploits:addSlider("Damage Multi Amount", 1, 1, 15, function(value)
    var["dmgMulti"] = value
end)

uiSecs.dmgExploits:addToggle("Damage Multiplier", false, function(value)
    var["dmgValue"] = value
end)

uiSecs.UI:addKeybind("Toggle UI", Enum.KeyCode.Equals, function(value)
    Veynx:toggle()
end)

uiSecs.TP:addDropdown("Teleports", DropdownTpList, function(value)
    if TpDebounce then return end
    TpDebounce = true
    local Island = Map:FindFirstChild(value)
    if not Island then return end

    local Center = Island:FindFirstChild("Center")
    if not Center then return end

    LocalPlayer.Character.HumanoidRootPart.CFrame = Center.CFrame * CFrame.new(0, 1000, 0)
    task.wait()
    LocalPlayer.Character.HumanoidRootPart.Anchored = true

    task.delay(15, function()
        LocalPlayer.Character.HumanoidRootPart.Anchored = false
        TpDebounce = false
    end)
end)

task.spawn(function()
    local damageHook
    damageHook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = { ... }
        local method = getnamecallmethod()

        if not checkcaller() and table.find(remotes, tostring(self)) and method == "FireServer" and var["dmgValue"] then
            for i = 1, var["dmgMulti"] do
                self.FireServer(self, unpack(args))
            end
            return
        end

        return damageHook(self, ...)
    end))
end)

task.spawn(function()
    local godHook
    godHook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = { ... }

        if not checkcaller() and tostring(self) == "DealAttackDamage" and var["godmode"] then
            if args[2] == LocalPlayer.Character then
                args[2] = nil
            end
        elseif not checkcaller() and tostring(self) == "DealMagicDamage" and var["godmode"] then
            if args[2] == LocalPlayer.Character then
                args[2] = nil
            end
        elseif not checkcaller() and (tostring(self) == "DealStrengthDamage" or tostring(self) == "DealWeaponDamage" or tostring(self) == "DealBossDamage") and var["godmode"] then
            if args[3] == LocalPlayer.Character then
                args[3] = nil
            end
        end

        return godHook(self, unpack(args))
    end))
end)

task.spawn(function()
    local blockHook
    blockHook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local args = { ... }
        local method = getnamecallmethod()

        if not checkcaller() and tostring(self) == "TargetBehavior" and method == "InvokeServer" and var["NPCBlock"] then
            return
        end

        return blockHook(self, unpack(args))
    end))
end)
