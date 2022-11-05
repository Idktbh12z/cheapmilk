-- game.Players.LocalPlayer.Character.Head.playeroverhead:Destroy()

coroutine.wrap(
    function()
        game.RunService.RenderStepped:Connect(
            function()
                if workspace.GamemodeStuff:FindFirstChild("outerGas") ~= nil then
                    workspace.GamemodeStuff.outerGas:Destroy()
                end
            end
        )
    end
)

function Respawn()
    workspace.ServerStuff.spawnPlayer:FireServer("respawncharacter")
end

function Hub()
    workspace.ServerStuff.spawnPlayer:FireServer("hubbing")
end

function Start(arg)
    if arg == "Normal" then
        game.Players.LocalPlayer:FindFirstChild("start").Value = "normal"
    elseif arg == "Ray" then
        game.Players.LocalPlayer:FindFirstChild("start").Value = "normal"
    end
end

function Spawn(Cords)
    Respawn()
    repeat
        task.wait()
    until not game.Players.LocalPlayer.Character:FindFirstChild("Outfit")
    Hub()
    Start("Normal")
    repeat
        task.wait()
    until game.Players.LocalPlayer.Character:FindFirstChild("Outfit")
    if Cords == "Match" then
        game.Players.LocalPlayer.start.Value = "normal"
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame =
            CFrame.new(18.777990341186523, -2.5860984325408936, -9.264251708984375)
    elseif Cords == "HubA" then
        game.Players.LocalPlayer.start.Value = "hubbing"
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame =
            CFrame.new(-118.72508239746094, -22.03114128112793, 1088.935546875)
    elseif Cords == "Respawn" then
        game.Players.LocalPlayer.start.Value = "hubbing"
        Respawn()
    elseif Cords == "HubB" then
        game.Players.LocalPlayer.start.Value = ""
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame =
            CFrame.new(-118.72508239746094, -22.03114128112793, 1088.935546875)
    end
end

Spawn("Match") --- Match (puts you in match with pvp), HubB (hub with pvp), HubA (hub without pvp), Respawn (puts you back into menu)
for _, instance in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if instance:IsA("LocalScript") and instance.Name ~= "ClickDetectorScript" then
        getsenv(instance).nametag = "Abus, God Of Extermination"
    end
end

coroutine.wrap(
    function()
        local RemoteHook
        RemoteHook =
            hookmetamethod(
            game,
            "__namecall",
            function(self, ...)
                local method = getnamecallmethod()
                local args = {...}

                if
                    not checkcaller() and tostring(self.Name) == "spawnPlayer" and method == "FireServer" and
                        tostring(self.ClassName) == "RemoteEvent" and
                        args[1] and
                        args[1] == "respawncharacter"
                 then
                    return task.wait(9e9)
                end

                return RemoteHook(self, ...)
            end
        )
    end
)

--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")

repeat
    task.wait()
until game.Players.LocalPlayer.Character.Head ~= nil

if game.Players.LocalPlayer.Character.Head:FindFirstChildOfClass("BillboardGui") then
    game.Players.LocalPlayer.Character.Head:FindFirstChildOfClass("BillboardGui"):Destroy()
else
end

--// Variables
local localPlayer = Players.LocalPlayer
local mainHandler = {instance = nil, senv = nil}
local namecall = nil
local toggle = {
    using = false,
    blocking = {false, 0, 0},
    dashing = {false},
    healing = {false},
    grappling = {false}
}

local activeStat = {
    def = {func = nil, upvalue = 0},
    mvt = {func = nil, upvalue = 0}
}

