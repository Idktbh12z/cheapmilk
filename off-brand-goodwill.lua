local UIS = game:GetService("UserInputService")
--
--[[
I DO NOT OWN ANY OF THIS CODE
ALL IS OWNED BY AIDEZ
https://github.com/Aidez/decaying_winter
THIS CODE WAS MODIFIED TO BE A LIGHER/SEMI-LEGIT SCRIPT.
]] if
    game.PlaceId ~= 7551121821 and game.PlaceId ~= 9880062154
 then
    return
end

repeat
    wait()
until game.Players.LocalPlayer ~= nil

_G.Code1 = nil
_G.Code2 = nil

local EffectsTable = {}
local FoodTable = {}
local Toggles = {
    NoCooldown = false,
    AntiDebuff = false,
    VirusBlock = false,
    NoHunger = false,
    Dispenser = false
}

local Debounces = {
    Dispensing = false
}

local function RemoveMark(child)
    if child.Name == "playerflagged" then
        wait(0.1)
        child.Parent = nil
    end
end

local function GrabMainScript()
    local Script = nil
    for i, v in pairs(game.Players.LocalPlayer.Backpack.GetChildren(game.Players.LocalPlayer.Backpack)) do
        if v:IsA("LocalScript") and v.Name ~= "ClickDetectorScript" then
            Script = v
        end
    end
    return Script
end

local function getargs(inputstring)
    inputstring = string.lower(inputstring)
    inputstring = string.gsub(inputstring, "'", "")
    inputstring = string.gsub(inputstring, ":", "")
    inputstring = string.gsub(inputstring, ";", "")
    inputstring = string.gsub(inputstring, "%.", "")
    inputstring = string.gsub(inputstring, "/e ", "")
    inputstring = string.gsub(inputstring, "/w ", "")
    local args = string.split(inputstring, " ")
    args.Command = args[1]
    table.remove(args, 1)
    return args
end

local function IsInTable(table, tofind)
    local found = false
    for i, v in pairs(table) do
        if v == tofind then
            found = true
            break
        end
    end
    return found
end

local function CommandHandler(msg, speaker)
    local Args = getargs(msg)
    if
        IsInTable(
            {
                "scrap",
                "mre",
                "soda",
                "beans",
                "water",
                "cola",
                "bottle"
            },
            Args.Command
        )
     then
        if not Toggles.Dispenser and speaker ~= game.Players.LocalPlayer then
            return
        end
        local Amount = tonumber(Args[1])
        local IsFood = false
        if IsInTable({"mre", "soda", "beans", "water"}, Args.Command) then
            IsFood = true
        end
        if Amount == nil and Args.Command == "scrap" then
            Amount = 500
        elseif Amount == nil and Args.Command ~= "scrap" then
            Amount = 1
        end
        if Amount > 499 then
            Amount = 500
        else
            Amount = Amount
        end

        if speaker == game.Players.LocalPlayer then
            if Args.Command ~= "scrap" then
                if not IsFood then
                    local AmmoName = string.upper(string.sub(Args.Command, 1, 1)) .. string.sub(Args.Command, 2, -1)
                    if AmmoTable[AmmoName] ~= nil then
                        AmmoTable[AmmoName] = Amount
                    end
                else
                    local FoodName = string.gsub(Args.Command, "water", "Bottle")
                    FoodName = string.gsub(FoodName, "mre", "MRE")
                    FoodName = string.gsub(FoodName, "cola", "Soda")
                    FoodName = string.upper(string.sub(FoodName, 1, 1)) .. string.sub(FoodName, 2, -1)
                    FoodTable[FoodName] = Amount
                end
                return
            else
                workspace.ServerStuff.dropAmmo:FireServer("scrap", Amount)
                return
            end
        elseif
            speaker ~= game.Players.LocalPlayer and Toggles.Dispenser and speaker.Character ~= nil and
                not Debounces.Dispensing and
                speaker.Character:FindFirstChild("HumanoidRootPart")
         then
            Debounces.Dispensing = true
            local ReturnTo = nil
            if
                Toggles.Dispenser and game.Players.LocalPlayer.Character ~= nil and
                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
             then
                ReturnTo = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    speaker.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
            end
            if Args.Command ~= "scrap" then
                local AmmoName = string.upper(string.sub(Args.Command, 1, 1)) .. string.sub(Args.Command, 2, -1)
                for i = 1, Amount do
                    workspace.ServerStuff.dropAmmo:FireServer(AmmoName, 100)
                end
            else
                workspace.ServerStuff.dropAmmo:FireServer("scrap", Amount)
            end
            if ReturnTo ~= nil then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ReturnTo
            end
            Debounces.Dispensing = false
        end
    end
end

