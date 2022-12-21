        
        -- https://discord.com/channels/825324633079021578/988350086419451986/1048863969818968084 --
        -- This script is not mine!!! --
        
        local perks = require(workspace.ServerStuff.Statistics["CLASS_STATISTICS"])["fire"].basestats
        local perk = require(workspace.ServerStuff.Statistics["CLASS_STATISTICS"])["fire"]
        if perks then
            perk.name = "Pyromaniac"
            perk.desc = "Fire. Fire is good! Fire is death. Y O U  A R E  A  F U CK I N G  M A N I A C"
            perk.pros = {"Buffed Flame thrower", "Increased Gun Stats", "More stamina"}
            perk.cons = {"Decreased Melee Damage", "Decreased Defense", "Decreased movement speeds"}
            perk.activename = "39.Feire-UMG"
            perk.activedetails =
                "A flamethrower able to shred through hoards, the heat is so intense it can destroy enemies in seconds."
            perk.icon = "rbxassetid://10434756416" --You can change the image of your perk 🙂
            perks.atkmod = 15
            perks.defmod = 17.5 --Set this to 900 if you want to take 1 damage from every source of damage (excluding explosives and sq longshot)
            perks.stammod = 50
            perks.shovemod = 150
            perks.lightatkspeed = -5
            perks.heavyatkspeed = -10
            perks.recoilmod = 15
            --perks.scavmod = 60
            perks.accmod = 15
            perks.reloadmod = 20
            perks.noaimmod = nil
            perks.mvtmod = 15 --Movement speed (if you wanna go faster i reccomend 50 but if you wanna go hyper speed then like 100-150-200)
            perks.burnimmune = true
            perks.nomorale = false
            perk["activestats"].cooldown = math.huge
            perk["activestats"].flamer_range = 25
            perk["activestats"].flamer_burn_damage = 5
            perk["activestats"].flamer_burn_tick = 0.035 --This burns INCREDIBLY fast so it will make your overheat go up very quickly
        end

        task.wait(1)
        local args = {
            [1] = "respawncharacter"
        }

        workspace.ServerStuff.spawnPlayer:FireServer(unpack(args))