--// Functions
function spawnItem(itemName, slot)
    local inventory = getupvalue(mainHandler.senv.start_dual_wield, 3)
    local function spawn(use)
        if inventory[slot][1] ~= itemName then
            if workspace.InteractablesNoDel:FindFirstChild("Personal Workbench") ~= nil then
                repeat
                    ReplicatedStorage.Interactables.interaction:FireServer(
                        workspace.InteractablesNoDel["Personal Workbench"],
                        "buybaseupgrade",
                        _G.serverKey
                    )
                    RunService.Heartbeat:Wait()
                until workspace.InteractablesNoDel:FindFirstChild("Workbench") ~= nil
            end

            local workbench =
                workspace.InteractablesNoDel:FindFirstChild("Workbench") or
                workspace.Interactables:FindFirstChild("Workbench")
            if workbench:FindFirstChild("stats") == nil then
                return
            end

            ReplicatedStorage.Interactables.interaction:FireServer(
                workbench,
                "workbenchblueprint" .. itemName,
                _G.playerKey
            )
            repeat
                RunService.Heartbeat:Wait()
            until workbench.stats.blueprint.Value == itemName

            ReplicatedStorage.Interactables.interaction:FireServer(workbench, "workbench", _G.playerKey)

            local self = nil
            self =
                workspace.WeaponDrops.ChildAdded:Connect(
                function(item)
                    if
                        item.Name == itemName and
                            (item:GetPivot().Position - workbench:GetPivot().Position).Magnitude <= 20
                     then
                        if inventory[slot][1] ~= "Fist" then
                            inventory[slot] = {"Fist", false, nil}
                        end

                        local lastPosition = localPlayer.Character:GetPivot()
                        repeat
                            localPlayer.Character:PivotTo(item:GetPivot() + Vector3.new(0, 5, 0))
                            workspace.ServerStuff.claimItem:InvokeServer(item)

                            RunService.Heartbeat:Wait()
                        until localPlayer.Character.valids:FindFirstChild(itemName) ~= nil

                        local animSet = nil
                        for _, v in pairs(ReplicatedStorage.animationSets.TPanimSets:GetChildren()) do
                            if v.Name == require(workspace.ServerStuff.Statistics.W_STATISTICS)[itemName].animset then
                                animSet = v
                            end
                        end

                        repeat
                            if use == nil then
                                workspace.ServerStuff.getTPWeapon:FireServer(itemName, animSet, "Fist", item, true)
                            else
                                workspace.ServerStuff.getTPWeapon:FireServer(itemName, animSet, "Fist", item, false)
                            end

                            RunService.Heartbeat:Wait()
                        until workspace.WeaponDrops:FindFirstChild(item) == nil

                        localPlayer.Character:PivotTo(lastPosition)
                        inventory[slot] = {itemName, false, nil}

                        self:Disconnect()
                        self = nil
                    end
                end
            )
        end
    end

    for index, value in pairs(require(workspace.ServerStuff.Statistics.W_STATISTICS)) do
        if string.match(string.lower(index), string.lower(itemName)) ~= nil then
            itemName = index

            local use = nil
            if value.weapontype == "Item" or value.weapontype == "Bow" or value.weapontype == "Gun" then
                if ReplicatedStorage.Weapons:FindFirstChild(index) then
                    use = ReplicatedStorage.Weapons[index].ammo.Value
                end

                if slot == nil then
                    for inventorySlot, content in pairs(inventory) do
                        if inventorySlot ~= 1 and content[1] == "Fist" then
                            slot = inventorySlot
                            break
                        end
                    end
                end
            end

            if localPlayer.Character.valids:FindFirstChild(itemName) ~= nil then
                inventory[slot] = {itemName, false, use}
            else
                spawn(use)
            end

            repeat
                RunService.Heartbeat:Wait()
            until inventory[slot][1] == itemName and
                localPlayer.PlayerGui.mainHUD:FindFirstChild("InventoryFrame") ~= nil
            mainHandler.senv.invmanage("updatehud")
            break
        end
    end
end