local function StatusAdded(new)
    if string.find(new.Name, "Virus") then
        VirusFrame = new
        repeat
            wait()
        until new:FindFirstChild("EmptyBar")
        repeat
            wait()
        until new.EmptyBar:FindFirstChild("Bar")
        new.EmptyBar.Bar.Changed:Connect(VirusChanged)
    end
    if not Toggles.AntiDebuff then
        if not Toggles.AntiFallDamage then
            return
        elseif Toggles.AntiFallDamage and new.Name ~= "Cripple" then
            return
        end
    end
    repeat
        wait()
    until EffectsTable[new.Name] ~= nil
    wait()
    if new:IsA("Frame") and EffectsTable ~= nil and EffectsTable[new.Name] ~= nil and not string.find(new.Name, "Virus") then
        if
            EffectsTable[new.Name].effects ~= nil and EffectsTable[new.Name].effects.currentduration ~= nil and
                EffectsTable[new.Name].effects.colour ~= nil
         then
            if
                EffectsTable[new.Name].effects.colour == Color3.new(1, 0.05, 0.05) or
                    EffectsTable[new.Name].effects.colour == false or
                    new.Name == "Burning" or
                    new.Name == "Exhaustion"
             then
                EffectsTable[new.Name].effects.currentduration = 0
            end
        end
    end
end

local function VirusChanged()
    if Toggles.VirusBlock and VirusFrame ~= nil and EffectsTable[VirusFrame.Name] ~= nil then
        EffectsTable[VirusFrame.Name].effects.currentduration = tick()
    end
end

local function GrabEssentials()
    local FunnyPlace = getrenv()._G
    local TempEnv = getsenv(GrabMainScript())
    repeat
        FunnyPlace = getrenv()._G
        TempEnv = getsenv(GrabMainScript())
        wait(0.3)
    until FunnyPlace["keylist"] ~= nil and TempEnv["afflictstatus"] ~= nil and TempEnv["drop_slide"] ~= nil
    wait(1)
    if TempEnv["afflictstatus"] ~= nil then
        local upvalues = getupvalues(TempEnv.afflictstatus)
        for i, v in pairs(upvalues) do
            if _G.Code1 ~= nil then
                break
            end
            if typeof(v) == "number" then
                for x, y in pairs(FunnyPlace) do
                    if y == v then
                        _G.Code1 = v
                        break
                    end
                end
            end
        end
        local CorrectIndex = math.huge
        for i, v in pairs(upvalues) do
            if v == _G.Code1 and tonumber(i) ~= nil then
                CorrectIndex = i + 1
            end
            if i == CorrectIndex then
                _G.Code2 = v
            end
        end

        if TempEnv["ration_system_handler"] ~= nil then
            FoodTable = TempEnv["ration_system_handler"]
        end
    end
    if TempEnv["drop_slide"] ~= nil then
        for i, v in pairs(debug.getupvalues(TempEnv["drop_slide"])) do
            if typeof(v) == "table" then
                for x, y in pairs(v) do
                    if typeof(y) == "table" and y["effects"] ~= nil then
                        EffectsTable = v
                        break
                    end
                end
            end
        end
    end
    TempEnv = nil
    FunnyPlace = nil
end

game.Players.LocalPlayer.CharacterAdded:Connect(
    function(char)
        repeat
            wait()
        until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
        repeat
            wait()
        until game.Players.LocalPlayer:FindFirstChild("Backpack")
        repeat
            wait()
        until game.Players.LocalPlayer.PlayerGui:FindFirstChild("mainHUD")
        repeat
            wait()
        until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("LocalScript")
        repeat
            wait()
        until game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("HealthFrame")
        repeat
            wait()
        until game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame:FindFirstChild("Statuses")

        GrabEssentials()
        local FunnyPlace = getrenv()._G
        if game.PlaceId ~= 9880062154 and not game.Workspace:FindFirstChild("HoldoutDecor") then
            repeat
                local Continue = false
                if
                    game.Players.LocalPlayer.PlayerGui:FindFirstChild("mainHUD") and
                        game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("HealthFrame") and
                        game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame:FindFirstChild("Statuses")
                 then
                    for i, v in pairs(game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame.Statuses:GetChildren()) do
                        if string.find(v.Name, "Virus") then
                            VirusFrame = v
                            repeat
                                wait()
                            until v:FindFirstChild("EmptyBar")
                            repeat
                                wait()
                            until v.EmptyBar:FindFirstChild("Bar")
                            v.EmptyBar.Bar.Changed:Connect(VirusChanged)
                            Continue = true
                        end
                    end
                end
                wait()
            until Continue
        end
        game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame.Statuses.ChildAdded:Connect(StatusAdded)
        repeat
            wait()
        until game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("LowerHudFrame")
        repeat
            wait()
        until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame:FindFirstChild("main")
        repeat
            wait()
        until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame:FindFirstChild("reserve")
        repeat
            wait()
        until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame.main:FindFirstChild("label")
        repeat
            wait()
        until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame.reserve:FindFirstChild("label")
    end
)

repeat
    wait()
until game.Players.LocalPlayer:FindFirstChild("Backpack")
repeat
    wait()
until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("LocalScript")

if game.Players.LocalPlayer.Character ~= nil then
    GrabEssentials()
end

repeat
    wait()
until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat
    wait()
until game.Players.LocalPlayer.PlayerGui:FindFirstChild("mainHUD")
repeat
    wait()
