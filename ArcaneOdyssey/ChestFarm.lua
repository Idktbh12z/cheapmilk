local Map = workspace.Map
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local AntiCheatDisipateWait = 35
local ChestCollectionCooldown = 10
local RunService = game:GetService("RunService")

local Cooldown = false
local Character = LocalPlayer.Character
local HumanoidRootPart = nil

local function GetCharacter()
    if LocalPlayer.Character then
        return LocalPlayer.Character
    end
    return LocalPlayer.CharacterAdded:Wait()
end

local function GetHumanoidRootPart()
    local character = GetCharacter()
    if character and character:FindFirstChild("HumanoidRootPart") then
        return character.HumanoidRootPart
    end
    return nil
end

local function GetClosestChest()
    local closestChest = nil
    local minDistance = math.huge

    if not Map then
        return nil
    end

    for _,Island in Map:GetChildren() do
        for _,Instance in Island:GetDescendants() do
            if Instance.Name == "Chests" then continue end

            if string.find(string.lower(Instance.Name), "chest") then
                local chestBase = Instance:FindFirstChild("Base")
                if chestBase and chestBase.Prompt and chestBase.Prompt.Enabled then
                    local rootPart = GetHumanoidRootPart()
                    if rootPart then
                        local distance = (rootPart.Position - chestBase.Position).Magnitude
                        if distance < minDistance then
                            minDistance = distance
                            closestChest = Instance
                        end
                    else
                        return nil
                    end
                end
            end
        end
    end
    return closestChest
end

local function TweenPlayerAir()
    local TargetChest = GetClosestChest()
    if not TargetChest then
        task.wait(5)
        TweenPlayerAir()
        return
    end

    local ChestBase = TargetChest:FindFirstChild("Base")
    if not ChestBase then
        task.wait(5)
        TweenPlayerAir()
        return
    end

    local TargetPos = ChestBase.CFrame * CFrame.new(0, 1000, 0)
    local TargetPos2 = ChestBase.CFrame * CFrame.new(0, -10, 0)
    local rootPart = GetHumanoidRootPart()

    if not rootPart then
        task.wait(5)
        TweenPlayerAir()
        return
    end

    local PositionTween = TweenService:Create(rootPart, TweenInfo.new(5), {CFrame = TargetPos})
    PositionTween:Play()
    PositionTween.Completed:Connect(function()
        if not rootPart then return end
        rootPart.Anchored = true

        task.wait(AntiCheatDisipateWait)
        local SecondaryTween = TweenService:Create(rootPart, TweenInfo.new(5), {CFrame = TargetPos2})

        rootPart.Anchored = false
        task.wait(0.1)
        SecondaryTween:Play()

        SecondaryTween.Completed:Connect(function()
            if not rootPart then return end
            task.wait(0.1)
            rootPart.Anchored = true
            local prompt = ChestBase:FindFirstChildOfClass("ProximityPrompt")
            if prompt then
                fireproximityprompt(prompt)
            end

            task.wait(1)
            rootPart.Anchored = false

            local ReturnTween = TweenService:Create(rootPart, TweenInfo.new(5), {CFrame = TargetPos})
            ReturnTween:Play()

            ReturnTween.Completed:Connect(function()
                if not rootPart then
                    task.wait(1)
                    TweenPlayerAir()
                    return
                end
                rootPart.Anchored = true
                task.wait(1)
                TweenPlayerAir()
            end)
        end)
    end)
end

local function mainLoop()
    while true do
        Character = GetCharacter()
        HumanoidRootPart = GetHumanoidRootPart()
        if not HumanoidRootPart then
            LocalPlayer.CharacterAdded:Wait()
        else
            TweenPlayerAir()
        end
        task.wait(1)
    end
end

mainLoop()