function damage(character, damage)
    if character:FindFirstChildOfClass("Humanoid").Health <= 0 then
        return
    end

    local changeToRevolver =
        coroutine.create(
        function()
            local originalPerk = localPlayer.Character:FindFirstChild("current_perk").Value
            if originalPerk ~= nil and originalPerk ~= "revolver" then
                workspace.ServerStuff.changeStats:InvokeServer("changeclass", "revolver")
                coroutine.yield()
                workspace.ServerStuff.changeStats:InvokeServer("changeclass", originalPerk)
            end
        end
    )
    coroutine.resume(changeToRevolver)

    local activestat = require(workspace.ServerStuff.Statistics.CLASS_STATISTICS).revolver.activestats
    activestat._revolver_damage = activestat.revolver_damage
    activestat._revolver_headshot_multi = activestat.revolver_headshot_multi
    activestat.revolver_damage = damage
    activestat.revolver_headshot_multi = 0

    workspace.ServerStuff.dealDamage:FireServer("revolver_shot", {character, damage}, _G.serverKey, _G.playerKey)
    coroutine.resume(changeToRevolver)

    activestat.revolver_damage = activestat._revolver_damage
    activestat.revolver_headshot_multi = activestat._revolver_headshot_multi
    activestat._revolver_damage = nil
    activestat._revolver_headshot_multi = nil
end

function getActiveStat()
    if mainHandler.senv.maingui:FindFirstChild("devbox") == nil then
        local devbox = Instance.new("Frame")
        devbox.Size = UDim2.new(0, 0)
        devbox.BackgroundTransparency = 0
        devbox.BorderSizePixel = 0
        devbox.Parent = mainHandler.senv.maingui
        devbox.Name = "devbox"

        local devlabel1 = Instance.new("TextLabel")
        devlabel1.Size = UDim2.new(0, 0)
        devlabel1.BackgroundTransparency = 0
        devlabel1.BorderSizePixel = 0
        devlabel1.TextSize = 0
        devlabel1.Parent = devbox
        devlabel1.Name = "devlabel1"

        local devlabel2 = Instance.new("TextLabel")
        devlabel2.Size = UDim2.new(0, 0)
        devlabel2.BackgroundTransparency = 0
        devlabel2.BorderSizePixel = 0
        devlabel2.TextSize = 0
        devlabel2.Parent = devbox
        devlabel2.Name = "devlabel2"

        local devlabel3 = Instance.new("TextLabel")
        devlabel3.Size = UDim2.new(0, 0)
        devlabel3.BackgroundTransparency = 0
        devlabel3.BorderSizePixel = 0
        devlabel3.TextSize = 0
        devlabel3.Parent = devbox
        devlabel3.Name = "devlabel3"

        while devlabel1.Text == "" or devlabel2.Text == "" or devlabel3.Text == "" do
            RunService.Heartbeat:Wait()
        end
    end

    local found = false
    while found == false do
        for _, functions in pairs(getreg()) do
            if
                type(functions) == "function" and getfenv(functions).script and
                    getfenv(functions).script == mainHandler.instance
             then
                local upvalues = getupvalues(functions)

                for i, v in pairs(upvalues) do
                    if type(v) == "number" then
                        if
                            tostring(v) == string.sub(mainHandler.senv.maingui.devbox.devlabel1.Text, 7, -1) or
                                tostring(v) == string.sub(mainHandler.senv.maingui.devbox.devlabel2.Text, 7, -1) or
                                tostring(v) == string.sub(mainHandler.senv.maingui.devbox.devlabel3.Text, 14, -1)
                         then
                            local random = math.random(-20, -10)
                            local old = v

                            setupvalue(functions, i, random)
                            RunService.Heartbeat:Wait()

                            if string.sub(mainHandler.senv.maingui.devbox.devlabel2.Text, 7, -1) == tostring(random) then
                                activeStat.def = {
                                    func = functions,
                                    upvalue = i
                                }

                                found = true
                            end

                            if string.sub(mainHandler.senv.maingui.devbox.devlabel3.Text, 14, -1) == tostring(random) then
                                activeStat.mvt = {
                                    func = functions,
                                    upvalue = i
                                }

                                found = true
                            end

                            setupvalue(functions, i, old)
                        end
                    end
                end
            end
        end

        RunService.Heartbeat:Wait()
    end
end