until game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("HealthFrame")
repeat
    wait()
until game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame:FindFirstChild("Statuses")

if game.PlaceId ~= 9880062154 and not game.Workspace:FindFirstChild("HoldoutDecor") then
    repeat
        local Continue = false
        if
            game.Players.LocalPlayer.PlayerGui:FindFirstChild("mainHUD") and
                game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("HealthFrame") and
                game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame:FindFirstChild("Statuses")
         then
            for i, v in pairs(game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame.Statuses:GetChildren()) do
                if string.find(v.Name, "Virus") then
                    VirusFrame = v
                    repeat
                        wait()
                    until v:FindFirstChild("EmptyBar")
                    repeat
                        wait()
                    until v.EmptyBar:FindFirstChild("Bar")
                    v.EmptyBar.Bar.Changed:Connect(VirusChanged)
                    Continue = true
                end
            end
        end
        wait()
    until Continue
end

game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame.Statuses.ChildAdded:Connect(StatusAdded)

local Toggle = true -- last second to default to true, rather than a toggle
Toggles.NoCooldown = Toggle
local Stats = require(game:GetService("Workspace").ServerStuff.Statistics["CLASS_STATISTICS"])
local TargetTable = Stats[game.Players.LocalPlayer.Character:WaitForChild("current_perk").Value]
if TargetTable == nil then
    return
end
local currenttext = ""
if Toggle == true then
    currenttext = "NoCooldown is now ON!"
    for i, v in pairs(TargetTable) do
        if typeof(v) == "table" and v["cooldown"] ~= nil then
            for x, y in pairs(v) do
                if string.find(tostring(x), "cooldown") and string.sub(x, #x - 2, -1) ~= "old" then
                    if v[x .. "old"] == nil then
                        v[x .. "old"] = v[x]
                    end
                    if v["kiramaxdamage"] ~= nil then
                        if tostring(x) == "mincooldown" then
                            v[x] = 0.1
                        elseif tostring(x) == "cooldown" then
                            v[x] = 1
                        end
                    else
                        if v["inverse_cd"] == nil then
                            v[x] = 0
                        else
                            v[x] = math.huge
                        end
                    end
                end
                if
                    x == "perk_mincd" or x == "vulka_ammo_usage" or string.find(tostring(x), "overheat") or
                        x == "goggle_broken_cd" or
                        x == "damage_taken_multi"
                 then
                    if v[x .. "old"] == nil and string.sub(x, #x - 2, -1) ~= "old" then
                        v[x .. "old"] = v[x]
                    end
                    v[x] = 0
                end
            end
        end
    end
else
    currenttext = "NoCooldown is now OFF!"
    for i, v in pairs(TargetTable) do
        if typeof(v) == "table" and v["cooldown"] ~= nil then
            for x, y in pairs(v) do
                if string.sub(x, #x - 2, -1) ~= "old" and v[x .. "old"] ~= nil then
                    v[x] = v[x .. "old"]
                end
            end
        end
    end
end
game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "notification",
        Text = currenttext,
        Icon = "rbxassetid://2541869220",
        Duration = 3
    }
)

local Toggle1 = true -- last second to default to true, rather than a toggle
Toggles.AntiDebuff = Toggle1
local currenttext = ""
if Toggle1 == true then
    for i, v in pairs(EffectsTable) do
        if
            not string.find(i, "Virus") and v.effects ~= nil and v.effects.currentduration ~= nil and
                v.effects.colour ~= nil
         then
            if
                v.effects.colour == Color3.new(1, 0.05, 0.05) or v.effects.colour == false or i == "Burning" or
                    i == "Exhaustion"
             then
                v.effects.currentduration = 0
            end
        end
    end
    currenttext = "AntiDebuff is now ON!"
else
    currenttext = "AntiDebuff is now OFF!"
end
game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "notification",
        Text = currenttext,
        Icon = "rbxassetid://2541869220",
        Duration = 3
    }
)

local Toggle2 = true -- last second to default to true, rather than a toggle
Toggles.VirusBlock = Toggle2
local currenttext = ""
if Toggle2 == true then
    currenttext = "VirusBlock is now ON!"
else
    currenttext = "VirusBlock is now OFF!"
end
game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "notification",
        Text = currenttext,
        Icon = "rbxassetid://2541869220",
        Duration = 3
    }
)
UIS.InputBegan:Connect(
    function(input)
        if input == Enum.KeyCode.M then
            if game.Players.LocalPlayer.Character == nil then
                return
            end
            if FoodTable == nil or FoodTable == {} then
                GrabEssentials()
                wait(0.5)
                FoodTable.hunger = math.huge
                FoodTable.thirst = math.huge
            else
                FoodTable.hunger = math.huge
                FoodTable.thirst = math.huge
            end
        else
        end
    end
)
game.Players.LocalPlayer.Chatted:Connect(
    function(msg)
        CommandHandler(msg, game.Players.LocalPlayer)
    end
)
game.Players.LocalPlayer.Character.Head.ChildAdded:Connect(RemoveMark)
