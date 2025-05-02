local Map = workspace.Map
local LocalPlayer = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local Cooldown = false
local AntiCheatDisipateWait = 35
local ChestCollectionCooldown = 10

local function GetClosestChest()
    local closestChest = nil
    local minDistance = math.huge

    for _,Island in Map:GetChildren() do
        for _,Instance in Island:GetDescendants() do
            if Instance.Name == "Chests" then continue end

            if string.find(string.lower(Instance.Name), "chest") then
                local chestBase = Instance:FindFirstChild("Base")
                if chestBase and chestBase.Prompt and chestBase.Prompt.Enabled then
                    local distance = (Character.HumanoidRootPart.Position - chestBase.Position).Magnitude
                    if distance < minDistance then
                        minDistance = distance
                        closestChest = Instance
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
        warn("NO CHESTS")
        return
    end

    local ChestBase = TargetChest:FindFirstChild("Base")
    if not ChestBase then
        warn("NO BASE")
        return
    end

    local TargetPos = ChestBase.CFrame * CFrame.new(0, 1000, 0)
    local TargetPos2 = ChestBase.CFrame * CFrame.new(0, -10, 0)

    local PositionTween = TweenService:Create(Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(5), {CFrame = TargetPos})
    PositionTween:Play()
    PositionTween.Completed:Connect(function()
        Character.HumanoidRootPart.Anchored = true

        task.wait(AntiCheatDisipateWait)
        local SecondaryTween = TweenService:Create(Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(5), {CFrame = TargetPos2})

        Character.HumanoidRootPart.Anchored = false
        task.wait(0.1)
        SecondaryTween:Play()

        SecondaryTween.Completed:Connect(function()
            task.wait(0.1)
            Character.HumanoidRootPart.Anchored = true

            fireproximityprompt(ChestBase:FindFirstChildOfClass("ProximityPrompt"))

            task.wait(1)
            Character.HumanoidRootPart.Anchored = false

            local ReturnTween = TweenService:Create(Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(5), {CFrame = TargetPos})
            ReturnTween:Play()

            ReturnTween.Completed:Connect(function()
                Character.HumanoidRootPart.Anchored = true
                task.wait(1)
                TweenPlayerAir()
            end)
        end)
    end)
end

TweenPlayerAir()