local function start()
    for _, instance in ipairs(localPlayer.Backpack:GetChildren()) do
        if instance:IsA("LocalScript") and instance.Name ~= "ClickDetectorScript" then
            repeat
                mainHandler.instance = instance
                mainHandler.senv = getsenv(mainHandler.instance)
                RunService.Heartbeat:Wait()
            until mainHandler.senv.afflictstatus ~= nil and mainHandler.senv.unloadgun ~= nil and
                mainHandler.senv.ration_system_handler ~= nil

            for index, upvalue in ipairs(getupvalues(mainHandler.senv.afflictstatus)) do
                if typeof(upvalue) == "number" then
                    for _, key in pairs(getrenv()._G) do
                        if upvalue == key then
                            _G.serverKey = upvalue
                        end
                    end
                end

                if upvalue == _G.serverKey then
                    _G.playerKey = getupvalue(mainHandler.senv.afflictstatus, index + 1)
                    break
                end
            end
        end
    end

    spawnItem("CRSpear", 1)
    getActiveStat()

    mainHandler.senv.teamfolder = nil

    setupvalue(activeStat.mvt.func, activeStat.mvt.upvalue, 13)

    --[[
        
    local ammo = getupvalues(mainHandler.senv.unloadgun)[7]
    ammo.Small = 200
    ammo.Shells = 200
    ammo.Long = 200
    ammo.Short = 200
    ammo.Heavy = 200
    ammo.Medium = 200
    ammo.Light = 200
    ]]
    local asjdahd12 = {
        [1] = {
            [1] = "gamemode"
        },
        [2] = "juggernaut",
        [3] = game.Players.LocalPlayer.Character.PrimaryPart
    }

    workspace.ServerStuff.playAudio:FireServer(unpack(asjdahd12))
    task.wait()
    local ration = mainHandler.senv.ration_system_handler
    ration.Soda = 50
    ration.Bottle = 25
    ration.Beans = 50
    ration.MRE = 25
    ration.hunger = math.huge
    ration.thirst = math.huge

    _G.connection[3] =
        RunService.RenderStepped:Connect(
        function()
            if workspace.GamemodeStuff:FindFirstChild("outerGas") ~= nil then
                workspace.GamemodeStuff.outerGas:Destroy()
            end
        end
    )

    --workspace.ServerStuff.playAudio:FireServer({"events"}, "shiparrive", workspace)
end
--// Set up
if _G.connection ~= nil then
    for _, connection in ipairs(_G.connection) do
        connection:Disconnect()
    end
end
_G.connection = {}

start()

local cooldown = false

