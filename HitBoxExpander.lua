local GMT = getrawmetatable(game)
setreadonly(GMT, false)
local oldIndex = GMT.__index
GMT.__index =
    newcclosure(
    function(a, b)
        if a == "HumanoidRootPart" and b == "Size" then
            return
        end
        return oldIndex(a, b)
    end
)

local plrs = game:GetService("Players")
for i, v in pairs(plrs:GetChildren()) do
    if v == plrs.LocalPlayer then
    else
        v = v.Character
        v:WaitForChild("HumanoidRootPart",10).CanCollide = false
        v:WaitForChild("HumanoidRootPart",10).Size = Vector3.new(10, 10, 10)
        v:WaitForChild("HumanoidRootPart",10).Transparency = 0.5
    end
end

for i, v in pairs(plrs:GetChildren()) do
    if v == plrs.LocalPlayer then
    else
        v.CharacterAdded:connect(
            function()
                repeat
                    task.wait()
                until v.Character and v.Character.HumanoidRootPart ~= nil
                v:WaitForChild("HumanoidRootPart",10).CanCollide = false
                v:WaitForChild("HumanoidRootPart",10).Size = Vector3.new(10, 10, 10)
                v:WaitForChild("HumanoidRootPart",10).Transparency = 0.5
            end
        )
    end
end

plrs.PlayerAdded:Connect(
    function(player)
        repeat
            task.wait()
        until player.Character ~= nil
        repeat
            task.wait()
        until v.Character and v.Character.HumanoidRootPart ~= nil
        v:WaitForChild("HumanoidRootPart",10).CanCollide = false
        v:WaitForChild("HumanoidRootPart",10).Size = Vector3.new(10, 10, 10)
        v:WaitForChild("HumanoidRootPart",10).Transparency = 0.5
        player.CharacterAdded:Connect(
            function()
                repeat
                    task.wait()
                until v.Character and v.Character.HumanoidRootPart ~= nil
                v:WaitForChild("HumanoidRootPart",10).CanCollide = false
                v:WaitForChild("HumanoidRootPart",10).Size = Vector3.new(10, 10, 10)
                v:WaitForChild("HumanoidRootPart",10).Transparency = 0.5
            end
        )
    end
)
