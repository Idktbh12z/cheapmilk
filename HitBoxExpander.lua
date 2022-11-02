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

while task.wait(0.2) do
for i,v in pairs(game.Players:GetChildren()) do
    if v == game.Players.LocalPlayer then
        else
        v = v.Character
        v.HumanoidRootPart.CanCollide = false
        v.HumanoidRootPart.Size = Vector3.new(10,10,10)
        v.HumanoidRootPart.Transparency = 0.5
    end
end
end