--// Keybinds
_G.connection[1] =
    UserInputService.InputBegan:Connect(
    function(input, gameProcessedEvent)
        if gameProcessedEvent == true then
            return
        end

        if localPlayer.Character ~= nil then
            if input.KeyCode == Enum.KeyCode.Y then
                if localPlayer.Character:FindFirstChild("hasPrimary") ~= nil then
                    if toggle.using == true then
                        return
                    end

                    toggle.blocking[1] = true

                    getupvalue(mainHandler.senv.drop_slide, 1).action = true
                    getupvalue(mainHandler.senv.drop_slide, 1).blocking = true
                    getupvalue(mainHandler.senv.drop_slide, 1).cancombo = false

                    workspace.ServerStuff.playAudio:FireServer(
                        {"general"},
                        "blockraise",
                        localPlayer.Character.PrimaryPart
                    )
                    workspace.ServerStuff.initiateblock:FireServer(_G.serverKey, true)

                    toggle.blocking[4] =
                        localPlayer.Character.Humanoid.Animator:LoadAnimation(
                        ReplicatedStorage.animationSets.TPanimSets["2JR"].bulletblock
                    )
                    toggle.blocking[4].Priority = Enum.AnimationPriority.Action
                    toggle.blocking[4]:Play(.1)
                    toggle.blocking[4].TimePosition = .3
                    toggle.blocking[4]:AdjustSpeed(0)

                    toggle.blocking[5] =
                        workspace.CurrentCamera.FPArms.AC.Animator:LoadAnimation(
                        ReplicatedStorage.animationSets["1HS"].block
                    )
                    toggle.blocking[5].Priority = Enum.AnimationPriority.Action
                    toggle.blocking[5]:Play(.15)
                    toggle.blocking[5]:AdjustSpeed(0)

                    toggle.blocking[2] = localPlayer.Character.Humanoid.Health
                    toggle.blocking[3] = getupvalue(activeStat.def.func, activeStat.def.upvalue)

                    setupvalue(activeStat.def.func, activeStat.def.upvalue, math.huge)

                    toggle.blocking[6] =
                        localPlayer.Character.Humanoid.HealthChanged:Connect(
                        function(health)
                            if health < toggle.blocking[2] then
                                if toggle.blocking[2] - health >= 10 then
                                    local integral =
                                        math.modf((toggle.blocking[2] - localPlayer.Character.Humanoid.Health) / 8)
                                    for _ = 1, integral do
                                        workspace.ServerStuff.dealDamage:FireServer(
                                            "lazarusheal",
                                            8,
                                            _G.serverKey,
                                            _G.playerKey
                                        )
                                    end

                                    if toggle.blocking[2] - (integral * 8) > 0 then
                                        workspace.ServerStuff.dealDamage:FireServer(
                                            "lazarusheal",
                                            (toggle.blocking[2] - localPlayer.Character.Humanoid.Health) -
                                                (integral * 8),
                                            _G.serverKey,
                                            _G.playerKey
                                        )
                                    end
                                end
                                workspace.ServerStuff.applyGore:FireServer(
                                    "gunricochet",
                                    localPlayer.Character,
                                    localPlayer,
                                    {
                                        localPlayer.Character.hasPrimary:FindFirstChildOfClass("Model"):GetPivot().Position
                                    }
                                )
                            end
                        end
                    )
                end
            end

            if input.KeyCode == Enum.KeyCode.BackSlash then
                local asjdahd = {
                    [1] = {
                        [1] = "gamemode"
                    },
                    [2] = "juggernaut",
                    [3] = game.Players.LocalPlayer.Character.PrimaryPart
                }

                workspace.ServerStuff.playAudio:FireServer(unpack(asjdahd))
            end

            if input.KeyCode == Enum.KeyCode.L then
                local num = math.random(1, 5)

                if num == 1 then
                    local args = {
                        [1] = {
                            [1] = "events",
                            [2] = "commander"
                        },
                        [2] = "confirm1",
                        [3] = game.Players.LocalPlayer.Character.PrimaryPart
                    }

                    workspace.ServerStuff.playAudio:FireServer(unpack(args))
                end

                if num == 2 then
                    local args = {
                        [1] = {
                            [1] = "events",
                            [2] = "commander"
                        },
                        [2] = "confirm2",
                        [3] = game.Players.LocalPlayer.Character.PrimaryPart
                    }

                    workspace.ServerStuff.playAudio:FireServer(unpack(args))
                end

                if num == 3 then
                    local args = {
                        [1] = {
                            [1] = "events",
                            [2] = "commander"
                        },
                        [2] = "confirm3",
                        [3] = game.Players.LocalPlayer.Character.PrimaryPart
                    }

                    workspace.ServerStuff.playAudio:FireServer(unpack(args))
                end

                if num == 4 then
                    local args = {
                        [1] = {
                            [1] = "events",
                            [2] = "commander"
                        },
                        [2] = "confirm4",
                        [3] = game.Players.LocalPlayer.Character.PrimaryPart
                    }

                    workspace.ServerStuff.playAudio:FireServer(unpack(args))
                end

                if num == 5 then
                    local args = {
                        [1] = {
                            [1] = "events",
                            [2] = "commander"
                        },
                        [2] = "confirm5",
                        [3] = game.Players.LocalPlayer.Character.PrimaryPart
                    }

                    workspace.ServerStuff.playAudio:FireServer(unpack(args))
                end
            end

            if input.KeyCode == Enum.KeyCode.J then
                if localPlayer.Character.Humanoid.Health <= localPlayer.Character.Humanoid.MaxHealth - 1 then
                    if toggle.healing[1] == true or toggle.using == true then
                        return
                    end
                    toggle.healing[1] = true
                    toggle.using = true

                    getupvalue(mainHandler.senv.drop_slide, 1).action = true
                    getupvalue(mainHandler.senv.drop_slide, 1).using_perk = true

                    local startupAnimation =
                        workspace.CurrentCamera.FPArms.AC.Animator:LoadAnimation(
                        ReplicatedStorage.animationSets.global.stun
                    )
                    startupAnimation.Priority = Enum.AnimationPriority.Action

                    local serumAnimation =
                        localPlayer.Character.Humanoid.Animator:LoadAnimation(
                        ReplicatedStorage.animationSets.TPanimSets.global.perk_calamity
                    )
                    serumAnimation.Priority = Enum.AnimationPriority.Action

                    local viewmodelAnimation =
                        workspace.CurrentCamera.FPArms.AC.Animator:LoadAnimation(
                        ReplicatedStorage.animationSets.global.perk_calamity
                    )
                    viewmodelAnimation.Priority = Enum.AnimationPriority.Action

                    local serum = ReplicatedStorage.perkAbilities.calamserum:Clone()
                    local perk = localPlayer.Character:FindFirstChild("current_perk").Value

                    coroutine.wrap(
                        function()
                            workspace.ServerStuff.changeStats:InvokeServer("changeclass", "berz")
                        end
                    )

                    _G.connection[3] =
                        startupAnimation.KeyframeReached:Connect(
                        function(keyframeName)
                            if keyframeName == "Stop" then
                                startupAnimation:AdjustSpeed(0)
                            end
                        end
                    )
                    startupAnimation:Play(.1)
                    task.wait(.2)

                    startupAnimation:Stop()
                    _G.connection[3]:Disconnect()

                    serum.Cap.Transparency = 0
                    task.delay(
                        .12,
                        function()
                            workspace.ServerStuff.playAudio:FireServer(
                                {"machinery"},
                                "sancuse",
                                localPlayer.Character.PrimaryPart
                            )

                            task.delay(
                                .1,
                                function()
                                    serum.CapWeld:Destroy()
                                    RunService.Heartbeat:Wait()
                                    serum.Cap.Velocity = serum.Cap.CFrame.UpVector * 20
                                end
                            )
                        end
                    )

                    workspace.ServerStuff.playAudio:FireServer({"weapons", "2HB"}, "draw", localPlayer.PlayerGui)
                    serumAnimation:Play(.1)

                    workspace.ServerStuff.handlePerkVisibility:FireServer("calamserum")

                    local motor6D = Instance.new("Motor6D")
                    motor6D.Part0 = workspace.CurrentCamera.FPArms.LeftArm.LUpperArm
                    motor6D.Part1 = serum
                    motor6D.Parent = serum
                    serum.Parent = workspace.CurrentCamera

                    _G.connection[4] =
                        viewmodelAnimation.KeyframeReached:Connect(
                        function(keyframeName)
                            if keyframeName == "activate_Perk" then
                                workspace.ServerStuff.playAudio:FireServer(
                                    {"weapons", "Item"},
                                    "stimuse",
                                    localPlayer.Character.PrimaryPart
                                )

                                repeat
                                    workspace.ServerStuff.dealDamage:FireServer(
                                        "Regeneration",
                                        nil,
                                        _G.serverKey,
                                        _G.playerKey
                                    )
                                    RunService.Heartbeat:Wait()
                                until localPlayer.Character.Humanoid.Health >= localPlayer.Character.Humanoid.MaxHealth
                                _G.connection[4]:Disconnect()
                            end
                        end
                    )

                    viewmodelAnimation:Play(.03)
                    viewmodelAnimation.Stopped:Wait()

                    getupvalue(mainHandler.senv.drop_slide, 1).action = false
                    getupvalue(mainHandler.senv.drop_slide, 1).using_perk = false
                    toggle.using = false

                    workspace.ServerStuff.handlePerkVisibility:FireServer("hide_perk")
                    serum:Destroy()

                    coroutine.wrap(
                        function()
                            workspace.ServerStuff.changeStats:InvokeServer("changeclass", perk)
                        end
                    )

                    task.wait()
                    toggle.healing[1] = false
                end
            end
        end
    end
)
_G.connection[2] =
    UserInputService.InputEnded:Connect(
    function(input, _)
        if input.KeyCode == Enum.KeyCode.Y then
            if toggle.blocking[1] == true and toggle.blocking[4] ~= nil and toggle.blocking[5] ~= nil then
                toggle.blocking[1] = false

                getupvalue(mainHandler.senv.drop_slide, 1).action = false
                getupvalue(mainHandler.senv.drop_slide, 1).blocking = false
                getupvalue(mainHandler.senv.drop_slide, 1).cancombo = true

                workspace.ServerStuff.initiateblock:FireServer(_G.serverKey, false)

                toggle.blocking[4]:Stop(.1)
                toggle.blocking[5]:Stop(.15)

                toggle.blocking[6]:Disconnect()
                toggle.blocking[6] = nil

                setupvalue(activeStat.def.func, activeStat.def.upvalue, toggle.blocking[3])

                if localPlayer.Character.Humanoid.Health < toggle.blocking[2] then
                    local integral = math.modf((toggle.blocking[2] - localPlayer.Character.Humanoid.Health) / 8)
                    for _ = 1, integral do
                        workspace.ServerStuff.dealDamage:FireServer("lazarusheal", 8, _G.serverKey, _G.playerKey)
                    end

                    if toggle.blocking[2] - (integral * 8) > 0 then
                        workspace.ServerStuff.dealDamage:FireServer(
                            "lazarusheal",
                            (toggle.blocking[2] - localPlayer.Character.Humanoid.Health) - (integral * 8),
                            _G.serverKey,
                            _G.playerKey
                        )
                    end
                end
            end
        end
    end
)

