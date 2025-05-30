local Interact = require(game.Players.LocalPlayer.PlayerScripts.Client.Interact)
local OldInteractUpdate = Interact.Update
Interact.Update = function(Self, ...)
    local Args = {...}

    if Args[1].Equipped then
        local Weapon = Args[3][Args[1].Equipped]
        local WeaponStats = Args[1].WeaponModule.Stats

        if WeaponStats.Pool then
            Weapon.Pool = WeaponStats.Pool
        end

        return OldInteractUpdate(Self, unpack(Args))
    end

    return OldInteractUpdate(...)
end
