local Map = workspace.Map
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local AntiCheatDisipateWait = 35

local characterAddedConnection = nil
local diedConnection = nil

local function GetHumanoidRootPart(character)
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
                    local character = LocalPlayer.Character
                    local rootPart = character and GetHumanoidRootPart(character)
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
    local character = LocalPlayer.Character
    local rootPart = character and GetHumanoidRootPart(character)

    if not rootPart then
        task.wait(5)
        TweenPlayerAir()
        return
    end

    local PositionTween = TweenService:Create(rootPart, TweenInfo.new(5), {CFrame = TargetPos})
    PositionTween:Play()
    PositionTween.Completed:Connect(function()
        local character = LocalPlayer.Character
        local rootPart = character and GetHumanoidRootPart(character)
        if not rootPart then return end
        rootPart.Anchored = true

        task.wait(AntiCheatDisipateWait)
        local SecondaryTween = TweenService:Create(rootPart, TweenInfo.new(5), {CFrame = TargetPos2})

        rootPart.Anchored = false
        task.wait(0.1)
        SecondaryTween:Play()

        SecondaryTween.Completed:Connect(function()
            local character = LocalPlayer.Character
            local rootPart = character and GetHumanoidRootPart(character)
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
                local character = LocalPlayer.Character
                local rootPart = character and GetHumanoidRootPart(character)
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

local function onCharacterDeath(humanoid)
    humanoid.Died:Wait()
    task.wait(2)
    TweenPlayerAir()
end

local function handleCharacter()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            TweenPlayerAir()
            if diedConnection then
                diedConnection:Disconnect()
            end
            diedConnection = humanoid.Died:Connect(onCharacterDeath)
        end
    else
        if characterAddedConnection then
            characterAddedConnection:Disconnect()
        end
        characterAddedConnection = LocalPlayer.CharacterAdded:Connect(function(newCharacter)
            local humanoid = newCharacter:FindFirstChildOfClass("Humanoid")
            if humanoid then
                TweenPlayerAir()
                if diedConnection then
                    diedConnection:Disconnect()
                end
                diedConnection = humanoid.Died:Connect(onCharacterDeath)
            end
        end)
    end
end

handleCharacter()