--// Animation

local TPanimSets = ReplicatedStorage.animationSets.TPanimSets
TPanimSets["2H"].equip.AnimationId = TPanimSets["special"].malice_combat.AnimationId
TPanimSets["2H"].swing.AnimationId = TPanimSets["2JR"].swing.AnimationId
TPanimSets["2H"].swing2.AnimationId = TPanimSets["2JR"].swing2.AnimationId
TPanimSets["global"].shove.AnimationId = TPanimSets["2JR"].grapple.AnimationId
TPanimSets["2H"].charge.AnimationId = TPanimSets["2JR"].charge.AnimationId
TPanimSets.global.low_walk.AnimationId = TPanimSets.global.runOLD.AnimationId
TPanimSets.global.low_idle.AnimationId = TPanimSets.global.idle.AnimationId

for i = 1, 1000 do
    workspace.ServerStuff.dealDamage:FireServer("lazarusheal", 1, getgenv().Code1, getgenv().Code2)
end
--// Hooking
namecall =
    hookfunction(
    getrawmetatable(game).__namecall,
    newcclosure(
        function(self, ...)
            local method = getnamecallmethod()
            local args = {...}

            if method == "FireServer" then
                if self.Name == "dealDamage" then
                    if typeof(args[1]) == "table" then
                        if args[1][2] ~= nil and args[1][2].Parent == workspace.activePlayers and args[1][3] ~= "shove" then
                            coroutine.wrap(damage)(args[1][2], args[1][3])
                        end
                    end
                end

                if self.Name == "playAudio" then
                    if args[1][1] == "movement_sounds" then
                        return true
                    end
                end

                if self.Name == "initiateblock" then
                    if toggle.blocking[1] == true and args[2] == false then
                        return true
                    end
                end

                if self.Name == "BREATHE" then
                    return true
                end

                if self.Name == "SayMessageRequest" and args[2] == "All" then
                    workspace.ServerStuff.playAudio:FireServer(
                        {"ai"},
                        "dialogue" .. math.random(1, 2),
                        localPlayer.Character.PrimaryPart
                    )
                end
            end

            if method == "Kick" then
                return true
            end

            if self.Name == "adjustArms" then
                return true
            end

            return namecall(self, ...)
        end
    )
)
