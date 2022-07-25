-- Decompiled with the Synapse X Luau decompiler.

script.Name = game:GetService("HttpService"):GenerateGUID(false);
while true do
	wait();
	if game.Players.LocalPlayer.Character then
		break;
	end;
end;
ply = game.Players.LocalPlayer;
if (ply.Backpack:FindFirstChild("mainHandler") or (ply.PlayerGui:FindFirstChild("mainHandler") or ply:FindFirstChild("mainHandler"))) and (ply.Backpack:FindFirstChild("mainHandler") or (ply.PlayerGui:FindFirstChild("mainHandler") or ply:FindFirstChild("mainHandler"))) ~= script then
	script:Destroy();
	return;
end;
local l__CurrentCamera__1 = workspace.CurrentCamera;
l__CurrentCamera__1.CameraSubject = ply.Character.Humanoid;
l__CurrentCamera__1.CameraType = "Custom";
for v2, v3 in ipairs(l__CurrentCamera__1:GetChildren()) do
	v3:Destroy();
end;
filth = nil;
if workspace.ServerStuff.Statistics:FindFirstChild("Filth") then
	filth = require(workspace.ServerStuff.Statistics:FindFirstChild("Filth"));
else
	filth = { "Praise the sun!" };
end;
teamfolder = nil;
character = ply.Character;
mouse = ply:GetMouse();
mouse.TargetFilter = character;
RS = game:GetService("RunService").RenderStepped;
UIS = game:GetService("UserInputService");
sharedm = require(workspace.ServerStuff.Statistics.G_SCRIPTS);
playerstats = workspace.ServerStuff.retrieveStats:InvokeServer();
startperk = ply:WaitForChild("start");
nametag = ply.Name;
local v4 = workspace.ServerStuff.say:InvokeServer();
if playerstats.Settings.EnableCC == true then
	game.ReplicatedStorage.effects.ccFX:Clone().Parent = l__CurrentCamera__1;
end;
local v5 = _G[_G.keylist[workspace.ServerStuff.ask:InvokeServer(script.Name, true, script.Name)]];
hum = character.Humanoid;
maingui = ply.PlayerGui:WaitForChild("mainHUD");
if game.Players.LocalPlayer.Name ~= "Archeximus" and game.Players.LocalPlayer.Name ~= "Player1" and game.Players.LocalPlayer.Name ~= "Player2" and game.Players.LocalPlayer.Name ~= "Player3" then
	maingui.devbox:Destroy();
end;
UIS.MouseIconEnabled = false;
fparms = game.ReplicatedStorage.Rigs.FPArms:Clone();
camroot = fparms.camROOT;
fparms.Parent = l__CurrentCamera__1;
cpart = Instance.new("Part");
cpart.Transparency = 1;
cpart.CanCollide = false;
cpart.Anchored = true;
cpart.Locked = true;
cpart.Size = Vector3.new(0.2, 0.2, 0.2);
cpart.Parent = l__CurrentCamera__1;
local v6 = {};
local v7 = "Fist";
if playerstats.Class == "shadow" then
	v7 = "THand";
end;
v6[1] = { v7, true, nil };
v6[2] = { "Fist", false, nil };
v6[3] = { "Fist", false, nil };
v6[4] = { "Fist", false, nil };
local v8 = require(workspace.ServerStuff.Statistics.P_STATISTICS);
playerperks = {};
perksactive = {};
for v9, v10 in ipairs(character:FindFirstChild("perks"):GetChildren()) do
	playerperks[v10.Name] = true;
end;
if playerstats.Settings.Anonymous == true then
	if character:FindFirstChild("playerID") then
		nametag = "Contestant #" .. character:FindFirstChild("playerID").Value;
	else
		nametag = "Contestant #" .. math.random(1000, 9000);
	end;
end;
dsdesignations = { "Alpha", "Bravo", "Delta", "Echo", "Foxtrot", "Kilo", "Lima", "Oscar", "Quebec", "Sierra", "Tango", "Zulu" };
risdesignations = { "Acey", "Butcher", "Black", "Zero", "Crow", "Dusty", "Eagle", "Falcon", "Chaos", "Wolf", "Phantom", "Ghost" };
chattertime = 30;
if startperk.Value == "commander" then
	local v11 = "CMMaul";
	v6[1] = { v11, true, nil };
	nametag = "The Commander";
elseif startperk.Value == "emperor" then
	v11 = "EMSword";
	v6[1] = { v11, true, nil };
	nametag = "The Emperor";
elseif startperk.Value == "hiddenB" then
	chattertime = 10;
	v11 = "GhostKnife";
	v6[1] = { v11, true, nil };
	v6[2] = { "GhostBomb", false, nil };
	v6[3] = { "GhostBomb", false, nil };
	v6[4] = { "GhostBomb", false, nil };
	nametag = "The Hidden";
	game.ReplicatedStorage.effects.hiddenlight:Clone().Parent = character.Head;
elseif startperk.Value == "turfwarA" then
	v11 = "MMachete";
	v6[1] = { v11, true, nil };
	nametag = "Agent " .. dsdesignations[math.random(1, #dsdesignations)];
elseif startperk.Value == "turfwarB" then
	v11 = "MilAxe";
	v6[1] = { v11, true, nil };
	nametag = "Operative '" .. risdesignations[math.random(1, #risdesignations)] .. "'";
elseif startperk.Value == "siegeA" then
	v11 = "SSword";
	v6[1] = { v11, true, nil };
	if math.random(1, 2) == 1 then
		local v12 = { "DStim", "DEFStim", "SStim", "SPDStim", "AdrStim" };
		v6[2] = { v12[math.random(1, #v12)], false, 1 };
	end;
	if math.random(1, 50) == 1 then
		v6[2] = { "MPistol", false, 7 };
	end;
elseif startperk.Value == "siegeB" then
	local v13 = { "TCaltrop", "PTrap", "SSnare", "RExplosive" };
	local v14 = v13[math.random(1, #v13)];
	local v15 = 2;
	if v14 == "RExplosive" then
		v15 = 1;
	end;
	if v14 == "TCaltrop" then
		v15 = nil;
	end;
	v11 = "CRSpear";
	v6[1] = { v11, true, nil };
	v6[2] = { v14, false, v15 };
elseif startperk.Value == "tElimA" or startperk.Value == "tElimB" or startperk.Value == "jElimA" or startperk.Value == "hiddenA" or startperk.Value == "shadowGame" or startperk.Value == "coopvsDS" then
	v11 = playerstats.SelectedWep;
	v6[1] = { v11, true, nil };
	if startperk.Value == "hiddenA" or startperk.Value == "shadowGame" or startperk.Value == "coopvsDS" then
		local v16 = { { "SubAK", 30 }, { "SPShotgun", 9 }, { "Glock", 17 }, { "Rifle", 4 }, { "SubMG", 21 }, { "MPistol", 7 }, { "Deagle", 7 }, { "EBR", 20 }, { "Mac", 28 }, { "SubLMG", 50 }, { "SubVector", 25 }, { "ASVal", 30 } };
		local v17 = v16[math.random(1, #v16)];
		v6[2] = { v17[1], false, v17[2] };
	end;
elseif startperk.Value == "jElimB" then
	v11 = playerstats.SelectedWep;
	v6[1] = { v11, true, nil };
	v6[2] = { "EFlare", false, nil };
end;
if playerperks.tracker then
	for v18 = 1, #v6 do
		if v6[v18][1] == "Fist" and v18 ~= 1 then
			v6[v18] = { "PScanner", false, nil };
			break;
		end;
	end;
end;
local v19 = require(workspace.ServerStuff.Statistics.W_STATISTICS);
local v20 = require(workspace.ServerStuff.Statistics.CLASS_STATISTICS);
local v21 = require(workspace.ServerStuff.Statistics.Q_STATISTICS);
primwepset = v19[v11];
primanimset = game.ReplicatedStorage.animationSets:FindFirstChild(primwepset.animset);
tpprimanimset = game.ReplicatedStorage.animationSets.TPanimSets:FindFirstChild(primwepset.animset);
curentanimset = {};
tpcurrentanimset = {};
tauntchose = {};
tauntanimset = {};
tptauntanimset = {};
for v22, v23 in ipairs(game.ReplicatedStorage.animationSets.taunts:GetChildren()) do
	if v23:IsA("Animation") then
		tauntanimset[v23.Name] = fparms.AC:LoadAnimation(v23);
	end;
end;
for v24, v25 in ipairs(game.ReplicatedStorage.animationSets.TPanimSets.taunts:GetChildren()) do
	if v25:IsA("Animation") then
		tptauntanimset[v25.Name] = hum:LoadAnimation(v25);
	end;
end;
local v26 = 1;
for v27, v28 in pairs(tauntanimset) do
	tauntchose[v26] = v28.Name;
	local v29 = maingui.Centre.emotes.ex:Clone();
	v29.Text = "[" .. v26 .. "] " .. string.upper(v28.Name);
	v29.Position = UDim2.new(0.5, 0, 0, 0 + 20 * #maingui.Centre.emotes:GetChildren());
	v29.Visible = true;
	v29.Parent = maingui.Centre.emotes;
	v26 = v26 + 1;
end;
blocksets = {};
for v30, v31 in ipairs(game.ReplicatedStorage.animationSets.TPanimSets:GetChildren()) do
	if v31:FindFirstChild("block") then
		blocksets[v31.block.AnimationId] = true;
	end;
end;
local l__Debris__32 = game:GetService("Debris");
globalanimsets = {};
for v33, v34 in pairs(game.ReplicatedStorage.animationSets.global:GetChildren()) do
	if v34:IsA("Animation") then
		globalanimsets[v34.Name] = fparms.AC:LoadAnimation(v34);
	end;
end;
tpglobalanimsets = {};
for v35, v36 in pairs(game.ReplicatedStorage.animationSets.TPanimSets.global:GetChildren()) do
	if v36:IsA("Animation") then
		tpglobalanimsets[v36.Name] = hum:LoadAnimation(v36);
	end;
end;
tpglobalanimsets.crouch_idle.Priority = Enum.AnimationPriority.Action;
tpglobalanimsets.crouch_walk.Priority = Enum.AnimationPriority.Action;
tpglobalanimsets.stagger.Priority = Enum.AnimationPriority.Action;
akimbosets = {};
for v37, v38 in pairs(game.ReplicatedStorage.animationSets.AKMB:GetChildren()) do
	if v38:IsA("Animation") then
		akimbosets[v38.Name] = fparms.AC:LoadAnimation(v38);
	end;
end;
tpakimbosets = {};
for v39, v40 in pairs(game.ReplicatedStorage.animationSets.TPanimSets.AKMB:GetChildren()) do
	if v40:IsA("Animation") then
		tpakimbosets[v40.Name] = hum:LoadAnimation(v40);
	end;
end;
akimbo_factors = {
	active = false, 
	weapon_slot = 1, 
	alternate = false, 
	alt_weapon = nil, 
	alt_weapon_stats = nil, 
	alt_tick = 0
};
local l__workspace__1 = workspace;
function remove_dual_wield()
	akimbosets.equip:Stop(0.1);
	tpakimbosets.equip:Stop(0.1);
	akimbo_factors.active = false;
	if akimbo_factors.alt_weapon then
		akimbo_factors.alt_weapon:Destroy();
	end;
	akimbo_factors.alternate = false;
	if maingui.Centre.crosshair:FindFirstChild("akimbocrosshair") then
		maingui.Centre.crosshair:FindFirstChild("akimbocrosshair"):Destroy();
	end;
	maingui.Centre.crosshair.A1.Visible = true;
	maingui.Centre.crosshair.A2.Visible = true;
	maingui.Centre.crosshair.B1.Visible = true;
	maingui.Centre.crosshair.B2.Visible = true;
	maingui.Centre.crosshair.dot.Visible = true;
	l__workspace__1.ServerStuff.quickDisplay:FireServer("deleteakimbo");
end;
craftlist = require(l__workspace__1.ServerStuff.Statistics.CRAFTING_LIST);
local v41 = 0;
local v42 = 1;
local v43 = 1;
local v44 = 0;
local v45 = 0;
local v46 = 0;
local v47 = 0;
local v48 = 5;
local v49 = 12;
local v50 = 1;
local v51 = 1;
local v52 = 0;
local v53 = false;
local v54 = 0;
local v55 = true;
local v56 = true;
local v57 = false;
local v58 = false;
local v59 = false;
local v60 = false;
local v61 = false;
baseadstime = 6;
baseadstick = tick();
baseadsmod = 0;
local v62 = game.ReplicatedStorage.soundLibrary.general_ui.storm_ambience:Clone();
v62.Parent = character;
v62:Play();
local v63 = {};
local v64 = { "nothing", {}, {} };
local v65 = false;
local v66 = 100;
can_player_sprint = true;
exhaustion_immunity = false;
if v20[playerstats.Class] ~= nil then
	v64 = { playerstats.Class, v20[playerstats.Class].basestats, v20[playerstats.Class].activestats };
	maingui.PerkFrame.iconimage.Image = "rbxassetid://" .. v20[playerstats.Class].icon;
	local v67, v68, v69 = pairs(v64[2]);
	while true do
		local v70 = nil;
		local v71 = nil;
		v71, v70 = v67(v68, v69);
		if not v71 then
			break;
		end;
		v69 = v71;
		if v71 == "atkmod" then
			v42 = v42 + v70 / 100;
		elseif v71 == "defmod" then
			v43 = v43 + v70 / 100;
		elseif v71 == "mvtmod" then
			v41 = v41 + 10 * v70 / 100;
		elseif v71 == "stammod" then
			v66 = v66 + v70;
		elseif v71 == "craftcostmod" then
			v48 = v48 + v70;
		elseif v71 == "accmod" then
			v45 = v45 + v70 / 100;
		elseif v71 == "scavmod" then
			v47 = v47 + v70 / 100;
		elseif v71 == "grap" then
			v55 = false;
		elseif v71 == "lightatkspeed" then
			v50 = v50 + v70 / 100;
		elseif v71 == "heavyatkspeed" then
			v51 = v51 + v70 / 100;
		elseif v71 == "shovemod" then
			v46 = v46 + v70 / 100;
		elseif v71 == "aimmod" then
			baseadsmod = baseadsmod + v70 / 100;
		elseif v71 == "nomorale" then
			v65 = true;
		elseif v71 == "no_sprint" then
			can_player_sprint = false;
		elseif v71 == "burnimmune" then
			v61 = true;
		elseif v71 == "bleed_immune" then
			v57 = true;
		elseif v71 == "explosive_resist" then
			v60 = true;
		elseif v71 == "frac_immune" then
			v59 = true;
		elseif v71 == "cripple_immune" then
			v58 = true;
		elseif v71 == "exhaust_immune" then
			exhaustion_immunity = true;
		elseif v71 == "recoilmod" then
			v44 = v44 + v70 / 100;
		elseif v71 == "harvestmod" then
			v49 = v49 - v70;
		elseif v71 == "falldamagemod" then
			v56 = false;
		elseif v71 == "reloadmod" then
			v54 = v54 + v70 / 100;
		elseif v71 == "trapmod" then
			v52 = v52 + v70 / 100;
		elseif v71 == "drop_ranged" then
			v53 = true;
		elseif v71 == "backpack" then
			l__workspace__1.ServerStuff.dealDamage:FireServer("putbackpack", nil, v5, v4);
			v6[6] = { "Fist", false, nil };
			maingui.InventoryFrame.slot6.Visible = true;
			v6[5] = { "Fist", false, nil };
			maingui.InventoryFrame.slot5.Visible = true;
		end;	
	end;
end;
if playerperks.reliab then
	v54 = v54 + v8.reliab.efx[1] / 100;
end;
if playerperks.boxer then
	v46 = v46 + v8.boxer.efx[2] / 100;
end;
if playerperks.recoil then
	v44 = v44 + v8.recoil.efx[1] / 100;
end;
if playerperks.manic then
	v51 = v51 + v8.manic.efx[1] / 100;
end;
if playerperks.violence then
	v50 = v50 + v8.violence.efx[1] / 100;
end;
if playerperks.paranoia then
	baseadsmod = baseadsmod + v8.paranoia.efx[1] / 100;
end;
fanning_levering = false;
fanning_firerate = 0.15;
levering_firerate = 0.3;
if playerperks.hip then
	v45 = v45 + v8.hip.efx[1] / 100;
	fanning_levering = true;
end;
if playerperks.rustic then
	v42 = v42 + v8.rustic.efx[1] / 100;
end;
if playerperks.tough then
	v43 = v43 + v8.tough.efx[1] / 100;
end;
if playerperks.leg then
	v41 = v41 + 10 * v8.leg.efx[1] / 100;
end;
emotelist = false;
cc = nil;
if playerstats.Class == "sword" then
	local u2 = v41;
	function v63.losetags(p1, p2)
		if v63.dogtags and v63.dogtags > 0 then
			local v72 = math.ceil(v63.dogtags / (100 / v64[3].dogtagslostondamage));
			if p2 == true then
				v72 = math.ceil(math.clamp((hum.MaxHealth - hum.Health) / v64[3].healthperdogtag, 1, v63.dogtags));
				if v72 == 0 then
					v72 = 1;
				end;
			end;
			local v73 = v63.dogtags;
			if v64[3].dogtagmaxmovement < v73 then
				v73 = v64[3].dogtagmaxmovement;
			end;
			local v74 = math.clamp(v63.dogtags - v72 - v73, -1000, 0);
			v63.dogtags = v63.dogtags - v72;
			maingui.PerkFrame.numberstat.Text = v63.dogtags;
			if v74 < 0 then
				u2 = u2 - 10 * (v64[3].dogtagmovementbuff * -v74) / 100;
			end;
			if p2 == true then
				l__workspace__1.ServerStuff.dealDamage:FireServer("kiraheal", v72, v5, v4);
			end;
		end;
	end;
	v63.dogtag_lose_timer = 0;
	v63.dogtag_lose_damage = 0;
elseif playerstats.Class == "fire" then
	v63.overheat_danger_cd = 0;
	local u3 = 0;
	local u4 = nil;
	function v63.apply_overheat(p3, p4)
		if p4 == true then
			if tick() - v63.overheat_grace_period <= v64[3].overheat_graceperiod then
				return;
			end;
			v64[3].overheat_graceperiod = tick();
		end;
		if v64[3].cooldown <= tick() - u3 then
			u3 = tick() - v64[3].cooldown;
		end;
		u3 = u3 + p3;
		if tick() - u3 <= 8 and tick() - v63.overheat_danger_cd >= 3 then
			v63.overheat_danger_cd = tick();
			spawn(function()
				u4({ "perks" }, "flamer_danger", nil, nil, true, true);
				local v75 = tick();
				maingui.PerkFrame.numberstat.Visible = true;
				maingui.PerkFrame.numberstat.Text = "!";
				for v76 = 1, 15 do
					local v77 = tick();
					if maingui.PerkFrame.numberstat.Text == "!" then
						maingui.PerkFrame.numberstat.Text = "";
					else
						maingui.PerkFrame.numberstat.Text = "!";
					end;
					while true do
						RS:wait();
						if tick() - v77 >= 0.075 then
							break;
						end;					
					end;
				end;
				maingui.PerkFrame.numberstat.Visible = false;
				maingui.PerkFrame.numberstat.Text = "";
			end);
		end;
		if tick() - u3 <= 0 then
			l__workspace__1.ServerStuff.dealDamage:FireServer("immolate", character, v5, v4);
			l__workspace__1.ServerStuff.applyGore:FireServer("immolate_ability", character, ply, { character.Torso.CFrame - character.Torso.CFrame.upVector * 3 });
			l__workspace__1.ServerStuff.dealDamage:FireServer("immolator_overheated", {}, v5, v4);
		end;
		return u3;
	end;
	v63.overheat_grace_period = 0;
	local u5 = 0;
	function v63.overheat_damage()
		while true do
			u5 = (v64[3].overheat_damage_buff - v64[3].overheat_damage_buff * (math.clamp(tick() - u3, 1, v64[3].cooldown) / v64[3].cooldown)) / 100;
			RS:wait();
			if hum.Health <= 0 then
				break;
			end;		
		end;
	end;
	spawn(v63.overheat_damage);
end;
v63.buffer_f_key = true;
hum.WalkSpeed = (10 + v41) * 1;
local v78 = 0.0175;
if playerperks.recovery then
	v78 = v78 - v78 * v8.recovery.efx[1] / 100;
end;
local l__game__6 = game;
function update_player_challenges()
	local v79, v80, v81 = pairs(playerstats.PinnedChallenge);
	while true do
		local v82, v83 = v79(v80, v81);
		if v82 then

		else
			break;
		end;
		v81 = v82;
		if maingui.ChallengesFrame:FindFirstChild(v82) then
			local v84 = l__game__6.ReplicatedStorage.challenges:FindFirstChild(v82);
			if v84 then
				local v85 = require(v84);
				local v86 = 0;
				if playerstats.Trackers[v85.req] then
					v86 = math.floor(playerstats.Trackers[v85.req]);
				end;
				if v85.reqamount <= v86 then
					maingui.ChallengesFrame:FindFirstChild(v82).progbar.bar.Size = UDim2.new(1, 0, 0, 4);
					maingui.ChallengesFrame:FindFirstChild(v82).progresstext.Text = "COMPLETE";
					maingui.ChallengesFrame:FindFirstChild(v82).progresstext.TextColor3 = Color3.fromRGB(145, 255, 61);
				else
					maingui.ChallengesFrame:FindFirstChild(v82).progbar.bar.Size = UDim2.new(math.clamp(v86 / v85.reqamount, 0, 1), 0, 0, 4);
					maingui.ChallengesFrame:FindFirstChild(v82).progresstext.Text = v86 .. "/" .. v85.reqamount;
				end;
			end;
		end;	
	end;
end;
challengecount = 1;
for v87, v88 in pairs(playerstats.PinnedChallenge) do
	if l__game__6.ReplicatedStorage.challenges:FindFirstChild(v87) then
		maingui.ChallengesFrame["challenge" .. challengecount].Text = require(l__game__6.ReplicatedStorage.challenges:FindFirstChild(v87)).name;
		maingui.ChallengesFrame["challenge" .. challengecount].Visible = true;
		maingui.ChallengesFrame["challenge" .. challengecount].Name = v87;
		challengecount = challengecount + 1;
	end;
end;
update_player_challenges();
baselayer = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, l__workspace__1.PlayerShootThroughs, l__workspace__1.activeFriendlies };
function raycastline(p5, p6, p7, p8)
	local v89 = nil;
	local v90 = nil;
	local v91 = nil;
	local v92 = {};
	local v93 = 1 - 1;
	while true do
		local v94, v95, v96 = l__workspace__1:FindPartOnRayWithIgnoreList(Ray.new(p5, p6.unit * (p7 and 999.999)), v92);
		v89 = v94;
		v90 = v95;
		v91 = v96;
		if v89 then

		else
			break;
		end;
		local v97 = true;
		local v98, v99, v100 = pairs(p8);
		while true do
			local v101, v102 = v98(v99, v100);
			if v101 then

			else
				break;
			end;
			v100 = v101;
			if v89:IsDescendantOf(v102) then
				table.insert(v92, v89);
				v97 = false;
			end;		
		end;
		if v89.Locked == true then
			table.insert(v92, v89);
			v97 = false;
		end;
		if v97 == true then
			return v89, v90, v91;
		end;
		if 0 <= 1 then
			if v93 < 100 then

			else
				return;
			end;
		elseif 100 < v93 then

		else
			return;
		end;
		v93 = v93 + 1;	
	end;
	return v89, v90, v91;
end;
function lerp(p9, p10, p11)
	return p9 * (1 - p11) + p10 * p11;
end;
local v103 = v66;
if playerperks.lungs then
	v66 = v66 + v8.lungs.efx[1];
	v103 = v66;
end;
deathactivated = false;
local u7 = v103;
local u8 = {
	action = false, 
	swinging = false, 
	cancombo = false, 
	comboing = false, 
	sprinting = false, 
	shoving = false, 
	sneaking = false, 
	air = false, 
	walking = false, 
	canjump = true, 
	charging = false, 
	blocking = false, 
	blockimpact = false, 
	blockrecoil = false, 
	staggering = false, 
	sliding = false, 
	swapping = false, 
	startswap = false, 
	throwing = false, 
	aiming = false, 
	firing = false, 
	turnable = true, 
	channel = false, 
	poking = false, 
	using_perk = false, 
	using_aux = false, 
	eating = false, 
	hanger = false
};
local u9 = {};
local u10 = 10;
local u11 = {
	stamregen = 0, 
	regentick = 0, 
	jumptick = 0, 
	combotimer = 0.2
};
local u12 = v78;
invmanage = nil;
shakecamera = nil;
stagger = nil;
applygore = nil;
afflictstatus = nil;
createfxoutline = nil;
local function v104(p12, p13, p14, p15, p16, p17, p18)
	local v105 = l__game__6.ReplicatedStorage.soundLibrary;
	if p12 then
		for v106, v107 in ipairs(p12) do
			v105 = v105:FindFirstChild(v107);
		end;
	end;
	local v108 = v105:FindFirstChild(p13);
	if v108 then
		local v109 = v108:Clone();
		if p15 then
			v109.Pitch = v109.Pitch + math.random(-p15 * 100, p15 * 100) / 100;
		end;
		local v110 = ply.PlayerGui;
		if p17 == false then
			v110 = p14;
		end;
		v109.Parent = v110;
		v109.SoundGroup = l__game__6:GetService("SoundService").regular;
		if p18 == true then
			v109.RollOffMaxDistance = 50;
			v109.RollOffMinDistance = 25;
			v109.SoundGroup = l__game__6:GetService("SoundService").echo;
		end;
		v108:Play();
		if p16 == true then
			spawn(function()
				if p17 == false and v110 then
					local v111 = 1;
					local v112, v113, v114 = ipairs(v110:GetChildren());
					while true do
						local v115, v116 = v112(v113, v114);
						if not v115 then
							break;
						end;
						if v116.Name == v108.Name then
							v111 = v111 + 1;
						end;
						if v111 >= 8 and v116 ~= v108 and v116:IsA("Sound") and v116.TimePosition > 0.1 then
							v116:Destroy();
						end;					
					end;
				end;
			end);
			v108.Looped = false;
			v108.Ended:connect(function()
				v108:Destroy();
			end);
		end;
	end;
	return v108;
end;
l__workspace__1.ServerStuff.playAudio.OnClientEvent:Connect(v104);
func_flasher = tick();
local u13 = 0;
AGENT_sound = Instance.new("Sound");
AGENT_sound.Name = "AGENT";
AGENT_sound.Volume = 1;
AGENT_sound.Ended:connect(function()
	v104({ "AGENT" }, "bliptwo", nil, nil, true, true);
end);
AGENT_sound.Parent = l__CurrentCamera__1;
AGENT_timer = 0;
caption_timer = 0;
caption_max_timer = 5;
AGENT_debounces = {
	low_health = 0
};
function create_captions(p19, p20, p21)
	if startperk.Value == "hubbing" then
		return;
	end;
	maingui.Caption.Visible = true;
	maingui.Caption.captiontext.Text = p21;
	maingui.Caption.nameofcaption.Text = p19;
	maingui.Caption.nameofcaption.TextColor3 = p20;
	caption_max_timer = math.clamp(string.len(p21) / 10 + 0.5, 1, 6);
	if tick() - caption_timer < caption_max_timer then
		caption_timer = tick();
		return;
	end;
	caption_timer = tick();
	spawn(function()
		while true do
			RS:wait();
			if not (caption_max_timer <= tick() - caption_timer) then

			else
				break;
			end;		
		end;
		maingui.Caption.Visible = false;
	end);
end;
function agent_speak(p22, p23)
	if hum.Health <= 0 then
		return;
	end;
	if startperk.Value == "hubbing" then
		return;
	end;
	if p23 ~= true then
		if tick() - AGENT_timer <= 4 then
			return;
		end;
	end;
	AGENT_sound:Stop();
	AGENT_timer = tick();
	caption_timer = 0;
	if l__game__6.ReplicatedStorage.soundLibrary.AGENT:FindFirstChild(p22) then
		local v117 = l__game__6.ReplicatedStorage.soundLibrary.AGENT:FindFirstChild(p22);
		v104({ "AGENT" }, "blip", nil, nil, true, true);
		delay(0.7, function()
			local v118 = v117:GetChildren()[math.random(1, #v117:GetChildren())];
			AGENT_sound.SoundId = v118.SoundId;
			if playerstats.Settings.MuteAgent == false then
				AGENT_sound:Play();
			end;
			if v118:FindFirstChild("line") then
				create_captions("AGENT", Color3.fromRGB(255, 170, 20), v118:FindFirstChild("line").Value);
			end;
		end);
	end;
end;
l__workspace__1.ServerStuff.handleVoiceLine.OnClientEvent:Connect(function(p24, p25)
	if p24 == "AGENT" then
		agent_speak(p25[1], p25[2]);
		return;
	end;
	if p24 == "ilija" and playerstats.Settings.MuteAgent == false then
		v104({ "general_ui" }, "radio" .. math.random(1, 2), nil, nil, true, true);
		delay(0.5, function()
			local v119 = l__game__6.ReplicatedStorage.soundLibrary.voices.ilija:FindFirstChild(p25);
			local v120 = v119:GetChildren()[math.random(1, #v119:GetChildren())];
			v104({ "voices", "ilija", v119.Name }, v120.Name, nil, nil, true, true);
			create_captions("Ilija", Color3.fromRGB(125, 50, 200), v120:FindFirstChild("line").Value);
		end);
	end;
end);
bloodtier = 0;
bloodsprayDealt = 0;
local v121 = {
	damage = 0, 
	damagetaken = 0, 
	kills = 0, 
	killcombo = 0, 
	killer = nil, 
	placed = 16, 
	timealive = tick()
};
lastchatter = tick();
local u14 = nil;
harvestinghits = v49;
drawlockout = 0;
juggernaut = false;
primskin = nil;
function set_walk_anim(p26)
	if p26 == true then

	else
		tpglobalanimsets.low_walk:Stop(0);
		tpglobalanimsets.run:Stop(0);
		tpglobalanimsets.crouch_walk:Stop(0);
		tpglobalanimsets.crouch_idle:Stop(0);
		if not (hum.Health <= 20) then
			if u9.Cripple then
				tpglobalanimsets.low_idle:Play(0.2);
				return;
			else
				tpglobalanimsets.low_idle:Stop(0.4);
				return;
			end;
		else
			tpglobalanimsets.low_idle:Play(0.2);
			return;
		end;
	end;
	tpglobalanimsets.low_idle:Stop(0);
	tpglobalanimsets.crouch_walk:Stop(0);
	tpglobalanimsets.crouch_idle:Stop(0);
	if not (hum.Health <= 20) then
		if u9.Cripple then
			tpglobalanimsets.low_walk:Play(0.2);
			tpglobalanimsets.low_walk:AdjustWeight(0.6 + hum.WalkSpeed / 20);
			return;
		end;
	else
		tpglobalanimsets.low_walk:Play(0.2);
		tpglobalanimsets.low_walk:AdjustWeight(0.6 + hum.WalkSpeed / 20);
		return;
	end;
	tpglobalanimsets.low_walk:Stop(0.2);
	tpglobalanimsets.low_idle:Stop(0.2);
	tpglobalanimsets.run:Play(0.1, hum.WalkSpeed / 18, 0.6 + hum.WalkSpeed / 40);
	tpglobalanimsets.run:AdjustSpeed(0.6 + hum.WalkSpeed / 40);
	tpglobalanimsets.run:AdjustWeight(hum.WalkSpeed / 18);
end;
function check_walking_anim()
	delay(0.1, function()
		set_walk_anim(u8.walking);
	end);
end;
fist_speed_boost = false;
current_anim_set_use = "Fists";
local u15 = v7;
local u16 = nil;
local u17 = v43;
local u18 = v42;
local u19 = v41;
local u20 = nil;
local function u21()
	u8.action = true;
	u8.cancombo = false;
	curentanimset.bolt:Play(0);
	curentanimset.bolt:AdjustSpeed(1);
	tpcurrentanimset.bolt:Play(0);
	tpcurrentanimset.bolt:AdjustSpeed(1);
	while true do
		RS:wait();
		if curentanimset.bolt.IsPlaying == false then
			break;
		end;	
	end;
	curentanimset.bolt.KeyframeReached:connect(function(p27)
		if p27 == "BoltA" or p27 == "BoltB" then
			if p27 == "BoltA" then
				shakecamera("weapon", { "LSMG", "bolt" });
			end;
			l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", u14.animset }, p27, character.HumanoidRootPart);
			if p27 == "BoltB" then
				delay(0.1, function()
					v104({ "weapons", "LSMG" }, "move", nil, nil, true, true);
				end);
			end;
		end;
	end):Disconnect();
	curentanimset.equip.TimePosition = 0.5;
	curentanimset.equip:AdjustSpeed(0);
	tpcurrentanimset.equip:Play();
	tpcurrentanimset.equip.TimePosition = 0.5;
	tpcurrentanimset.equip:AdjustSpeed(0);
	u8.action = false;
	u8.cancombo = true;
end;
local function u22(p28)
	if p28 == "stamina" then
		if u7 < 0 then
			u7 = 0;
		elseif v66 < u7 then
			u7 = v66;
		end;
		maingui.StaminaFrame.TextLabel.Text = math.ceil(u7);
		maingui.StaminaFrame.max.Text = math.ceil(v66);
		return;
	end;
	if p28 == "sprint_stam" then
		if sprint_stam <= 0 then
			if cc == nil then
				cc = Instance.new("ColorCorrectionEffect");
				if deathactivated == false then
					cc.Parent = l__CurrentCamera__1;
				end;
				spawn(function()
					cc.Saturation = math.clamp(lerp(cc.Saturation, -1, 0.05), -0.5, 1);
					while RS:wait() do
						if sprint_stam > 15 then
							cc.Saturation = lerp(cc.Saturation, 1, 0.05);
							if cc.Saturation >= 0 then
								cc:Destroy();
								cc = nil;
								return;
							end;
						end;					
					end;
				end);
				return;
			end;
		elseif u8.staggering == false and u8.channel == false and not u9.Snared then
			u10 = 10;
			return;
		end;
	elseif p28 == "health" then
		maingui.HealthFrame.TextLabel.Text = math.ceil(hum.Health);
		maingui.HealthFrame.max.Text = math.ceil(hum.MaxHealth);
	end;
end;
local v122 = hum.Changed:connect(function(p29)
	if p29 == "MoveDirection" then
		if hum.MoveDirection.magnitude > 0.5 then
			if tpglobalanimsets.run.IsPlaying then
				tpglobalanimsets.run:AdjustSpeed(hum.WalkSpeed / 18);
				tpglobalanimsets.run:AdjustWeight(0.6 + hum.WalkSpeed / 40);
			end;
			if tpglobalanimsets.low_walk.IsPlaying then
				tpglobalanimsets.low_walk:AdjustWeight(0.6 + hum.WalkSpeed / 20);
			end;
			if tpglobalanimsets.crouch_walk.IsPlaying then
				tpglobalanimsets.crouch_walk:AdjustSpeed(0.8 + hum.WalkSpeed / 40);
			end;
			if u8.walking == false then
				u8.walking = true;
				set_walk_anim(true);
				return;
			end;
		else
			set_walk_anim(false);
			if u8.walking == true then
				u8.walking = false;
				return;
			end;
		end;
	elseif p29 == "Jump" then
		if u8.canjump == false or tick() - u11.jumptick < 1 or u8.staggering == true or u8.air == true or u7 <= 30 then
			hum.Jump = false;
			return;
		elseif hum.Jump == false and u8.air == false and u8.canjump == true then
			shakecamera("jumpstart");
			l__workspace__1.ServerStuff.playAudio:FireServer({ "movement_sounds" }, "jump", character.HumanoidRootPart);
			fall_sfx_tick = tick();
			u11.jumptick = tick();
			u7 = u7 - 30;
			u11.stamregen = tick();
			u11.regentick = tick();
			u22("stamina");
		end;
	end;
end);
hum.HealthChanged:connect(function()
	u22("health");
end);
local v123 = CFrame.new();
local v124 = CFrame.Angles(0, 0, 0);
local v125 = CFrame.new();
local u23 = {};
local function u24()
	local v126 = nil;
	while true do
		v126 = tostring(math.random(0, 500));
		if u23[v126] == nil then
			break;
		end;	
	end;
	u23[v126] = CFrame.Angles(0, 0, 0);
	return v126;
end;
local function u25(p30, p31)
	for v127 = 1, p31.loops do
		for v128 = 1, p31.tables[v127].frames do
			u23[p30] = u23[p30]:lerp(p31.tables[v127].value, p31.tables[v127].speed);
			RS:wait();
		end;
		RS:wait();
	end;
	for v129 = 1, p31.returnframes do
		u23[p30] = u23[p30]:lerp(CFrame.Angles(0, 0, 0), p31.returnspeed);
		RS:wait();
	end;
	u23[p30] = nil;
end;
function shakecamera(p32, p33)
	spawn(function()
		local v130 = u24();
		if p32 == "weapon" then
			if p33[1] ~= "Fists" then
				if p33[1] == "BK" then
					if p33[2] == "swingvar1" then
						u25(v130, {
							loops = 1, 
							tables = { {
									frames = 5, 
									value = CFrame.Angles(0, -0.12217304763960307, -0.12217304763960307), 
									speed = 0.15
								} }, 
							returnframes = 30, 
							returnspeed = 0.1
						});
					elseif p33[2] == "swingvar2" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 5, 
									value = CFrame.Angles(-0.05235987755982989, 0.05235987755982989, 0.08726646259971647), 
									speed = 0.15
								}, {
									frames = 10, 
									value = CFrame.Angles(0.05235987755982989, -0.026179938779914945, -0.017453292519943295), 
									speed = 0.3
								} }, 
							returnframes = 30, 
							returnspeed = 0.1
						});
					elseif p33[2] == "swingvar3" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 5, 
									value = CFrame.Angles(0, 0.08726646259971647, 0.05235987755982989), 
									speed = 0.15
								}, {
									frames = 8, 
									value = CFrame.Angles(0, -0.05235987755982989, -0.008726646259971648), 
									speed = 0.4
								} }, 
							returnframes = 30, 
							returnspeed = 0.1
						});
					elseif p33[2] == "charge" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 5, 
									value = CFrame.Angles(0, -0.13962634015954636, -0.05235987755982989), 
									speed = 0.125
								}, {
									frames = 10, 
									value = CFrame.Angles(0, 0.17453292519943295, 0.008726646259971648), 
									speed = 0.4
								} }, 
							returnframes = 65, 
							returnspeed = 0.05
						});
					elseif p33[2] == "equip" then
						u25(v130, {
							loops = 1, 
							tables = { {
									frames = 12, 
									value = CFrame.Angles(0.05235987755982989, 0, 0), 
									speed = 0.5
								} }, 
							returnframes = 30, 
							returnspeed = 0.075
						});
					end;
				elseif p33[1] == "2H" then
					if p33[2] == "swingvar1" then
						u25(v130, {
							loops = 1, 
							tables = { {
									frames = 10, 
									value = CFrame.Angles(0, 0.13962634015954636, -0.13962634015954636), 
									speed = 0.15
								} }, 
							returnframes = 30, 
							returnspeed = 0.1
						});
					elseif p33[2] == "swingvar2" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 10, 
									value = CFrame.Angles(-0.08726646259971647, -0.05235987755982989, 0.05235987755982989), 
									speed = 0.15
								}, {
									frames = 10, 
									value = CFrame.Angles(0, 0.05235987755982989, 0.03490658503988659), 
									speed = 0.3
								} }, 
							returnframes = 30, 
							returnspeed = 0.1
						});
					elseif p33[2] == "swingvar3" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 10, 
									value = CFrame.Angles(-0.03490658503988659, 0.05235987755982989, 0.05235987755982989), 
									speed = 0.15
								}, {
									frames = 8, 
									value = CFrame.Angles(0.03490658503988659, -0.08726646259971647, -0.017453292519943295), 
									speed = 0.4
								} }, 
							returnframes = 30, 
							returnspeed = 0.1
						});
					elseif p33[2] == "charge" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 5, 
									value = CFrame.Angles(0.17453292519943295, -0.10471975511965978, 0), 
									speed = 0.1
								}, {
									frames = 8, 
									value = CFrame.Angles(-0.17453292519943295, 0, 0), 
									speed = 0.3
								} }, 
							returnframes = 65, 
							returnspeed = 0.05
						});
					elseif p33[2] == "equip" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 10, 
									value = CFrame.Angles(0.03490658503988659, -0.03490658503988659, 0.03490658503988659), 
									speed = 0.15
								}, {
									frames = 12, 
									value = CFrame.Angles(-0.08726646259971647, 0, 0), 
									speed = 0.3
								} }, 
							returnframes = 30, 
							returnspeed = 0.075
						});
					end;
				elseif p33[1] ~= "1HB" then
					if p33[1] == "1BT" then
						if p33[2] == "swingvar1" then
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 8, 
										value = CFrame.Angles(0.05235987755982989, 0.017453292519943295, -0.05235987755982989), 
										speed = 0.15
									}, {
										frames = 10, 
										value = CFrame.Angles(-0.05235987755982989, -0.017453292519943295, 0.06981317007977318), 
										speed = 0.2
									} }, 
								returnframes = 30, 
								returnspeed = 0.075
							});
						elseif p33[2] == "swingvar2" then
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 8, 
										value = CFrame.Angles(0.05235987755982989, 0.08726646259971647, -0.05235987755982989), 
										speed = 0.15
									}, {
										frames = 10, 
										value = CFrame.Angles(-0.05235987755982989, -0.06981317007977318, 0.05235987755982989), 
										speed = 0.2
									} }, 
								returnframes = 30, 
								returnspeed = 0.1
							});
						elseif p33[2] == "swingvar3" then
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 8, 
										value = CFrame.Angles(0, 0.08726646259971647, -0.06981317007977318), 
										speed = 0.1
									}, {
										frames = 10, 
										value = CFrame.Angles(0, -0.06981317007977318, 0.08726646259971647), 
										speed = 0.2
									} }, 
								returnframes = 30, 
								returnspeed = 0.1
							});
						elseif p33[2] == "charge" then
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 8, 
										value = CFrame.Angles(0.10471975511965978, 0.017453292519943295, -0.05235987755982989), 
										speed = 0.2
									}, {
										frames = 8, 
										value = CFrame.Angles(-0.017453292519943295, -0.017453292519943295, 0.017453292519943295), 
										speed = 0.2
									} }, 
								returnframes = 65, 
								returnspeed = 0.05
							});
						elseif p33[2] == "equip" then
							if p33[1] == "1BT" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0.05235987755982989, -0.03490658503988659, 0.05235987755982989), 
											speed = 0.15
										}, {
											frames = 12, 
											value = CFrame.Angles(-0.03490658503988659, 0, 0), 
											speed = 0.3
										} }, 
									returnframes = 30, 
									returnspeed = 0.075
								});
							else
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(-0.05235987755982989, 0.03490658503988659, -0.05235987755982989), 
											speed = 0.15
										}, {
											frames = 12, 
											value = CFrame.Angles(0.03490658503988659, 0, 0), 
											speed = 0.3
										} }, 
									returnframes = 30, 
									returnspeed = 0.075
								});
							end;
						end;
					elseif p33[1] == "2HB" then
						if p33[2] == "swingvar1" then
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 8, 
										value = CFrame.Angles(0.06981317007977318, -0.05235987755982989, 0.03490658503988659), 
										speed = 0.175
									}, {
										frames = 12, 
										value = CFrame.Angles(-0.05235987755982989, 0.03490658503988659, -0.05235987755982989), 
										speed = 0.2
									} }, 
								returnframes = 30, 
								returnspeed = 0.075
							});
						elseif p33[2] == "swingvar2" then
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 8, 
										value = CFrame.Angles(0.05235987755982989, 0.06981317007977318, -0.05235987755982989), 
										speed = 0.175
									}, {
										frames = 12, 
										value = CFrame.Angles(-0.06981317007977318, -0.05235987755982989, 0.06981317007977318), 
										speed = 0.2
									} }, 
								returnframes = 30, 
								returnspeed = 0.1
							});
						elseif p33[2] == "swingvar3" then
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 8, 
										value = CFrame.Angles(0.08726646259971647, 0.017453292519943295, -0.017453292519943295), 
										speed = 0.15
									}, {
										frames = 10, 
										value = CFrame.Angles(-0.06981317007977318, -0.017453292519943295, 0.017453292519943295), 
										speed = 0.2
									} }, 
								returnframes = 30, 
								returnspeed = 0.1
							});
						elseif p33[2] == "charge" then
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 6, 
										value = CFrame.Angles(0, 0.06981317007977318, 0.017453292519943295), 
										speed = 0.2
									}, {
										frames = 13, 
										value = CFrame.Angles(-0.017453292519943295, -0.10471975511965978, -0.05235987755982989), 
										speed = 0.3
									} }, 
								returnframes = 65, 
								returnspeed = 0.05
							});
						elseif p33[2] == "equip" then
							u25(v130, {
								loops = 3, 
								tables = { {
										frames = 8, 
										value = CFrame.Angles(0.03490658503988659, 0.03490658503988659, -0.03490658503988659), 
										speed = 0.15
									}, {
										frames = 10, 
										value = CFrame.Angles(0, 0, 0), 
										speed = 0.2
									}, {
										frames = 8, 
										value = CFrame.Angles(-0.03490658503988659, 0, 0.017453292519943295), 
										speed = 0.15
									} }, 
								returnframes = 30, 
								returnspeed = 0.075
							});
						end;
					elseif p33[1] ~= "1HBL" then
						if p33[1] == "1HT" then
							if p33[2] == "swingvar1" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0, 0.08726646259971647, -0.03490658503988659), 
											speed = 0.15
										}, {
											frames = 10, 
											value = CFrame.Angles(0, -0.08726646259971647, 0.03490658503988659), 
											speed = 0.3
										} }, 
									returnframes = 30, 
									returnspeed = 0.075
								});
							elseif p33[2] == "swingvar2" then
								if p33[1] == "1HT" then
									u25(v130, {
										loops = 2, 
										tables = { {
												frames = 10, 
												value = CFrame.Angles(0, -0.08726646259971647, 0.03490658503988659), 
												speed = 0.15
											}, {
												frames = 10, 
												value = CFrame.Angles(0, 0.08726646259971647, -0.03490658503988659), 
												speed = 0.3
											} }, 
										returnframes = 30, 
										returnspeed = 0.075
									});
								else
									u25(v130, {
										loops = 2, 
										tables = { {
												frames = 10, 
												value = CFrame.Angles(-0.08726646259971647, -0.05235987755982989, 0.05235987755982989), 
												speed = 0.15
											}, {
												frames = 10, 
												value = CFrame.Angles(0.05235987755982989, 0.03490658503988659, -0.05235987755982989), 
												speed = 0.3
											} }, 
										returnframes = 30, 
										returnspeed = 0.1
									});
								end;
							elseif p33[2] == "swingvar3" then
								u25(v130, {
									loops = 1, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0, 0.08726646259971647, 0.06981317007977318), 
											speed = 0.175
										} }, 
									returnframes = 30, 
									returnspeed = 0.1
								});
							elseif p33[2] == "charge" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 5, 
											value = CFrame.Angles(0, -0.13962634015954636, 0.05235987755982989), 
											speed = 0.1
										}, {
											frames = 8, 
											value = CFrame.Angles(0, 0.08726646259971647, -0.08726646259971647), 
											speed = 0.3
										} }, 
									returnframes = 70, 
									returnspeed = 0.05
								});
							elseif p33[2] == "equip" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0.05235987755982989, 0.03490658503988659, 0.03490658503988659), 
											speed = 0.15
										}, {
											frames = 12, 
											value = CFrame.Angles(-0.05235987755982989, -0.03490658503988659, 0), 
											speed = 0.3
										} }, 
									returnframes = 30, 
									returnspeed = 0.075
								});
							end;
						elseif p33[1] == "1HS" then
							if p33[2] == "swingvar1" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0, 0.08726646259971647, -0.03490658503988659), 
											speed = 0.15
										}, {
											frames = 7, 
											value = CFrame.Angles(0, -0.08726646259971647, 0.05235987755982989), 
											speed = 0.4
										} }, 
									returnframes = 45, 
									returnspeed = 0.075
								});
							elseif p33[2] == "swingvar2" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0, -0.08726646259971647, 0.05235987755982989), 
											speed = 0.15
										}, {
											frames = 7, 
											value = CFrame.Angles(0, 0.06981317007977318, -0.08726646259971647), 
											speed = 0.4
										} }, 
									returnframes = 45, 
									returnspeed = 0.1
								});
							elseif p33[2] == "swingvar3" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0.10471975511965978, 0.08726646259971647, -0.05235987755982989), 
											speed = 0.15
										}, {
											frames = 7, 
											value = CFrame.Angles(-0.06981317007977318, -0.03490658503988659, 0.05235987755982989), 
											speed = 0.4
										} }, 
									returnframes = 45, 
									returnspeed = 0.1
								});
							elseif p33[2] == "charge" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 5, 
											value = CFrame.Angles(0.05235987755982989, 0.08726646259971647, -0.08726646259971647), 
											speed = 0.1
										}, {
											frames = 8, 
											value = CFrame.Angles(-0.03490658503988659, -0.12217304763960307, 0.06981317007977318), 
											speed = 0.3
										} }, 
									returnframes = 70, 
									returnspeed = 0.05
								});
							elseif p33[2] == "equip" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0.08726646259971647, -0.05235987755982989, 0.06981317007977318), 
											speed = 0.15
										}, {
											frames = 12, 
											value = CFrame.Angles(-0.06981317007977318, 0.05235987755982989, -0.08726646259971647), 
											speed = 0.3
										} }, 
									returnframes = 55, 
									returnspeed = 0.075
								});
							end;
						elseif p33[1] == "1TH" then
							if p33[2] == "swingvar1" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0, 0.08726646259971647, -0.03490658503988659), 
											speed = 0.15
										}, {
											frames = 7, 
											value = CFrame.Angles(0, -0.08726646259971647, 0.05235987755982989), 
											speed = 0.4
										} }, 
									returnframes = 45, 
									returnspeed = 0.075
								});
							elseif p33[2] == "swingvar2" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0, -0.08726646259971647, 0.05235987755982989), 
											speed = 0.15
										}, {
											frames = 7, 
											value = CFrame.Angles(0, 0.06981317007977318, -0.08726646259971647), 
											speed = 0.4
										} }, 
									returnframes = 45, 
									returnspeed = 0.1
								});
							elseif p33[2] == "swingvar3" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0.10471975511965978, 0.08726646259971647, -0.05235987755982989), 
											speed = 0.15
										}, {
											frames = 7, 
											value = CFrame.Angles(-0.06981317007977318, -0.03490658503988659, 0.05235987755982989), 
											speed = 0.4
										} }, 
									returnframes = 45, 
									returnspeed = 0.1
								});
							elseif p33[2] == "charge" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 5, 
											value = CFrame.Angles(0, -0.08726646259971647, -0.05235987755982989), 
											speed = 0.1
										}, {
											frames = 8, 
											value = CFrame.Angles(0, 0.12217304763960307, 0.06981317007977318), 
											speed = 0.3
										} }, 
									returnframes = 70, 
									returnspeed = 0.05
								});
							elseif p33[2] == "equip" then
								u25(v130, {
									loops = 1, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(-0.03490658503988659, -0.03490658503988659, -0.03490658503988659), 
											speed = 0.15
										} }, 
									returnframes = 55, 
									returnspeed = 0.065
								});
							end;
						elseif p33[1] == "2HBOW" then
							if p33[2] == "equip" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 12, 
											value = CFrame.Angles(0.05235987755982989, -0.05235987755982989, 0.03490658503988659), 
											speed = 0.1
										}, {
											frames = 14, 
											value = CFrame.Angles(-0.03490658503988659, 0.05235987755982989, -0.05235987755982989), 
											speed = 0.2
										} }, 
									returnframes = 55, 
									returnspeed = 0.075
								});
							end;
						elseif p33[1] == "1PB" then
							if p33[2] == "swingvar1" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0, 0.08726646259971647, -0.03490658503988659), 
											speed = 0.15
										}, {
											frames = 7, 
											value = CFrame.Angles(0, -0.08726646259971647, 0.05235987755982989), 
											speed = 0.4
										} }, 
									returnframes = 45, 
									returnspeed = 0.075
								});
							elseif p33[2] == "swingvar2" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0, -0.08726646259971647, 0.05235987755982989), 
											speed = 0.15
										}, {
											frames = 7, 
											value = CFrame.Angles(0, 0.06981317007977318, -0.08726646259971647), 
											speed = 0.4
										} }, 
									returnframes = 45, 
									returnspeed = 0.1
								});
							elseif p33[2] == "swingvar3" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0.10471975511965978, 0.08726646259971647, -0.05235987755982989), 
											speed = 0.15
										}, {
											frames = 7, 
											value = CFrame.Angles(-0.06981317007977318, -0.03490658503988659, 0.05235987755982989), 
											speed = 0.4
										} }, 
									returnframes = 45, 
									returnspeed = 0.1
								});
							elseif p33[2] == "charge" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 6, 
											value = CFrame.Angles(0, 0.06981317007977318, 0.017453292519943295), 
											speed = 0.2
										}, {
											frames = 13, 
											value = CFrame.Angles(-0.017453292519943295, -0.10471975511965978, -0.05235987755982989), 
											speed = 0.3
										} }, 
									returnframes = 65, 
									returnspeed = 0.05
								});
							elseif p33[2] == "equip" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0.08726646259971647, -0.05235987755982989, 0.06981317007977318), 
											speed = 0.15
										}, {
											frames = 12, 
											value = CFrame.Angles(-0.06981317007977318, 0.05235987755982989, -0.08726646259971647), 
											speed = 0.3
										} }, 
									returnframes = 55, 
									returnspeed = 0.075
								});
							end;
						elseif p33[1] == "1HAXE" then
							if p33[2] == "swingvar1" then
								u25(v130, {
									loops = 1, 
									tables = { {
											frames = 8, 
											value = CFrame.Angles(0, 0.17453292519943295, 0.08726646259971647), 
											speed = 0.15
										} }, 
									returnframes = 30, 
									returnspeed = 0.15
								});
							elseif p33[2] == "swingvar2" then
								u25(v130, {
									loops = 1, 
									tables = { {
											frames = 8, 
											value = CFrame.Angles(0, -0.13962634015954636, -0.13962634015954636), 
											speed = 0.15
										} }, 
									returnframes = 30, 
									returnspeed = 0.15
								});
							elseif p33[2] == "swingvar3" then
								u25(v130, {
									loops = 1, 
									tables = { {
											frames = 8, 
											value = CFrame.Angles(0, 0.13962634015954636, 0.13962634015954636), 
											speed = 0.175
										} }, 
									returnframes = 30, 
									returnspeed = 0.15
								});
							elseif p33[2] == "charge" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 5, 
											value = CFrame.Angles(0.05235987755982989, -0.08726646259971647, 0.08726646259971647), 
											speed = 0.08
										}, {
											frames = 10, 
											value = CFrame.Angles(-0.17453292519943295, 0.08726646259971647, -0.08726646259971647), 
											speed = 0.4
										} }, 
									returnframes = 65, 
									returnspeed = 0.1
								});
							elseif p33[2] == "equip" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(-0.05235987755982989, -0.05235987755982989, -0.05235987755982989), 
											speed = 0.15
										}, {
											frames = 12, 
											value = CFrame.Angles(0, 0.05235987755982989, 0), 
											speed = 0.2
										} }, 
									returnframes = 30, 
									returnspeed = 0.075
								});
							end;
						elseif p33[1] == "2HSPR" then
							if p33[2] == "swingvar1" then
								u25(v130, {
									loops = 1, 
									tables = { {
											frames = 8, 
											value = CFrame.Angles(-0.03490658503988659, -0.08726646259971647, 0.05235987755982989), 
											speed = 0.15
										} }, 
									returnframes = 30, 
									returnspeed = 0.15
								});
							elseif p33[2] == "swingvar2" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 8, 
											value = CFrame.Angles(0.05235987755982989, 0.06981317007977318, -0.05235987755982989), 
											speed = 0.175
										}, {
											frames = 12, 
											value = CFrame.Angles(-0.06981317007977318, -0.05235987755982989, 0.06981317007977318), 
											speed = 0.2
										} }, 
									returnframes = 30, 
									returnspeed = 0.1
								});
							elseif p33[2] == "swingvar3" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 8, 
											value = CFrame.Angles(0, 0.10471975511965978, 0.05235987755982989), 
											speed = 0.15
										}, {
											frames = 12, 
											value = CFrame.Angles(0, -0.06981317007977318, -0.008726646259971648), 
											speed = 0.3
										} }, 
									returnframes = 30, 
									returnspeed = 0.1
								});
							elseif p33[2] == "charge" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 5, 
											value = CFrame.Angles(-0.08726646259971647, -0.13962634015954636, 0.13962634015954636), 
											speed = 0.1
										}, {
											frames = 8, 
											value = CFrame.Angles(0.03490658503988659, 0.05235987755982989, -0.08726646259971647), 
											speed = 0.3
										} }, 
									returnframes = 65, 
									returnspeed = 0.05
								});
							elseif p33[2] == "equip" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 8, 
											value = CFrame.Angles(0.08726646259971647, -0.05235987755982989, 0.05235987755982989), 
											speed = 0.1
										}, {
											frames = 12, 
											value = CFrame.Angles(-0.05235987755982989, 0, -0.03490658503988659), 
											speed = 0.3
										} }, 
									returnframes = 40, 
									returnspeed = 0.075
								});
							end;
						elseif p33[1] == "LSMG" then
							if p33[2] == "swing" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 20, 
											value = CFrame.Angles(-0.017453292519943295, -0.10471975511965978, -0.05235987755982989), 
											speed = 0.075
										}, {
											frames = 15, 
											value = CFrame.Angles(0, 0.10471975511965978, 0.03490658503988659), 
											speed = 0.2
										} }, 
									returnframes = 65, 
									returnspeed = 0.05
								});
							elseif p33[2] == "equip" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 13, 
											value = CFrame.Angles(0.08726646259971647, -0.05235987755982989, 0.06981317007977318), 
											speed = 0.15
										}, {
											frames = 17, 
											value = CFrame.Angles(-0.06981317007977318, 0.05235987755982989, -0.08726646259971647), 
											speed = 0.3
										} }, 
									returnframes = 55, 
									returnspeed = 0.075
								});
							elseif p33[2] == "bolt" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 13, 
											value = CFrame.Angles(-0.03490658503988659, 0, 0), 
											speed = 0.15
										}, {
											frames = 13, 
											value = CFrame.Angles(0.03490658503988659, 0, 0), 
											speed = 0.3
										} }, 
									returnframes = 55, 
									returnspeed = 0.075
								});
							end;
						elseif p33[1] == "RV" then
							if p33[2] == "equip" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(-0.08726646259971647, 0, 0.05235987755982989), 
											speed = 0.2
										}, {
											frames = 12, 
											value = CFrame.Angles(0.05235987755982989, 0.03490658503988659, -0.03490658503988659), 
											speed = 0.3
										} }, 
									returnframes = 45, 
									returnspeed = 0.075
								});
							end;
						elseif p33[1] == "MRV" then
							if p33[2] == "equip" then
								u25(v130, {
									loops = 2, 
									tables = { {
											frames = 10, 
											value = CFrame.Angles(0.08726646259971647, 0, 0.05235987755982989), 
											speed = 0.2
										}, {
											frames = 12, 
											value = CFrame.Angles(-0.05235987755982989, 0.03490658503988659, -0.03490658503988659), 
											speed = 0.3
										} }, 
									returnframes = 45, 
									returnspeed = 0.075
								});
							end;
						elseif p33[1] ~= "SMG" then
							if p33[1] == "ASMG" then
								if p33[2] == "equip" then
									u25(v130, {
										loops = 2, 
										tables = { {
												frames = 12, 
												value = CFrame.Angles(-0.10471975511965978, 0.03490658503988659, 0.06981317007977318), 
												speed = 0.15
											}, {
												frames = 8, 
												value = CFrame.Angles(0.06981317007977318, 0.05235987755982989, -0.05235987755982989), 
												speed = 0.3
											} }, 
										returnframes = 50, 
										returnspeed = 0.075
									});
								end;
							elseif p33[1] == "RFL" then
								if p33[2] == "equip" then
									u25(v130, {
										loops = 2, 
										tables = { {
												frames = 10, 
												value = CFrame.Angles(0.10471975511965978, -0.05235987755982989, -0.06981317007977318), 
												speed = 0.25
											}, {
												frames = 12, 
												value = CFrame.Angles(-0.10471975511965978, 0.05235987755982989, 0.05235987755982989), 
												speed = 0.1
											} }, 
										returnframes = 50, 
										returnspeed = 0.075
									});
								end;
							elseif p33[1] == "PST" then
								if p33[2] == "equip" then
									u25(v130, {
										loops = 1, 
										tables = { {
												frames = 11, 
												value = CFrame.Angles(-0.10471975511965978, -0.03490658503988659, 0.05235987755982989), 
												speed = 0.12
											} }, 
										returnframes = 40, 
										returnspeed = 0.065
									});
								end;
							elseif p33[1] == "2HPST" then
								if p33[2] == "equip" then
									u25(v130, {
										loops = 1, 
										tables = { {
												frames = 11, 
												value = CFrame.Angles(-0.12217304763960307, -0.05235987755982989, 0.06981317007977318), 
												speed = 0.12
											} }, 
										returnframes = 40, 
										returnspeed = 0.065
									});
								end;
							elseif p33[1] == "DBB" then
								if p33[2] == "equip" then
									u25(v130, {
										loops = 2, 
										tables = { {
												frames = 8, 
												value = CFrame.Angles(-0.06981317007977318, 0.03490658503988659, 0.026179938779914945), 
												speed = 0.25
											}, {
												frames = 10, 
												value = CFrame.Angles(0.10471975511965978, 0, 0), 
												speed = 0.3
											} }, 
										returnframes = 30, 
										returnspeed = 0.08
									});
								end;
							elseif p33[1] == "Item" then
								if p33[2] == "equip" then
									u25(v130, {
										loops = 2, 
										tables = { {
												frames = 8, 
												value = CFrame.Angles(-0.061086523819801536, 0.03490658503988659, 0.026179938779914945), 
												speed = 0.25
											}, {
												frames = 10, 
												value = CFrame.Angles(0.06981317007977318, 0, 0), 
												speed = 0.3
											} }, 
										returnframes = 30, 
										returnspeed = 0.08
									});
								end;
							end;
						elseif p33[2] == "equip" then
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 12, 
										value = CFrame.Angles(-0.10471975511965978, 0.03490658503988659, 0.06981317007977318), 
										speed = 0.15
									}, {
										frames = 8, 
										value = CFrame.Angles(0.06981317007977318, 0.05235987755982989, -0.05235987755982989), 
										speed = 0.3
									} }, 
								returnframes = 50, 
								returnspeed = 0.075
							});
						end;
					elseif p33[2] == "swingvar1" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 10, 
									value = CFrame.Angles(0, 0.08726646259971647, -0.03490658503988659), 
									speed = 0.15
								}, {
									frames = 10, 
									value = CFrame.Angles(0, -0.08726646259971647, 0.03490658503988659), 
									speed = 0.3
								} }, 
							returnframes = 30, 
							returnspeed = 0.075
						});
					elseif p33[2] == "swingvar2" then
						if p33[1] == "1HT" then
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 10, 
										value = CFrame.Angles(0, -0.08726646259971647, 0.03490658503988659), 
										speed = 0.15
									}, {
										frames = 10, 
										value = CFrame.Angles(0, 0.08726646259971647, -0.03490658503988659), 
										speed = 0.3
									} }, 
								returnframes = 30, 
								returnspeed = 0.075
							});
						else
							u25(v130, {
								loops = 2, 
								tables = { {
										frames = 10, 
										value = CFrame.Angles(-0.08726646259971647, -0.05235987755982989, 0.05235987755982989), 
										speed = 0.15
									}, {
										frames = 10, 
										value = CFrame.Angles(0.05235987755982989, 0.03490658503988659, -0.05235987755982989), 
										speed = 0.3
									} }, 
								returnframes = 30, 
								returnspeed = 0.1
							});
						end;
					elseif p33[2] == "swingvar3" then
						u25(v130, {
							loops = 1, 
							tables = { {
									frames = 10, 
									value = CFrame.Angles(0, 0.08726646259971647, 0.06981317007977318), 
									speed = 0.175
								} }, 
							returnframes = 30, 
							returnspeed = 0.1
						});
					elseif p33[2] == "charge" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 5, 
									value = CFrame.Angles(0, -0.13962634015954636, 0.05235987755982989), 
									speed = 0.1
								}, {
									frames = 8, 
									value = CFrame.Angles(0, 0.08726646259971647, -0.08726646259971647), 
									speed = 0.3
								} }, 
							returnframes = 70, 
							returnspeed = 0.05
						});
					elseif p33[2] == "equip" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 10, 
									value = CFrame.Angles(0.05235987755982989, 0.03490658503988659, 0.03490658503988659), 
									speed = 0.15
								}, {
									frames = 12, 
									value = CFrame.Angles(-0.05235987755982989, -0.03490658503988659, 0), 
									speed = 0.3
								} }, 
							returnframes = 30, 
							returnspeed = 0.075
						});
					end;
				elseif p33[2] == "swingvar1" then
					u25(v130, {
						loops = 2, 
						tables = { {
								frames = 8, 
								value = CFrame.Angles(0.05235987755982989, 0.017453292519943295, -0.05235987755982989), 
								speed = 0.15
							}, {
								frames = 10, 
								value = CFrame.Angles(-0.05235987755982989, -0.017453292519943295, 0.06981317007977318), 
								speed = 0.2
							} }, 
						returnframes = 30, 
						returnspeed = 0.075
					});
				elseif p33[2] == "swingvar2" then
					u25(v130, {
						loops = 2, 
						tables = { {
								frames = 8, 
								value = CFrame.Angles(0.05235987755982989, 0.08726646259971647, -0.05235987755982989), 
								speed = 0.15
							}, {
								frames = 10, 
								value = CFrame.Angles(-0.05235987755982989, -0.06981317007977318, 0.05235987755982989), 
								speed = 0.2
							} }, 
						returnframes = 30, 
						returnspeed = 0.1
					});
				elseif p33[2] == "swingvar3" then
					u25(v130, {
						loops = 2, 
						tables = { {
								frames = 8, 
								value = CFrame.Angles(0, 0.08726646259971647, -0.06981317007977318), 
								speed = 0.1
							}, {
								frames = 10, 
								value = CFrame.Angles(0, -0.06981317007977318, 0.08726646259971647), 
								speed = 0.2
							} }, 
						returnframes = 30, 
						returnspeed = 0.1
					});
				elseif p33[2] == "charge" then
					u25(v130, {
						loops = 2, 
						tables = { {
								frames = 8, 
								value = CFrame.Angles(0.10471975511965978, 0.017453292519943295, -0.05235987755982989), 
								speed = 0.2
							}, {
								frames = 8, 
								value = CFrame.Angles(-0.017453292519943295, -0.017453292519943295, 0.017453292519943295), 
								speed = 0.2
							} }, 
						returnframes = 65, 
						returnspeed = 0.05
					});
				elseif p33[2] == "equip" then
					if p33[1] == "1BT" then
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 10, 
									value = CFrame.Angles(0.05235987755982989, -0.03490658503988659, 0.05235987755982989), 
									speed = 0.15
								}, {
									frames = 12, 
									value = CFrame.Angles(-0.03490658503988659, 0, 0), 
									speed = 0.3
								} }, 
							returnframes = 30, 
							returnspeed = 0.075
						});
					else
						u25(v130, {
							loops = 2, 
							tables = { {
									frames = 10, 
									value = CFrame.Angles(-0.05235987755982989, 0.03490658503988659, -0.05235987755982989), 
									speed = 0.15
								}, {
									frames = 12, 
									value = CFrame.Angles(0.03490658503988659, 0, 0), 
									speed = 0.3
								} }, 
							returnframes = 30, 
							returnspeed = 0.075
						});
					end;
				end;
			elseif p33[2] == "swingvar1" then
				u25(v130, {
					loops = 1, 
					tables = { {
							frames = 5, 
							value = CFrame.Angles(0, -0.12217304763960307, -0.12217304763960307), 
							speed = 0.15
						} }, 
					returnframes = 30, 
					returnspeed = 0.1
				});
			elseif p33[2] == "swingvar2" then
				u25(v130, {
					loops = 2, 
					tables = { {
							frames = 5, 
							value = CFrame.Angles(-0.05235987755982989, 0.05235987755982989, 0.08726646259971647), 
							speed = 0.15
						}, {
							frames = 10, 
							value = CFrame.Angles(0.05235987755982989, -0.026179938779914945, -0.017453292519943295), 
							speed = 0.3
						} }, 
					returnframes = 30, 
					returnspeed = 0.1
				});
			elseif p33[2] == "swingvar3" then
				u25(v130, {
					loops = 2, 
					tables = { {
							frames = 5, 
							value = CFrame.Angles(0, 0.08726646259971647, 0.05235987755982989), 
							speed = 0.15
						}, {
							frames = 8, 
							value = CFrame.Angles(0, -0.05235987755982989, -0.008726646259971648), 
							speed = 0.4
						} }, 
					returnframes = 30, 
					returnspeed = 0.1
				});
			elseif p33[2] == "charge" then
				u25(v130, {
					loops = 2, 
					tables = { {
							frames = 5, 
							value = CFrame.Angles(0, -0.13962634015954636, -0.05235987755982989), 
							speed = 0.125
						}, {
							frames = 10, 
							value = CFrame.Angles(0, 0.17453292519943295, 0.008726646259971648), 
							speed = 0.4
						} }, 
					returnframes = 65, 
					returnspeed = 0.05
				});
			elseif p33[2] == "equip" then
				u25(v130, {
					loops = 1, 
					tables = { {
							frames = 12, 
							value = CFrame.Angles(0.05235987755982989, 0, 0), 
							speed = 0.5
						} }, 
					returnframes = 30, 
					returnspeed = 0.075
				});
			end;
		elseif p32 == "shove" then
			u25(v130, {
				loops = 2, 
				tables = { {
						frames = 8, 
						value = CFrame.Angles(0.08726646259971647, 0, 0), 
						speed = 0.15
					}, {
						frames = 8, 
						value = CFrame.Angles(-0.10471975511965978, 0, 0), 
						speed = 0.3
					} }, 
				returnframes = 20, 
				returnspeed = 0.2
			});
		elseif p32 == "stagger" then
			u25(v130, {
				loops = 3, 
				tables = { {
						frames = 10, 
						value = CFrame.Angles(0.2617993877991494, -0.2617993877991494, 0.2617993877991494), 
						speed = 0.05
					}, {
						frames = 15, 
						value = CFrame.Angles(-0.2617993877991494, -0.2617993877991494, -0.2617993877991494), 
						speed = 0.035
					}, {
						frames = 15, 
						value = CFrame.Angles(-0.2617993877991494, 0.13962634015954636, 0.13962634015954636), 
						speed = 0.035
					} }, 
				returnframes = 70, 
				returnspeed = 0.05
			});
		elseif p32 == "tinnitus" then
			u25(v130, {
				loops = 6, 
				tables = { {
						frames = 20, 
						value = CFrame.Angles(0.2617993877991494, -0.2617993877991494, 0.2617993877991494), 
						speed = 0.025
					}, {
						frames = 25, 
						value = CFrame.Angles(-0.2617993877991494, -0.2617993877991494, -0.2617993877991494), 
						speed = 0.015
					}, {
						frames = 20, 
						value = CFrame.Angles(-0.2617993877991494, 0.13962634015954636, 0.13962634015954636), 
						speed = 0.015
					}, {
						frames = 20, 
						value = CFrame.Angles(0.17453292519943295, -0.17453292519943295, 0.17453292519943295), 
						speed = 0.025
					}, {
						frames = 25, 
						value = CFrame.Angles(-0.2617993877991494, -0.4363323129985824, -0.2617993877991494), 
						speed = 0.015
					}, {
						frames = 25, 
						value = CFrame.Angles(-0.08726646259971647, 0.13962634015954636, 0.08726646259971647), 
						speed = 0.015
					} }, 
				returnframes = 70, 
				returnspeed = 0.05
			});
		elseif p32 == "abilityshake" then
			u25(v130, {
				loops = 4, 
				tables = { {
						frames = 4, 
						value = CFrame.Angles(0, 0, 0.10471975511965978), 
						speed = 0.2
					}, {
						frames = 4, 
						value = CFrame.Angles(0, 0, -0.08726646259971647), 
						speed = 0.2
					}, {
						frames = 4, 
						value = CFrame.Angles(0, 0, 0.05235987755982989), 
						speed = 0.2
					}, {
						frames = 4, 
						value = CFrame.Angles(0, 0, -0.03490658503988659), 
						speed = 0.2
					} }, 
				returnframes = 70, 
				returnspeed = 0.05
			});
		elseif p32 == "tased" then
			u25(v130, {
				loops = 9, 
				tables = { {
						frames = 5, 
						value = CFrame.Angles(math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4)), 
						speed = 0.3
					}, {
						frames = 5, 
						value = CFrame.Angles(math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4)), 
						speed = 0.3
					}, {
						frames = 5, 
						value = CFrame.Angles(math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4)), 
						speed = 0.3
					}, {
						frames = 5, 
						value = CFrame.Angles(math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4)), 
						speed = 0.3
					}, {
						frames = 5, 
						value = CFrame.Angles(math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4)), 
						speed = 0.3
					}, {
						frames = 5, 
						value = CFrame.Angles(math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4)), 
						speed = 0.3
					}, {
						frames = 5, 
						value = CFrame.Angles(math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4)), 
						speed = 0.3
					}, {
						frames = 5, 
						value = CFrame.Angles(math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4)), 
						speed = 0.3
					}, {
						frames = 5, 
						value = CFrame.Angles(math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4), math.rad(math.random(-15, 15) / 4)), 
						speed = 0.3
					} }, 
				returnframes = 60, 
				returnspeed = 0.05
			});
		elseif p32 == "damage" then
			local v131 = math.clamp(p33[1] * 0.35, 2, 20);
			local v132 = { math.random(-v131 * 10, v131 * 10) / 10, math.random(-v131 * 10, v131 * 10) / 10, math.random(-v131 * 10, v131 * 10) / 10 };
			u25(v130, {
				loops = 1, 
				tables = { {
						frames = 10, 
						value = CFrame.Angles(math.rad(v132[1]), math.rad(v132[2]), math.rad(v132[3])), 
						speed = 0.6
					} }, 
				returnframes = 100 + v131, 
				returnspeed = math.clamp(0.2 - p33[1] / 70, 0.03, 0.2)
			});
		elseif p32 == "gunrecoil" then
			local v133 = p33[1];
			local v134 = { v133, math.random(-v133, v133) / 2 };
			u25(v130, {
				loops = 1, 
				tables = { {
						frames = 6, 
						value = CFrame.Angles(math.rad(v134[1]), math.rad(v134[2]), 0), 
						speed = 0.2 + v133 / 300
					} }, 
				returnframes = 150 + v133 * 5, 
				returnspeed = 0.2 - v133 / 200
			});
		elseif p32 == "jumpstart" then
			u25(v130, {
				loops = 2, 
				tables = { {
						frames = 3, 
						value = CFrame.Angles(-0.08726646259971647, 0, 0), 
						speed = 0.2
					}, {
						frames = 6, 
						value = CFrame.Angles(0.08726646259971647, 0, 0), 
						speed = 0.2
					} }, 
				returnframes = 30, 
				returnspeed = 0.1
			});
		elseif p32 == "jumpland" then
			u25(v130, {
				loops = 1, 
				tables = { {
						frames = 6, 
						value = CFrame.Angles(-0.08726646259971647, 0, 0), 
						speed = 0.2
					} }, 
				returnframes = 30, 
				returnspeed = 0.1
			});
		elseif p32 == "slide" then
			u25(v130, {
				loops = 1, 
				tables = { {
						frames = 30, 
						value = CFrame.Angles(0, 0, 0.13962634015954636), 
						speed = 0.05
					} }, 
				returnframes = 40, 
				returnspeed = 0.075
			});
		elseif p32 == "guntilt" then
			local v135 = p33[1] / 2;
			local v136 = v135;
			if math.random(1, 2) == 1 then
				v136 = -v136;
			end;
			u25(v130, {
				loops = 2, 
				tables = { {
						frames = 4, 
						value = CFrame.Angles(0, 0, math.rad(v136)), 
						speed = 0.2 + v135 / 300
					}, {
						frames = 4, 
						value = CFrame.Angles(0, 0, math.rad(-v136)), 
						speed = 0.2 + v135 / 300
					} }, 
				returnframes = 150 + v135 * 5, 
				returnspeed = 0.2 - v135 / 200
			});
		elseif p32 == "usestim" then
			u25(v130, {
				loops = 2, 
				tables = { {
						frames = 10, 
						value = CFrame.Angles(0.03490658503988659, 0.05235987755982989, 0.03490658503988659), 
						speed = 0.1
					}, {
						frames = 8, 
						value = CFrame.Angles(0, 0, -0.06981317007977318), 
						speed = 0.2
					} }, 
				returnframes = 30, 
				returnspeed = 0.2
			});
		elseif p32 == "climb" then
			u25(v130, {
				loops = 2, 
				tables = { {
						frames = 11, 
						value = CFrame.Angles(0.06981317007977318, 0.10471975511965978, -0.12217304763960307), 
						speed = 0.1
					}, {
						frames = 8, 
						value = CFrame.Angles(-0.06981317007977318, 0, 0.10471975511965978), 
						speed = 0.2
					} }, 
				returnframes = 30, 
				returnspeed = 0.2
			});
		elseif p32 == "backpack" then
			u25(v130, {
				loops = 4, 
				tables = { {
						frames = 8, 
						value = CFrame.Angles(0.05235987755982989, -0.06981317007977318, -0.06981317007977318), 
						speed = 0.1
					}, {
						frames = 6, 
						value = CFrame.Angles(-0.05235987755982989, -0.06981317007977318, 0.06981317007977318), 
						speed = 0.2
					}, {
						frames = 8, 
						value = CFrame.Angles(0.05235987755982989, 0.06981317007977318, 0.06981317007977318), 
						speed = 0.1
					}, {
						frames = 6, 
						value = CFrame.Angles(-0.05235987755982989, 0.06981317007977318, -0.06981317007977318), 
						speed = 0.2
					} }, 
				returnframes = 30, 
				returnspeed = 0.2
			});
		end;
		u23[v130] = nil;
	end);
end;
sprint_stam = 100;
buff_sprint_stam = 0;
gun_holster_timer = tick();
sprint_lockout = 0;
local u26 = {
	w = false, 
	a = false, 
	s = false, 
	d = false
};
adjustcamto = Vector3.new(0, 0, 0);
crouch_wait = tick();
crouch_held = false;
ajustarmpos = CFrame.new(0, 0, 0);
ajustarmposto = CFrame.new(0, 0, 0);
local u27 = Vector3.new(0, 1.5, 0);
slide_wait = tick();
local function u28()
	if u8.air == true or u8.sprinting == true or u8.sliding == true then
		return;
	end;
	if u8.sneaking == true then
		u8.sneaking = false;
		return;
	end;
	if tick() - crouch_wait <= 0.5 then
		return;
	end;
	crouch_wait = tick();
	u8.sneaking = true;
	u19 = u19 - 6;
	u27 = Vector3.new(0, 0.75, 0);
	l__workspace__1.ServerStuff.movementAdjust:FireServer("sneak", true);
	ajustarmpos = CFrame.new(0, -0.2, 0);
	check_walking_anim();
	while true do
		RS:wait();
		if u8.sprinting == true then
			break;
		end;
		if u8.air == true then
			break;
		end;
		if u8.staggering == true then
			break;
		end;
		if u8.channel == true then
			break;
		end;
		if u8.sneaking == false then
			break;
		end;	
	end;
	ajustarmpos = CFrame.new(0, 0, 0);
	crouch_wait = tick();
	u27 = Vector3.new(0, 1.5, 0);
	l__workspace__1.ServerStuff.movementAdjust:FireServer("sneak", false);
	u8.sneaking = false;
	u19 = u19 + 6;
	check_walking_anim();
end;
function drop_slide()
	if u8.air ~= true then
		if u8.sneaking ~= true then
			if not u9.Exhaustion then
				if u10 < 1 then

				else
					slide_wait = tick();
					u8.sneaking = false;
					u8.sliding = true;
					u8.sprinting = false;
					u8.canjump = false;
					u27 = Vector3.new(0, 0.6, 0);
					if exhaustion_immunity == false then
						sprint_stam = sprint_stam - 25;
					end;
					local v137 = Instance.new("BodyVelocity");
					v137.Name = "parkourPositionThing";
					v137.P = 100;
					v137.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
					v137.Velocity = character.HumanoidRootPart.CFrame.lookVector * (8 + hum.WalkSpeed);
					v137.Parent = character.HumanoidRootPart;
					globalanimsets.slide:Play(0.1, 1, 1.5);
					gun_holster_timer = tick();
					u19 = u19 - 80;
					shakecamera("slide");
					tpglobalanimsets.slide:Play(0.1, 1, 1);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "movement_sounds" }, "slide", character.HumanoidRootPart, 0.1);
					local v138 = tick();
					while true do
						if not raycastline(character.HumanoidRootPart.Position, character.HumanoidRootPart.CFrame.lookVector, 3, baselayer) then

						else
							break;
						end;
						if 0.2 <= tick() - slide_wait then
							tpglobalanimsets.slide:Play(0);
						end;
						if 0.03 <= tick() - v138 then
							v138 = tick();
							v137.Velocity = character.HumanoidRootPart.CFrame.lookVector * 20;
						end;
						RS:wait();
						if not (0.7 <= tick() - slide_wait) then

						else
							break;
						end;
						if u8.staggering ~= true then

						else
							break;
						end;
						if u8.sliding ~= false then

						else
							break;
						end;
						if u8.air ~= true then

						else
							break;
						end;					
					end;
					tpglobalanimsets.slide:Stop(0.4);
					u19 = u19 + 80;
					globalanimsets.slide:Stop(0.5);
					v137:Destroy();
					u8.sliding = false;
					u8.canjump = true;
					slide_wait = tick();
					if crouch_held == true then
						if u8.staggering == false then
							u28();
							return;
						else
							u27 = Vector3.new(0, 1.5, 0);
							return;
						end;
					else
						u27 = Vector3.new(0, 1.5, 0);
						return;
					end;
				end;
			end;
		end;
	end;
end;
local u29 = 0;
local u30 = 0;
local u31 = 0;
local u32 = {
	ticktimers = {}, 
	tagged = {}, 
	suslevels = {}, 
	damagedealt = {}, 
	nowinshowdown = false
};
l__workspace__1.ServerStuff.eventTime.OnClientEvent:Connect(function(p34, p35)
	if p34 == "showdownbegin" then
		v104({ "events" }, "duel", nil, nil, true, true);
		v104({ "events" }, "thunder", nil, nil, true, true);
		l__game__6.ReplicatedStorage.misc.showdownFX:Clone().Parent = ply.PlayerGui;
		u32.nowinshowdown = true;
		afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Shd);
		local v139 = l__workspace__1.NoTarget:WaitForChild(p35);
		while l__workspace__1.NoTarget:FindFirstChild(p35) do
			if (character.Torso.Position - l__workspace__1.NoTarget:FindFirstChild(p35).centre.Position).magnitude < 20 then
				afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Shd);
			end;
			RS:wait();
			if l__workspace__1.NoTarget:FindFirstChild(p35) == nil then
				break;
			end;
			if hum.Health <= 0 then
				break;
			end;		
		end;
	elseif p34 == "showdownover" then
		u32.nowinshowdown = false;
	end;
end);
function trigger_map_item_func(p36, p37, p38)
	if p36 ~= nil then
		if p36.Parent == nil then
			return;
		end;
	else
		return;
	end;
	if p36 then
		if p36.Parent then
			if p36.Name ~= "CRBarrel" then
				if p36.Name == "SANCBarrel" then
					l__workspace__1.ServerStuff.detBarrel:FireServer(p36.Parent.Parent);
					return;
				end;
			else
				l__workspace__1.ServerStuff.detBarrel:FireServer(p36.Parent.Parent);
				return;
			end;
		end;
	end;
	if p36 then
		if p36.Parent then
			if p36.Parent.Parent then
				if p36.Parent.Parent.Name ~= "Barrel" then
					if p36.Parent.Parent.Name == "S.A.N.C Barrel" then
						l__workspace__1.ServerStuff.detBarrel:FireServer(p36.Parent.Parent);
						return;
					end;
				else
					l__workspace__1.ServerStuff.detBarrel:FireServer(p36.Parent.Parent);
					return;
				end;
			end;
		end;
	end;
	if p36 then
		if p36.Parent then
			if p36.Name == "CRPylon" then
				local v140 = 10;
				if p37 == "gundamage" then
					v140 = 1;
				end;
				if v140 <= p38 then
					l__workspace__1.ServerStuff.detBarrel:FireServer(p36.Parent.Parent, false);
				end;
			end;
		end;
	end;
end;
l__workspace__1.ServerStuff.getStatsBack.OnClientEvent:Connect(function(p39)
	if hum and hum.Health > 0 then
		playerstats = p39;
	end;
	update_player_challenges();
end);
local u33 = false;
local function u34(p40, p41)
	if startperk.Value == "hubbing" then
		return;
	end;
	local v141 = maingui.SponsorFrame.Image:Clone();
	l__Debris__32:AddItem(v141, 4);
	v141.Name = "fakeflash";
	v141.Parent = maingui.SponsorFrame;
	spawn(function()
		for v142 = 1, 60 do
			v141.ImageTransparency = v141.ImageTransparency + 0.015;
			v141.Size = v141.Size + UDim2.new(0, 1, 0, 1);
			RS:wait();
		end;
		if v141 then
			v141:Destroy();
		end;
	end);
	handle_scrap_drop(0);
	v104({ "general" }, "funcadd", nil, nil, true, true);
	u13 = u13 + p40;
	local l__funcgain__143 = maingui.SponsorFrame.funcgain;
	l__funcgain__143.TextTransparency = 0;
	local v144 = "+";
	if p40 < 0 then
		v144 = "";
	end;
	l__funcgain__143.Text = v144 .. p40 .. " " .. p41;
	maingui.SponsorFrame.funclabel.Text = u13;
	func_flasher = tick();
	local v145 = l__funcgain__143.gradient:Clone();
	l__Debris__32:AddItem(v145, 2);
	spawn(function()
		v145.Visible = true;
		v145.Parent = l__funcgain__143;
		for v146 = 1, 30 do
			v145.ImageTransparency = v145.ImageTransparency + 0.03;
			v145.Size = v145.Size + UDim2.new(0, 2, 0, 0);
			RS:wait();
		end;
		if v145 then
			v145:Destroy();
		end;
	end);
	spawn(function()
		while true do
			RS:wait();
			if tick() - func_flasher >= 3 then
				break;
			end;		
		end;
		l__funcgain__143.TextTransparency = l__funcgain__143.TextTransparency + 0.02;
		while true do
			l__funcgain__143.TextTransparency = l__funcgain__143.TextTransparency + 0.02;
			RS:wait();
			if l__funcgain__143.TextTransparency >= 1 then
				break;
			end;
			if l__funcgain__143.TextTransparency == 0 then
				break;
			end;		
		end;
	end);
	if tonumber(maingui.SponsorFrame.funclabel.Text) >= 2500 then
		l__workspace__1.ServerStuff.callEvent:FireServer("lel");
	end;
	if u13 >= 2500 then
		l__workspace__1.ServerStuff.callEvent:FireServer("lel");
	end;
end;
local u35 = false;
local u36 = 0;
local function u37()
	if bloodsprayDealt > 35 or u29 > 35 then
		if bloodsprayDealt > 35 then
			if u30 < 5 then
				u30 = u30 + 1;
				if startperk.Value == "hiddenB" then
					return;
				end;
				l__workspace__1.ServerStuff.paintWeapon:FireServer(u30, "arms");
			end;
			bloodsprayDealt = 0;
			if v6[1][1] ~= "Fist" and v6[1][2] == true then
				bloodtier = bloodtier + 1;
				if bloodtier <= 6 then
					if startperk.Value == "hiddenB" then
						return;
					end;
					l__workspace__1.ServerStuff.paintWeapon:FireServer(bloodtier, "wep");
					sharedm.paintwep(u16.Model, bloodtier);
				end;
			end;
		elseif u29 > 35 then
			if u31 < 3 then
				u31 = u31 + 1;
				if startperk.Value == "hiddenB" then
					return;
				end;
				l__workspace__1.ServerStuff.paintWeapon:FireServer(u31, "body");
			end;
			u29 = 0;
		end;
		local v147 = { { "rbxassetid://396983823", Color3.fromRGB(102, 102, 102) }, { "rbxassetid://1483727717", Color3.fromRGB(255, 255, 255) }, { "rbxassetid://7276343317", Color3.fromRGB(124, 55, 55) }, { "rbxassetid://2630738539", Color3.fromRGB(103, 103, 103) }, { "rbxassetid://2630742998", Color3.fromRGB(148, 30, 30) } };
		local v148 = Instance.new("ImageLabel");
		l__Debris__32:AddItem(v148, 5);
		local v149 = math.random(250, 300);
		v148.Size = UDim2.new(0.5, v149, 0.5, v149);
		v148.AnchorPoint = Vector2.new(0.5, 0.5);
		if math.random(1, 2) == 1 then
			local v150 = 0.9;
		else
			v150 = 0.1;
		end;
		v148.Position = UDim2.new(v150 + math.random(-5, 5) / 100, 0, math.random(0, 20) / 20, 0);
		v148.Rotation = math.random(0, 360);
		v148.ZIndex = 4;
		v148.BackgroundTransparency = 1;
		v148.BorderSizePixel = 0;
		local v151 = v147[math.random(1, #v147)];
		v148.Image = v151[1];
		v148.ImageColor3 = v151[2];
		v148.Parent = maingui;
		delay(math.random(15, 25) / 10, function()
			for v152 = 1, 40 do
				v148.ImageTransparency = v152 / 40;
				RS:wait();
			end;
			v148:Destroy();
		end);
	end;
end;
local u38 = 0;
local function u39(p42, p43)
	if p43 == nil then
		return;
	end;
	local v153 = l__game__6.ReplicatedStorage.effects.damagenumber:Clone();
	l__Debris__32:AddItem(v153, 5);
	v153.bg.label.Text = math.ceil(p43);
	if p43 >= 70 then
		v153.bg.label.TextColor3 = Color3.new(0.9, 0, 0);
		v153.bg.label.TextSize = 30;
	end;
	v153.CFrame = CFrame.new(p42) * CFrame.new(math.random(-20, 20) / 10, 0, math.random(-20, 20) / 10);
	v153.Parent = l__workspace__1.Camera;
	local l__CFrame__40 = v153.CFrame;
	spawn(function()
		for v154 = 1, 20 do
			v153.CFrame = v153.CFrame:Lerp(l__CFrame__40 * CFrame.new(0, 2.5, 0), 0.1);
			RS:wait();
		end;
		delay(1, function()
			for v155 = 1, 20 do
				if v153.Parent == nil then
					return;
				end;
				v153.bg.label.TextTransparency = v153.bg.label.TextTransparency + 0.05;
				v153.bg.label.TextStrokeTransparency = v153.bg.label.TextTransparency;
				RS:wait();
			end;
			v153:Destroy();
		end);
	end);
end;
local function v156()
	v104({ "hitsound", "general" }, "throwhit", nil, nil, true, true);
	local v157 = maingui.Centre.ThrowHitmarker:Clone();
	v157.ImageTransparency = 0;
	v157.Parent = maingui.Centre;
	spawn(function()
		while true do
			v157.ImageTransparency = v157.ImageTransparency + 0.04;
			RS:wait();
			if v157.ImageTransparency == 1 then
				break;
			end;
			if v157.ImageTransparency > 1 then
				break;
			end;		
		end;
		v157:Destroy();
	end);
end;
l__workspace__1.ServerStuff.hitmarker.OnClientEvent:Connect(v156);
local u41 = 0;
local u42 = 1;
local u43 = v50;
local function u44(p44, p45, p46)
	if u9.Cloaked and v63.driftactive == nil then
		u9.Cloaked.effects.currentduration = 0;
	end;
	local v158 = u14;
	if p46 == true then
		v158 = akimbo_factors.alt_weapon_stats;
	end;
	local l__CFrame__159 = l__CurrentCamera__1.CFrame;
	local v160 = 4 + 0.4 * v158.sizerating;
	if v158.sizerating == 4 then
		v160 = v160 + 0.45;
	end;
	local v161 = v160 - 1.65;
	local v162 = false;
	local v163 = false;
	local v164 = Vector3.new(0, 0, 0);
	local v165 = "meleedamage";
	if (v158.weapontype == "Gun" or v158.weapontype == "Bow") and typeof(p44) ~= "string" then
		local l__sizerating__166 = v158.sizerating;
		local v167 = v45;
		if u33 == true then
			v167 = 0;
		end;
		local v168 = math.clamp(l__sizerating__166 - l__sizerating__166 * v167, 0.01, 10000);
		if v158.weapontype == "Bow" then
			v165 = "gundamage";
			v162 = true;
			v163 = true;
			v160 = 80;
			v161 = 0;
			if u8.walking == true then
				v164 = Vector3.new(math.rad(math.random(-v168, v168)), math.rad(math.random(-v168, v168)), math.rad(math.random(-v168, v168)));
			end;
		else
			local v169 = false;
			if u8.aiming == false then
				v169 = true;
			end;
			if tick() - baseadstick <= baseadstime / (1 + baseadsmod) / 8 then
				v169 = true;
			end;
			if u33 == true then
				v169 = true;
			end;
			if v169 == true then
				v164 = Vector3.new(math.rad(math.random(-v168, v168)), math.rad(math.random(-v168, v168)), math.rad(math.random(-v168, v168)));
			end;
		end;
	end;
	local v170 = true;
	if typeof(p44) == "string" then
		v160 = 3.5;
		v161 = 3.5;
		if p44 == "pepperspray" then
			v160 = 6;
			v161 = 6;
			v170 = false;
		end;
	end;
	local v171, v172 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector + v164, v160, baselayer);
	if v170 == true then
		trigger_map_item_func(v171, v165, p44);
		if v171 and ((v171.Name == "HarvestWood" or v171.Name == "HarvestStone") and p44 ~= "shove" and p44 ~= "shovebleed" and v165 == "meleedamage" and v171.Name ~= "Interact") then
			local v173 = true;
			if v171.Parent and (v171.Name == "CRBarrel" or v171.Name == "CRPylon") then
				v173 = false;
			end;
			if v173 == true then
				local v174 = "wood";
				if v171.Name == "HarvestStone" then
					v174 = "stone";
				end;
				local v175 = 2;
				if v158.weapontype == "Fists" then
					v175 = 1;
				end;
				if v158.weapontype == "Bludgeon" and v174 == "stone" or v158.weapontype == "Axe" and v174 == "wood" then
					v175 = 3;
				end;
				l__workspace__1.ServerStuff.applyGore:FireServer("harvestmat", character, ply, { v174, v172 });
				l__workspace__1.ServerStuff.playAudio:FireServer({ "harvesting" }, v174 .. "hit", character.HumanoidRootPart, 0.2);
				harvestinghits = harvestinghits - v175;
				if harvestinghits <= 0 then
					u34(2, "SALVAGE");
					l__workspace__1.ServerStuff.applyGore:FireServer("harvestmat", character, ply, { "salvaged", v172 });
					harvestinghits = v49;
					l__workspace__1.ServerStuff.harvest:FireServer(v174, v171.Parent);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "harvesting" }, v174 .. "break", character.HumanoidRootPart, 0.2);
				end;
			end;
		end;
	end;
	local v176 = nil;
	local v177 = v161;
	if v161 > 0 then
		local v178, v179, v180 = pairs(l__game__6.Players:GetChildren());
		while true do
			local v181, v182 = v178(v179, v180);
			if not v181 then
				break;
			end;
			local v183 = v182:FindFirstChild("npc") and v183.Value;
			if v183 == nil and v182:IsA("Player") then
				v183 = v182.Character;
			end;
			if v183 and v183:FindFirstChild("HumanoidRootPart") and (v172 - v183.HumanoidRootPart.CFrame.p).magnitude < v177 and v182 ~= ply and v183:FindFirstChild("Humanoid") and v183.Humanoid.Health > 0 then
				v177 = (v172 - v183.HumanoidRootPart.CFrame.p).magnitude;
				v176 = v183;
				if teamfolder and v183:IsDescendantOf(teamfolder) then
					v176 = nil;
				end;
				if v183:IsDescendantOf(l__workspace__1.activeFriendlies) then
					v176 = nil;
				end;
			end;		
		end;
	end;
	if v163 == true and v171 == nil then
		local v184 = v172;
		for v185 = 1, 200 do
			local v186, v187 = raycastline(v184, l__CurrentCamera__1.CFrame.LookVector + v164 + Vector3.new(0, -0.05, 0), 3, baselayer);
			trigger_map_item_func(v186, v165, p44);
			if v186 then
				v171 = v186;
				break;
			end;
			v184 = v187;
			RS:wait();
		end;
	end;
	if v171 and v171.Name == "ricochet" and v165 == "gundamage" then
		l__workspace__1.ServerStuff.applyGore:FireServer("gunricochet", character, ply, { v172 });
	end;
	if v171 and v171.Parent:FindFirstChild("Humanoid") and v171.Parent:FindFirstChild("HumanoidRootPart") and (v171.Parent:FindFirstChild("Humanoid").Health > 0 and not v176) then
		v176 = v171.Parent;
	end;
	if v171 and p44 ~= "shove" and p44 ~= "shovebleed" and v165 == "meleedamage" and v171.Name ~= "Interact" and false == false and v176 == nil then
		l__workspace__1.ServerStuff.applyGore:FireServer("firegun", character, ply, { character.Head.Position, v172, true, nil, true });
	end;
	if v162 == true then
		if v163 == true then
			l__workspace__1.ServerStuff.applyGore:FireServer("bowarrow", character, ply, { l__CurrentCamera__1.CFrame, v164 });
		else
			local v188 = false;
			if p45 == "suppressed" then
				v188 = true;
			end;
			local v189 = u16.muzzle.Position;
			if p46 == true then
				v189 = akimbo_factors.alt_weapon.muzzle.Position;
			end;
			if v158.animset == "LSMG" or v158.name == "A.J.M. 9" then
				l__workspace__1.ServerStuff.applyGore:FireServer("firelaser", character, ply, { v189, v172 });
			else
				l__workspace__1.ServerStuff.applyGore:FireServer("firegun", character, ply, { v189, v172, v188, v176, true, u14.damagerating[4] });
			end;
			if u9["Immolator Buff"] then
				l__workspace__1.ServerStuff.applyGore:FireServer("incendiary_trail", character, ply, { v189, v172 });
			end;
		end;
	end;
	if v176 and v162 == false and v163 == false and not raycastline(v176.Head.CFrame.p, -(v176.Head.CFrame.p - character.Head.CFrame.p), 100, { l__workspace__1.GoreEffects, v176 }) then
		v176 = nil;
	end;
	local v190 = false;
	local v191 = p44;
	local v192 = false;
	if v176 then
		local v193 = CFrame.new(v176.HumanoidRootPart.CFrame.p, v176.HumanoidRootPart.CFrame.p + Vector3.new(v176.HumanoidRootPart.CFrame.lookVector.x, 0, v176.HumanoidRootPart.CFrame.lookVector.z).unit):inverse() * character.HumanoidRootPart.Position;
		local l__unit__194 = Vector3.new(v193.x, v193.z).unit;
		local v195 = math.deg(math.atan2(l__unit__194.y * 200, l__unit__194.x * 200)) + 90;
		if v162 == true then
			v165 = "gundamage";
			v190 = v171.Name == "Head";
		end;
		if v190 == true and typeof(p44) ~= "string" then
			if v162 == true then
				v191 = v158.damagerating[4];
				p44 = v158.damagerating[4];
			end;
			if v162 == false then
				l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "Backstabs", 1 });
			end;
		end;
		if typeof(p44) ~= "string" and v162 == true and v176:FindFirstChild("perks") and v176:FindFirstChild("perks"):FindFirstChild("thick") then
			v191 = v191 - v191 * v8.thick.efx[1] / 100;
		end;
		if v176 then
			if typeof(v191) ~= "string" and v190 ~= true and v165 == "meleedamage" and u35 == false then
				v191 = math.ceil(v191 * (u18 + u36));
				if v176:FindFirstChild("activeBlock") and v176:FindFirstChild("activeBlock").Value == true then
					v192 = true;
				end;
			end;
			if v192 == true then
				l__workspace__1.ServerStuff.applyGore:FireServer("blocksmoke", v176, nil, nil);
				l__workspace__1.ServerStuff.playAudio:FireServer({ "hitsound", "general" }, "hitblocked", character.HumanoidRootPart, 0.15);
				l__workspace__1.ServerStuff.dealDamage:FireServer("registerblocked", v176, v5, v4);
				spawn(function()
					stagger("normal");
				end);
				return;
			end;
		end;
		local u45 = true;
		spawn(function()
			l__workspace__1.ServerStuff.dealDamage:FireServer({ v165, v176, p44, v190, u15, v192, false, playerperks, v171, u14 }, nil, v5, v4);
			if u45 == true then
				if typeof(p44) ~= "string" then
					if v162 == false then
						if u32.damagedealt[v176.Name] == nil then
							u32.damagedealt[v176.Name] = v191;
						else
							u32.damagedealt[v176.Name] = u32.damagedealt[v176.Name] + v191;
						end;
						if u32.tagged[v176.Name] and v191 >= 12 then
							u32.tagged[v176.Name] = nil;
							u32.ticktimers[v176.Name] = tick();
							u32.suslevels[v176.Name] = tick();
						end;
						if u32.tagged[v176.Name] == nil and u32.damagedealt[v176.Name] and u32.damagedealt[v176.Name] >= 20 then
							local v196 = 10000;
							local v197 = nil;
							for v198, v199 in pairs(u32.tagged) do
								if l__workspace__1.activePlayers:FindFirstChild(v198) and v199 < v196 then
									v196 = v199;
									v197 = v198;
								end;
							end;
							if v196 <= 40 and v197 ~= nil and u32.nowinshowdown == false then
								l__workspace__1.ServerStuff.eventTime:FireServer(v197, v5);
							end;
						end;
						bloodsprayDealt = bloodsprayDealt + v191;
						u37();
						if v158.name == "Sledgehammer" and v191 >= 30 and math.random(1, 100) == 1 then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "donk", character.HumanoidRootPart);
						end;
						if playerperks.slippery and v158.weapontype == "Spear" then
							u19 = u19 + 10 * v8.slippery.efx[1] / 100;
							delay(v8.slippery.efx[2], function()
								u19 = u19 - 10 * v8.slippery.efx[1] / 100;
							end);
						end;
						if p45 == "heavy" and (v158.weapontype == "Bludgeon" or v158.weapontype == "Spear" or v158.weapontype == "Axe" or v158.weapontype == "Blade" or v158.weapontype == "Fists") then
							l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { v158.weapontype .. "Heavies", 1 });
							if v158.name == "Theourgia's Hand" and v176 and v176:FindFirstChild("Head") then
								local v200 = l__game__6.ReplicatedStorage.misc.shadow_tag:Clone();
								l__Debris__32:AddItem(v200, 5);
								v200.Parent = v176.Head;
								v200.Adornee = v176.Head;
								delay(2, function()
									while v200 do
										v200.img.ImageTransparency = v200.img.ImageTransparency + 0.05;
										RS:wait();
										if v200 == nil then
											break;
										end;
										if v200.img.ImageTransparency >= 1 then
											break;
										end;									
									end;
									if v200 then
										v200:Destroy();
									end;
								end);
							end;
						end;
						if v158.name == "Fists" and v191 >= 14 then
							l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "ChargedFists", 1 });
						end;
						if v158.weapontype == "Blade" then
							l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "BleedProc", 1 });
						end;
						v121.damage = v121.damage + p44;
						l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "DamageDealt", p44 });
					end;
					if tick() - u38 > 0.01 then
						v104({ "hitsound", "general" }, "hitdeal", nil, nil, true, true);
					end;
					if v176:FindFirstChild("Head") then
						u39(v176:FindFirstChild("Head").Position, v191);
					end;
					if v158.name == "Double Barrel" then
						l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "DBPellets", 1 });
					end;
					if v158.name == "Submachine Gun" then
						l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "LandedSMG", 1 });
					end;
					if v158.weapontype == "Bow" then
						l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "BowsHit", 1 });
					end;
					if v162 == true and v190 == true then
						l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "RangedDamageDealt", p44 });
						if v158.name == "Rifle" then
							l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "RifleHeadshots", 1 });
						end;
						if v158.weapontype == "Bow" then
							l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "bowHeadshots", 1 });
						end;
						l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "Headshots", 1 });
						if tick() - u38 > 0.01 then
							v104({ "hitsound", "general" }, "hitheadshot", nil, nil, true, true);
						end;
					end;
					u38 = tick();
					local v201 = nil;
					if v162 == true and u14.damagerating[4] >= 80 then
						v201 = character.Torso.Position;
					end;
					l__workspace__1.ServerStuff.applyGore:FireServer("bloodhit", v176, l__game__6.Players:GetPlayerFromCharacter(v176), { v191, v172, v201 });
				end;
				if maingui.Centre.Hitmarker.ImageTransparency < 1 then
					maingui.Centre.Hitmarker.ImageTransparency = 0;
					return;
				end;
				maingui.Centre.Hitmarker.ImageTransparency = 0;
				spawn(function()
					while true do
						maingui.Centre.Hitmarker.ImageTransparency = maingui.Centre.Hitmarker.ImageTransparency + 0.04;
						RS:wait();
						if maingui.Centre.Hitmarker.ImageTransparency == 1 then
							break;
						end;					
					end;
					maingui.Centre.Hitmarker.ImageTransparency = 1;
				end);
			end;
		end);
	end;
	return v176;
end;
local v202 = CFrame.new(0, 0, 0);
local u46 = tick();
local u47 = v51;
local function u48()
	l__workspace__1.ServerStuff.dealDamage:FireServer("raidbossshotgun", nil, v5, v4);
	local v203 = curentanimset.pump;
	local v204 = 1;
	local v205 = false;
	if primskin and primskin.name == "Merci-fall" then
		v205 = true;
		v203 = curentanimset.skinpump;
		v204 = 0.8;
		delay(0.65, function()
			v104({ "reloads" }, "shotgun_mid", nil, nil, true, true);
		end);
		delay(0.75, function()
			v104({ "general" }, "reloadpartial", nil, nil, true, true);
		end);
	end;
	v203:Play(0.2, 1, v204);
	if v205 == false then
		delay(0.4, function()
			l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", u14.animset }, "pump", character.HumanoidRootPart);
			u16.fx.shelleject.Enabled = true;
			u16.fx.shelleject:Emit(1);
			u16.fx.shelleject.Enabled = false;
		end);
	end;
end;
local u49 = tick();
local u50 = tick();
local u51 = nil;
local u52 = v125;
u51 = function(p47)
	if v63.aegisshieldup ~= nil then
		v63.aegisshieldup(v64[3].aegisdamagetakenmelee, p47);
		return;
	end;
	if v63.berzactive ~= nil then
		local v206 = v63.berzactive + v64[3].regenonparry;
		if tick() - v206 > 0 then
			v63.berzactive = v206;
		else
			v63.berzactive = tick();
		end;
	end;
	if u14.weapontype ~= "Spear" and u14.weapontype ~= "Bludgeon" and u14.weapontype ~= "Blade" and u14.weapontype ~= "Fists" and u14.weapontype ~= "Axe" then
		return;
	end;
	if u8.staggering == true then
		return;
	end;
	if u8.blockimpact == false and u8.blockrecoil == true then
		u8.blockimpact = true;
		return;
	end;
	if startperk.Value == "emperor" or startperk.Value == "commander" or startperk.Value == "hiddenB" then
		lastchatter = tick();
		l__workspace__1.ServerStuff.voiceline:FireServer(startperk, "blocked");
	end;
	l__workspace__1.ServerStuff.initiateblock:FireServer(v5, true);
	u8.charging = false;
	u8.action = true;
	u8.blocking = false;
	u8.blockrecoil = true;
	u8.blockimpact = true;
	u8.cancombo = false;
	u8.shoving = false;
	u46 = 0;
	u49 = 0;
	local v207 = tick();
	if curentanimset.block then
		curentanimset.block:Play(0);
		curentanimset.block.TimePosition = 0.2;
		curentanimset.block:AdjustSpeed(0);
	end;
	if tpcurrentanimset.block then
		tpcurrentanimset.block:Play(0);
		tpcurrentanimset.block.TimePosition = 0.2;
		tpcurrentanimset.block:AdjustSpeed(0);
	end;
	u7 = u7 + 35;
	u22("stamina");
	while true do
		RS:wait();
		if u8.blockimpact == true then
			v207 = tick();
			u8.blockimpact = false;
			u52 = CFrame.new(0, 1, 0);
			delay(0.05, function()
				if u52 == CFrame.new(0, 1, 0) then
					u52 = CFrame.new(0, 0, 0);
				end;
			end);
		end;
		if tick() - v207 >= 0.2 then
			break;
		end;
		if u8.staggering == true then
			break;
		end;	
	end;
	if u8.staggering == false then
		u8.blockrecoil = false;
		if curentanimset.block then
			curentanimset.block:Stop(0.2);
			tpcurrentanimset.block:Stop(0.2);
		end;
		u12 = 0.0175;
		l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
		if curentanimset.equip then
			curentanimset.equip.TimePosition = 0.5;
			curentanimset.equip:AdjustSpeed(0);
		end;
		if tpcurrentanimset.equip then
			tpcurrentanimset.equip:Play();
			tpcurrentanimset.equip.TimePosition = 0.5;
			tpcurrentanimset.equip:AdjustSpeed(0);
			check_walking_anim();
		end;
		u8.action = false;
		u8.blocking = false;
		u8.cancombo = true;
	end;
	if u8.blockrecoil == true then
		spawn(function()
			local v208 = tick();
			local v209 = false;
			while true do
				if tick() - v208 >= 5 then
					v209 = true;
					break;
				end;
				if u8.blockrecoil == false then
					v209 = false;
					break;
				end;
				if v209 == true then
					break;
				end;			
			end;
			if v209 == true then
				u8.blockrecoil = false;
				curentanimset.block:Stop(0.2);
				tpcurrentanimset.block:Stop(0.2);
				u12 = 0.0175;
				l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
				curentanimset.equip.TimePosition = 0.5;
				curentanimset.equip:AdjustSpeed(0);
				tpcurrentanimset.equip:Play();
				tpcurrentanimset.equip.TimePosition = 0.5;
				tpcurrentanimset.equip:AdjustSpeed(0);
				check_walking_anim();
				u8.action = false;
				u8.blocking = false;
				u8.cancombo = true;
			end;
		end);
	end;
end;
l__workspace__1.ServerStuff.initiateblock.OnClientEvent:Connect(function(p48)
	u51(p48);
end);
l__workspace__1.ServerStuff.confirmBlock.OnClientInvoke = function()
	local v210 = false;
	if u8.blocking == true and u8.staggering == false then
		v210 = true;
	end;
	if u8.swapping == true then
		v210 = false;
	end;
	return v210;
end;
local u53 = v46;
local v211 = { 2, 1.7, 1.35, 0.6 };
cancel_throw = false;
local u54 = false;
local u55 = 0;
local function u56(p49, p50)
	if u8.startswap == true then
		return;
	end;
	if juggernaut == true then
		return;
	end;
	if u8.channel == true then
		return;
	end;
	if p49 ~= "JBox" and p49 ~= "LSMini" and p49 ~= "GMSword" and p49 ~= "EMSword" and p49 ~= "CMMaul" and p49 ~= "PLBlade" then
		remove_dual_wield();
		drawlockout = tick();
		local v212 = v19[p49];
		if v212 == nil then
			v212 = v19[v11];
		end;
		local v213 = v212.animset;
		current_anim_set_use = v212.animset;
		local v214 = p49;
		local v215 = false;
		if playerstats.Exotic ~= "none" and p49 == "Fist" and v21[playerstats.Exotic] then
			v213 = v21[playerstats.Exotic].param[2];
			current_anim_set_use = v21[playerstats.Exotic].param[2];
			v214 = playerstats.Exotic;
			v215 = true;
		end;
		if v212.weapontype == "Item" then
			shakecamera("weapon", { "Item", "equip" });
		else
			shakecamera("weapon", { v213, "equip" });
		end;
		u8.swapping = true;
		u8.blocking = false;
		l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
		u8.action = true;
		u8.cancombo = false;
		u8.startswap = true;
		local v216 = false;
		if p50 and p50:FindFirstChild("trapped") then
			v216 = true;
		end;
		if p50 and p50:FindFirstChild("agentcode") then
			for v217, v218 in pairs(v6) do
				if v218[2] == true then
					v218[4] = p50:FindFirstChild("agentcode").Value;
				end;
			end;
		end;
		if curentanimset.equip then
			curentanimset.equip:Stop(0);
		end;
		if tpcurrentanimset.equip then
			tpcurrentanimset.equip:Stop(0);
		end;
		for v219, v220 in pairs(curentanimset) do
			v220:Stop();
			v220:Destroy();
		end;
		for v221, v222 in pairs(tpcurrentanimset) do
			v222:Stop();
			v222:Destroy();
		end;
		curentanimset = {};
		tpcurrentanimset = {};
		u14 = {};
		harvestinghits = v49;
		local v223 = false;
		if v212.weapontype == "Axe" or v212.weapontype == "Bludgeon" or v212.weapontype == "Blade" or v212.weapontype == "Spear" then
			v223 = true;
		end;
		if p49 == "Primary" then
			p49 = v11;
			local v224 = primanimset;
			local v225 = tpprimanimset;
			u14 = primwepset;
		else
			v224 = l__game__6.ReplicatedStorage.animationSets:FindFirstChild(v213);
			v225 = l__game__6.ReplicatedStorage.animationSets.TPanimSets:FindFirstChild(v213);
			u14 = v212;
			if v224 == nil then
				v224 = l__game__6.ReplicatedStorage.animationSets.global;
			end;
			if v225 == nil then
				v225 = l__game__6.ReplicatedStorage.animationSets.TPanimSets.global;
			end;
		end;
		if p50 then
			p50:Destroy();
		end;
		l__workspace__1.ServerStuff.getTPWeapon:FireServer(p49, v225, u15, p50, v223);
		if u16 then
			u16:Destroy();
			for v226, v227 in ipairs(fparms.Joints:GetChildren()) do
				if v227.Name == "WeaponJoint" then
					v227:Destroy();
				end;
			end;
		end;
		if p49 == "Fist" then
			local v228 = nil;
			local v229 = nil;
			local v230 = nil;
			local v231 = nil;
			local v232 = nil;
			local v233 = nil;
			local v234 = nil;
			local v235 = nil;
			local v236 = nil;
			local v237 = nil;
			local v238 = nil;
			local v239 = nil;
			local v240 = nil;
			local v241 = nil;
			local v242 = nil;
			local v243 = nil;
			local v244 = nil;
			local v245 = nil;
			local v246 = nil;
			local v247 = nil;
			local v248 = nil;
			local v249 = nil;
			local v250 = nil;
			local v251 = nil;
			local v252 = nil;
			local v253 = nil;
			local v254 = nil;
			local v255 = nil;
			local v256 = nil;
			local v257 = nil;
			local v258 = nil;
			local v259 = nil;
			local v260 = nil;
			local v261 = nil;
			local v262 = nil;
			local v263 = nil;
			local v264 = nil;
			local v265 = nil;
			local v266 = nil;
			local v267 = nil;
			local v268 = nil;
			local v269 = nil;
			local v270 = nil;
			if v215 == true then
				local v271 = nil;
				local v272 = nil;
				local v273 = nil;
				local v274 = nil;
				local v275 = nil;
				local v276 = nil;
				local v277 = nil;
				local v278 = nil;
				local v279 = nil;
				local v280 = nil;
				local v281 = nil;
				local v282 = nil;
				local v283 = nil;
				local v284 = nil;
				local v285 = nil;
				local v286 = nil;
				local v287 = nil;
				local v288 = nil;
				local v289 = nil;
				local v290 = nil;
				local v291 = nil;
				local v292 = nil;
				local v293 = nil;
				local v294 = nil;
				local v295 = nil;
				local v296 = nil;
				local v297 = nil;
				local v298 = nil;
				local v299 = nil;
				local v300 = nil;
				local v301 = nil;
				local v302 = nil;
				local v303 = nil;
				local v304 = nil;
				local v305 = nil;
				local v306 = nil;
				local v307 = nil;
				local v308 = nil;
				local v309 = nil;
				local v310 = nil;
				local v311 = nil;
				local v312 = nil;
				local v313 = nil;
				local v314 = nil;
				local v315 = nil;
				local v316 = nil;
				local v317 = nil;
				local v318 = nil;
				local v319 = nil;
				local v320 = nil;
				local v321 = nil;
				local v322 = nil;
				local v323 = nil;
				local v324 = nil;
				local v325 = nil;
				local v326 = nil;
				local v327 = nil;
				local v328 = nil;
				local v329 = nil;
				local v330 = nil;
				local v331 = nil;
				local v332 = nil;
				local v333 = nil;
				local v334 = nil;
				local v335 = nil;
				local v336 = nil;
				local v337 = nil;
				local v338 = nil;
				local v339 = nil;
				local v340 = nil;
				local v341 = nil;
				local v342 = nil;
				local v343 = nil;
				local v344 = nil;
				local v345 = nil;
				local v346 = nil;
				local v347 = nil;
				local v348 = nil;
				local v349 = nil;
				local v350 = nil;
				local v351 = nil;
				local v352 = nil;
				local v353 = nil;
				local v354 = nil;
				local v355 = nil;
				local v356 = nil;
				local v357 = nil;
				local v358 = nil;
				local v359 = nil;
				if v215 == true and v223 == true and p49 == "Fist" then
					v223 = false;
				end;
				if character:FindFirstChild("hasPrimary") then
					local v360 = tick();
					if v223 == true then
						while true do
							drawlockout = tick();
							RS:wait();
							if tick() - v360 >= 2 then
								break;
							end;
							if character:FindFirstChild("hasPrimary") == nil then
								break;
							end;
							if character:FindFirstChild("hasPrimary") and character:FindFirstChild("hasPrimary"):GetChildren()[1].JointGrip:FindFirstChild("HolsterJoint") == nil then
								break;
							end;						
						end;
					else
						while true do
							drawlockout = tick();
							RS:wait();
							if tick() - v360 >= 2 then
								break;
							end;
							if v215 == true then
								break;
							end;
							if character:FindFirstChild("hasPrimary") == nil then
								break;
							end;
							if character:FindFirstChild("hasPrimary") and character:FindFirstChild("hasPrimary"):GetChildren()[1].JointGrip:FindFirstChild("HolsterJoint") then
								break;
							end;						
						end;
					end;
				end;
				if v223 == true then
					u16 = character:WaitForChild("hasPrimary"):GetChildren()[1]:Clone();
					if u16:FindFirstChild("JointGrip") then
						if u16.JointGrip:FindFirstChild("HolsterJoint") then
							u16.JointGrip:FindFirstChild("HolsterJoint"):Destroy();
						end;
						bloodtier = 0;
						bloodsprayDealt = 0;
						if u16:FindFirstChild("bloodstage") then
							bloodtier = u16:FindFirstChild("bloodstage").Value;
						end;
						v271 = true;
						v272 = v216;
						v273 = v271;
						if v272 == v273 then
							local v361 = Instance.new("BoolValue");
							v361.Name = "trapped";
							v361.Parent = u16;
						end;
						v274 = u16;
						local v362 = "JointGrip";
						v275 = v274;
						v276 = v362;
						v286 = v275[v276];
						v277 = fparms;
						local v363 = "RightArm";
						v278 = v277;
						v279 = v363;
						v280 = v278[v279];
						local v364 = "RUpperArm";
						v281 = v280;
						v282 = v364;
						v283 = v281[v282];
						local v365 = "CFrame";
						v284 = v283;
						v285 = v365;
						local v366 = v284[v285];
						local v367 = "CFrame";
						v287 = v286;
						v288 = v367;
						v289 = v366;
						v287[v288] = v289;
						local v368 = u16;
						local v369 = "JointGrip";
						v290 = v368;
						v291 = v369;
						local v370 = v290[v291];
						local v371 = true;
						local v372 = "Locked";
						v292 = v370;
						v293 = v372;
						v294 = v371;
						v292[v293] = v294;
						local v373 = Instance.new;
						local v374 = "Motor6D";
						v295 = v373;
						v296 = v374;
						local v375 = v295(v296);
						local v376 = "WeaponJoint";
						local v377 = "Name";
						v297 = v375;
						v298 = v377;
						v299 = v376;
						v297[v298] = v299;
						local v378 = fparms;
						local v379 = "RightArm";
						v300 = v378;
						v301 = v379;
						local v380 = v300[v301];
						local v381 = "RUpperArm";
						v302 = v380;
						v303 = v381;
						local v382 = v302[v303];
						local v383 = "Part0";
						v304 = v375;
						v305 = v383;
						v306 = v382;
						v304[v305] = v306;
						local v384 = u16;
						local v385 = "JointGrip";
						v307 = v384;
						v308 = v385;
						local v386 = v307[v308];
						local v387 = "Part1";
						v309 = v375;
						v310 = v387;
						v311 = v386;
						v309[v310] = v311;
						local v388 = CFrame.new;
						local v389 = 0;
						local v390 = -1;
						local v391 = 0;
						v312 = 1;
						v313 = 0;
						v314 = 0;
						v315 = 0;
						v316 = 1;
						v317 = 0;
						v318 = 0;
						v319 = 0;
						v320 = 1;
						v321 = v388;
						v322 = v389;
						v323 = v390;
						v324 = v391;
						v325 = v312;
						v326 = v313;
						v327 = v314;
						v328 = v315;
						v329 = v316;
						v330 = v317;
						v331 = v318;
						v332 = v319;
						v333 = v320;
						local v392 = v321(v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333);
						local v393 = "C0";
						v334 = v375;
						v335 = v393;
						v336 = v392;
						v334[v335] = v336;
						local v394 = u16;
						local v395 = "Name";
						v337 = v394;
						v338 = v395;
						local v396 = v337[v338];
						local v397 = "LSMini";
						v339 = v396;
						v340 = v397;
						if v339 == v340 then
							v375.C0 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
						end;
						local v398 = "weldval";
						local v399 = "FindFirstChild";
						v341 = v224;
						local v400 = v341;
						v342 = v224;
						v343 = v399;
						local v401 = v342[v343];
						v344 = v401;
						v345 = v400;
						v346 = v398;
						local v402 = v344(v345, v346);
						v347 = v402;
						if v347 then
							v375.C1 = v224.weldval.Value;
						else
							v375.C1 = l__game__6.ReplicatedStorage.animationSets.global.gweldval.Value;
						end;
						local v403 = u16;
						local v404 = "Name";
						v348 = v403;
						v349 = v404;
						local v405 = v348[v349];
						local v406 = "Tourni";
						v350 = v405;
						v351 = v406;
						if v350 == v351 then
							v375.C0 = CFrame.new(0.155029297, -1.00993419, 0.217743874, 0, 7.10542736E-15, 0.999999285, 0.999999285, 0, 0, 0, 0.999999285, -7.10542736E-15);
							v375.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
						end;
						local v407 = fparms;
						local v408 = "Joints";
						v352 = v407;
						v353 = v408;
						local v409 = v352[v353];
						local v410 = "Parent";
						v354 = v375;
						v355 = v410;
						v356 = v409;
						v354[v355] = v356;
						local v411 = u16;
						local v412 = fparms;
						local v413 = "Parent";
						v357 = v411;
						v358 = v413;
						v359 = v412;
						v357[v358] = v359;
						v228 = u8;
						v230 = false;
						v229 = "startswap";
						v231 = v228;
						v232 = v229;
						v233 = v230;
						v231[v232] = v233;
						local v414 = fparms;
						local v415 = l__CurrentCamera__1;
						local v416 = "Parent";
						v234 = v414;
						v235 = v416;
						v236 = v415;
						v234[v235] = v236;
						local v417 = pairs;
						local v418 = "GetChildren";
						v237 = v224;
						v240 = v237;
						v238 = v224;
						v239 = v418;
						local v419 = v238[v239];
						v241 = v419;
						v242 = v240;
						v244 = v241(v242);
						v243 = v417;
						for v420, v421 in v243(v244) do
							if v421:IsA("Animation") then
								local v422 = fparms.AC:LoadAnimation(v421);
								v422.Name = v421.Name;
								curentanimset[v421.Name] = v422;
							end;
						end;
						local v423 = pairs;
						local v424 = "GetChildren";
						v245 = v225;
						local v425 = v245;
						v246 = v225;
						v247 = v424;
						local v426 = v246[v247];
						v248 = v426;
						v249 = v425;
						v251 = v248(v249);
						v250 = v423;
						for v427, v428 in v250(v251) do
							if v428:IsA("Animation") then
								local v429 = hum:LoadAnimation(v428);
								v429.Name = v428.Name;
								tpcurrentanimset[v428.Name] = v429;
							end;
						end;
						local v430 = curentanimset;
						local v431 = "block";
						v252 = v430;
						v253 = v431;
						local v432 = v252[v253];
						v254 = v432;
						if v254 then
							curentanimset.block:Stop();
							tpcurrentanimset.block:Stop();
						end;
						local v433 = "weapontype";
						v255 = v212;
						v256 = v433;
						local v434 = v255[v256];
						local v435 = "Item";
						v257 = v434;
						v258 = v435;
						if v257 == v258 then
							if l__game__6.ReplicatedStorage.animationSets:FindFirstChild(v212.animset):FindFirstChild("equip") == nil then
								curentanimset.equip = globalanimsets.equip;
								tpcurrentanimset.equip = tpglobalanimsets.equip;
							end;
							l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "draw", character.HumanoidRootPart);
						elseif l__game__6.ReplicatedStorage.soundLibrary.weapons:FindFirstChild(v212.weapontype) then
							if v215 == true then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v213 }, "draw", character.HumanoidRootPart);
							else
								l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v212.weapontype }, "draw", character.HumanoidRootPart);
							end;
						else
							l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v213 }, "draw", character.HumanoidRootPart);
							if v212.name == "FAMAS F1" and math.random(1, 3) == 1 then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v212.animset }, "aughfrench", character.HumanoidRootPart);
							end;
						end;
						local v436 = "animset";
						v259 = v212;
						v260 = v436;
						local v437 = v259[v260];
						local v438 = "1PB";
						v261 = v437;
						v262 = v438;
						if v261 == v262 then
							spawn(function()
								local v439 = tick();
								local v440 = true;
								while true do
									if u14.animset ~= "1PB" then
										v440 = false;
										break;
									end;
									RS:wait();
									if tick() - v439 >= 0.4 then
										break;
									end;								
								end;
								if character.HumanoidRootPart:FindFirstChild("playerdrones") then
									baselayer = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, character.HumanoidRootPart:FindFirstChild("playerdrones").Part0.Parent };
								end;
								if v440 == true then
									v104({ "weapons", u14.animset }, "flash", nil, nil, true, true);
									local l__plasmaEffect__441 = u16:WaitForChild("plasmaEffect");
									l__plasmaEffect__441:WaitForChild("flash").Enabled = true;
									l__plasmaEffect__441:WaitForChild("spark").Enabled = true;
									l__plasmaEffect__441:WaitForChild("lightglow").Enabled = true;
									l__plasmaEffect__441:WaitForChild("electric").Enabled = true;
									l__plasmaEffect__441.flash:Emit(20);
									l__plasmaEffect__441.spark:Emit(math.random(10, 20));
									l__plasmaEffect__441.flash.Enabled = false;
									l__plasmaEffect__441.spark.Enabled = false;
									if u16.Model:FindFirstChild("bladeglow") then
										u16.Model.bladeglow.Transparency = 0.1;
									end;
								end;
							end);
						end;
						local v442 = "weapontype";
						v263 = v212;
						v264 = v442;
						local v443 = v263[v264];
						local v444 = "Gun";
						v265 = v443;
						v266 = v444;
						if (v265 == v266 or v212.weapontype == "Bow") and v212.weapontype == "Bow" then
							local v445 = nil;
							for v446 = 1, 100 do
								if character:FindFirstChild("RBow") then
									v445 = character:FindFirstChild("RBow");
									if v445 == nil then
										v445 = character:FindFirstChild("CRBow");
										if v445 == nil then
											v445 = character:FindFirstChild("CPBow");
										end;
									end;
									break;
								end;
								if character:FindFirstChild("CRBow") then
									v445 = character:FindFirstChild("RBow");
									if v445 == nil then
										v445 = character:FindFirstChild("CRBow");
										if v445 == nil then
											v445 = character:FindFirstChild("CPBow");
										end;
									end;
									break;
								end;
								if character:FindFirstChild("CPBow") then
									v445 = character:FindFirstChild("RBow");
									if v445 == nil then
										v445 = character:FindFirstChild("CRBow");
										if v445 == nil then
											v445 = character:FindFirstChild("CPBow");
										end;
									end;
									break;
								end;
								RS:wait();
							end;
							if v445 then
								if u16:FindFirstChild("arrow") then
									for v447, v448 in ipairs(u16.arrow:GetChildren()) do
										if v448:IsA("BasePart") then
											v448.Transparency = 1;
										end;
									end;
								end;
								v445.bowString.stringA.Transparency = NumberSequence.new(1);
								v445.bowString.stringB.Transparency = NumberSequence.new(1);
							end;
						end;
						local v449 = curentanimset;
						local v450 = "equip";
						v267 = v449;
						v268 = v450;
						local v451 = v267[v268];
						v269 = v451;
						if v269 then
							if playerperks.leather then
								if v212.weapontype == "Bludgeon" then
									if perksactive.leather == nil then
										perksactive.leather = true;
										u17 = u17 + v8.leather.efx[1] / 100;
									end;
								elseif perksactive.leather == true then
									perksactive.leather = nil;
									u17 = u17 - v8.leather.efx[1] / 100;
								end;
							end;
							if playerperks.boxer then
								if v212.weapontype == "Fists" then
									if perksactive.boxer == nil then
										perksactive.boxer = true;
										u18 = u18 + v8.boxer.efx[1] / 100;
									end;
								elseif perksactive.boxer == true then
									perksactive.boxer = nil;
									u18 = u18 - v8.boxer.efx[1] / 100;
								end;
							end;
							if playerperks.honor then
								if v212.weapontype == "Fists" then
									if perksactive.honor == nil then
										perksactive.honor = true;
										u18 = u18 + v8.honor.efx[1] / 100;
									end;
								elseif perksactive.honor == true then
									perksactive.honor = nil;
									u18 = u18 - v8.honor.efx[1] / 100;
								end;
							end;
							if v212.weapontype == "Fists" then
								if fist_speed_boost == false then
									fist_speed_boost = true;
									u19 = u19 + 1.5;
								end;
							elseif fist_speed_boost == true then
								fist_speed_boost = false;
								u19 = u19 - 1.5;
							end;
							if playerperks.mcrafter then
								if v212.name == "Crafted Spear" or v212.name == "Crafted Hatchet" or v212.name == "Crafted Knife" or v212.name == "Crafted Cudgel" then
									if perksactive.mcrafter == nil then
										perksactive.mcrafter = true;
										u18 = u18 + v8.mcrafter.efx[1] / 100;
									end;
								elseif perksactive.mcrafter == true then
									perksactive.mcrafter = nil;
									u18 = u18 - v8.mcrafter.efx[1] / 100;
								end;
							end;
							if playerperks.spearsrun then
								if v212.weapontype == "Spear" then
									if perksactive.spearsrun == nil then
										perksactive.spearsrun = true;
										u19 = u19 + 10 * v8.spearsrun.efx[1] / 100;
									end;
								elseif perksactive.spearsrun == true then
									perksactive.spearsrun = nil;
									u19 = u19 - 10 * v8.spearsrun.efx[1] / 100;
								end;
							end;
							if playerperks.tracker then
								if v212.name == "Mantracker" then
									if perksactive.tracker == nil then
										perksactive.tracker = true;
										u19 = u19 + 10 * v8.tracker.efx[1] / 100;
									end;
								elseif perksactive.tracker == true then
									perksactive.tracker = nil;
									u19 = u19 - 10 * v8.tracker.efx[1] / 100;
								end;
							end;
							if v212.name == "'Polters Last Wish'" or v212.name == "'Polters Last Breath'" then
								for v452, v453 in ipairs(u16.Model:GetChildren()) do
									v453.Transparency = 0;
								end;
							end;
							local v454 = 0.6;
							if v212.name == "Fists" then
								v454 = 0.9;
							end;
							if v212.animset == "PST" or v212.animset == "2HPST" then
								v454 = 0.8;
							end;
							curentanimset.equip:AdjustSpeed(v454);
							curentanimset.equip:Play(0, 1, v454);
							tpcurrentanimset.equip:AdjustSpeed(v454);
							tpcurrentanimset.equip:Play(0.2, 1, v454);
							local u57 = nil;
							u57 = tpcurrentanimset.equip.KeyframeReached:connect(function(p51)
								if p51 == "Stop" then
									tpcurrentanimset.equip:AdjustSpeed(0);
									u57:Disconnect();
								end;
							end);
							local u58 = nil;
							u58 = curentanimset.equip.KeyframeReached:connect(function(p52)
								if p52 == "Stop" then
									u20 = nil;
									if u8.staggering == false then
										curentanimset.equip:AdjustSpeed(0);
										u8.action = false;
										u8.swapping = false;
										u8.cancombo = true;
										check_walking_anim();
										u58:Disconnect();
										if v212.animset == "LSMG" then
											u21();
										end;
									end;
								end;
							end);
							if u16 and u16:FindFirstChild("skinned") and v21[u16:FindFirstChild("skinned").Value] then
								primskin = v21[u16:FindFirstChild("skinned").Value];
							end;
							drawlockout = tick();
							invmanage("updatehud");
							if p49 == "THand" then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1TH" }, "drawtwo", character.HumanoidRootPart);
								delay(0.3, function()
									if u15 == "THand" then
										l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1TH" }, "drawthree", character.HumanoidRootPart);
										l__workspace__1.ServerStuff.dealDamage:FireServer("shadow_equip", {}, v5, v4);
									end;
								end);
							end;
							check_walking_anim();
						end;
						v270 = p49;
						u15 = v270;
						return;
					else
						u8.action = false;
						u8.swapping = false;
						return;
					end;
				else
					u16 = l__game__6.ReplicatedStorage.Weapons:FindFirstChild(v214):Clone();
					if v215 == true and playerstats.Exotic == "Tanto" then
						u16.sheath.Transparency = 0;
					end;
					v271 = true;
					v272 = v216;
					v273 = v271;
					if v272 == v273 then
						v361 = Instance.new("BoolValue");
						v361.Name = "trapped";
						v361.Parent = u16;
					end;
					v274 = u16;
					v362 = "JointGrip";
					v275 = v274;
					v276 = v362;
					v286 = v275[v276];
					v277 = fparms;
					v363 = "RightArm";
					v278 = v277;
					v279 = v363;
					v280 = v278[v279];
					v364 = "RUpperArm";
					v281 = v280;
					v282 = v364;
					v283 = v281[v282];
					v365 = "CFrame";
					v284 = v283;
					v285 = v365;
					v366 = v284[v285];
					v367 = "CFrame";
					v287 = v286;
					v288 = v367;
					v289 = v366;
					v287[v288] = v289;
					v368 = u16;
					v369 = "JointGrip";
					v290 = v368;
					v291 = v369;
					v370 = v290[v291];
					v371 = true;
					v372 = "Locked";
					v292 = v370;
					v293 = v372;
					v294 = v371;
					v292[v293] = v294;
					v373 = Instance.new;
					v374 = "Motor6D";
					v295 = v373;
					v296 = v374;
					v375 = v295(v296);
					v376 = "WeaponJoint";
					v377 = "Name";
					v297 = v375;
					v298 = v377;
					v299 = v376;
					v297[v298] = v299;
					v378 = fparms;
					v379 = "RightArm";
					v300 = v378;
					v301 = v379;
					v380 = v300[v301];
					v381 = "RUpperArm";
					v302 = v380;
					v303 = v381;
					v382 = v302[v303];
					v383 = "Part0";
					v304 = v375;
					v305 = v383;
					v306 = v382;
					v304[v305] = v306;
					v384 = u16;
					v385 = "JointGrip";
					v307 = v384;
					v308 = v385;
					v386 = v307[v308];
					v387 = "Part1";
					v309 = v375;
					v310 = v387;
					v311 = v386;
					v309[v310] = v311;
					v388 = CFrame.new;
					v389 = 0;
					v390 = -1;
					v391 = 0;
					v312 = 1;
					v313 = 0;
					v314 = 0;
					v315 = 0;
					v316 = 1;
					v317 = 0;
					v318 = 0;
					v319 = 0;
					v320 = 1;
					v321 = v388;
					v322 = v389;
					v323 = v390;
					v324 = v391;
					v325 = v312;
					v326 = v313;
					v327 = v314;
					v328 = v315;
					v329 = v316;
					v330 = v317;
					v331 = v318;
					v332 = v319;
					v333 = v320;
					v392 = v321(v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333);
					v393 = "C0";
					v334 = v375;
					v335 = v393;
					v336 = v392;
					v334[v335] = v336;
					v394 = u16;
					v395 = "Name";
					v337 = v394;
					v338 = v395;
					v396 = v337[v338];
					v397 = "LSMini";
					v339 = v396;
					v340 = v397;
					if v339 == v340 then
						v375.C0 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
					end;
					v398 = "weldval";
					v399 = "FindFirstChild";
					v341 = v224;
					v400 = v341;
					v342 = v224;
					v343 = v399;
					v401 = v342[v343];
					v344 = v401;
					v345 = v400;
					v346 = v398;
					v402 = v344(v345, v346);
					v347 = v402;
					if v347 then
						v375.C1 = v224.weldval.Value;
					else
						v375.C1 = l__game__6.ReplicatedStorage.animationSets.global.gweldval.Value;
					end;
					v403 = u16;
					v404 = "Name";
					v348 = v403;
					v349 = v404;
					v405 = v348[v349];
					v406 = "Tourni";
					v350 = v405;
					v351 = v406;
					if v350 == v351 then
						v375.C0 = CFrame.new(0.155029297, -1.00993419, 0.217743874, 0, 7.10542736E-15, 0.999999285, 0.999999285, 0, 0, 0, 0.999999285, -7.10542736E-15);
						v375.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
					end;
					v407 = fparms;
					v408 = "Joints";
					v352 = v407;
					v353 = v408;
					v409 = v352[v353];
					v410 = "Parent";
					v354 = v375;
					v355 = v410;
					v356 = v409;
					v354[v355] = v356;
					v411 = u16;
					v412 = fparms;
					v413 = "Parent";
					v357 = v411;
					v358 = v413;
					v359 = v412;
					v357[v358] = v359;
					v228 = u8;
					v230 = false;
					v229 = "startswap";
					v231 = v228;
					v232 = v229;
					v233 = v230;
					v231[v232] = v233;
					v414 = fparms;
					v415 = l__CurrentCamera__1;
					v416 = "Parent";
					v234 = v414;
					v235 = v416;
					v236 = v415;
					v234[v235] = v236;
					v417 = pairs;
					v418 = "GetChildren";
					v237 = v224;
					v240 = v237;
					v238 = v224;
					v239 = v418;
					v419 = v238[v239];
					v241 = v419;
					v242 = v240;
					v244 = v241(v242);
					v243 = v417;
					local v455, v456, v457 = v243(v244);
					while true do
						if v421:IsA("Animation") then
							v422 = fparms.AC:LoadAnimation(v421);
							v422.Name = v421.Name;
							curentanimset[v421.Name] = v422;
						end;					
					end;
					v423 = pairs;
					v424 = "GetChildren";
					v245 = v225;
					v425 = v245;
					v246 = v225;
					v247 = v424;
					v426 = v246[v247];
					v248 = v426;
					v249 = v425;
					v251 = v248(v249);
					v250 = v423;
					local v458, v459, v460 = v250(v251);
					while true do
						if v428:IsA("Animation") then
							v429 = hum:LoadAnimation(v428);
							v429.Name = v428.Name;
							tpcurrentanimset[v428.Name] = v429;
						end;					
					end;
					v430 = curentanimset;
					v431 = "block";
					v252 = v430;
					v253 = v431;
					v432 = v252[v253];
					v254 = v432;
					if v254 then
						curentanimset.block:Stop();
						tpcurrentanimset.block:Stop();
					end;
					v433 = "weapontype";
					v255 = v212;
					v256 = v433;
					v434 = v255[v256];
					v435 = "Item";
					v257 = v434;
					v258 = v435;
					if v257 == v258 then
						if l__game__6.ReplicatedStorage.animationSets:FindFirstChild(v212.animset):FindFirstChild("equip") == nil then
							curentanimset.equip = globalanimsets.equip;
							tpcurrentanimset.equip = tpglobalanimsets.equip;
						end;
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "draw", character.HumanoidRootPart);
					elseif l__game__6.ReplicatedStorage.soundLibrary.weapons:FindFirstChild(v212.weapontype) then
						if v215 == true then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v213 }, "draw", character.HumanoidRootPart);
						else
							l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v212.weapontype }, "draw", character.HumanoidRootPart);
						end;
					else
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v213 }, "draw", character.HumanoidRootPart);
						if v212.name == "FAMAS F1" and math.random(1, 3) == 1 then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v212.animset }, "aughfrench", character.HumanoidRootPart);
						end;
					end;
					v436 = "animset";
					v259 = v212;
					v260 = v436;
					v437 = v259[v260];
					v438 = "1PB";
					v261 = v437;
					v262 = v438;
					if v261 == v262 then
						spawn(function()
							v439 = tick();
							v440 = true;
							while true do
								if u14.animset ~= "1PB" then
									v440 = false;
									break;
								end;
								RS:wait();
								if tick() - v439 >= 0.4 then
									break;
								end;							
							end;
							if character.HumanoidRootPart:FindFirstChild("playerdrones") then
								baselayer = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, character.HumanoidRootPart:FindFirstChild("playerdrones").Part0.Parent };
							end;
							if v440 == true then
								v104({ "weapons", u14.animset }, "flash", nil, nil, true, true);
								l__plasmaEffect__441 = u16:WaitForChild("plasmaEffect");
								l__plasmaEffect__441:WaitForChild("flash").Enabled = true;
								l__plasmaEffect__441:WaitForChild("spark").Enabled = true;
								l__plasmaEffect__441:WaitForChild("lightglow").Enabled = true;
								l__plasmaEffect__441:WaitForChild("electric").Enabled = true;
								l__plasmaEffect__441.flash:Emit(20);
								l__plasmaEffect__441.spark:Emit(math.random(10, 20));
								l__plasmaEffect__441.flash.Enabled = false;
								l__plasmaEffect__441.spark.Enabled = false;
								if u16.Model:FindFirstChild("bladeglow") then
									u16.Model.bladeglow.Transparency = 0.1;
								end;
							end;
						end);
					end;
					v442 = "weapontype";
					v263 = v212;
					v264 = v442;
					v443 = v263[v264];
					v444 = "Gun";
					v265 = v443;
					v266 = v444;
					if (v265 == v266 or v212.weapontype == "Bow") and v212.weapontype == "Bow" then
						v445 = nil;
						for v446 = 1, 100 do
							if character:FindFirstChild("RBow") then
								v445 = character:FindFirstChild("RBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CRBow");
									if v445 == nil then
										v445 = character:FindFirstChild("CPBow");
									end;
								end;
								break;
							end;
							if character:FindFirstChild("CRBow") then
								v445 = character:FindFirstChild("RBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CRBow");
									if v445 == nil then
										v445 = character:FindFirstChild("CPBow");
									end;
								end;
								break;
							end;
							if character:FindFirstChild("CPBow") then
								v445 = character:FindFirstChild("RBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CRBow");
									if v445 == nil then
										v445 = character:FindFirstChild("CPBow");
									end;
								end;
								break;
							end;
							RS:wait();
						end;
						if v445 then
							if u16:FindFirstChild("arrow") then
								for v447, v448 in ipairs(u16.arrow:GetChildren()) do
									if v448:IsA("BasePart") then
										v448.Transparency = 1;
									end;
								end;
							end;
							v445.bowString.stringA.Transparency = NumberSequence.new(1);
							v445.bowString.stringB.Transparency = NumberSequence.new(1);
						end;
					end;
					v449 = curentanimset;
					v450 = "equip";
					v267 = v449;
					v268 = v450;
					v451 = v267[v268];
					v269 = v451;
					if v269 then
						if playerperks.leather then
							if v212.weapontype == "Bludgeon" then
								if perksactive.leather == nil then
									perksactive.leather = true;
									u17 = u17 + v8.leather.efx[1] / 100;
								end;
							elseif perksactive.leather == true then
								perksactive.leather = nil;
								u17 = u17 - v8.leather.efx[1] / 100;
							end;
						end;
						if playerperks.boxer then
							if v212.weapontype == "Fists" then
								if perksactive.boxer == nil then
									perksactive.boxer = true;
									u18 = u18 + v8.boxer.efx[1] / 100;
								end;
							elseif perksactive.boxer == true then
								perksactive.boxer = nil;
								u18 = u18 - v8.boxer.efx[1] / 100;
							end;
						end;
						if playerperks.honor then
							if v212.weapontype == "Fists" then
								if perksactive.honor == nil then
									perksactive.honor = true;
									u18 = u18 + v8.honor.efx[1] / 100;
								end;
							elseif perksactive.honor == true then
								perksactive.honor = nil;
								u18 = u18 - v8.honor.efx[1] / 100;
							end;
						end;
						if v212.weapontype == "Fists" then
							if fist_speed_boost == false then
								fist_speed_boost = true;
								u19 = u19 + 1.5;
							end;
						elseif fist_speed_boost == true then
							fist_speed_boost = false;
							u19 = u19 - 1.5;
						end;
						if playerperks.mcrafter then
							if v212.name == "Crafted Spear" or v212.name == "Crafted Hatchet" or v212.name == "Crafted Knife" or v212.name == "Crafted Cudgel" then
								if perksactive.mcrafter == nil then
									perksactive.mcrafter = true;
									u18 = u18 + v8.mcrafter.efx[1] / 100;
								end;
							elseif perksactive.mcrafter == true then
								perksactive.mcrafter = nil;
								u18 = u18 - v8.mcrafter.efx[1] / 100;
							end;
						end;
						if playerperks.spearsrun then
							if v212.weapontype == "Spear" then
								if perksactive.spearsrun == nil then
									perksactive.spearsrun = true;
									u19 = u19 + 10 * v8.spearsrun.efx[1] / 100;
								end;
							elseif perksactive.spearsrun == true then
								perksactive.spearsrun = nil;
								u19 = u19 - 10 * v8.spearsrun.efx[1] / 100;
							end;
						end;
						if playerperks.tracker then
							if v212.name == "Mantracker" then
								if perksactive.tracker == nil then
									perksactive.tracker = true;
									u19 = u19 + 10 * v8.tracker.efx[1] / 100;
								end;
							elseif perksactive.tracker == true then
								perksactive.tracker = nil;
								u19 = u19 - 10 * v8.tracker.efx[1] / 100;
							end;
						end;
						if v212.name == "'Polters Last Wish'" or v212.name == "'Polters Last Breath'" then
							for v452, v453 in ipairs(u16.Model:GetChildren()) do
								v453.Transparency = 0;
							end;
						end;
						v454 = 0.6;
						if v212.name == "Fists" then
							v454 = 0.9;
						end;
						if v212.animset == "PST" or v212.animset == "2HPST" then
							v454 = 0.8;
						end;
						curentanimset.equip:AdjustSpeed(v454);
						curentanimset.equip:Play(0, 1, v454);
						tpcurrentanimset.equip:AdjustSpeed(v454);
						tpcurrentanimset.equip:Play(0.2, 1, v454);
						u57 = nil;
						u57 = tpcurrentanimset.equip.KeyframeReached:connect(function(p51)
							if p51 == "Stop" then
								tpcurrentanimset.equip:AdjustSpeed(0);
								u57:Disconnect();
							end;
						end);
						u58 = nil;
						u58 = curentanimset.equip.KeyframeReached:connect(function(p52)
							if p52 == "Stop" then
								u20 = nil;
								if u8.staggering == false then
									curentanimset.equip:AdjustSpeed(0);
									u8.action = false;
									u8.swapping = false;
									u8.cancombo = true;
									check_walking_anim();
									u58:Disconnect();
									if v212.animset == "LSMG" then
										u21();
									end;
								end;
							end;
						end);
						if u16 and u16:FindFirstChild("skinned") and v21[u16:FindFirstChild("skinned").Value] then
							primskin = v21[u16:FindFirstChild("skinned").Value];
						end;
						drawlockout = tick();
						invmanage("updatehud");
						if p49 == "THand" then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1TH" }, "drawtwo", character.HumanoidRootPart);
							delay(0.3, function()
								if u15 == "THand" then
									l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1TH" }, "drawthree", character.HumanoidRootPart);
									l__workspace__1.ServerStuff.dealDamage:FireServer("shadow_equip", {}, v5, v4);
								end;
							end);
						end;
						check_walking_anim();
					end;
					v270 = p49;
					u15 = v270;
					return;
				end;
			else
				v228 = u8;
				v230 = false;
				v229 = "startswap";
				v231 = v228;
				v232 = v229;
				v233 = v230;
				v231[v232] = v233;
				v414 = fparms;
				v415 = l__CurrentCamera__1;
				v416 = "Parent";
				v234 = v414;
				v235 = v416;
				v236 = v415;
				v234[v235] = v236;
				v417 = pairs;
				v418 = "GetChildren";
				v237 = v224;
				v240 = v237;
				v238 = v224;
				v239 = v418;
				v419 = v238[v239];
				v241 = v419;
				v242 = v240;
				v244 = v241(v242);
				v243 = v417;
				v455, v456, v457 = v243(v244);
				while true do
					if v421:IsA("Animation") then
						v422 = fparms.AC:LoadAnimation(v421);
						v422.Name = v421.Name;
						curentanimset[v421.Name] = v422;
					end;				
				end;
				v423 = pairs;
				v424 = "GetChildren";
				v245 = v225;
				v425 = v245;
				v246 = v225;
				v247 = v424;
				v426 = v246[v247];
				v248 = v426;
				v249 = v425;
				v251 = v248(v249);
				v250 = v423;
				v458, v459, v460 = v250(v251);
				while true do
					if v428:IsA("Animation") then
						v429 = hum:LoadAnimation(v428);
						v429.Name = v428.Name;
						tpcurrentanimset[v428.Name] = v429;
					end;				
				end;
				v430 = curentanimset;
				v431 = "block";
				v252 = v430;
				v253 = v431;
				v432 = v252[v253];
				v254 = v432;
				if v254 then
					curentanimset.block:Stop();
					tpcurrentanimset.block:Stop();
				end;
				v433 = "weapontype";
				v255 = v212;
				v256 = v433;
				v434 = v255[v256];
				v435 = "Item";
				v257 = v434;
				v258 = v435;
				if v257 == v258 then
					if l__game__6.ReplicatedStorage.animationSets:FindFirstChild(v212.animset):FindFirstChild("equip") == nil then
						curentanimset.equip = globalanimsets.equip;
						tpcurrentanimset.equip = tpglobalanimsets.equip;
					end;
					l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "draw", character.HumanoidRootPart);
				elseif l__game__6.ReplicatedStorage.soundLibrary.weapons:FindFirstChild(v212.weapontype) then
					if v215 == true then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v213 }, "draw", character.HumanoidRootPart);
					else
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v212.weapontype }, "draw", character.HumanoidRootPart);
					end;
				else
					l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v213 }, "draw", character.HumanoidRootPart);
					if v212.name == "FAMAS F1" and math.random(1, 3) == 1 then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v212.animset }, "aughfrench", character.HumanoidRootPart);
					end;
				end;
				v436 = "animset";
				v259 = v212;
				v260 = v436;
				v437 = v259[v260];
				v438 = "1PB";
				v261 = v437;
				v262 = v438;
				if v261 == v262 then
					spawn(function()
						v439 = tick();
						v440 = true;
						while true do
							if u14.animset ~= "1PB" then
								v440 = false;
								break;
							end;
							RS:wait();
							if tick() - v439 >= 0.4 then
								break;
							end;						
						end;
						if character.HumanoidRootPart:FindFirstChild("playerdrones") then
							baselayer = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, character.HumanoidRootPart:FindFirstChild("playerdrones").Part0.Parent };
						end;
						if v440 == true then
							v104({ "weapons", u14.animset }, "flash", nil, nil, true, true);
							l__plasmaEffect__441 = u16:WaitForChild("plasmaEffect");
							l__plasmaEffect__441:WaitForChild("flash").Enabled = true;
							l__plasmaEffect__441:WaitForChild("spark").Enabled = true;
							l__plasmaEffect__441:WaitForChild("lightglow").Enabled = true;
							l__plasmaEffect__441:WaitForChild("electric").Enabled = true;
							l__plasmaEffect__441.flash:Emit(20);
							l__plasmaEffect__441.spark:Emit(math.random(10, 20));
							l__plasmaEffect__441.flash.Enabled = false;
							l__plasmaEffect__441.spark.Enabled = false;
							if u16.Model:FindFirstChild("bladeglow") then
								u16.Model.bladeglow.Transparency = 0.1;
							end;
						end;
					end);
				end;
				v442 = "weapontype";
				v263 = v212;
				v264 = v442;
				v443 = v263[v264];
				v444 = "Gun";
				v265 = v443;
				v266 = v444;
				if (v265 == v266 or v212.weapontype == "Bow") and v212.weapontype == "Bow" then
					v445 = nil;
					for v446 = 1, 100 do
						if character:FindFirstChild("RBow") then
							v445 = character:FindFirstChild("RBow");
							if v445 == nil then
								v445 = character:FindFirstChild("CRBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CPBow");
								end;
							end;
							break;
						end;
						if character:FindFirstChild("CRBow") then
							v445 = character:FindFirstChild("RBow");
							if v445 == nil then
								v445 = character:FindFirstChild("CRBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CPBow");
								end;
							end;
							break;
						end;
						if character:FindFirstChild("CPBow") then
							v445 = character:FindFirstChild("RBow");
							if v445 == nil then
								v445 = character:FindFirstChild("CRBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CPBow");
								end;
							end;
							break;
						end;
						RS:wait();
					end;
					if v445 then
						if u16:FindFirstChild("arrow") then
							for v447, v448 in ipairs(u16.arrow:GetChildren()) do
								if v448:IsA("BasePart") then
									v448.Transparency = 1;
								end;
							end;
						end;
						v445.bowString.stringA.Transparency = NumberSequence.new(1);
						v445.bowString.stringB.Transparency = NumberSequence.new(1);
					end;
				end;
				v449 = curentanimset;
				v450 = "equip";
				v267 = v449;
				v268 = v450;
				v451 = v267[v268];
				v269 = v451;
				if v269 then
					if playerperks.leather then
						if v212.weapontype == "Bludgeon" then
							if perksactive.leather == nil then
								perksactive.leather = true;
								u17 = u17 + v8.leather.efx[1] / 100;
							end;
						elseif perksactive.leather == true then
							perksactive.leather = nil;
							u17 = u17 - v8.leather.efx[1] / 100;
						end;
					end;
					if playerperks.boxer then
						if v212.weapontype == "Fists" then
							if perksactive.boxer == nil then
								perksactive.boxer = true;
								u18 = u18 + v8.boxer.efx[1] / 100;
							end;
						elseif perksactive.boxer == true then
							perksactive.boxer = nil;
							u18 = u18 - v8.boxer.efx[1] / 100;
						end;
					end;
					if playerperks.honor then
						if v212.weapontype == "Fists" then
							if perksactive.honor == nil then
								perksactive.honor = true;
								u18 = u18 + v8.honor.efx[1] / 100;
							end;
						elseif perksactive.honor == true then
							perksactive.honor = nil;
							u18 = u18 - v8.honor.efx[1] / 100;
						end;
					end;
					if v212.weapontype == "Fists" then
						if fist_speed_boost == false then
							fist_speed_boost = true;
							u19 = u19 + 1.5;
						end;
					elseif fist_speed_boost == true then
						fist_speed_boost = false;
						u19 = u19 - 1.5;
					end;
					if playerperks.mcrafter then
						if v212.name == "Crafted Spear" or v212.name == "Crafted Hatchet" or v212.name == "Crafted Knife" or v212.name == "Crafted Cudgel" then
							if perksactive.mcrafter == nil then
								perksactive.mcrafter = true;
								u18 = u18 + v8.mcrafter.efx[1] / 100;
							end;
						elseif perksactive.mcrafter == true then
							perksactive.mcrafter = nil;
							u18 = u18 - v8.mcrafter.efx[1] / 100;
						end;
					end;
					if playerperks.spearsrun then
						if v212.weapontype == "Spear" then
							if perksactive.spearsrun == nil then
								perksactive.spearsrun = true;
								u19 = u19 + 10 * v8.spearsrun.efx[1] / 100;
							end;
						elseif perksactive.spearsrun == true then
							perksactive.spearsrun = nil;
							u19 = u19 - 10 * v8.spearsrun.efx[1] / 100;
						end;
					end;
					if playerperks.tracker then
						if v212.name == "Mantracker" then
							if perksactive.tracker == nil then
								perksactive.tracker = true;
								u19 = u19 + 10 * v8.tracker.efx[1] / 100;
							end;
						elseif perksactive.tracker == true then
							perksactive.tracker = nil;
							u19 = u19 - 10 * v8.tracker.efx[1] / 100;
						end;
					end;
					if v212.name == "'Polters Last Wish'" or v212.name == "'Polters Last Breath'" then
						for v452, v453 in ipairs(u16.Model:GetChildren()) do
							v453.Transparency = 0;
						end;
					end;
					v454 = 0.6;
					if v212.name == "Fists" then
						v454 = 0.9;
					end;
					if v212.animset == "PST" or v212.animset == "2HPST" then
						v454 = 0.8;
					end;
					curentanimset.equip:AdjustSpeed(v454);
					curentanimset.equip:Play(0, 1, v454);
					tpcurrentanimset.equip:AdjustSpeed(v454);
					tpcurrentanimset.equip:Play(0.2, 1, v454);
					u57 = nil;
					u57 = tpcurrentanimset.equip.KeyframeReached:connect(function(p51)
						if p51 == "Stop" then
							tpcurrentanimset.equip:AdjustSpeed(0);
							u57:Disconnect();
						end;
					end);
					u58 = nil;
					u58 = curentanimset.equip.KeyframeReached:connect(function(p52)
						if p52 == "Stop" then
							u20 = nil;
							if u8.staggering == false then
								curentanimset.equip:AdjustSpeed(0);
								u8.action = false;
								u8.swapping = false;
								u8.cancombo = true;
								check_walking_anim();
								u58:Disconnect();
								if v212.animset == "LSMG" then
									u21();
								end;
							end;
						end;
					end);
					if u16 and u16:FindFirstChild("skinned") and v21[u16:FindFirstChild("skinned").Value] then
						primskin = v21[u16:FindFirstChild("skinned").Value];
					end;
					drawlockout = tick();
					invmanage("updatehud");
					if p49 == "THand" then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1TH" }, "drawtwo", character.HumanoidRootPart);
						delay(0.3, function()
							if u15 == "THand" then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1TH" }, "drawthree", character.HumanoidRootPart);
								l__workspace__1.ServerStuff.dealDamage:FireServer("shadow_equip", {}, v5, v4);
							end;
						end);
					end;
					check_walking_anim();
				end;
				v270 = p49;
				u15 = v270;
				return;
			end;
		else
			v271 = nil;
			v272 = nil;
			v273 = nil;
			v274 = nil;
			v275 = nil;
			v276 = nil;
			v277 = nil;
			v278 = nil;
			v279 = nil;
			v280 = nil;
			v281 = nil;
			v282 = nil;
			v283 = nil;
			v284 = nil;
			v285 = nil;
			v286 = nil;
			v287 = nil;
			v288 = nil;
			v289 = nil;
			v290 = nil;
			v291 = nil;
			v292 = nil;
			v293 = nil;
			v294 = nil;
			v295 = nil;
			v296 = nil;
			v297 = nil;
			v298 = nil;
			v299 = nil;
			v300 = nil;
			v301 = nil;
			v302 = nil;
			v303 = nil;
			v304 = nil;
			v305 = nil;
			v306 = nil;
			v307 = nil;
			v308 = nil;
			v309 = nil;
			v310 = nil;
			v311 = nil;
			v312 = nil;
			v313 = nil;
			v314 = nil;
			v315 = nil;
			v316 = nil;
			v317 = nil;
			v318 = nil;
			v319 = nil;
			v320 = nil;
			v321 = nil;
			v322 = nil;
			v323 = nil;
			v324 = nil;
			v325 = nil;
			v326 = nil;
			v327 = nil;
			v328 = nil;
			v329 = nil;
			v330 = nil;
			v331 = nil;
			v332 = nil;
			v333 = nil;
			v334 = nil;
			v335 = nil;
			v336 = nil;
			v337 = nil;
			v338 = nil;
			v339 = nil;
			v340 = nil;
			v341 = nil;
			v342 = nil;
			v343 = nil;
			v344 = nil;
			v345 = nil;
			v346 = nil;
			v347 = nil;
			v348 = nil;
			v349 = nil;
			v350 = nil;
			v351 = nil;
			v352 = nil;
			v353 = nil;
			v354 = nil;
			v355 = nil;
			v356 = nil;
			v357 = nil;
			v358 = nil;
			v359 = nil;
			if v215 == true and v223 == true and p49 == "Fist" then
				v223 = false;
			end;
			if character:FindFirstChild("hasPrimary") then
				v360 = tick();
				if v223 == true then
					while true do
						drawlockout = tick();
						RS:wait();
						if tick() - v360 >= 2 then
							break;
						end;
						if character:FindFirstChild("hasPrimary") == nil then
							break;
						end;
						if character:FindFirstChild("hasPrimary") and character:FindFirstChild("hasPrimary"):GetChildren()[1].JointGrip:FindFirstChild("HolsterJoint") == nil then
							break;
						end;					
					end;
				else
					while true do
						drawlockout = tick();
						RS:wait();
						if tick() - v360 >= 2 then
							break;
						end;
						if v215 == true then
							break;
						end;
						if character:FindFirstChild("hasPrimary") == nil then
							break;
						end;
						if character:FindFirstChild("hasPrimary") and character:FindFirstChild("hasPrimary"):GetChildren()[1].JointGrip:FindFirstChild("HolsterJoint") then
							break;
						end;					
					end;
				end;
			end;
			if v223 == true then
				u16 = character:WaitForChild("hasPrimary"):GetChildren()[1]:Clone();
				if u16:FindFirstChild("JointGrip") then
					if u16.JointGrip:FindFirstChild("HolsterJoint") then
						u16.JointGrip:FindFirstChild("HolsterJoint"):Destroy();
					end;
					bloodtier = 0;
					bloodsprayDealt = 0;
					if u16:FindFirstChild("bloodstage") then
						bloodtier = u16:FindFirstChild("bloodstage").Value;
					end;
					v271 = true;
					v272 = v216;
					v273 = v271;
					if v272 == v273 then
						v361 = Instance.new("BoolValue");
						v361.Name = "trapped";
						v361.Parent = u16;
					end;
					v274 = u16;
					v362 = "JointGrip";
					v275 = v274;
					v276 = v362;
					v286 = v275[v276];
					v277 = fparms;
					v363 = "RightArm";
					v278 = v277;
					v279 = v363;
					v280 = v278[v279];
					v364 = "RUpperArm";
					v281 = v280;
					v282 = v364;
					v283 = v281[v282];
					v365 = "CFrame";
					v284 = v283;
					v285 = v365;
					v366 = v284[v285];
					v367 = "CFrame";
					v287 = v286;
					v288 = v367;
					v289 = v366;
					v287[v288] = v289;
					v368 = u16;
					v369 = "JointGrip";
					v290 = v368;
					v291 = v369;
					v370 = v290[v291];
					v371 = true;
					v372 = "Locked";
					v292 = v370;
					v293 = v372;
					v294 = v371;
					v292[v293] = v294;
					v373 = Instance.new;
					v374 = "Motor6D";
					v295 = v373;
					v296 = v374;
					v375 = v295(v296);
					v376 = "WeaponJoint";
					v377 = "Name";
					v297 = v375;
					v298 = v377;
					v299 = v376;
					v297[v298] = v299;
					v378 = fparms;
					v379 = "RightArm";
					v300 = v378;
					v301 = v379;
					v380 = v300[v301];
					v381 = "RUpperArm";
					v302 = v380;
					v303 = v381;
					v382 = v302[v303];
					v383 = "Part0";
					v304 = v375;
					v305 = v383;
					v306 = v382;
					v304[v305] = v306;
					v384 = u16;
					v385 = "JointGrip";
					v307 = v384;
					v308 = v385;
					v386 = v307[v308];
					v387 = "Part1";
					v309 = v375;
					v310 = v387;
					v311 = v386;
					v309[v310] = v311;
					v388 = CFrame.new;
					v389 = 0;
					v390 = -1;
					v391 = 0;
					v312 = 1;
					v313 = 0;
					v314 = 0;
					v315 = 0;
					v316 = 1;
					v317 = 0;
					v318 = 0;
					v319 = 0;
					v320 = 1;
					v321 = v388;
					v322 = v389;
					v323 = v390;
					v324 = v391;
					v325 = v312;
					v326 = v313;
					v327 = v314;
					v328 = v315;
					v329 = v316;
					v330 = v317;
					v331 = v318;
					v332 = v319;
					v333 = v320;
					v392 = v321(v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333);
					v393 = "C0";
					v334 = v375;
					v335 = v393;
					v336 = v392;
					v334[v335] = v336;
					v394 = u16;
					v395 = "Name";
					v337 = v394;
					v338 = v395;
					v396 = v337[v338];
					v397 = "LSMini";
					v339 = v396;
					v340 = v397;
					if v339 == v340 then
						v375.C0 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
					end;
					v398 = "weldval";
					v399 = "FindFirstChild";
					v341 = v224;
					v400 = v341;
					v342 = v224;
					v343 = v399;
					v401 = v342[v343];
					v344 = v401;
					v345 = v400;
					v346 = v398;
					v402 = v344(v345, v346);
					v347 = v402;
					if v347 then
						v375.C1 = v224.weldval.Value;
					else
						v375.C1 = l__game__6.ReplicatedStorage.animationSets.global.gweldval.Value;
					end;
					v403 = u16;
					v404 = "Name";
					v348 = v403;
					v349 = v404;
					v405 = v348[v349];
					v406 = "Tourni";
					v350 = v405;
					v351 = v406;
					if v350 == v351 then
						v375.C0 = CFrame.new(0.155029297, -1.00993419, 0.217743874, 0, 7.10542736E-15, 0.999999285, 0.999999285, 0, 0, 0, 0.999999285, -7.10542736E-15);
						v375.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
					end;
					v407 = fparms;
					v408 = "Joints";
					v352 = v407;
					v353 = v408;
					v409 = v352[v353];
					v410 = "Parent";
					v354 = v375;
					v355 = v410;
					v356 = v409;
					v354[v355] = v356;
					v411 = u16;
					v412 = fparms;
					v413 = "Parent";
					v357 = v411;
					v358 = v413;
					v359 = v412;
					v357[v358] = v359;
					v228 = u8;
					v230 = false;
					v229 = "startswap";
					v231 = v228;
					v232 = v229;
					v233 = v230;
					v231[v232] = v233;
					v414 = fparms;
					v415 = l__CurrentCamera__1;
					v416 = "Parent";
					v234 = v414;
					v235 = v416;
					v236 = v415;
					v234[v235] = v236;
					v417 = pairs;
					v418 = "GetChildren";
					v237 = v224;
					v240 = v237;
					v238 = v224;
					v239 = v418;
					v419 = v238[v239];
					v241 = v419;
					v242 = v240;
					v244 = v241(v242);
					v243 = v417;
					for v420, v421 in v243(v244) do
						if v421:IsA("Animation") then
							v422 = fparms.AC:LoadAnimation(v421);
							v422.Name = v421.Name;
							curentanimset[v421.Name] = v422;
						end;
					end;
					v423 = pairs;
					v424 = "GetChildren";
					v245 = v225;
					v425 = v245;
					v246 = v225;
					v247 = v424;
					v426 = v246[v247];
					v248 = v426;
					v249 = v425;
					v251 = v248(v249);
					v250 = v423;
					for v427, v428 in v250(v251) do
						if v428:IsA("Animation") then
							v429 = hum:LoadAnimation(v428);
							v429.Name = v428.Name;
							tpcurrentanimset[v428.Name] = v429;
						end;
					end;
					v430 = curentanimset;
					v431 = "block";
					v252 = v430;
					v253 = v431;
					v432 = v252[v253];
					v254 = v432;
					if v254 then
						curentanimset.block:Stop();
						tpcurrentanimset.block:Stop();
					end;
					v433 = "weapontype";
					v255 = v212;
					v256 = v433;
					v434 = v255[v256];
					v435 = "Item";
					v257 = v434;
					v258 = v435;
					if v257 == v258 then
						if l__game__6.ReplicatedStorage.animationSets:FindFirstChild(v212.animset):FindFirstChild("equip") == nil then
							curentanimset.equip = globalanimsets.equip;
							tpcurrentanimset.equip = tpglobalanimsets.equip;
						end;
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "draw", character.HumanoidRootPart);
					elseif l__game__6.ReplicatedStorage.soundLibrary.weapons:FindFirstChild(v212.weapontype) then
						if v215 == true then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v213 }, "draw", character.HumanoidRootPart);
						else
							l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v212.weapontype }, "draw", character.HumanoidRootPart);
						end;
					else
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v213 }, "draw", character.HumanoidRootPart);
						if v212.name == "FAMAS F1" and math.random(1, 3) == 1 then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v212.animset }, "aughfrench", character.HumanoidRootPart);
						end;
					end;
					v436 = "animset";
					v259 = v212;
					v260 = v436;
					v437 = v259[v260];
					v438 = "1PB";
					v261 = v437;
					v262 = v438;
					if v261 == v262 then
						spawn(function()
							v439 = tick();
							v440 = true;
							while true do
								if u14.animset ~= "1PB" then
									v440 = false;
									break;
								end;
								RS:wait();
								if tick() - v439 >= 0.4 then
									break;
								end;							
							end;
							if character.HumanoidRootPart:FindFirstChild("playerdrones") then
								baselayer = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, character.HumanoidRootPart:FindFirstChild("playerdrones").Part0.Parent };
							end;
							if v440 == true then
								v104({ "weapons", u14.animset }, "flash", nil, nil, true, true);
								l__plasmaEffect__441 = u16:WaitForChild("plasmaEffect");
								l__plasmaEffect__441:WaitForChild("flash").Enabled = true;
								l__plasmaEffect__441:WaitForChild("spark").Enabled = true;
								l__plasmaEffect__441:WaitForChild("lightglow").Enabled = true;
								l__plasmaEffect__441:WaitForChild("electric").Enabled = true;
								l__plasmaEffect__441.flash:Emit(20);
								l__plasmaEffect__441.spark:Emit(math.random(10, 20));
								l__plasmaEffect__441.flash.Enabled = false;
								l__plasmaEffect__441.spark.Enabled = false;
								if u16.Model:FindFirstChild("bladeglow") then
									u16.Model.bladeglow.Transparency = 0.1;
								end;
							end;
						end);
					end;
					v442 = "weapontype";
					v263 = v212;
					v264 = v442;
					v443 = v263[v264];
					v444 = "Gun";
					v265 = v443;
					v266 = v444;
					if (v265 == v266 or v212.weapontype == "Bow") and v212.weapontype == "Bow" then
						v445 = nil;
						for v446 = 1, 100 do
							if character:FindFirstChild("RBow") then
								v445 = character:FindFirstChild("RBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CRBow");
									if v445 == nil then
										v445 = character:FindFirstChild("CPBow");
									end;
								end;
								break;
							end;
							if character:FindFirstChild("CRBow") then
								v445 = character:FindFirstChild("RBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CRBow");
									if v445 == nil then
										v445 = character:FindFirstChild("CPBow");
									end;
								end;
								break;
							end;
							if character:FindFirstChild("CPBow") then
								v445 = character:FindFirstChild("RBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CRBow");
									if v445 == nil then
										v445 = character:FindFirstChild("CPBow");
									end;
								end;
								break;
							end;
							RS:wait();
						end;
						if v445 then
							if u16:FindFirstChild("arrow") then
								for v447, v448 in ipairs(u16.arrow:GetChildren()) do
									if v448:IsA("BasePart") then
										v448.Transparency = 1;
									end;
								end;
							end;
							v445.bowString.stringA.Transparency = NumberSequence.new(1);
							v445.bowString.stringB.Transparency = NumberSequence.new(1);
						end;
					end;
					v449 = curentanimset;
					v450 = "equip";
					v267 = v449;
					v268 = v450;
					v451 = v267[v268];
					v269 = v451;
					if v269 then
						if playerperks.leather then
							if v212.weapontype == "Bludgeon" then
								if perksactive.leather == nil then
									perksactive.leather = true;
									u17 = u17 + v8.leather.efx[1] / 100;
								end;
							elseif perksactive.leather == true then
								perksactive.leather = nil;
								u17 = u17 - v8.leather.efx[1] / 100;
							end;
						end;
						if playerperks.boxer then
							if v212.weapontype == "Fists" then
								if perksactive.boxer == nil then
									perksactive.boxer = true;
									u18 = u18 + v8.boxer.efx[1] / 100;
								end;
							elseif perksactive.boxer == true then
								perksactive.boxer = nil;
								u18 = u18 - v8.boxer.efx[1] / 100;
							end;
						end;
						if playerperks.honor then
							if v212.weapontype == "Fists" then
								if perksactive.honor == nil then
									perksactive.honor = true;
									u18 = u18 + v8.honor.efx[1] / 100;
								end;
							elseif perksactive.honor == true then
								perksactive.honor = nil;
								u18 = u18 - v8.honor.efx[1] / 100;
							end;
						end;
						if v212.weapontype == "Fists" then
							if fist_speed_boost == false then
								fist_speed_boost = true;
								u19 = u19 + 1.5;
							end;
						elseif fist_speed_boost == true then
							fist_speed_boost = false;
							u19 = u19 - 1.5;
						end;
						if playerperks.mcrafter then
							if v212.name == "Crafted Spear" or v212.name == "Crafted Hatchet" or v212.name == "Crafted Knife" or v212.name == "Crafted Cudgel" then
								if perksactive.mcrafter == nil then
									perksactive.mcrafter = true;
									u18 = u18 + v8.mcrafter.efx[1] / 100;
								end;
							elseif perksactive.mcrafter == true then
								perksactive.mcrafter = nil;
								u18 = u18 - v8.mcrafter.efx[1] / 100;
							end;
						end;
						if playerperks.spearsrun then
							if v212.weapontype == "Spear" then
								if perksactive.spearsrun == nil then
									perksactive.spearsrun = true;
									u19 = u19 + 10 * v8.spearsrun.efx[1] / 100;
								end;
							elseif perksactive.spearsrun == true then
								perksactive.spearsrun = nil;
								u19 = u19 - 10 * v8.spearsrun.efx[1] / 100;
							end;
						end;
						if playerperks.tracker then
							if v212.name == "Mantracker" then
								if perksactive.tracker == nil then
									perksactive.tracker = true;
									u19 = u19 + 10 * v8.tracker.efx[1] / 100;
								end;
							elseif perksactive.tracker == true then
								perksactive.tracker = nil;
								u19 = u19 - 10 * v8.tracker.efx[1] / 100;
							end;
						end;
						if v212.name == "'Polters Last Wish'" or v212.name == "'Polters Last Breath'" then
							for v452, v453 in ipairs(u16.Model:GetChildren()) do
								v453.Transparency = 0;
							end;
						end;
						v454 = 0.6;
						if v212.name == "Fists" then
							v454 = 0.9;
						end;
						if v212.animset == "PST" or v212.animset == "2HPST" then
							v454 = 0.8;
						end;
						curentanimset.equip:AdjustSpeed(v454);
						curentanimset.equip:Play(0, 1, v454);
						tpcurrentanimset.equip:AdjustSpeed(v454);
						tpcurrentanimset.equip:Play(0.2, 1, v454);
						u57 = nil;
						u57 = tpcurrentanimset.equip.KeyframeReached:connect(function(p51)
							if p51 == "Stop" then
								tpcurrentanimset.equip:AdjustSpeed(0);
								u57:Disconnect();
							end;
						end);
						u58 = nil;
						u58 = curentanimset.equip.KeyframeReached:connect(function(p52)
							if p52 == "Stop" then
								u20 = nil;
								if u8.staggering == false then
									curentanimset.equip:AdjustSpeed(0);
									u8.action = false;
									u8.swapping = false;
									u8.cancombo = true;
									check_walking_anim();
									u58:Disconnect();
									if v212.animset == "LSMG" then
										u21();
									end;
								end;
							end;
						end);
						if u16 and u16:FindFirstChild("skinned") and v21[u16:FindFirstChild("skinned").Value] then
							primskin = v21[u16:FindFirstChild("skinned").Value];
						end;
						drawlockout = tick();
						invmanage("updatehud");
						if p49 == "THand" then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1TH" }, "drawtwo", character.HumanoidRootPart);
							delay(0.3, function()
								if u15 == "THand" then
									l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1TH" }, "drawthree", character.HumanoidRootPart);
									l__workspace__1.ServerStuff.dealDamage:FireServer("shadow_equip", {}, v5, v4);
								end;
							end);
						end;
						check_walking_anim();
					end;
					v270 = p49;
					u15 = v270;
					return;
				else
					u8.action = false;
					u8.swapping = false;
					return;
				end;
			else
				u16 = l__game__6.ReplicatedStorage.Weapons:FindFirstChild(v214):Clone();
				if v215 == true and playerstats.Exotic == "Tanto" then
					u16.sheath.Transparency = 0;
				end;
				v271 = true;
				v272 = v216;
				v273 = v271;
				if v272 == v273 then
					v361 = Instance.new("BoolValue");
					v361.Name = "trapped";
					v361.Parent = u16;
				end;
				v274 = u16;
				v362 = "JointGrip";
				v275 = v274;
				v276 = v362;
				v286 = v275[v276];
				v277 = fparms;
				v363 = "RightArm";
				v278 = v277;
				v279 = v363;
				v280 = v278[v279];
				v364 = "RUpperArm";
				v281 = v280;
				v282 = v364;
				v283 = v281[v282];
				v365 = "CFrame";
				v284 = v283;
				v285 = v365;
				v366 = v284[v285];
				v367 = "CFrame";
				v287 = v286;
				v288 = v367;
				v289 = v366;
				v287[v288] = v289;
				v368 = u16;
				v369 = "JointGrip";
				v290 = v368;
				v291 = v369;
				v370 = v290[v291];
				v371 = true;
				v372 = "Locked";
				v292 = v370;
				v293 = v372;
				v294 = v371;
				v292[v293] = v294;
				v373 = Instance.new;
				v374 = "Motor6D";
				v295 = v373;
				v296 = v374;
				v375 = v295(v296);
				v376 = "WeaponJoint";
				v377 = "Name";
				v297 = v375;
				v298 = v377;
				v299 = v376;
				v297[v298] = v299;
				v378 = fparms;
				v379 = "RightArm";
				v300 = v378;
				v301 = v379;
				v380 = v300[v301];
				v381 = "RUpperArm";
				v302 = v380;
				v303 = v381;
				v382 = v302[v303];
				v383 = "Part0";
				v304 = v375;
				v305 = v383;
				v306 = v382;
				v304[v305] = v306;
				v384 = u16;
				v385 = "JointGrip";
				v307 = v384;
				v308 = v385;
				v386 = v307[v308];
				v387 = "Part1";
				v309 = v375;
				v310 = v387;
				v311 = v386;
				v309[v310] = v311;
				v388 = CFrame.new;
				v389 = 0;
				v390 = -1;
				v391 = 0;
				v312 = 1;
				v313 = 0;
				v314 = 0;
				v315 = 0;
				v316 = 1;
				v317 = 0;
				v318 = 0;
				v319 = 0;
				v320 = 1;
				v321 = v388;
				v322 = v389;
				v323 = v390;
				v324 = v391;
				v325 = v312;
				v326 = v313;
				v327 = v314;
				v328 = v315;
				v329 = v316;
				v330 = v317;
				v331 = v318;
				v332 = v319;
				v333 = v320;
				v392 = v321(v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333);
				v393 = "C0";
				v334 = v375;
				v335 = v393;
				v336 = v392;
				v334[v335] = v336;
				v394 = u16;
				v395 = "Name";
				v337 = v394;
				v338 = v395;
				v396 = v337[v338];
				v397 = "LSMini";
				v339 = v396;
				v340 = v397;
				if v339 == v340 then
					v375.C0 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
				end;
				v398 = "weldval";
				v399 = "FindFirstChild";
				v341 = v224;
				v400 = v341;
				v342 = v224;
				v343 = v399;
				v401 = v342[v343];
				v344 = v401;
				v345 = v400;
				v346 = v398;
				v402 = v344(v345, v346);
				v347 = v402;
				if v347 then
					v375.C1 = v224.weldval.Value;
				else
					v375.C1 = l__game__6.ReplicatedStorage.animationSets.global.gweldval.Value;
				end;
				v403 = u16;
				v404 = "Name";
				v348 = v403;
				v349 = v404;
				v405 = v348[v349];
				v406 = "Tourni";
				v350 = v405;
				v351 = v406;
				if v350 == v351 then
					v375.C0 = CFrame.new(0.155029297, -1.00993419, 0.217743874, 0, 7.10542736E-15, 0.999999285, 0.999999285, 0, 0, 0, 0.999999285, -7.10542736E-15);
					v375.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
				end;
				v407 = fparms;
				v408 = "Joints";
				v352 = v407;
				v353 = v408;
				v409 = v352[v353];
				v410 = "Parent";
				v354 = v375;
				v355 = v410;
				v356 = v409;
				v354[v355] = v356;
				v411 = u16;
				v412 = fparms;
				v413 = "Parent";
				v357 = v411;
				v358 = v413;
				v359 = v412;
				v357[v358] = v359;
				v228 = u8;
				v230 = false;
				v229 = "startswap";
				v231 = v228;
				v232 = v229;
				v233 = v230;
				v231[v232] = v233;
				v414 = fparms;
				v415 = l__CurrentCamera__1;
				v416 = "Parent";
				v234 = v414;
				v235 = v416;
				v236 = v415;
				v234[v235] = v236;
				v417 = pairs;
				v418 = "GetChildren";
				v237 = v224;
				v240 = v237;
				v238 = v224;
				v239 = v418;
				v419 = v238[v239];
				v241 = v419;
				v242 = v240;
				v244 = v241(v242);
				v243 = v417;
				v455, v456, v457 = v243(v244);
				while true do
					if v421:IsA("Animation") then
						v422 = fparms.AC:LoadAnimation(v421);
						v422.Name = v421.Name;
						curentanimset[v421.Name] = v422;
					end;				
				end;
				v423 = pairs;
				v424 = "GetChildren";
				v245 = v225;
				v425 = v245;
				v246 = v225;
				v247 = v424;
				v426 = v246[v247];
				v248 = v426;
				v249 = v425;
				v251 = v248(v249);
				v250 = v423;
				v458, v459, v460 = v250(v251);
				while true do
					if v428:IsA("Animation") then
						v429 = hum:LoadAnimation(v428);
						v429.Name = v428.Name;
						tpcurrentanimset[v428.Name] = v429;
					end;				
				end;
				v430 = curentanimset;
				v431 = "block";
				v252 = v430;
				v253 = v431;
				v432 = v252[v253];
				v254 = v432;
				if v254 then
					curentanimset.block:Stop();
					tpcurrentanimset.block:Stop();
				end;
				v433 = "weapontype";
				v255 = v212;
				v256 = v433;
				v434 = v255[v256];
				v435 = "Item";
				v257 = v434;
				v258 = v435;
				if v257 == v258 then
					if l__game__6.ReplicatedStorage.animationSets:FindFirstChild(v212.animset):FindFirstChild("equip") == nil then
						curentanimset.equip = globalanimsets.equip;
						tpcurrentanimset.equip = tpglobalanimsets.equip;
					end;
					l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "draw", character.HumanoidRootPart);
				elseif l__game__6.ReplicatedStorage.soundLibrary.weapons:FindFirstChild(v212.weapontype) then
					if v215 == true then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v213 }, "draw", character.HumanoidRootPart);
					else
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v212.weapontype }, "draw", character.HumanoidRootPart);
					end;
				else
					l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v213 }, "draw", character.HumanoidRootPart);
					if v212.name == "FAMAS F1" and math.random(1, 3) == 1 then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v212.animset }, "aughfrench", character.HumanoidRootPart);
					end;
				end;
				v436 = "animset";
				v259 = v212;
				v260 = v436;
				v437 = v259[v260];
				v438 = "1PB";
				v261 = v437;
				v262 = v438;
				if v261 == v262 then
					spawn(function()
						v439 = tick();
						v440 = true;
						while true do
							if u14.animset ~= "1PB" then
								v440 = false;
								break;
							end;
							RS:wait();
							if tick() - v439 >= 0.4 then
								break;
							end;						
						end;
						if character.HumanoidRootPart:FindFirstChild("playerdrones") then
							baselayer = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, character.HumanoidRootPart:FindFirstChild("playerdrones").Part0.Parent };
						end;
						if v440 == true then
							v104({ "weapons", u14.animset }, "flash", nil, nil, true, true);
							l__plasmaEffect__441 = u16:WaitForChild("plasmaEffect");
							l__plasmaEffect__441:WaitForChild("flash").Enabled = true;
							l__plasmaEffect__441:WaitForChild("spark").Enabled = true;
							l__plasmaEffect__441:WaitForChild("lightglow").Enabled = true;
							l__plasmaEffect__441:WaitForChild("electric").Enabled = true;
							l__plasmaEffect__441.flash:Emit(20);
							l__plasmaEffect__441.spark:Emit(math.random(10, 20));
							l__plasmaEffect__441.flash.Enabled = false;
							l__plasmaEffect__441.spark.Enabled = false;
							if u16.Model:FindFirstChild("bladeglow") then
								u16.Model.bladeglow.Transparency = 0.1;
							end;
						end;
					end);
				end;
				v442 = "weapontype";
				v263 = v212;
				v264 = v442;
				v443 = v263[v264];
				v444 = "Gun";
				v265 = v443;
				v266 = v444;
				if (v265 == v266 or v212.weapontype == "Bow") and v212.weapontype == "Bow" then
					v445 = nil;
					for v446 = 1, 100 do
						if character:FindFirstChild("RBow") then
							v445 = character:FindFirstChild("RBow");
							if v445 == nil then
								v445 = character:FindFirstChild("CRBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CPBow");
								end;
							end;
							break;
						end;
						if character:FindFirstChild("CRBow") then
							v445 = character:FindFirstChild("RBow");
							if v445 == nil then
								v445 = character:FindFirstChild("CRBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CPBow");
								end;
							end;
							break;
						end;
						if character:FindFirstChild("CPBow") then
							v445 = character:FindFirstChild("RBow");
							if v445 == nil then
								v445 = character:FindFirstChild("CRBow");
								if v445 == nil then
									v445 = character:FindFirstChild("CPBow");
								end;
							end;
							break;
						end;
						RS:wait();
					end;
					if v445 then
						if u16:FindFirstChild("arrow") then
							for v447, v448 in ipairs(u16.arrow:GetChildren()) do
								if v448:IsA("BasePart") then
									v448.Transparency = 1;
								end;
							end;
						end;
						v445.bowString.stringA.Transparency = NumberSequence.new(1);
						v445.bowString.stringB.Transparency = NumberSequence.new(1);
					end;
				end;
				v449 = curentanimset;
				v450 = "equip";
				v267 = v449;
				v268 = v450;
				v451 = v267[v268];
				v269 = v451;
				if v269 then
					if playerperks.leather then
						if v212.weapontype == "Bludgeon" then
							if perksactive.leather == nil then
								perksactive.leather = true;
								u17 = u17 + v8.leather.efx[1] / 100;
							end;
						elseif perksactive.leather == true then
							perksactive.leather = nil;
							u17 = u17 - v8.leather.efx[1] / 100;
						end;
					end;
					if playerperks.boxer then
						if v212.weapontype == "Fists" then
							if perksactive.boxer == nil then
								perksactive.boxer = true;
								u18 = u18 + v8.boxer.efx[1] / 100;
							end;
						elseif perksactive.boxer == true then
							perksactive.boxer = nil;
							u18 = u18 - v8.boxer.efx[1] / 100;
						end;
					end;
					if playerperks.honor then
						if v212.weapontype == "Fists" then
							if perksactive.honor == nil then
								perksactive.honor = true;
								u18 = u18 + v8.honor.efx[1] / 100;
							end;
						elseif perksactive.honor == true then
							perksactive.honor = nil;
							u18 = u18 - v8.honor.efx[1] / 100;
						end;
					end;
					if v212.weapontype == "Fists" then
						if fist_speed_boost == false then
							fist_speed_boost = true;
							u19 = u19 + 1.5;
						end;
					elseif fist_speed_boost == true then
						fist_speed_boost = false;
						u19 = u19 - 1.5;
					end;
					if playerperks.mcrafter then
						if v212.name == "Crafted Spear" or v212.name == "Crafted Hatchet" or v212.name == "Crafted Knife" or v212.name == "Crafted Cudgel" then
							if perksactive.mcrafter == nil then
								perksactive.mcrafter = true;
								u18 = u18 + v8.mcrafter.efx[1] / 100;
							end;
						elseif perksactive.mcrafter == true then
							perksactive.mcrafter = nil;
							u18 = u18 - v8.mcrafter.efx[1] / 100;
						end;
					end;
					if playerperks.spearsrun then
						if v212.weapontype == "Spear" then
							if perksactive.spearsrun == nil then
								perksactive.spearsrun = true;
								u19 = u19 + 10 * v8.spearsrun.efx[1] / 100;
							end;
						elseif perksactive.spearsrun == true then
							perksactive.spearsrun = nil;
							u19 = u19 - 10 * v8.spearsrun.efx[1] / 100;
						end;
					end;
					if playerperks.tracker then
						if v212.name == "Mantracker" then
							if perksactive.tracker == nil then
								perksactive.tracker = true;
								u19 = u19 + 10 * v8.tracker.efx[1] / 100;
							end;
						elseif perksactive.tracker == true then
							perksactive.tracker = nil;
							u19 = u19 - 10 * v8.tracker.efx[1] / 100;
						end;
					end;
					if v212.name == "'Polters Last Wish'" or v212.name == "'Polters Last Breath'" then
						for v452, v453 in ipairs(u16.Model:GetChildren()) do
							v453.Transparency = 0;
						end;
					end;
					v454 = 0.6;
					if v212.name == "Fists" then
						v454 = 0.9;
					end;
					if v212.animset == "PST" or v212.animset == "2HPST" then
						v454 = 0.8;
					end;
					curentanimset.equip:AdjustSpeed(v454);
					curentanimset.equip:Play(0, 1, v454);
					tpcurrentanimset.equip:AdjustSpeed(v454);
					tpcurrentanimset.equip:Play(0.2, 1, v454);
					u57 = nil;
					u57 = tpcurrentanimset.equip.KeyframeReached:connect(function(p51)
						if p51 == "Stop" then
							tpcurrentanimset.equip:AdjustSpeed(0);
							u57:Disconnect();
						end;
					end);
					u58 = nil;
					u58 = curentanimset.equip.KeyframeReached:connect(function(p52)
						if p52 == "Stop" then
							u20 = nil;
							if u8.staggering == false then
								curentanimset.equip:AdjustSpeed(0);
								u8.action = false;
								u8.swapping = false;
								u8.cancombo = true;
								check_walking_anim();
								u58:Disconnect();
								if v212.animset == "LSMG" then
									u21();
								end;
							end;
						end;
					end);
					if u16 and u16:FindFirstChild("skinned") and v21[u16:FindFirstChild("skinned").Value] then
						primskin = v21[u16:FindFirstChild("skinned").Value];
					end;
					drawlockout = tick();
					invmanage("updatehud");
					if p49 == "THand" then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1TH" }, "drawtwo", character.HumanoidRootPart);
						delay(0.3, function()
							if u15 == "THand" then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1TH" }, "drawthree", character.HumanoidRootPart);
								l__workspace__1.ServerStuff.dealDamage:FireServer("shadow_equip", {}, v5, v4);
							end;
						end);
					end;
					check_walking_anim();
				end;
				v270 = p49;
				u15 = v270;
				return;
			end;
		end;
	end;
	ply:Kick(filth[math.random(1, #filth)]);
end;
reload_locklout = tick();
local u59 = {
	Light = 0, 
	Small = 0, 
	Short = 0, 
	Medium = 0, 
	Heavy = 0, 
	Long = 0, 
	Shells = 0
};
local u60 = v54;
function unloadgun()
	local l__ammo__461 = l__game__6.ReplicatedStorage.Weapons:FindFirstChild(u16.Name):FindFirstChild("ammo");
	if l__ammo__461 ~= nil then
		if u8.action ~= true then
			if u14.ammoused ~= nil then
				if tick() - reload_locklout <= 2 then

				elseif akimbo_factors.active == true then
					return;
				else
					local l__Value__462 = l__ammo__461.Value;
					local v463 = nil;
					local v464, v465, v466 = pairs(v6);
					while true do
						local v467, v468 = v464(v465, v466);
						if v467 then

						else
							break;
						end;
						v466 = v467;
						if v468[2] == true then
							if v468[3] ~= nil then
								v463 = v468[3];
								if v468[3] <= 0 then
									return;
								end;
							end;
						end;					
					end;
					u8.action = true;
					reload_locklout = tick();
					local v469 = { globalanimsets.reload, tpglobalanimsets.reloadloop };
					if u14.animset == "MRV" then
						v469 = { curentanimset.reload, tpglobalanimsets.reloadloop };
					end;
					v469[1]:Play(0.3);
					v469[2]:Play(0.3);
					local u61 = nil;
					u61 = v469[1].KeyframeReached:connect(function(p53)
						if p53 == "Stop" then
							v469[1]:AdjustSpeed(0);
							u61:Disconnect();
						end;
					end);
					local u62 = nil;
					u62 = v469[2].KeyframeReached:connect(function(p54)
						if p54 == "Stop" then
							v469[2]:AdjustSpeed(0);
							u62:Disconnect();
						end;
					end);
					local v470 = tick();
					l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "unload", character.HumanoidRootPart, 0.05);
					local v471 = false;
					while true do
						if 1.5 / 1.3 < tick() - v470 then
							if v471 == false then
								v471 = true;
								l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "reloaddone", character.HumanoidRootPart, 0.05);
							end;
						end;
						if u14.weapontype ~= "Gun" then
							u8.action = false;
							v469[1]:Stop(0.5);
							v469[2]:Stop(0.5);
							return;
						end;
						RS:wait();
						if not (1.5 < tick() - v470) then

						else
							break;
						end;					
					end;
					v469[1]:Stop(0.5);
					v469[2]:Stop(0.5);
					local v472, v473, v474 = pairs(v6);
					while true do
						local v475, v476 = v472(v473, v474);
						if v475 then

						else
							break;
						end;
						v474 = v475;
						if v476[2] == true then
							if v476[3] ~= nil then
								v476[3] = v476[3] - v463;
							end;
						end;					
					end;
					u59[u14.ammoused] = u59[u14.ammoused] + v463;
					invmanage("updatehud");
					local v477 = tick();
					local v478 = 0.2;
					while true do
						RS:wait();
						if not (v478 < tick() - v477) then

						else
							break;
						end;					
					end;
					u8.action = false;
					return;
				end;
			end;
		end;
	end;
end;
function start_dual_wield()
	if u8.action ~= true then
		if u8.using_perk ~= true then
			if u8.using_aux ~= true then
				if u8.swapping ~= true then
					if u8.aiming ~= true then
						if u8.staggering ~= true then
							if u8.swinging ~= true then
								if akimbo_factors.active == true then

								elseif u14.animset ~= "PST" then
									if u14.animset ~= "2HPST" then
										if u14.animset ~= "RV" then
											if u14.animset == "MRV" then
												if u14.name == "Ingram MAC-10" then
													return;
												else
													local v479 = nil;
													local v480, v481, v482 = pairs(v6);
													while true do
														local v483, v484 = v480(v481, v482);
														if v483 then

														else
															break;
														end;
														v482 = v483;
														if v484[2] == false then
															if v19[v484[1]] then
																if v484[1] ~= "Mac" then
																	if v19[v484[1]].animset ~= "PST" then

																	else
																		v479 = v483;
																		break;
																	end;
																	if v19[v484[1]].animset ~= "2HPST" then

																	else
																		v479 = v483;
																		break;
																	end;
																	if v19[v484[1]].animset ~= "RV" then

																	else
																		v479 = v483;
																		break;
																	end;
																	if v19[v484[1]].animset == "MRV" then
																		v479 = v483;
																		break;
																	end;
																end;
															end;
														end;													
													end;
													if v479 ~= nil then
														akimbo_factors.weapon_slot = v479;
														akimbo_factors.alt_weapon_stats = v19[v6[v479][1]];
														akimbo_factors.alternate = false;
														akimbo_factors.alt_tick = 0;
														akimbo_factors.active = true;
														local v485 = l__game__6.ReplicatedStorage.Weapons:FindFirstChild(v6[v479][1]);
														if v485 then
															local v486 = l__game__6.ReplicatedStorage.misc.akimbocrosshair:Clone();
															local v487 = (u14.sizerating + akimbo_factors.alt_weapon_stats.sizerating) * 8;
															local v488 = math.clamp(v487 - v487 * v45, 10, 60);
															v486.Size = UDim2.new(0, v488, 0, v488);
															v486.Parent = maingui.Centre.crosshair;
															maingui.Centre.crosshair.A1.Visible = false;
															maingui.Centre.crosshair.A2.Visible = false;
															maingui.Centre.crosshair.B1.Visible = false;
															maingui.Centre.crosshair.B2.Visible = false;
															maingui.Centre.crosshair.dot.Visible = false;
															l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "akimbo", character.HumanoidRootPart);
															u8.action = true;
															local v489 = v485:Clone();
															v489.Parent = fparms;
															akimbo_factors.alt_weapon = v489;
															local v490 = Instance.new("Motor6D");
															v490.Name = "fakeDual";
															v490.Part0 = fparms.LeftArm.LUpperArm;
															v490.Part1 = v489.JointGrip;
															v490.C0 = CFrame.new(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(-0.1, 0, 0);
															local v491 = CFrame.new(0, 0, 0);
															local v492 = l__game__6.ReplicatedStorage.animationSets:FindFirstChild(akimbo_factors.alt_weapon_stats.animset);
															if v492:FindFirstChild("weldval") then
																v490.C1 = v492.weldval.Value;
															else
																v490.C1 = l__game__6.ReplicatedStorage.animationSets.global.gweldval.Value;
															end;
															v490.Parent = fparms.Joints;
															l__workspace__1.ServerStuff.quickDisplay:FireServer("fakeakimbo", { v6[v479][1], v490.C1 });
															invmanage("updatehud");
															akimbosets.equip:Play(0.1);
															local u63 = nil;
															u63 = akimbosets.equip.KeyframeReached:connect(function(p55)
																if p55 == "Stop" then
																	akimbosets.equip:AdjustSpeed(0);
																	u63:Disconnect();
																end;
															end);
															tpakimbosets.equip:Play(0.1);
															local u64 = nil;
															u64 = tpakimbosets.equip.KeyframeReached:connect(function(p56)
																if p56 == "Stop" then
																	tpakimbosets.equip:AdjustSpeed(0);
																	u64:Disconnect();
																end;
															end);
															delay(0.5, function()
																u8.action = false;
															end);
														end;
													end;
													return;
												end;
											else
												return;
											end;
										elseif u14.name == "Ingram MAC-10" then
											return;
										else
											v479 = nil;
											v480, v481, v482 = pairs(v6);
											while true do
												v483, v484 = v480(v481, v482);
												if v483 then

												else
													break;
												end;
												v482 = v483;
												if v484[2] == false then
													if v19[v484[1]] then
														if v484[1] ~= "Mac" then
															if v19[v484[1]].animset ~= "PST" then

															else
																v479 = v483;
																break;
															end;
															if v19[v484[1]].animset ~= "2HPST" then

															else
																v479 = v483;
																break;
															end;
															if v19[v484[1]].animset ~= "RV" then

															else
																v479 = v483;
																break;
															end;
															if v19[v484[1]].animset == "MRV" then
																v479 = v483;
																break;
															end;
														end;
													end;
												end;											
											end;
											if v479 ~= nil then
												akimbo_factors.weapon_slot = v479;
												akimbo_factors.alt_weapon_stats = v19[v6[v479][1]];
												akimbo_factors.alternate = false;
												akimbo_factors.alt_tick = 0;
												akimbo_factors.active = true;
												v485 = l__game__6.ReplicatedStorage.Weapons:FindFirstChild(v6[v479][1]);
												if v485 then
													v486 = l__game__6.ReplicatedStorage.misc.akimbocrosshair:Clone();
													v487 = (u14.sizerating + akimbo_factors.alt_weapon_stats.sizerating) * 8;
													v488 = math.clamp(v487 - v487 * v45, 10, 60);
													v486.Size = UDim2.new(0, v488, 0, v488);
													v486.Parent = maingui.Centre.crosshair;
													maingui.Centre.crosshair.A1.Visible = false;
													maingui.Centre.crosshair.A2.Visible = false;
													maingui.Centre.crosshair.B1.Visible = false;
													maingui.Centre.crosshair.B2.Visible = false;
													maingui.Centre.crosshair.dot.Visible = false;
													l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "akimbo", character.HumanoidRootPart);
													u8.action = true;
													v489 = v485:Clone();
													v489.Parent = fparms;
													akimbo_factors.alt_weapon = v489;
													v490 = Instance.new("Motor6D");
													v490.Name = "fakeDual";
													v490.Part0 = fparms.LeftArm.LUpperArm;
													v490.Part1 = v489.JointGrip;
													v490.C0 = CFrame.new(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(-0.1, 0, 0);
													v491 = CFrame.new(0, 0, 0);
													v492 = l__game__6.ReplicatedStorage.animationSets:FindFirstChild(akimbo_factors.alt_weapon_stats.animset);
													if v492:FindFirstChild("weldval") then
														v490.C1 = v492.weldval.Value;
													else
														v490.C1 = l__game__6.ReplicatedStorage.animationSets.global.gweldval.Value;
													end;
													v490.Parent = fparms.Joints;
													l__workspace__1.ServerStuff.quickDisplay:FireServer("fakeakimbo", { v6[v479][1], v490.C1 });
													invmanage("updatehud");
													akimbosets.equip:Play(0.1);
													u63 = nil;
													u63 = akimbosets.equip.KeyframeReached:connect(function(p55)
														if p55 == "Stop" then
															akimbosets.equip:AdjustSpeed(0);
															u63:Disconnect();
														end;
													end);
													tpakimbosets.equip:Play(0.1);
													u64 = nil;
													u64 = tpakimbosets.equip.KeyframeReached:connect(function(p56)
														if p56 == "Stop" then
															tpakimbosets.equip:AdjustSpeed(0);
															u64:Disconnect();
														end;
													end);
													delay(0.5, function()
														u8.action = false;
													end);
												end;
											end;
											return;
										end;
									elseif u14.name == "Ingram MAC-10" then
										return;
									else
										v479 = nil;
										v480, v481, v482 = pairs(v6);
										while true do
											v483, v484 = v480(v481, v482);
											if v483 then

											else
												break;
											end;
											v482 = v483;
											if v484[2] == false then
												if v19[v484[1]] then
													if v484[1] ~= "Mac" then
														if v19[v484[1]].animset ~= "PST" then

														else
															v479 = v483;
															break;
														end;
														if v19[v484[1]].animset ~= "2HPST" then

														else
															v479 = v483;
															break;
														end;
														if v19[v484[1]].animset ~= "RV" then

														else
															v479 = v483;
															break;
														end;
														if v19[v484[1]].animset == "MRV" then
															v479 = v483;
															break;
														end;
													end;
												end;
											end;										
										end;
										if v479 ~= nil then
											akimbo_factors.weapon_slot = v479;
											akimbo_factors.alt_weapon_stats = v19[v6[v479][1]];
											akimbo_factors.alternate = false;
											akimbo_factors.alt_tick = 0;
											akimbo_factors.active = true;
											v485 = l__game__6.ReplicatedStorage.Weapons:FindFirstChild(v6[v479][1]);
											if v485 then
												v486 = l__game__6.ReplicatedStorage.misc.akimbocrosshair:Clone();
												v487 = (u14.sizerating + akimbo_factors.alt_weapon_stats.sizerating) * 8;
												v488 = math.clamp(v487 - v487 * v45, 10, 60);
												v486.Size = UDim2.new(0, v488, 0, v488);
												v486.Parent = maingui.Centre.crosshair;
												maingui.Centre.crosshair.A1.Visible = false;
												maingui.Centre.crosshair.A2.Visible = false;
												maingui.Centre.crosshair.B1.Visible = false;
												maingui.Centre.crosshair.B2.Visible = false;
												maingui.Centre.crosshair.dot.Visible = false;
												l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "akimbo", character.HumanoidRootPart);
												u8.action = true;
												v489 = v485:Clone();
												v489.Parent = fparms;
												akimbo_factors.alt_weapon = v489;
												v490 = Instance.new("Motor6D");
												v490.Name = "fakeDual";
												v490.Part0 = fparms.LeftArm.LUpperArm;
												v490.Part1 = v489.JointGrip;
												v490.C0 = CFrame.new(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(-0.1, 0, 0);
												v491 = CFrame.new(0, 0, 0);
												v492 = l__game__6.ReplicatedStorage.animationSets:FindFirstChild(akimbo_factors.alt_weapon_stats.animset);
												if v492:FindFirstChild("weldval") then
													v490.C1 = v492.weldval.Value;
												else
													v490.C1 = l__game__6.ReplicatedStorage.animationSets.global.gweldval.Value;
												end;
												v490.Parent = fparms.Joints;
												l__workspace__1.ServerStuff.quickDisplay:FireServer("fakeakimbo", { v6[v479][1], v490.C1 });
												invmanage("updatehud");
												akimbosets.equip:Play(0.1);
												u63 = nil;
												u63 = akimbosets.equip.KeyframeReached:connect(function(p55)
													if p55 == "Stop" then
														akimbosets.equip:AdjustSpeed(0);
														u63:Disconnect();
													end;
												end);
												tpakimbosets.equip:Play(0.1);
												u64 = nil;
												u64 = tpakimbosets.equip.KeyframeReached:connect(function(p56)
													if p56 == "Stop" then
														tpakimbosets.equip:AdjustSpeed(0);
														u64:Disconnect();
													end;
												end);
												delay(0.5, function()
													u8.action = false;
												end);
											end;
										end;
										return;
									end;
								elseif u14.name == "Ingram MAC-10" then
									return;
								else
									v479 = nil;
									v480, v481, v482 = pairs(v6);
									while true do
										v483, v484 = v480(v481, v482);
										if v483 then

										else
											break;
										end;
										v482 = v483;
										if v484[2] == false then
											if v19[v484[1]] then
												if v484[1] ~= "Mac" then
													if v19[v484[1]].animset ~= "PST" then

													else
														v479 = v483;
														break;
													end;
													if v19[v484[1]].animset ~= "2HPST" then

													else
														v479 = v483;
														break;
													end;
													if v19[v484[1]].animset ~= "RV" then

													else
														v479 = v483;
														break;
													end;
													if v19[v484[1]].animset == "MRV" then
														v479 = v483;
														break;
													end;
												end;
											end;
										end;									
									end;
									if v479 ~= nil then
										akimbo_factors.weapon_slot = v479;
										akimbo_factors.alt_weapon_stats = v19[v6[v479][1]];
										akimbo_factors.alternate = false;
										akimbo_factors.alt_tick = 0;
										akimbo_factors.active = true;
										v485 = l__game__6.ReplicatedStorage.Weapons:FindFirstChild(v6[v479][1]);
										if v485 then
											v486 = l__game__6.ReplicatedStorage.misc.akimbocrosshair:Clone();
											v487 = (u14.sizerating + akimbo_factors.alt_weapon_stats.sizerating) * 8;
											v488 = math.clamp(v487 - v487 * v45, 10, 60);
											v486.Size = UDim2.new(0, v488, 0, v488);
											v486.Parent = maingui.Centre.crosshair;
											maingui.Centre.crosshair.A1.Visible = false;
											maingui.Centre.crosshair.A2.Visible = false;
											maingui.Centre.crosshair.B1.Visible = false;
											maingui.Centre.crosshair.B2.Visible = false;
											maingui.Centre.crosshair.dot.Visible = false;
											l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "akimbo", character.HumanoidRootPart);
											u8.action = true;
											v489 = v485:Clone();
											v489.Parent = fparms;
											akimbo_factors.alt_weapon = v489;
											v490 = Instance.new("Motor6D");
											v490.Name = "fakeDual";
											v490.Part0 = fparms.LeftArm.LUpperArm;
											v490.Part1 = v489.JointGrip;
											v490.C0 = CFrame.new(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(-0.1, 0, 0);
											v491 = CFrame.new(0, 0, 0);
											v492 = l__game__6.ReplicatedStorage.animationSets:FindFirstChild(akimbo_factors.alt_weapon_stats.animset);
											if v492:FindFirstChild("weldval") then
												v490.C1 = v492.weldval.Value;
											else
												v490.C1 = l__game__6.ReplicatedStorage.animationSets.global.gweldval.Value;
											end;
											v490.Parent = fparms.Joints;
											l__workspace__1.ServerStuff.quickDisplay:FireServer("fakeakimbo", { v6[v479][1], v490.C1 });
											invmanage("updatehud");
											akimbosets.equip:Play(0.1);
											u63 = nil;
											u63 = akimbosets.equip.KeyframeReached:connect(function(p55)
												if p55 == "Stop" then
													akimbosets.equip:AdjustSpeed(0);
													u63:Disconnect();
												end;
											end);
											tpakimbosets.equip:Play(0.1);
											u64 = nil;
											u64 = tpakimbosets.equip.KeyframeReached:connect(function(p56)
												if p56 == "Stop" then
													tpakimbosets.equip:AdjustSpeed(0);
													u64:Disconnect();
												end;
											end);
											delay(0.5, function()
												u8.action = false;
											end);
										end;
									end;
									return;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end;
local u65 = 0;
local function u66(p57, p58)
	local v493 = 0;
	for v494, v495 in pairs(v6) do
		if v495[2] == true and v495[3] ~= nil then
			v493 = v495[3];
		end;
	end;
	local v496 = u14.damagerating[3];
	if p58 == true then
		v496 = akimbo_factors.alt_weapon_stats.damagerating[3];
		v493 = v6[akimbo_factors.weapon_slot][3];
	end;
	if v493 <= 0 then
		return;
	end;
	u44(v496, p57, p58);
end;
local u67 = false;
local u68 = v44;
local u69 = false;
local u70 = tick();
local function v497(p59)
	if tick() - u70 <= 0.3 then
		return;
	end;
	u70 = tick();
	if u59[p59] ~= nil and u59[p59] > 0 then
		l__workspace__1.ServerStuff.dropAmmo:FireServer(p59, u59[p59]);
		u59[p59] = u59[p59] - sharedm.ammovalues[p59 .. " Ammo"];
		if u59[p59] < 0 then
			u59[p59] = 0;
		end;
		invmanage("updatehud");
	end;
end;
inner_dialogue = 0;
ration_system_handler = {
	hunger = tick() - 180, 
	thirst = tick() - 180, 
	full_bar = 360, 
	bonus_threshold = 320, 
	bonus_add = 80, 
	stats_lower = 20, 
	cooldown_rations = 40, 
	cooldown_eat_tick = 0, 
	cooldown_drink_tick = 0, 
	low_tier = 180, 
	high_tier = 300, 
	hunger_lower_atk = 15, 
	hunger_lower_def = 10, 
	hunger_buff_atk = 20, 
	hunger_buff_mvmt = 1.5, 
	thirst_lower_def = 15, 
	thirst_lower_atk = 10, 
	thirst_buff_def = 20, 
	thirst_buff_stam = 0.3, 
	Beans = 0, 
	MRE = 0, 
	Soda = 0, 
	Bottle = 0
};
if l__workspace__1.ServerStuff.game.holdout.Value == true then
	ration_system_handler.cooldown_rations = 1;
	ration_system_handler.full_bar = 600;
	ration_system_handler.bonus_threshold = 560;
	ration_system_handler.low_tier = 210;
	ration_system_handler.high_tier = 330;
	ration_system_handler.hunger = tick() - 300;
	ration_system_handler.thirst = tick() - 300;
end;
spawn(function()
	local v498 = false;
	local v499 = false;
	local v500 = false;
	local v501 = false;
	while true do
		if ration_system_handler.full_bar - ration_system_handler.stats_lower <= tick() - ration_system_handler.hunger then
			if v499 == false then
				v499 = true;
				maingui.Thought.thoughttext.Text = "I'm starving.";
				inner_dialogue = tick();
				u18 = u18 - ration_system_handler.hunger_lower_atk / 100;
				u17 = u17 - ration_system_handler.hunger_lower_def / 100;
			end;
		elseif v499 == true then
			v499 = false;
			u18 = u18 + ration_system_handler.hunger_lower_atk / 100;
			u17 = u17 + ration_system_handler.hunger_lower_def / 100;
		end;
		if ration_system_handler.full_bar - ration_system_handler.stats_lower <= tick() - ration_system_handler.thirst then
			if v501 == false then
				v501 = true;
				maingui.Thought.thoughttext.Text = "I'm dehydrated.";
				inner_dialogue = tick();
				u18 = u18 - ration_system_handler.thirst_lower_atk / 100;
				u17 = u17 - ration_system_handler.thirst_lower_def / 100;
			end;
		elseif v501 == true then
			v501 = false;
			u18 = u18 + ration_system_handler.thirst_lower_atk / 100;
			u17 = u17 + ration_system_handler.thirst_lower_def / 100;
		end;
		if tick() - v121.timealive > 1 then
			if tick() - ration_system_handler.hunger <= ration_system_handler.full_bar - ration_system_handler.bonus_threshold then
				if v498 == false then
					v498 = true;
					maingui.Thought.thoughttext.Text = "I feel nourished.";
					inner_dialogue = tick();
					u18 = u18 + ration_system_handler.hunger_buff_atk / 100;
					u19 = u19 + ration_system_handler.hunger_buff_mvmt;
				end;
			elseif v498 == true then
				v498 = false;
				u18 = u18 - ration_system_handler.hunger_buff_atk / 100;
				u19 = u19 - ration_system_handler.hunger_buff_mvmt;
			end;
			if tick() - ration_system_handler.thirst <= ration_system_handler.full_bar - ration_system_handler.bonus_threshold then
				if v500 == false then
					v500 = true;
					maingui.Thought.thoughttext.Text = "I feel quenched.";
					inner_dialogue = tick();
					u17 = u17 + ration_system_handler.thirst_buff_def / 100;
					buff_sprint_stam = ration_system_handler.thirst_buff_stam;
				end;
			elseif v500 == true then
				v500 = false;
				u17 = u17 - ration_system_handler.thirst_buff_def / 100;
				buff_sprint_stam = 0;
			end;
		end;
		maingui.RationFrame.hunger.BackgroundColor3 = Color3.new(1, 1, 1);
		maingui.RationFrame.thirst.BackgroundColor3 = Color3.new(1, 1, 1);
		if v501 == true then
			maingui.RationFrame.thirst.BackgroundColor3 = Color3.fromRGB(170, 0, 0);
		end;
		if v499 == true then
			maingui.RationFrame.hunger.BackgroundColor3 = Color3.fromRGB(170, 0, 0);
		end;
		if v500 == true then
			maingui.RationFrame.thirst.BackgroundColor3 = Color3.fromRGB(19, 161, 30);
		end;
		if v498 == true then
			maingui.RationFrame.hunger.BackgroundColor3 = Color3.fromRGB(19, 161, 30);
		end;
		if tick() - ration_system_handler.cooldown_eat_tick <= ration_system_handler.cooldown_rations then
			maingui.RationFrame.hunger.BackgroundColor3 = Color3.fromRGB(118, 17, 158);
		end;
		if tick() - ration_system_handler.cooldown_drink_tick <= ration_system_handler.cooldown_rations then
			maingui.RationFrame.thirst.BackgroundColor3 = Color3.fromRGB(118, 17, 158);
		end;
		maingui.RationFrame.hunger.bar.Size = UDim2.new(math.clamp(1 - (tick() - ration_system_handler.hunger) / ration_system_handler.full_bar, 0, 1), 0, 0.6, 0);
		maingui.RationFrame.thirst.bar.Size = UDim2.new(math.clamp(1 - (tick() - ration_system_handler.thirst) / ration_system_handler.full_bar, 0, 1), 0, 0.6, 0);
		RS:wait();
		if hum == nil then
			break;
		end;
		if hum.Health <= 0 then
			break;
		end;
		if startperk.Value == "hubbing" then
			break;
		end;	
	end;
end);
local function u71(p60, p61)
	if p61 == nil then
		maingui.ChargeOverlay.usinglabel.label.Text = "USING";
	else
		maingui.ChargeOverlay.usinglabel.label.Text = p61;
	end;
	maingui.ChargeOverlay.ChargeOverlay.Size = UDim2.new(0, 0, 1, 0);
	maingui.ChargeOverlay.usingText.label.Text = p60;
	maingui.ChargeOverlay.Visible = true;
end;
function consume_rations(p62)
	if u8.action ~= true then
		if u8.channel ~= true then
			if u8.staggering == true then
				return;
			end;
		else
			return;
		end;
	else
		return;
	end;
	local v502 = 4.45;
	local v503 = globalanimsets["ration_" .. p62];
	local v504 = l__game__6.ReplicatedStorage.rations:FindFirstChild(p62);
	if v504 then
		u8.eating = true;
		if ration_system_handler[p62] then
			ration_system_handler[p62] = ration_system_handler[p62] - 1;
		end;
		u8.action = true;
		u8.channel = true;
		u19 = u19 - 3;
		local v505 = v504:Clone();
		v505.JointGrip.CFrame = l__CurrentCamera__1.CFrame;
		v505.Parent = fparms;
		local v506 = Instance.new("Motor6D");
		v506.Part1 = v505.JointGrip;
		v506.Part0 = fparms.RightArm.RUpperArm;
		v506.C0 = CFrame.new(0.182983398, -0.908285379, 0.225113869, 1.00000012, -7.27595761E-12, 8.77771527E-08, 8.70786607E-08, 4.47034836E-08, -1.00000012, 0, 1.00000012, 4.47034836E-08);
		v506.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
		v506.Parent = fparms.Joints;
		local v507 = false;
		local v508 = tick();
		local v509 = nil;
		if v503 ~= nil then
			v503:Play(0.1, 1, 1);
			v509 = v503.KeyframeReached:connect(function(p63)
				if p63 == "open_bean" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "beans_open", character.HumanoidRootPart);
					return;
				end;
				if p63 == "eat_bean" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "beans_eating", character.HumanoidRootPart);
					return;
				end;
				if p63 == "rip_mre" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "mre_open", character.HumanoidRootPart);
					return;
				end;
				if p63 == "pick_mre" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "mre_pick", character.HumanoidRootPart);
					return;
				end;
				if p63 == "eat_mre" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "mre_eat", character.HumanoidRootPart);
					return;
				end;
				if p63 == "open_can" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "can_open", character.HumanoidRootPart);
					delay(0.2, function()
						l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "can_align", character.HumanoidRootPart);
					end);
					return;
				end;
				if p63 == "bottle_open" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "bottle_open", character.HumanoidRootPart);
					return;
				end;
				if p63 == "sip_drink" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "liquid_sip", character.HumanoidRootPart);
				end;
			end);
		end;
		local v510 = tpglobalanimsets.ration_food;
		local v511 = false;
		local v512 = false;
		local v513 = "R.I.Beans";
		if p62 == "MRE" then
			v502 = 4.95;
			v511 = true;
			v513 = "MRE Lunchbox";
		elseif p62 == "Soda" then
			v510 = tpglobalanimsets.ration_drink;
			v502 = 4.85;
			v512 = true;
			v513 = "UlayCola";
		elseif p62 == "Bottle" then
			v510 = tpglobalanimsets.ration_drink;
			v502 = 3.75;
			v512 = true;
			v511 = true;
			v513 = "Aquafill Bottle";
		end;
		local v514 = v502 * 1;
		u71(v513, "CONSUMING");
		v510:Play(0.4, 1, 1);
		l__workspace__1.ServerStuff.quickDisplay:FireServer(p62);
		while true do
			maingui.ChargeOverlay.ChargeOverlay.Size = UDim2.new(math.clamp((tick() - v508) / v514, 0, 1), 0, 1, 0);
			RS:wait();
			if not (v514 <= tick() - v508) then

			else
				break;
			end;
			if u8.staggering ~= true then

			else
				break;
			end;
			if not (hum.Health <= 0) then

			else
				break;
			end;		
		end;
		l__workspace__1.ServerStuff.quickDisplay:FireServer("delete");
		v510:Stop(0.4);
		if v509 ~= nil then
			v509:Disconnect();
		end;
		v503:Stop(0.1, 1, 1);
		maingui.ChargeOverlay.Visible = false;
		if v514 <= tick() - v508 then
			v507 = true;
		end;
		if v507 == true then
			l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "EatRations", 1 });
			if v512 == true then
				ration_system_handler.cooldown_drink_tick = tick();
				if ration_system_handler.full_bar <= tick() - ration_system_handler.thirst then
					ration_system_handler.thirst = tick() - ration_system_handler.full_bar;
				end;
				if v511 == true then
					ration_system_handler.thirst = ration_system_handler.thirst + ration_system_handler.high_tier;
				else
					ration_system_handler.thirst = ration_system_handler.thirst + ration_system_handler.low_tier;
				end;
				if tick() - ration_system_handler.thirst <= 0 then
					ration_system_handler.thirst = tick();
					if v511 == true then
						ration_system_handler.thirst = ration_system_handler.thirst + ration_system_handler.bonus_add;
					end;
				end;
			else
				ration_system_handler.cooldown_eat_tick = tick();
				if ration_system_handler.full_bar <= tick() - ration_system_handler.hunger then
					ration_system_handler.hunger = tick() - ration_system_handler.full_bar;
				end;
				if v511 == true then
					ration_system_handler.hunger = ration_system_handler.hunger + ration_system_handler.high_tier;
				else
					ration_system_handler.hunger = ration_system_handler.hunger + ration_system_handler.low_tier;
				end;
				if tick() - ration_system_handler.hunger <= 0 then
					ration_system_handler.hunger = tick();
					if v511 == true then
						ration_system_handler.hunger = ration_system_handler.hunger + ration_system_handler.bonus_add;
					end;
				end;
			end;
		end;
		v505:Destroy();
		v506:Destroy();
		u19 = u19 + 3;
		u8.eating = false;
		u8.action = false;
		u8.channel = false;
	end;
end;
aux_usage = 0;
all_aux = require(l__workspace__1.ServerStuff.Statistics.AUX_STATISTICS);
aux_name = playerstats.AuxUsing;
current_aux = nil;
if all_aux[aux_name] then
	current_aux = all_aux[aux_name];
	aux_usage = current_aux.use_per_night;
	for v515 = 1, aux_usage do
		local v516 = maingui.UpperLower.auxcount.ex:Clone();
		v516.Name = "aux" .. v515;
		v516.Position = UDim2.new(1, 35 - 35 * #maingui.UpperLower.auxcount:GetChildren(), 0.65, 0);
		v516.Visible = true;
		v516.Parent = maingui.UpperLower.auxcount;
	end;
end;
aux_held = false;
function use_aux()
	if u8.action ~= true then
		if u8.channel ~= true then
			if u8.staggering ~= true then
				if u8.firing ~= true then
					if u8.swinging ~= true then
						if u8.blocking ~= true then
							if u8.shoving ~= true then
								if u8.swapping ~= true then
									if u8.using_aux == true then

									else
										u8.using_aux = true;
										local v517 = nil;
										if l__game__6.ReplicatedStorage.auxItems:FindFirstChild(aux_name) then
											v517 = l__game__6.ReplicatedStorage.auxItems:FindFirstChild(aux_name):Clone();
											v517.Parent = l__CurrentCamera__1;
										end;
										if v517 ~= nil then
											local v518 = Instance.new("Motor6D");
											v518.Part0 = fparms.LeftArm.LUpperArm;
											v518.Part1 = v517;
											v518.Parent = v517;
											v518.Parent = l__CurrentCamera__1;
										end;
										local v519 = globalanimsets.aux_resp;
										if globalanimsets["aux_" .. aux_name] then
											v519 = globalanimsets["aux_" .. aux_name];
										end;
										if tpglobalanimsets["aux_" .. aux_name] then
											tpglobalanimsets["aux_" .. aux_name]:Play(0.1);
										end;
										if aux_name == "knives" then
											v104({ "aux" }, "knife_equip", nil, nil, true, true);
										elseif aux_name == "decoy" then
											v104({ "aux" }, "decoy_ready", nil, nil, true, true);
										elseif aux_name == "concertina" then
											v104({ "aux" }, "concertina_hold", nil, nil, true, true);
										elseif aux_name == "tgas" then
											v104({ "aux" }, "tgas_equip", nil, nil, true, true);
										elseif aux_name == "ladder" then
											v104({ "aux" }, "ladder_grab", nil, nil, true, true);
										elseif aux_name == "buffer" then
											v104({ "echo_specific" }, "lighter", nil, nil, true, true);
											delay(0.3, function()
												v104({ "echo_specific" }, "lighter", nil, nil, true, true);
											end);
										elseif aux_name == "ballistic" then
											v104({ "aux" }, "ballistic_hold", nil, nil, true, true);
										elseif aux_name == "cauteriser" then
											l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "match_light", character.HumanoidRootPart);
											l__workspace__1.ServerStuff.quickDisplay:FireServer("Caut", true);
										elseif aux_name == "bottle" then
											l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "bottle_equip", character.HumanoidRootPart);
											delay(0.37, function()
												v104({ "aux" }, "bottle_open", nil, nil, true, true);
												if v517 then
													v517:FindFirstChild("corkweld"):Destroy();
													RS:wait();
													v517:FindFirstChild("cork").Velocity = v517:FindFirstChild("cork").CFrame.upVector * 10;
												end;
											end);
											l__workspace__1.ServerStuff.quickDisplay:FireServer("Alky", true);
										end;
										local u72 = nil;
										u72 = v519.KeyframeReached:connect(function(p64)
											if p64 == "aux_use" then
												if current_aux.activestats.held == true then
													local v520 = false;
													maingui.Centre.crosshair.A1.Visible = false;
													maingui.Centre.crosshair.A2.Visible = false;
													maingui.Centre.crosshair.dot.Visible = false;
													maingui.Centre.crosshair.B1.Size = UDim2.new(0, 20, 0, 2);
													maingui.Centre.crosshair.B2.Size = UDim2.new(0, 20, 0, 2);
													v519.TimePosition = v519:GetTimeOfKeyframe("aux_use");
													v519:AdjustSpeed(0);
													v519.TimePosition = v519:GetTimeOfKeyframe("aux_use");
													while true do
														RS:wait();
														if u8.action ~= true then

														else
															v520 = true;
															break;
														end;
														if u8.channel ~= true then

														else
															v520 = true;
															break;
														end;
														if u8.staggering ~= true then

														else
															v520 = true;
															break;
														end;
														if u8.firing ~= true then

														else
															v520 = true;
															break;
														end;
														if u8.swinging ~= true then

														else
															v520 = true;
															break;
														end;
														if u8.blocking ~= true then

														else
															v520 = true;
															break;
														end;
														if u8.shoving ~= true then

														else
															v520 = true;
															break;
														end;
														if u8.swapping == true then
															v520 = true;
															break;
														end;
														if aux_held ~= false then

														else
															break;
														end;													
													end;
													v519.TimePosition = v519:GetTimeOfKeyframe("aux_use") + 0.01;
													if u8.throwing == false then
														maingui.Centre.crosshair.A1.Visible = true;
														maingui.Centre.crosshair.A2.Visible = true;
														maingui.Centre.crosshair.dot.Visible = true;
														maingui.Centre.crosshair.B1.Size = UDim2.new(0, 10, 0, 2);
														maingui.Centre.crosshair.B2.Size = UDim2.new(0, 10, 0, 2);
													end;
													if v520 == true then
														aux_held = false;
														u8.using_aux = false;
														v519:Stop(0);
														if v517 ~= nil then
															v517:Destroy();
														end;
														if u72 ~= nil then
															u72:Disconnect();
														end;
														return;
													end;
													v519:AdjustSpeed(1);
												end;
												aux_usage = aux_usage - 1;
												local v521, v522, v523 = ipairs(maingui.UpperLower.auxcount:GetChildren());
												while true do
													local v524, v525 = v521(v522, v523);
													if v524 then

													else
														break;
													end;
													v523 = v524;
													if v525.Name ~= "ex" then
														if tonumber(string.sub(v525.Name, 4, 6)) <= aux_usage then
															v525.inner.Visible = true;
														else
															v525.inner.Visible = false;
														end;
														if aux_usage == 0 then
															v525.inner.Visible = false;
														end;
													end;												
												end;
												if aux_name == "resp" then
													l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "resp_equip", character.HumanoidRootPart);
													afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).RespA);
													v517:Destroy();
													return;
												end;
												if aux_name == "bottle" then
													l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "liquid_sip", character.HumanoidRootPart);
													delay(0.8, function()
														l__workspace__1.ServerStuff.playAudio:FireServer({ "rations" }, "liquid_sip", character.HumanoidRootPart);
													end);
													delay(1.7, function()
														tpglobalanimsets.aux_bottle:Stop(0.1);
														l__workspace__1.ServerStuff.quickDisplay:FireServer("delete");
														v104({ "aux" }, "decoy_throw", nil, nil, true, true);
														delay(0.1, function()
															v104({ "aux" }, "bottle_break", nil, nil, true, true);
														end);
													end);
													afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).AlkyA);
													return;
												end;
												if aux_name == "cauteriser" then
													l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "match_burn", character.HumanoidRootPart);
													l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "match_burn2", character.HumanoidRootPart);
													delay(1.3, function()
														l__workspace__1.ServerStuff.quickDisplay:FireServer("delete");
														v104({ "aux" }, "match_flick", nil, nil, true, true);
													end);
													l__workspace__1.ServerStuff.dealDamage:FireServer("cauteriseheal", nil, v5, v4);
													delay(0.5, function()
														if hum.Health == hum.MaxHealth then
															if u9.Bleed then
																u9.Bleed.effects.currentduration = 0;
															end;
														end;
													end);
													return;
												end;
												if aux_name == "knives" then
													tpglobalanimsets.aux_knifethrow:Play(0.1);
													l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "knife_throw", character.HumanoidRootPart);
													l__workspace__1.ServerStuff.throwWeapon:FireServer("TKnife", 50, l__CurrentCamera__1.CFrame, 1, v19.TKnife, 1, nil, v5, nil, v4);
													v517:Destroy();
													return;
												end;
												if aux_name == "tgas" then
													delay(0.45, function()
														l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "pinpull", character.HumanoidRootPart);
													end);
													delay(0.8, function()
														l__workspace__1.ServerStuff.playAudio:FireServer({ "general_ui" }, "throw_fast", character.HumanoidRootPart);
														tpglobalanimsets.aux_overhead:Play(0.1);
														v517:Destroy();
														local v526 = l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * 1;
														l__workspace__1.ServerStuff.throwWeapon:FireServer("TGas", 20, l__CurrentCamera__1.CFrame, 1, v19.TGas, 1, nil, v5, nil, v4);
													end);
													return;
												end;
												if aux_name == "buffer" then
													v517:Destroy();
													afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).BuffC);
													tpglobalanimsets.aux_resp:Play(0.1);
													spawn(function()
														if character:FindFirstChild("Head") then
															if character.Head:WaitForChild("buffer_head") then
																character.Head:FindFirstChild("buffer_head"):Destroy();
															end;
														end;
													end);
													return;
												end;
												if aux_name == "decoy" then
													l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "decoy_throw", character.HumanoidRootPart);
													delay(0.35, function()
														tpglobalanimsets.aux_overhead:Play(0.1);
														v517:Destroy();
														l__workspace__1.ServerStuff.dealDamage:FireServer("throwdecoy", l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * 1, v5, v4);
													end);
													return;
												end;
												if aux_name == "concertina" then
													delay(0.45, function()
														l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "concertina_throw", character.HumanoidRootPart);
														tpglobalanimsets.perk_throwing:Play(0.1);
														v517:Destroy();
														l__workspace__1.ServerStuff.dealDamage:FireServer("throwconcertina", l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * 1, v5, v4);
													end);
													return;
												end;
												if aux_name == "ladder" then
													l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "ladder_deploy", character.HumanoidRootPart);
													tpglobalanimsets.aux_overhead:Play(0.1);
													v517:Destroy();
													l__workspace__1.ServerStuff.dealDamage:FireServer("create_ladder", l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * 1, v5, v4);
													return;
												end;
												if aux_name == "holo" then
													l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "holo_spawn", character.HumanoidRootPart);
													l__workspace__1.ServerStuff.dealDamage:FireServer("create_holo", u26.w, v5, v4);
													return;
												end;
												if aux_name == "ballistic" then
													tpglobalanimsets.aux_knifethrow:Play(0.1);
													l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "ballistic_shoot", character.HumanoidRootPart);
													v517.blade:Destroy();
													spawn(function()
														local v527, v528 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, 80, baselayer);
														if v527 == nil then
															local v529 = v528;
															local v530 = 1 - 1;
															while true do
																local v531, v532 = raycastline(v529, l__CurrentCamera__1.CFrame.LookVector + Vector3.new(0, -0.05, 0), 3, baselayer);
																trigger_map_item_func(v531, "gundamage", 100);
																if v531 then
																	v527 = v531;
																	break;
																end;
																v529 = v532;
																RS:wait();
																if 0 <= 1 then
																	if v530 < 200 then

																	else
																		break;
																	end;
																elseif 200 < v530 then

																else
																	break;
																end;
																v530 = v530 + 1;															
															end;
														end;
														l__workspace__1.ServerStuff.applyGore:FireServer("bowarrow", character, ply, { l__CurrentCamera__1.CFrame, Vector3.new(0, 0, 0) });
														if v527 then
															if v527.Parent:FindFirstChild("Humanoid") then
																if 0 < v527.Parent:FindFirstChild("Humanoid").Health then
																	if v527.Parent:FindFirstChild("Head") then
																		if v527.Parent:IsDescendantOf(l__workspace__1.activeHostiles) then
																			v156();
																			u39(v527.Parent.Head.Position, current_aux.activestats.impact_damage);
																			l__workspace__1.ServerStuff.dealDamage:FireServer("aux_ballistic", v527.Parent, v5, v4);
																		end;
																	end;
																end;
															end;
														end;
													end);
												end;
											end;
										end);
										v519:Play(0.1, 1, 1);
										while true do
											RS:wait();
											if v519.IsPlaying ~= false then

											else
												break;
											end;										
										end;
										u8.using_aux = false;
										if v517 ~= nil then
											v517:Destroy();
										end;
										if u72 ~= nil then
											u72:Disconnect();
										end;
										return;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end;
sniperscope = nil;
function sniperscopefunction(p65)
	if sniperscope == nil then
		return;
	end;
	spawn(function()
		if p65 == "shake" then
			local v533 = 1 - 1;
			while true do
				if sniperscope == nil then
					return;
				end;
				sniperscope.scopedFrame.Size = sniperscope.scopedFrame.Size + UDim2.new(0, 12, 0, 12);
				RS:wait();
				if 0 <= 1 then
					if v533 < 10 then

					else
						break;
					end;
				elseif 10 < v533 then

				else
					break;
				end;
				v533 = v533 + 1;			
			end;
			if sniperscope == nil then
				return;
			else
				local v534 = 1 - 1;
				while true do
					if sniperscope == nil then
						return;
					end;
					sniperscope.scopedFrame.Size = sniperscope.scopedFrame.Size - UDim2.new(0, 6, 0, 6);
					RS:wait();
					if 0 <= 1 then
						if v534 < 20 then

						else
							break;
						end;
					elseif 20 < v534 then

					else
						break;
					end;
					v534 = v534 + 1;				
				end;
				return;
			end;
		end;
		if p65 == "tilt" then
			local v535 = tick();
			while true do
				if sniperscope == nil then
					return;
				end;
				sniperscope.scopedFrame.crosshair.Rotation = lerp(sniperscope.scopedFrame.Rotation, -6, (tick() - v535) / 0.25);
				RS:wait();
				if not (0.25 <= tick() - v535) then

				else
					break;
				end;			
			end;
			local v536 = tick();
			while true do
				if sniperscope == nil then
					return;
				end;
				sniperscope.scopedFrame.crosshair.Rotation = lerp(sniperscope.scopedFrame.Rotation, 6, (tick() - v536) / 0.25);
				RS:wait();
				if not (0.25 <= tick() - v536) then

				else
					break;
				end;			
			end;
			local v537 = tick();
			while true do
				if sniperscope == nil then
					return;
				end;
				sniperscope.scopedFrame.crosshair.Rotation = lerp(sniperscope.scopedFrame.Rotation, 0, (tick() - v537) / 0.25);
				RS:wait();
				if not (0.25 <= tick() - v537) then

				else
					break;
				end;			
			end;
		end;
	end);
end;
local u73 = 1;
local u74 = 1;
juggernaut = false;
local u75 = 0;
local u76 = 0;
local u77 = false;
local u78 = false;
l__workspace__1.ServerStuff.spawnPlayer.OnClientEvent:Connect(function()

end);
local u79 = false;
function stagger(p66)
	if juggernaut == true then
		return;
	end;
	if u8.hanger == true then
		return;
	end;
	if startperk.Value == "rayzen" then
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Rge);
	end;
	u54 = false;
	u69 = false;
	if u14.weapontype ~= "Bludgeon" then
		if u14.weapontype ~= "Spear" then
			if u14.weapontype ~= "Axe" then
				if u14.weapontype == "Blade" then
					curentanimset.block:Stop(0);
					tpcurrentanimset.block:Stop(0);
					curentanimset.charge:Stop(0);
					tpcurrentanimset.charge:Stop(0);
				end;
			else
				curentanimset.block:Stop(0);
				tpcurrentanimset.block:Stop(0);
				curentanimset.charge:Stop(0);
				tpcurrentanimset.charge:Stop(0);
			end;
		else
			curentanimset.block:Stop(0);
			tpcurrentanimset.block:Stop(0);
			curentanimset.charge:Stop(0);
			tpcurrentanimset.charge:Stop(0);
		end;
	else
		curentanimset.block:Stop(0);
		tpcurrentanimset.block:Stop(0);
		curentanimset.charge:Stop(0);
		tpcurrentanimset.charge:Stop(0);
	end;
	u8.action = true;
	u8.staggering = true;
	u8.cancombo = false;
	u8.channel = true;
	u8.swinging = true;
	u8.sneaking = false;
	u8.sliding = false;
	u8.sprinting = false;
	u8.blocking = false;
	l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
	u8.turnable = true;
	u41 = tick();
	u42 = 1;
	u11.stamregen = tick();
	u11.regentick = tick();
	u12 = 0.0175;
	local v538 = { globalanimsets.stagger, tpglobalanimsets.stagger };
	if p66 == "vomit" then
		v538 = { globalanimsets.stun, tpglobalanimsets.sick };
		l__workspace__1.ServerStuff.applyGore:FireServer("vomit", character, nil, nil);
		local u80 = nil;
		u80 = v538[1].KeyframeReached:connect(function(p67)
			if p67 == "Stop" then
				v538[1]:AdjustSpeed(0);
				u80:Disconnect();
			end;
		end);
		u8.turnable = false;
	end;
	v538[1]:Play(0.1);
	v538[2]:Play(0.1);
	u10 = 0.001;
	local v539 = Instance.new("BlurEffect");
	v539.Size = 15;
	if p66 == "normal" then
		shakecamera("stagger");
		v539.Parent = l__CurrentCamera__1;
	end;
	local v540 = false;
	u79 = false;
	while true do
		v539.Size = v539.Size - 0.5;
		if u79 == true then
			if v540 == false then
				v540 = true;
				if v538[2].TimePosition < v538[2].Length - 0.4 then
					v538[1].TimePosition = v538[1].Length - 0.4;
					v538[2].TimePosition = v538[2].Length - 0.4;
				end;
			end;
		end;
		RS:wait();
		if v538[1].IsPlaying ~= false then

		else
			break;
		end;
		if v538[2].IsPlaying ~= false then

		else
			break;
		end;	
	end;
	u10 = 10;
	u11.stamregen = tick();
	u11.regentick = tick();
	u12 = 0.0175;
	u79 = false;
	v539:Destroy();
	v538[1]:Stop(0.1);
	v538[2]:Stop();
	curentanimset.equip.TimePosition = 0.5;
	curentanimset.equip:AdjustSpeed(0);
	tpcurrentanimset.equip:Play();
	tpcurrentanimset.equip.TimePosition = 0.5;
	tpcurrentanimset.equip:AdjustSpeed(0);
	check_walking_anim();
	u8.action = false;
	u8.cancombo = true;
	u8.turnable = true;
	u8.swinging = false;
	u8.staggering = false;
	u8.channel = false;
end;
function createfxoutline(p68, p69)
	local v541 = l__game__6.ReplicatedStorage.effects.outlineFx:Clone();
	local v542 = v541:FindFirstChild(p68);
	local v543, v544, v545 = ipairs(v541:GetChildren());
	while true do
		local v546, v547 = v543(v544, v545);
		if v546 then

		else
			break;
		end;
		v545 = v546;
		if v547:IsA("BasePart") then
			local v548 = v542:Clone();
			v548.Enabled = true;
			v548.Parent = v547;
		elseif v547 ~= v542 then
			if not v547:IsA("Folder") then
				v547:Destroy();
			end;
		end;	
	end;
	v541.CFrame = l__CurrentCamera__1.CFrame;
	v541.Parent = l__CurrentCamera__1;
	local v549 = Instance.new("Motor6D");
	v549.Part0 = v541;
	v549.Part1 = cpart;
	v549.C1 = CFrame.new(0, 0, -0.4) * CFrame.Angles(0, 0, 0);
	v549.Parent = v541;
	if p69 then
		delay(p69, function()
			local v550, v551, v552 = ipairs(v541:GetDescendants());
			while true do
				local v553, v554 = v550(v551, v552);
				if v553 then

				else
					break;
				end;
				v552 = v553;
				if v554:IsA("ParticleEmitter") then
					v554.Enabled = false;
				end;			
			end;
			l__Debris__32:AddItem(v541, v542.Lifetime.Min + 0.5);
		end);
	end;
	return v541;
end;
if startperk.Value == "hiddenB" then
	local v555 = l__game__6.ReplicatedStorage.effects.wraithFX:Clone();
	v555.CFrame = l__CurrentCamera__1.CFrame;
	v555.Parent = l__CurrentCamera__1;
	local v556 = Instance.new("Motor6D");
	v556.Part0 = v555;
	v556.Part1 = cpart;
	v556.C1 = CFrame.new(0, 0, -0.4) * CFrame.Angles(0, 0, 0);
	v556.Parent = v555;
end;
local u81 = 1;
local u82 = v202;
local function u83(p70)
	maingui.infectionalert.TextTransparency = 1;
	maingui.infectionalert.TextStrokeTransparency = maingui.infectionalert.TextTransparency;
	maingui.infectionalert.Text = "";
	agent_speak("viral");
	local u84 = "Systemic Infection has reached Stage " .. p70 .. ".";
	spawn(function()
		local v557 = tick();
		local v558 = 0;
		local v559 = tick();
		while true do
			maingui.infectionalert.TextTransparency = 1 - (tick() - v557) / 2;
			maingui.infectionalert.TextStrokeTransparency = maingui.infectionalert.TextTransparency;
			if tick() - v559 > 0.1 then
				v559 = tick();
				v558 = v558 + 1;
				maingui.infectionalert.Text = string.sub(u84, 1, v558);
				if string.len(u84) <= v558 then
					maingui.infectionalert.Text = u84;
				end;
			end;
			RS:wait();
			if maingui.infectionalert.Text == u84 then
				break;
			end;		
		end;
		maingui.infectionalert.TextTransparency = 0;
		maingui.infectionalert.TextStrokeTransparency = maingui.infectionalert.TextTransparency;
		local v560 = tick();
		while true do
			RS:wait();
			if tick() - v560 >= 2 then
				break;
			end;		
		end;
		local v561 = tick();
		while true do
			maingui.infectionalert.TextTransparency = (tick() - v561) / 2;
			maingui.infectionalert.TextStrokeTransparency = maingui.infectionalert.TextTransparency;
			RS:wait();
			if tick() - v561 >= 2 then
				break;
			end;		
		end;
		maingui.infectionalert.TextTransparency = 1;
		maingui.infectionalert.TextStrokeTransparency = maingui.infectionalert.TextTransparency;
	end);
end;
local function u85()
	for v562, v563 in ipairs(maingui.HealthFrame.Statuses:GetChildren()) do
		if v563.Name ~= "Example" then
			v563.Position = UDim2.new(v562 - 0.7 + 0.1 * v562 - 2, 0, 0.5, 0);
		end;
	end;
end;
function afflictstatus(p71)
	if u9[p71.name] then
		u9[p71.name].effects.currentduration = tick();
		if p71.name ~= "Cripple" then
			if p71.name ~= "Bleed" then
				if p71.name ~= "Expose" then
					if p71.name == "Pierce" then
						if u9[p71.name].mainstats.intensity < p71.intensity then
							u9[p71.name].mainstats.intensity = p71.intensity;
							return;
						end;
					end;
				elseif u9[p71.name].mainstats.intensity < p71.intensity then
					u9[p71.name].mainstats.intensity = p71.intensity;
					return;
				end;
			elseif u9[p71.name].mainstats.intensity < p71.intensity then
				u9[p71.name].mainstats.intensity = p71.intensity;
				return;
			end;
		elseif u9[p71.name].mainstats.intensity < p71.intensity then
			u9[p71.name].mainstats.intensity = p71.intensity;
			return;
		end;
	else
		if playerperks.lead then
			if p71.name == "Vomit" then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Rgn);
				return;
			end;
		end;
		local v564 = {
			effects = {
				corename = "", 
				currentloop = nil, 
				currentduration = tick(), 
				maxduration = 0, 
				currentgui = nil, 
				currentpos = 0, 
				ticks = {}, 
				colour = false
			}, 
			mainstats = {}
		};
		local v565, v566, v567 = pairs(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS));
		while true do
			local v568, v569 = v565(v566, v567);
			if v568 then

			else
				break;
			end;
			v567 = v568;
			if v569.name == p71.name then
				v564.effects.corename = v568;
				break;
			end;		
		end;
		v564.mainstats = p71;
		v564.effects.maxduration = v564.mainstats.dur;
		v564.effects.currentduration = tick();
		if p71.colour ~= nil then
			v564.effects.colour = p71.colour;
		end;
		local v570 = maingui.HealthFrame.Statuses.Example:Clone();
		v564.effects.currentgui = v570;
		v570.Name = v564.mainstats.name;
		local v571 = 0;
		v570.Icon.Image = "rbxassetid://" .. v564.mainstats.icon;
		v570.Visible = true;
		if v564.mainstats.name ~= "Death Morale 1" then
			if v564.mainstats.name ~= "Death Morale 2" then
				if v564.mainstats.name ~= "Death Morale 3" then
					if v564.mainstats.name ~= "Death Morale 4" then
						if v564.mainstats.name ~= "Arterial Bleed" then
							if v564.mainstats.name ~= "Toxins" then
								if v564.mainstats.name ~= "Artillerist Buff" then
									if v564.mainstats.name ~= "Cloaked" then
										if v564.mainstats.name ~= "Sprinting" then
											if v564.mainstats.name ~= "Exhaustion" then
												if v564.mainstats.name == "Gas Mask" then
													v570.EmptyBar.Visible = false;
													v570.textinsteadofbar.Visible = true;
													v570.textinsteadofbar.Text = "MORALE";
													if v564.mainstats.name == "Arterial Bleed" then
														v570.textinsteadofbar.Text = "ARTERY";
													elseif v564.mainstats.name == "Toxins" then
														v570.textinsteadofbar.Text = "TOXINS";
													elseif v564.mainstats.name == "Artillerist Buff" then
														v570.textinsteadofbar.Text = "DEADEYE";
													elseif v564.mainstats.name == "Cloaked" then
														v570.textinsteadofbar.Text = "CLOAKED";
													elseif v564.mainstats.name == "Sprinting" then
														v570.textinsteadofbar.Text = "SPRINT";
													elseif v564.mainstats.name == "Exhaustion" then
														v570.textinsteadofbar.Text = "EXHAUST";
													elseif v564.mainstats.name == "Gas Mask" then
														v570.textinsteadofbar.Text = "MASK";
													end;
												end;
											else
												v570.EmptyBar.Visible = false;
												v570.textinsteadofbar.Visible = true;
												v570.textinsteadofbar.Text = "MORALE";
												if v564.mainstats.name == "Arterial Bleed" then
													v570.textinsteadofbar.Text = "ARTERY";
												elseif v564.mainstats.name == "Toxins" then
													v570.textinsteadofbar.Text = "TOXINS";
												elseif v564.mainstats.name == "Artillerist Buff" then
													v570.textinsteadofbar.Text = "DEADEYE";
												elseif v564.mainstats.name == "Cloaked" then
													v570.textinsteadofbar.Text = "CLOAKED";
												elseif v564.mainstats.name == "Sprinting" then
													v570.textinsteadofbar.Text = "SPRINT";
												elseif v564.mainstats.name == "Exhaustion" then
													v570.textinsteadofbar.Text = "EXHAUST";
												elseif v564.mainstats.name == "Gas Mask" then
													v570.textinsteadofbar.Text = "MASK";
												end;
											end;
										else
											v570.EmptyBar.Visible = false;
											v570.textinsteadofbar.Visible = true;
											v570.textinsteadofbar.Text = "MORALE";
											if v564.mainstats.name == "Arterial Bleed" then
												v570.textinsteadofbar.Text = "ARTERY";
											elseif v564.mainstats.name == "Toxins" then
												v570.textinsteadofbar.Text = "TOXINS";
											elseif v564.mainstats.name == "Artillerist Buff" then
												v570.textinsteadofbar.Text = "DEADEYE";
											elseif v564.mainstats.name == "Cloaked" then
												v570.textinsteadofbar.Text = "CLOAKED";
											elseif v564.mainstats.name == "Sprinting" then
												v570.textinsteadofbar.Text = "SPRINT";
											elseif v564.mainstats.name == "Exhaustion" then
												v570.textinsteadofbar.Text = "EXHAUST";
											elseif v564.mainstats.name == "Gas Mask" then
												v570.textinsteadofbar.Text = "MASK";
											end;
										end;
									else
										v570.EmptyBar.Visible = false;
										v570.textinsteadofbar.Visible = true;
										v570.textinsteadofbar.Text = "MORALE";
										if v564.mainstats.name == "Arterial Bleed" then
											v570.textinsteadofbar.Text = "ARTERY";
										elseif v564.mainstats.name == "Toxins" then
											v570.textinsteadofbar.Text = "TOXINS";
										elseif v564.mainstats.name == "Artillerist Buff" then
											v570.textinsteadofbar.Text = "DEADEYE";
										elseif v564.mainstats.name == "Cloaked" then
											v570.textinsteadofbar.Text = "CLOAKED";
										elseif v564.mainstats.name == "Sprinting" then
											v570.textinsteadofbar.Text = "SPRINT";
										elseif v564.mainstats.name == "Exhaustion" then
											v570.textinsteadofbar.Text = "EXHAUST";
										elseif v564.mainstats.name == "Gas Mask" then
											v570.textinsteadofbar.Text = "MASK";
										end;
									end;
								else
									v570.EmptyBar.Visible = false;
									v570.textinsteadofbar.Visible = true;
									v570.textinsteadofbar.Text = "MORALE";
									if v564.mainstats.name == "Arterial Bleed" then
										v570.textinsteadofbar.Text = "ARTERY";
									elseif v564.mainstats.name == "Toxins" then
										v570.textinsteadofbar.Text = "TOXINS";
									elseif v564.mainstats.name == "Artillerist Buff" then
										v570.textinsteadofbar.Text = "DEADEYE";
									elseif v564.mainstats.name == "Cloaked" then
										v570.textinsteadofbar.Text = "CLOAKED";
									elseif v564.mainstats.name == "Sprinting" then
										v570.textinsteadofbar.Text = "SPRINT";
									elseif v564.mainstats.name == "Exhaustion" then
										v570.textinsteadofbar.Text = "EXHAUST";
									elseif v564.mainstats.name == "Gas Mask" then
										v570.textinsteadofbar.Text = "MASK";
									end;
								end;
							else
								v570.EmptyBar.Visible = false;
								v570.textinsteadofbar.Visible = true;
								v570.textinsteadofbar.Text = "MORALE";
								if v564.mainstats.name == "Arterial Bleed" then
									v570.textinsteadofbar.Text = "ARTERY";
								elseif v564.mainstats.name == "Toxins" then
									v570.textinsteadofbar.Text = "TOXINS";
								elseif v564.mainstats.name == "Artillerist Buff" then
									v570.textinsteadofbar.Text = "DEADEYE";
								elseif v564.mainstats.name == "Cloaked" then
									v570.textinsteadofbar.Text = "CLOAKED";
								elseif v564.mainstats.name == "Sprinting" then
									v570.textinsteadofbar.Text = "SPRINT";
								elseif v564.mainstats.name == "Exhaustion" then
									v570.textinsteadofbar.Text = "EXHAUST";
								elseif v564.mainstats.name == "Gas Mask" then
									v570.textinsteadofbar.Text = "MASK";
								end;
							end;
						else
							v570.EmptyBar.Visible = false;
							v570.textinsteadofbar.Visible = true;
							v570.textinsteadofbar.Text = "MORALE";
							if v564.mainstats.name == "Arterial Bleed" then
								v570.textinsteadofbar.Text = "ARTERY";
							elseif v564.mainstats.name == "Toxins" then
								v570.textinsteadofbar.Text = "TOXINS";
							elseif v564.mainstats.name == "Artillerist Buff" then
								v570.textinsteadofbar.Text = "DEADEYE";
							elseif v564.mainstats.name == "Cloaked" then
								v570.textinsteadofbar.Text = "CLOAKED";
							elseif v564.mainstats.name == "Sprinting" then
								v570.textinsteadofbar.Text = "SPRINT";
							elseif v564.mainstats.name == "Exhaustion" then
								v570.textinsteadofbar.Text = "EXHAUST";
							elseif v564.mainstats.name == "Gas Mask" then
								v570.textinsteadofbar.Text = "MASK";
							end;
						end;
					else
						v570.EmptyBar.Visible = false;
						v570.textinsteadofbar.Visible = true;
						v570.textinsteadofbar.Text = "MORALE";
						if v564.mainstats.name == "Arterial Bleed" then
							v570.textinsteadofbar.Text = "ARTERY";
						elseif v564.mainstats.name == "Toxins" then
							v570.textinsteadofbar.Text = "TOXINS";
						elseif v564.mainstats.name == "Artillerist Buff" then
							v570.textinsteadofbar.Text = "DEADEYE";
						elseif v564.mainstats.name == "Cloaked" then
							v570.textinsteadofbar.Text = "CLOAKED";
						elseif v564.mainstats.name == "Sprinting" then
							v570.textinsteadofbar.Text = "SPRINT";
						elseif v564.mainstats.name == "Exhaustion" then
							v570.textinsteadofbar.Text = "EXHAUST";
						elseif v564.mainstats.name == "Gas Mask" then
							v570.textinsteadofbar.Text = "MASK";
						end;
					end;
				else
					v570.EmptyBar.Visible = false;
					v570.textinsteadofbar.Visible = true;
					v570.textinsteadofbar.Text = "MORALE";
					if v564.mainstats.name == "Arterial Bleed" then
						v570.textinsteadofbar.Text = "ARTERY";
					elseif v564.mainstats.name == "Toxins" then
						v570.textinsteadofbar.Text = "TOXINS";
					elseif v564.mainstats.name == "Artillerist Buff" then
						v570.textinsteadofbar.Text = "DEADEYE";
					elseif v564.mainstats.name == "Cloaked" then
						v570.textinsteadofbar.Text = "CLOAKED";
					elseif v564.mainstats.name == "Sprinting" then
						v570.textinsteadofbar.Text = "SPRINT";
					elseif v564.mainstats.name == "Exhaustion" then
						v570.textinsteadofbar.Text = "EXHAUST";
					elseif v564.mainstats.name == "Gas Mask" then
						v570.textinsteadofbar.Text = "MASK";
					end;
				end;
			else
				v570.EmptyBar.Visible = false;
				v570.textinsteadofbar.Visible = true;
				v570.textinsteadofbar.Text = "MORALE";
				if v564.mainstats.name == "Arterial Bleed" then
					v570.textinsteadofbar.Text = "ARTERY";
				elseif v564.mainstats.name == "Toxins" then
					v570.textinsteadofbar.Text = "TOXINS";
				elseif v564.mainstats.name == "Artillerist Buff" then
					v570.textinsteadofbar.Text = "DEADEYE";
				elseif v564.mainstats.name == "Cloaked" then
					v570.textinsteadofbar.Text = "CLOAKED";
				elseif v564.mainstats.name == "Sprinting" then
					v570.textinsteadofbar.Text = "SPRINT";
				elseif v564.mainstats.name == "Exhaustion" then
					v570.textinsteadofbar.Text = "EXHAUST";
				elseif v564.mainstats.name == "Gas Mask" then
					v570.textinsteadofbar.Text = "MASK";
				end;
			end;
		else
			v570.EmptyBar.Visible = false;
			v570.textinsteadofbar.Visible = true;
			v570.textinsteadofbar.Text = "MORALE";
			if v564.mainstats.name == "Arterial Bleed" then
				v570.textinsteadofbar.Text = "ARTERY";
			elseif v564.mainstats.name == "Toxins" then
				v570.textinsteadofbar.Text = "TOXINS";
			elseif v564.mainstats.name == "Artillerist Buff" then
				v570.textinsteadofbar.Text = "DEADEYE";
			elseif v564.mainstats.name == "Cloaked" then
				v570.textinsteadofbar.Text = "CLOAKED";
			elseif v564.mainstats.name == "Sprinting" then
				v570.textinsteadofbar.Text = "SPRINT";
			elseif v564.mainstats.name == "Exhaustion" then
				v570.textinsteadofbar.Text = "EXHAUST";
			elseif v564.mainstats.name == "Gas Mask" then
				v570.textinsteadofbar.Text = "MASK";
			end;
		end;
		if v564.effects.colour ~= false then
			v570.EmptyBar.Bar.BackgroundColor3 = v564.effects.colour;
			v570.Icon.ImageColor3 = v564.effects.colour;
			v570.textinsteadofbar.TextColor3 = v564.effects.colour;
		end;
		v570.Parent = maingui.HealthFrame.Statuses;
		local v572, v573, v574 = pairs(u9);
		while true do
			local v575, v576 = v572(v573, v574);
			if v575 then

			else
				break;
			end;
			v574 = v575;
			v571 = v571 + 1;		
		end;
		v564.effects.currentpos = v571;
		if v564.mainstats.name ~= "Bleed" then
			if v564.mainstats.name ~= "Regeneration" then
				if v564.mainstats.name ~= "Arterial Bleed" then
					if v564.mainstats.name ~= "Fracture" then
						if v564.mainstats.name == "Cripple" then
							v564.effects.ticks[1] = tick();
							if v564.mainstats.name == "Fracture" then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "fracture", character.HumanoidRootPart);
							elseif v564.mainstats.name == "Cripple" then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "cripple", character.HumanoidRootPart);
							elseif v564.mainstats.name == "Bleed" then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "bleed", character.HumanoidRootPart);
							end;
						elseif v564.mainstats.name == "Vomit" then
							spawn(function()
								stagger("vomit");
							end);
						elseif v564.mainstats.name == "Blindness" then
							local v577 = l__game__6.ReplicatedStorage.effects.blackscreen:Clone();
							v577.Parent = maingui;
							v564.effects.ticks[1] = v577;
						elseif v564.mainstats.name == "Cloaked" then
							local v578 = l__game__6.ReplicatedStorage.soundLibrary.perks.two.drift_loop:Clone();
							v578.Looped = true;
							v578.Parent = l__CurrentCamera__1;
							v578:Play();
							v564.effects.ticks[2] = v578;
							l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "drift_cloak1", character.HumanoidRootPart);
							l__workspace__1.ServerStuff.applyGore:FireServer("drifter_puff", character, nil, character.Torso.CFrame);
							l__workspace__1.ServerStuff.applyGore:FireServer("drifter_cloak", character, nil);
							v564.effects.ticks[1] = createfxoutline("smokeFX");
						elseif v564.mainstats.name ~= "Sickness" then
							if v564.mainstats.name == "Toxins" then
								if v564.mainstats.name == "Toxins" then
									local v579 = l__game__6.ReplicatedStorage.effects.sickcc:Clone();
								else
									v579 = l__game__6.ReplicatedStorage.effects.punjicc:Clone();
								end;
								v579.Parent = l__CurrentCamera__1;
								local v580 = Instance.new("BlurEffect");
								v580.Size = 0;
								v580.Parent = l__CurrentCamera__1;
								v564.effects.ticks[1] = { v579, v580, tick() };
								if v564.mainstats.name == "Sickness" then
									spawn(function()
										createfxoutline("sickParticle", v564.mainstats.dur);
									end);
								end;
								if v564.mainstats.name == "Toxins" then
									agent_speak("stormenter");
									local v581 = l__game__6.ReplicatedStorage.effects.stormfx_overlay:Clone();
									v581.CFrame = l__CurrentCamera__1.CFrame;
									v581.Parent = l__CurrentCamera__1;
									local v582 = Instance.new("Motor6D");
									v582.Part0 = v581;
									v582.Part1 = cpart;
									v582.C1 = CFrame.new(0, 0, -0.4) * CFrame.Angles(0, 0, 0);
									v582.Parent = v581;
									v564.effects.ticks[2] = v581;
									v564.effects.ticks[3] = tick();
								end;
							elseif v564.mainstats.name == "Tinnitus" then
								shakecamera("tinnitus");
								l__game__6:GetService("SoundService").regular.Volume = 0.3;
								local v583 = Instance.new("BlurEffect");
								v583.Size = 0;
								v583.Parent = l__CurrentCamera__1;
								local v584 = l__game__6.ReplicatedStorage.soundLibrary.general.earringing:Clone();
								v584.Looped = true;
								v584.Parent = l__CurrentCamera__1;
								v584:Play();
								v564.effects.ticks[1] = { v584, v583 };
							elseif v564.mainstats.name == "Berserk" then
								local v585 = l__game__6.ReplicatedStorage.effects.ragecc:Clone();
								v585.Parent = l__CurrentCamera__1;
								v564.effects.ticks[1] = { v585, v104({ "general" }, "doom", nil, nil, nil, true) };
								if playerstats.Settings.MuteMusic == true then
									v564.effects.ticks[1][2].Volume = 0;
								end;
							elseif v564.mainstats.name == "Snared" then
								local v586 = l__game__6.ReplicatedStorage.effects.snare:Clone();
								v586.Parent = maingui;
								u10 = 0.001;
								u8.turnable = false;
								v564.effects.ticks[1] = v586;
							elseif v564.mainstats.name == "Tracking Beacon" then
								v564.effects.ticks[1] = tick();
							elseif v564.mainstats.name ~= "Damage Buff" then
								if v564.mainstats.name == "Unwaivered" then
									u18 = u18 + v564.mainstats.ints[1] / 100;
									u53 = u53 + 1.2;
								elseif v564.mainstats.name == "Artillerist Buff" then
									u60 = u60 + v564.mainstats.ints[2] / 100;
									u68 = u68 + v564.mainstats.ints[1] / 100;
								elseif v564.mainstats.name == "Defense Buff" then
									u17 = u17 + v564.mainstats.ints[1] / 100;
								elseif v564.mainstats.name == "Susceptible" then
									u17 = u17 - v564.mainstats.ints[1] / 100;
								elseif v564.mainstats.name == "Armoured" then
									u17 = u17 + v564.mainstats.ints[1];
								elseif v564.mainstats.name ~= "Speed Buff" then
									if v564.mainstats.name == "Silencer" then
										v564.effects.ticks[1] = 10 * v564.mainstats.ints[1] / 100;
										u19 = u19 + v564.effects.ticks[1];
										u43 = u43 + 1;
										u47 = u47 + 1;
										u60 = u60 + 1.5;
									elseif v564.mainstats.name == "Sprinting" then
										u19 = u19 + 10;
									elseif v564.mainstats.name == "Exhaustion" then
										u19 = u19 - 2.5;
									elseif v564.mainstats.name == "Exhausted" then
										u18 = u18 - v564.mainstats.ints[1];
									elseif v564.mainstats.name == "Respirator" then
										local v587 = l__game__6.ReplicatedStorage.misc.respOverlay:Clone();
										v587.Parent = maingui;
										v564.effects.ticks[1] = v587;
									elseif v564.mainstats.name == "Gas Mask" then
										local v588 = l__game__6.ReplicatedStorage.misc.gasmaskoverlay:Clone();
										v588.Parent = maingui;
										v564.effects.ticks[1] = v588;
									elseif v564.mainstats.name == "Koldera Buff" then
										local v589 = l__game__6.ReplicatedStorage.auxItems.buffermodel:Clone();
										v589.CFrame = l__CurrentCamera__1.CFrame;
										v589.Parent = l__CurrentCamera__1;
										local v590 = Instance.new("Motor6D");
										v590.Part0 = v589;
										v590.Part1 = cpart;
										v590.C1 = CFrame.new(0, -0.8, -0.7) * CFrame.Angles(0, 1.5707963267948966, 0);
										v590.Parent = v589;
										v564.effects.ticks[1] = v589;
										u18 = u18 + 0.1;
										u17 = u17 + 0.1;
										v564.effects.ticks[4] = 1;
										u19 = u19 + v564.effects.ticks[4];
										if not u9["Death Morale 1"] then
											if u9["Death Morale 2"] then
												u18 = u18 + 0.1;
												u17 = u17 + 0.1;
												v564.effects.ticks[3] = 1;
												u19 = u19 + v564.effects.ticks[3];
												v564.effects.ticks[2] = true;
											end;
										else
											u18 = u18 + 0.1;
											u17 = u17 + 0.1;
											v564.effects.ticks[3] = 1;
											u19 = u19 + v564.effects.ticks[3];
											v564.effects.ticks[2] = true;
										end;
										l__workspace__1.ServerStuff.quickDisplay:FireServer("add_buffer");
									elseif v564.mainstats.name == "Painkillers" then
										local v591 = l__game__6.ReplicatedStorage.effects.painkillers:Clone();
										v591.Parent = maingui;
										local v592 = l__game__6.ReplicatedStorage.misc.painkillersCC:Clone();
										v592.Parent = l__CurrentCamera__1;
										v564.effects.ticks[1] = v591;
										v564.effects.ticks[2] = v592;
										u17 = u17 + v564.mainstats.ints[1] / 100;
										maingui.HurtOverlay.Visible = false;
										maingui.HurtOverlayA.Visible = false;
										maingui.HurtOverlayB.Visible = false;
									elseif v564.mainstats.name == "Burning" then
										l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "burst", character.HumanoidRootPart);
										local v593 = l__game__6.ReplicatedStorage.effects.burnfx:Clone();
										v593.CFrame = l__CurrentCamera__1.CFrame;
										v593.Parent = l__CurrentCamera__1;
										local v594 = Instance.new("Motor6D");
										v594.Part0 = v593;
										v594.Part1 = cpart;
										v594.C1 = CFrame.new(0, 0, -0.6) * CFrame.Angles(0, 0, 0);
										v594.Parent = v593;
										local v595 = l__game__6.ReplicatedStorage.effects.fireCC:Clone();
										v595.Parent = l__CurrentCamera__1;
										v564.effects.ticks[1] = 0;
										v564.effects.ticks[2] = v593;
										v564.effects.ticks[3] = v595;
									elseif v564.mainstats.name == "Lazarus" then
										v104({ "perks" }, "laz_effect", nil, nil, true, true);
										local v596 = l__game__6.ReplicatedStorage.effects.lazarmfx:Clone();
										v596.Parent = fparms.RightArm.RLowerArm;
										local v597 = Instance.new("Weld");
										v597.Part0 = fparms.RightArm.RLowerArm;
										v597.Part1 = v596;
										v597.Parent = v596;
										local v598 = l__game__6.ReplicatedStorage.effects.lazarmfx:Clone();
										v598.Parent = fparms.RightArm.RUpperArm;
										local v599 = Instance.new("Weld");
										v599.Part0 = fparms.RightArm.RUpperArm;
										v599.Part1 = v598;
										v599.Parent = v598;
										local v600 = l__game__6.ReplicatedStorage.effects.lazarmfx:Clone();
										v600.Parent = fparms.LeftArm.LLowerArm;
										local v601 = Instance.new("Weld");
										v601.Part0 = fparms.LeftArm.LLowerArm;
										v601.Part1 = v600;
										v601.Parent = v600;
										local v602 = l__game__6.ReplicatedStorage.effects.lazarmfx:Clone();
										v602.Parent = fparms.LeftArm.LUpperArm;
										local v603 = Instance.new("Weld");
										v603.Part0 = fparms.LeftArm.LUpperArm;
										v603.Part1 = v602;
										v603.Parent = v602;
										v564.effects.ticks[1] = v596;
										v564.effects.ticks[2] = v598;
										v564.effects.ticks[3] = v600;
										v564.effects.ticks[4] = v602;
										v564.effects.ticks[5] = v104({ "perks" }, "laz_loop", nil, nil, nil, true);
										u18 = u18 + v564.mainstats.ints[1] / 100;
									elseif v564.mainstats.name == "Immolator Buff" then
										local v604 = l__game__6.ReplicatedStorage.effects.burnarm_fx:Clone();
										v604.Parent = fparms.RightArm.RLowerArm;
										local v605 = Instance.new("Weld");
										v605.Part0 = fparms.RightArm.RLowerArm;
										v605.Part1 = v604;
										v605.Parent = v604;
										local v606 = l__game__6.ReplicatedStorage.effects.burnarm_fx:Clone();
										v606.Parent = fparms.RightArm.RUpperArm;
										local v607 = Instance.new("Weld");
										v607.Part0 = fparms.RightArm.RUpperArm;
										v607.Part1 = v606;
										v607.Parent = v606;
										local v608 = l__game__6.ReplicatedStorage.effects.burnarm_fx:Clone();
										v608.Parent = fparms.LeftArm.LLowerArm;
										local v609 = Instance.new("Weld");
										v609.Part0 = fparms.LeftArm.LLowerArm;
										v609.Part1 = v608;
										v609.Parent = v608;
										local v610 = l__game__6.ReplicatedStorage.effects.burnarm_fx:Clone();
										v610.Parent = fparms.LeftArm.LUpperArm;
										local v611 = Instance.new("Weld");
										v611.Part0 = fparms.LeftArm.LUpperArm;
										v611.Part1 = v610;
										v611.Parent = v610;
										v564.effects.ticks[1] = v604;
										v564.effects.ticks[2] = v606;
										v564.effects.ticks[3] = v608;
										v564.effects.ticks[4] = v610;
									end;
								else
									v564.effects.ticks[1] = 10 * v564.mainstats.ints[1] / 100;
									u19 = u19 + v564.effects.ticks[1];
									u43 = u43 + 1;
									u47 = u47 + 1;
									u60 = u60 + 1.5;
								end;
							else
								u18 = u18 + v564.mainstats.ints[1] / 100;
								u53 = u53 + 1.2;
							end;
						else
							if v564.mainstats.name == "Toxins" then
								v579 = l__game__6.ReplicatedStorage.effects.sickcc:Clone();
							else
								v579 = l__game__6.ReplicatedStorage.effects.punjicc:Clone();
							end;
							v579.Parent = l__CurrentCamera__1;
							v580 = Instance.new("BlurEffect");
							v580.Size = 0;
							v580.Parent = l__CurrentCamera__1;
							v564.effects.ticks[1] = { v579, v580, tick() };
							if v564.mainstats.name == "Sickness" then
								spawn(function()
									createfxoutline("sickParticle", v564.mainstats.dur);
								end);
							end;
							if v564.mainstats.name == "Toxins" then
								agent_speak("stormenter");
								v581 = l__game__6.ReplicatedStorage.effects.stormfx_overlay:Clone();
								v581.CFrame = l__CurrentCamera__1.CFrame;
								v581.Parent = l__CurrentCamera__1;
								v582 = Instance.new("Motor6D");
								v582.Part0 = v581;
								v582.Part1 = cpart;
								v582.C1 = CFrame.new(0, 0, -0.4) * CFrame.Angles(0, 0, 0);
								v582.Parent = v581;
								v564.effects.ticks[2] = v581;
								v564.effects.ticks[3] = tick();
							end;
						end;
					else
						v564.effects.ticks[1] = tick();
						if v564.mainstats.name == "Fracture" then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "fracture", character.HumanoidRootPart);
						elseif v564.mainstats.name == "Cripple" then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "cripple", character.HumanoidRootPart);
						elseif v564.mainstats.name == "Bleed" then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "bleed", character.HumanoidRootPart);
						end;
					end;
				else
					v564.effects.ticks[1] = tick();
					if v564.mainstats.name == "Fracture" then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "fracture", character.HumanoidRootPart);
					elseif v564.mainstats.name == "Cripple" then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "cripple", character.HumanoidRootPart);
					elseif v564.mainstats.name == "Bleed" then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "bleed", character.HumanoidRootPart);
					end;
				end;
			else
				v564.effects.ticks[1] = tick();
				if v564.mainstats.name == "Fracture" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "fracture", character.HumanoidRootPart);
				elseif v564.mainstats.name == "Cripple" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "cripple", character.HumanoidRootPart);
				elseif v564.mainstats.name == "Bleed" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "bleed", character.HumanoidRootPart);
				end;
			end;
		else
			v564.effects.ticks[1] = tick();
			if v564.mainstats.name == "Fracture" then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "fracture", character.HumanoidRootPart);
			elseif v564.mainstats.name == "Cripple" then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "cripple", character.HumanoidRootPart);
			elseif v564.mainstats.name == "Bleed" then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "bleed", character.HumanoidRootPart);
			end;
		end;
		if v564.mainstats.name ~= "Virus Stage 2" then
			if v564.mainstats.name ~= "Virus Stage 3" then
				if v564.mainstats.name == "Virus Stage 4" then
					v564.effects.ticks[1] = 10 * v564.mainstats.ints[1] / 100;
					u19 = u19 - v564.effects.ticks[1];
					if v564.mainstats.name ~= "Virus Stage 2" then
						u17 = u17 - v564.mainstats.ints[2] / 100;
					end;
					l__workspace__1.ServerStuff.dealDamage:FireServer("virusmaxhealth", v564.mainstats.name, v5, v4);
					if v564.mainstats.name == "Virus Stage 4" then
						v564.effects.ticks[2] = tick();
					end;
				end;
			else
				v564.effects.ticks[1] = 10 * v564.mainstats.ints[1] / 100;
				u19 = u19 - v564.effects.ticks[1];
				if v564.mainstats.name ~= "Virus Stage 2" then
					u17 = u17 - v564.mainstats.ints[2] / 100;
				end;
				l__workspace__1.ServerStuff.dealDamage:FireServer("virusmaxhealth", v564.mainstats.name, v5, v4);
				if v564.mainstats.name == "Virus Stage 4" then
					v564.effects.ticks[2] = tick();
				end;
			end;
		else
			v564.effects.ticks[1] = 10 * v564.mainstats.ints[1] / 100;
			u19 = u19 - v564.effects.ticks[1];
			if v564.mainstats.name ~= "Virus Stage 2" then
				u17 = u17 - v564.mainstats.ints[2] / 100;
			end;
			l__workspace__1.ServerStuff.dealDamage:FireServer("virusmaxhealth", v564.mainstats.name, v5, v4);
			if v564.mainstats.name == "Virus Stage 4" then
				v564.effects.ticks[2] = tick();
			end;
		end;
		if v564.mainstats.name ~= "Death Morale 1" then
			if v564.mainstats.name ~= "Death Morale 2" then
				if v564.mainstats.name ~= "Death Morale 3" then
					if v564.mainstats.name == "Death Morale 4" then
						u18 = u18 - v564.mainstats.ints[1] / 100;
						u17 = u17 - v564.mainstats.ints[2] / 100;
						u19 = u19 - 10 * v564.mainstats.ints[3] / 100;
						local v612 = l__game__6.ReplicatedStorage.effects.moralevignette:Clone();
						v612.Parent = maingui;
						v564.effects.ticks[1] = v612;
					end;
				else
					u18 = u18 - v564.mainstats.ints[1] / 100;
					u17 = u17 - v564.mainstats.ints[2] / 100;
					u19 = u19 - 10 * v564.mainstats.ints[3] / 100;
					v612 = l__game__6.ReplicatedStorage.effects.moralevignette:Clone();
					v612.Parent = maingui;
					v564.effects.ticks[1] = v612;
				end;
			else
				u18 = u18 - v564.mainstats.ints[1] / 100;
				u17 = u17 - v564.mainstats.ints[2] / 100;
				u19 = u19 - 10 * v564.mainstats.ints[3] / 100;
				v612 = l__game__6.ReplicatedStorage.effects.moralevignette:Clone();
				v612.Parent = maingui;
				v564.effects.ticks[1] = v612;
			end;
		else
			u18 = u18 - v564.mainstats.ints[1] / 100;
			u17 = u17 - v564.mainstats.ints[2] / 100;
			u19 = u19 - 10 * v564.mainstats.ints[3] / 100;
			v612 = l__game__6.ReplicatedStorage.effects.moralevignette:Clone();
			v612.Parent = maingui;
			v564.effects.ticks[1] = v612;
		end;
		v564.effects.currentloop = RS:connect(function()
			if v564.mainstats.name == "Cripple" then
				u81 = 1 - 1 * v564.mainstats.ints[v564.mainstats.intensity] / 100;
			elseif v564.mainstats.name == "Bleed" then
				if v564.mainstats.ints[v564.mainstats.intensity] < tick() - v564.effects.ticks[1] then
					if l__workspace__1.ServerStuff.game.disableInteraction.Value == false then
						if u9.Painkillers == nil then
							if 1 < hum.Health then
								v564.effects.ticks[1] = tick();
								l__workspace__1.ServerStuff.dealDamage:FireServer("bleed", nil, v5, v4);
								l__workspace__1.ServerStuff.applyGore:FireServer("bleed", character, nil, { 1, nil });
								if u9["Arterial Bleed"] then
									local v613 = l__game__6.ReplicatedStorage.effects.blood_drop:Clone();
									v613.Position = UDim2.new(math.random(15, 95) / 100, 0, math.random(15, 95) / 100, 0);
									v613.Rotation = math.random(0, 360);
									v613.Parent = maingui;
									spawn(function()
										while true do
											v613.ImageTransparency = v613.ImageTransparency + 0.01;
											RS:wait();
											if not (1 <= v613.ImageTransparency) then

											else
												break;
											end;										
										end;
										v613:Destroy();
									end);
								end;
							end;
						end;
					end;
				end;
			elseif v564.mainstats.name == "Fracture" then
				if 0.1 < tick() - v564.effects.ticks[1] then
					v564.effects.ticks[1] = tick();
					u82 = CFrame.new(math.random(-10, 10) / 1000, math.random(-10, 10) / 1000, math.random(-10, 10) / 1000);
				end;
			elseif v564.mainstats.name == "Speed Buff" then
				sprint_stam = 100;
				if u9.Exhaustion then
					u9.Exhaustion.effects.currentduration = 0;
				end;
			elseif v564.mainstats.name == "Sprinting" then
				if u9.Sprinting then
					if u8.sprinting == false then
						u9.Sprinting.effects.currentduration = 0;
					end;
				end;
			elseif v564.mainstats.name == "Exhaustion" then
				if u9["Speed Buff"] == nil then
					sprint_stam = 0;
				end;
			elseif v564.mainstats.name == "Arterial Bleed" then
				if v564.mainstats.ints[1] < tick() - v564.effects.ticks[1] then
					if l__workspace__1.ServerStuff.game.disableInteraction.Value == false then
						if u9.Painkillers == nil then
							v564.effects.ticks[1] = tick();
							l__workspace__1.ServerStuff.dealDamage:FireServer("bleed", nil, v5, v4);
							l__workspace__1.ServerStuff.applyGore:FireServer("bleed", character, nil, { 1, nil });
							local v614 = l__game__6.ReplicatedStorage.effects.blood_drop:Clone();
							v614.Position = UDim2.new(math.random(15, 95) / 100, 0, math.random(15, 95) / 100, 0);
							v614.Rotation = math.random(0, 360);
							v614.Parent = maingui;
							spawn(function()
								while true do
									v614.ImageTransparency = v614.ImageTransparency + 0.01;
									RS:wait();
									if not (1 <= v614.ImageTransparency) then

									else
										break;
									end;								
								end;
								v614:Destroy();
							end);
						end;
					end;
				end;
				if u9["Bleed Prevention"] == nil then
					local l__Bld__615 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Bld;
					l__Bld__615.intensity = 4;
					afflictstatus(l__Bld__615);
				end;
			elseif v564.mainstats.name == "Burning" then
				if u9["Immolator Buff"] == nil then
					if v61 == false then
						u11.regentick = tick();
						if v564.mainstats.ints[1] < tick() - v564.effects.ticks[1] then
							v564.effects.ticks[1] = tick();
							l__workspace__1.ServerStuff.dealDamage:FireServer("burning", nil, v5, v4);
						end;
					end;
				end;
			elseif v564.mainstats.name == "Immolator Buff" then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Brn);
				if u9.Burning then
					u9.Burning.effects.ticks[1] = tick();
				end;
			elseif v564.mainstats.name == "Bottle Buff" then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Pnk);
			elseif v564.mainstats.name == "Lazarus" then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Pnk);
			elseif v564.mainstats.name == "Toxins" then
				if v564.mainstats.ints[2] < tick() - v564.effects.ticks[1][3] then
					if 0 < hum.Health then
						v564.effects.ticks[1][3] = tick();
						if u9.Respirator == nil then
							if u9["Gas Mask"] == nil then
								l__workspace__1.ServerStuff.dealDamage:FireServer("toxicated", nil, v5, v4);
							end;
						end;
						if 30 <= tick() - v564.effects.ticks[3] then
							l__workspace__1.ServerStuff.dealDamage:FireServer("toxicdead", nil, v5, v4);
						end;
					end;
				end;
			elseif v564.mainstats.name == "Regeneration" then
				if 1 < tick() - v564.effects.ticks[1] then
					if hum.Health < hum.MaxHealth then
						v564.effects.ticks[1] = tick();
						if u9.Toxins == nil then
							l__workspace__1.ServerStuff.dealDamage:FireServer(v564.mainstats.name, nil, v5, v4);
						end;
					end;
				end;
			elseif v564.mainstats.name == "Stamina Buff" then
				if 0.5 < tick() - u11.stamregen then
					u7 = v66;
					u22("stamina");
				end;
			elseif v564.mainstats.name == "Tracking Beacon" then
				if u8.walking == false then
					if v564.mainstats.ints[1] <= tick() - v564.effects.ticks[1] then
						v564.effects.currentduration = 0;
					end;
				else
					v564.effects.ticks[1] = tick();
				end;
			elseif v564.mainstats.name == "Blindness" then
				v564.effects.ticks[1].BackgroundTransparency = (tick() - v564.effects.currentduration) / 2 / v564.effects.maxduration;
			elseif v564.mainstats.name == "Bleed Prevention" then
				if u9.Bleed then
					u9.Bleed.effects.currentduration = 0;
				end;
			elseif v564.mainstats.name == "Cripple Prevention" then
				if u9.Cripple then
					u9.Cripple.effects.currentduration = 0;
				end;
				if u9.Fracture then
					u9.Fracture.effects.currentduration = 0;
				end;
			elseif v564.mainstats.name == "Virus Stage 4" then
				if v564.mainstats.ints[4] <= tick() - v564.effects.ticks[2] then
					v564.effects.ticks[2] = tick();
					afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
				end;
			elseif v564.mainstats.name == "Painkillers" then
				v564.effects.ticks[1].ImageTransparency = v564.effects.ticks[1].ImageTransparency + (math.cos(time() * 2) * 0.5 - v564.effects.ticks[1].ImageTransparency) * 0.025 + 0.1;
			elseif v564.mainstats.name ~= "Sickness" then
				if v564.mainstats.name ~= "Toxins" then
					if v564.mainstats.name == "Tinnitus" then
						v564.effects.ticks[1][2].Size = math.sin(time() * 3) * 5 + 8;
					elseif v564.mainstats.name == "Silencer" then
						if u9.Cripple then
							u9.Cripple.effects.currentduration = 0;
						end;
						if u9.Bleed then
							u9.Bleed.effects.currentduration = 0;
						end;
					end;
				else
					v564.effects.ticks[1][2].Size = math.sin(time() * 3) * 5 + 8;
				end;
			else
				v564.effects.ticks[1][2].Size = math.sin(time() * 3) * 5 + 8;
			end;
			v564.effects.currentgui.EmptyBar.Bar.Size = UDim2.new((v564.effects.maxduration - (tick() - v564.effects.currentduration)) / v564.effects.maxduration, 0, 1, 0);
			if v564.effects.maxduration < tick() - v564.effects.currentduration then
				v564.effects.currentloop:Disconnect();
				v564.effects.currentgui:Destroy();
				if v564.mainstats.name == "Cripple" then
					u81 = 1;
				end;
				if v564.mainstats.name ~= "Damage Buff" then
					if v564.mainstats.name == "Unwaivered" then
						u18 = u18 - v564.mainstats.ints[1] / 100;
						afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
						u53 = u53 - 1.2;
					elseif v564.mainstats.name == "Defense Buff" then
						u17 = u17 - v564.mainstats.ints[1] / 100;
						afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
					elseif v564.mainstats.name == "Susceptible" then
						u17 = u17 + v564.mainstats.ints[1] / 100;
					elseif v564.mainstats.name == "Armoured" then
						u17 = u17 - v564.mainstats.ints[1];
						l__workspace__1.ServerStuff.dealDamage:FireServer("removearmour", nil, v5, v4);
					elseif v564.mainstats.name ~= "Speed Buff" then
						if v564.mainstats.name == "Silencer" then
							u19 = u19 - v564.effects.ticks[1];
							afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
							u43 = u43 - 1;
							u47 = u47 - 1;
							u60 = u60 - 1.5;
						elseif v564.mainstats.name == "Sprinting" then
							u19 = u19 - 10;
						elseif v564.mainstats.name ~= "Death Morale 1" then
							if v564.mainstats.name ~= "Death Morale 2" then
								if v564.mainstats.name ~= "Death Morale 3" then
									if v564.mainstats.name == "Death Morale 4" then
										u18 = u18 + v564.mainstats.ints[1] / 100;
										u17 = u17 + v564.mainstats.ints[2] / 100;
										u19 = u19 + 10 * v564.mainstats.ints[3] / 100;
										v564.effects.ticks[1]:Destroy();
									elseif v564.mainstats.name == "Stamina Buff" then
										afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
									elseif v564.mainstats.name == "Respirator" then
										tpglobalanimsets.aux_resp_off:Play(0.1);
										v104({ "aux" }, "resp_remove", nil, nil, true, true);
										v564.effects.ticks[1]:Destroy();
										globalanimsets.aux_resp_remove:Play(0.1, 1, 1);
									elseif v564.mainstats.name == "Gas Mask" then
										v564.effects.ticks[1]:Destroy();
									elseif v564.mainstats.name == "Koldera Buff" then
										l__workspace__1.ServerStuff.quickDisplay:FireServer("remove_buffer");
										tpglobalanimsets.aux_resp_off:Play(0.1);
										v564.effects.ticks[1]:Destroy();
										globalanimsets.aux_resp_remove:Play(0.1, 1, 1);
										u18 = u18 - 0.1;
										u17 = u17 - 0.1;
										u19 = u19 - v564.effects.ticks[4];
										if v564.effects.ticks[2] == true then
											u18 = u18 - 0.1;
											u17 = u17 - 0.1;
											u19 = u19 - v564.effects.ticks[3];
										end;
									elseif v564.mainstats.name == "Burning" then
										l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "extinguish", character.HumanoidRootPart);
										l__workspace__1.ServerStuff.dealDamage:FireServer("burningstop", nil, v5, v4);
										if v564.effects.ticks[2] then
											if v564.effects.ticks[2]:FindFirstChild("outline1") then
												l__Debris__32:AddItem(v564.effects.ticks[2], 5);
												local v616, v617, v618 = ipairs(v564.effects.ticks[2].outline1:GetChildren());
												while true do
													local v619, v620 = v616(v617, v618);
													if v619 then

													else
														break;
													end;
													v618 = v619;
													v620.Enabled = false;												
												end;
											end;
										end;
										v564.effects.ticks[3]:Destroy();
									elseif v564.mainstats.name == "Blindness" then
										v564.effects.ticks[1]:Destroy();
									elseif v564.mainstats.name == "Cloaked" then
										if v564.effects.ticks[1] then
											local v621, v622, v623 = ipairs(v564.effects.ticks[1]:GetDescendants());
											while true do
												local v624, v625 = v621(v622, v623);
												if v624 then

												else
													break;
												end;
												v623 = v624;
												if v625:IsA("ParticleEmitter") then
													v625.Enabled = false;
												end;											
											end;
											l__Debris__32:AddItem(v564.effects.ticks[1], 3);
										end;
										if v564.effects.ticks[2] then
											v564.effects.ticks[2]:Destroy();
										end;
										l__workspace__1.ServerStuff.applyGore:FireServer("drifter_puff", character, nil, character.Torso.CFrame);
										l__workspace__1.ServerStuff.applyGore:FireServer("drifter_end", character, nil);
										l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "drift_cloak2", character.HumanoidRootPart);
									elseif v564.mainstats.name == "Exhausted" then
										u18 = u18 + v564.mainstats.ints[1];
									elseif v564.mainstats.name == "Exhaustion" then
										sprint_stam = 10;
										u19 = u19 + 2.5;
									elseif v564.mainstats.name == "Artillerist Buff" then
										u60 = u60 - v564.mainstats.ints[2] / 100;
										u68 = u68 - v564.mainstats.ints[1] / 100;
									elseif v564.mainstats.name ~= "Sickness" then
										if v564.mainstats.name == "Toxins" then
											v564.effects.ticks[1][1]:Destroy();
											v564.effects.ticks[1][2]:Destroy();
											if v564.mainstats.name == "Sickness" then
												afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Vcd);
											else
												v564.effects.ticks[2]:Destroy();
												agent_speak("stormleave");
											end;
										elseif v564.mainstats.name ~= "Berserk" then
											if v564.mainstats.name == "Tinnitus" then
												v564.effects.ticks[1][1]:Destroy();
												v564.effects.ticks[1][2]:Destroy();
												l__game__6:GetService("SoundService").regular.Volume = 1;
											elseif v564.mainstats.name == "Tracking Beacon" then
												l__workspace__1.ServerStuff.dealDamage:FireServer("removealarm", nil, v5, v4);
											elseif v564.mainstats.name == "Showdown" then
												if u32.nowinshowdown == true then
													l__workspace__1.ServerStuff.callEvent:FireServer();
												end;
											elseif v564.mainstats.name == "Fracture" then
												u82 = CFrame.new(0, 0, 0);
											elseif v564.mainstats.name == "Painkillers" then
												v564.effects.ticks[1]:Destroy();
												v564.effects.ticks[2]:Destroy();
												maingui.HurtOverlay.Visible = true;
												maingui.HurtOverlayA.Visible = true;
												maingui.HurtOverlayB.Visible = true;
												v104({ "weapons", "Item" }, "adrenal", nil, nil, true, true);
												u17 = u17 - v564.mainstats.ints[1] / 100;
											elseif v564.mainstats.name == "Lazarus" then
												v564.effects.ticks[1]:Destroy();
												v564.effects.ticks[2]:Destroy();
												v564.effects.ticks[3]:Destroy();
												v564.effects.ticks[4]:Destroy();
												v564.effects.ticks[5]:Destroy();
												u18 = u18 - v564.mainstats.ints[1] / 100;
												if u9.Painkillers then
													u9.Painkillers.effects.currentduration = 0;
												end;
											elseif v564.mainstats.name == "Bottle Buff" then
												if u9.Tinnitus then
													u9.Tinnitus.effects.currentduration = 0;
												end;
												if u9.Painkillers then
													u9.Painkillers.effects.currentduration = 0;
												end;
											elseif v564.mainstats.name == "Immolator Buff" then
												if u9.Burning then
													u9.Burning.effects.currentduration = 0;
												end;
												v564.effects.ticks[1]:Destroy();
												v564.effects.ticks[2]:Destroy();
												v564.effects.ticks[3]:Destroy();
												v564.effects.ticks[4]:Destroy();
											elseif v564.mainstats.name == "Snared" then
												if u8.staggering == false then
													if u8.channel == false then
														u10 = 10;
														u8.turnable = true;
														v564.effects.ticks[1]:Destroy();
													end;
												end;
											end;
										else
											v564.effects.ticks[1][1]:Destroy();
											v564.effects.ticks[1][2]:Destroy();
											l__game__6:GetService("SoundService").regular.Volume = 1;
										end;
									else
										v564.effects.ticks[1][1]:Destroy();
										v564.effects.ticks[1][2]:Destroy();
										if v564.mainstats.name == "Sickness" then
											afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Vcd);
										else
											v564.effects.ticks[2]:Destroy();
											agent_speak("stormleave");
										end;
									end;
								else
									u18 = u18 + v564.mainstats.ints[1] / 100;
									u17 = u17 + v564.mainstats.ints[2] / 100;
									u19 = u19 + 10 * v564.mainstats.ints[3] / 100;
									v564.effects.ticks[1]:Destroy();
								end;
							else
								u18 = u18 + v564.mainstats.ints[1] / 100;
								u17 = u17 + v564.mainstats.ints[2] / 100;
								u19 = u19 + 10 * v564.mainstats.ints[3] / 100;
								v564.effects.ticks[1]:Destroy();
							end;
						else
							u18 = u18 + v564.mainstats.ints[1] / 100;
							u17 = u17 + v564.mainstats.ints[2] / 100;
							u19 = u19 + 10 * v564.mainstats.ints[3] / 100;
							v564.effects.ticks[1]:Destroy();
						end;
					else
						u19 = u19 - v564.effects.ticks[1];
						afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
						u43 = u43 - 1;
						u47 = u47 - 1;
						u60 = u60 - 1.5;
					end;
				else
					u18 = u18 - v564.mainstats.ints[1] / 100;
					afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
					u53 = u53 - 1.2;
				end;
				if v564.mainstats.name == "Virus Stage 1" then
					afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).VirusB);
					u83(2);
				elseif v564.mainstats.name == "Virus Stage 2" then
					afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).VirusC);
					u83(3);
					u19 = u19 + v564.effects.ticks[1];
				elseif v564.mainstats.name == "Virus Stage 3" then
					afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).VirusD);
					u83(4);
					u19 = u19 + v564.effects.ticks[1];
					u17 = u17 + v564.mainstats.ints[2] / 100;
				elseif v564.mainstats.name == "Virus Stage 4" then
					l__workspace__1.ServerStuff.dealDamage:FireServer("sepsis", nil, v5, v4);
				end;
				u9[v564.mainstats.name] = nil;
				u85();
			end;
		end);
		u9[v564.mainstats.name] = v564;
		u85();
	end;
end;
l__workspace__1.ServerStuff.flinchTarget.OnClientEvent:Connect(function(p72, p73, p74, p75)
	if p72 == character.Torso or p72:FindFirstChild("RootJoint") == nil then
		return;
	end;
	local v626 = math.clamp(p75 * 2, 3, 35);
	if p74 > 80 then
		v626 = -v626;
	end;
	if p74 > 80 then
		p74 = 0;
	end;
	p74 = math.clamp(p74, -40, 40);
	for v627 = 1, 60 do
		if p72:FindFirstChild("Left Hip") == nil then
			break;
		end;
		if v627 < 5 then
			p73.RootJoint.C0 = p73.RootJoint.C0:lerp(CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0) * CFrame.Angles(math.rad(-v626), 0, 0) * CFrame.Angles(0, 0, math.rad(p74)), 0.5);
			p72["Right Hip"].C0 = p72["Right Hip"].C0:lerp(CFrame.new(1, -1, 0, -4.37113883E-08, 0, 1, -0, 0.99999994, 0, -1, 0, -4.37113883E-08) * CFrame.Angles(0, math.rad(-p74), 0) * CFrame.Angles(0, 0, math.rad(-v626)), 0.5);
			p72["Left Hip"].C0 = p72["Left Hip"].C0:lerp(CFrame.new(-1, -1, 0, -4.37113883E-08, 0, -1, 0, 0.99999994, 0, 1, 0, -4.37113883E-08) * CFrame.Angles(0, math.rad(p74), 0) * CFrame.Angles(0, 0, math.rad(v626)), 0.5);
		else
			p73.RootJoint.C0 = p73.RootJoint.C0:lerp(CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0) * CFrame.Angles(0, 0, 0), 0.075);
			p72["Right Hip"].C0 = p72["Right Hip"].C0:lerp(CFrame.new(1, -1, 0, -4.37113883E-08, 0, 1, -0, 0.99999994, 0, -1, 0, -4.37113883E-08) * CFrame.Angles(0, 0, 0), 0.075);
			p72["Left Hip"].C0 = p72["Left Hip"].C0:lerp(CFrame.new(-1, -1, 0, -4.37113883E-08, 0, -1, 0, 0.99999994, 0, 1, 0, -4.37113883E-08) * CFrame.Angles(0, 0, 0), 0.075);
		end;
		RS:wait();
	end;
end);
clotting = 0;
clottingwound = nil;
hiddeneyescooldown = tick();
shadowForm = false;
function shadowrespawnflash()
	if shadowForm == false then
		return;
	end;
	v104({ "gamemode" }, "shadowchosen", nil, nil, true, true);
	local v628 = Instance.new("Frame");
	v628.BorderSizePixel = 0;
	v628.BackgroundColor3 = Color3.new(0.9, 0, 0);
	v628.Size = UDim2.new(1, 0, 1, 0);
	v628.ZIndex = 100;
	v628.Parent = maingui;
	while true do
		v628.BackgroundTransparency = v628.BackgroundTransparency + 0.025;
		RS:wait();
		if not (1 <= v628.BackgroundTransparency) then

		else
			break;
		end;	
	end;
	v628:Destroy();
end;
local u86 = false;
local function u87(p76, p77, p78)
	local l__clientmusic__629 = l__workspace__1.clientmusic;
	while true do
		l__clientmusic__629.Volume = l__clientmusic__629.Volume - 0.05;
		RS:wait();
		if l__clientmusic__629.Volume <= 0 then
			break;
		end;	
	end;
	l__clientmusic__629:Stop();
	if playerstats.Settings.MuteMusic == true and p77 == nil then
		return;
	end;
	l__clientmusic__629.SoundId = p76;
	l__clientmusic__629:Play();
	local v630 = 0.5;
	if p78 then
		v630 = p78;
	end;
	while true do
		l__clientmusic__629.Volume = l__clientmusic__629.Volume + 0.05;
		RS:wait();
		if v630 <= l__clientmusic__629.Volume then
			break;
		end;	
	end;
	l__clientmusic__629.Volume = v630;
end;
local u88 = 0;
l__workspace__1.ServerStuff.handleClientAudio.OnClientEvent:Connect(function(p79, p80, p81)
	if p79 == "music" then
		if p80 ~= "roam" then
			if p80 == "combat" then
				if l__workspace__1.ServerStuff.game.holdout.Value == true then
					local v631 = l__game__6.ReplicatedStorage.soundLibrary.songs:FindFirstChild("holdout_fight" .. math.random(1, 4));
					u87(v631.SoundId, nil, v631.Volume);
					return;
				else
					u87(l__game__6.ReplicatedStorage.soundLibrary.songs:FindFirstChild("fight" .. math.random(1, 4)).SoundId, nil, 0.8);
					return;
				end;
			elseif p80 == "boss" then
				u87(l__game__6.ReplicatedStorage.soundLibrary.songs.scavfinal.SoundId, nil, 2);
				return;
			elseif string.sub(p80, 1, 8) == "holdout_" then
				local v632 = l__game__6.ReplicatedStorage.soundLibrary.songs.holdout_bosses:FindFirstChild(string.sub(p80, 9, 100));
				u87(v632.SoundId, nil, v632.Volume);
				return;
			elseif p80 == "ultima" then
				u87(l__game__6.ReplicatedStorage.soundLibrary.songs.final.SoundId, true, 1.5);
				return;
			else
				return;
			end;
		end;
	elseif p79 == "player_morale" then
		v104({ "general" }, "deathwhisper", nil, nil, true, true);
		agent_speak("down", true);
		if v64[1] == "shadow" then
			u88 = 0;
		end;
		if v65 == true then
			return;
		else
			u86 = true;
			if u9["Death Morale 4"] ~= nil then
				return;
			elseif u9["Death Morale 3"] ~= nil and l__workspace__1.ServerStuff.game.holdout.Value == false then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).DMoraleD);
				return;
			elseif u9["Death Morale 2"] ~= nil and l__workspace__1.ServerStuff.game.holdout.Value == false then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).DMoraleC);
				return;
			elseif u9["Death Morale 1"] ~= nil then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).DMoraleB);
				return;
			else
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).DMoraleA);
				return;
			end;
		end;
	elseif p79 == "maskup" then
		v104({ "aux" }, "resp_equip", nil, nil, true, true);
		local v633 = l__game__6.ReplicatedStorage.auxItems:FindFirstChild("mask"):Clone();
		l__Debris__32:AddItem(v633, 2);
		v633.Parent = l__CurrentCamera__1;
		local v634 = Instance.new("Motor6D");
		v634.Part0 = fparms.LeftArm.LUpperArm;
		v634.Part1 = v633;
		v634.Parent = v633;
		v634.Parent = l__CurrentCamera__1;
		globalanimsets.gasmask:Play(0, 1, 0.75);
		delay(0.7, function()
			tpglobalanimsets.aux_resp:Play(0.1);
			l__workspace__1.ServerStuff.quickDisplay:FireServer("maskup");
			afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).GasM);
			v633:Destroy();
			l__workspace__1.ServerStuff.playAudio:FireServer({ "status_fx" }, "mask", character.HumanoidRootPart, 0);
		end);
		return;
	elseif p79 == "nomusic" then
		u87("", nil, 0);
		return;
	else
		if p79 == "signal" then
			u87("rbxassetid://9852972796", true, 1);
			delay(40, function()
				v104({ "machinery", "parts" }, "start", l__workspace__1.InteractablesNoDel.EscapeShip.screen, nil, true, true);
			end);
			delay(80, function()
				v104({ "machinery", "parts" }, "mech1", l__workspace__1.InteractablesNoDel.EscapeShip.screen, nil, true, true);
			end);
			delay(120, function()
				v104({ "machinery", "parts" }, "mech2", l__workspace__1.InteractablesNoDel.EscapeShip.screen, nil, true, true);
			end);
			delay(160, function()
				v104({ "machinery", "parts" }, "mech3", l__workspace__1.InteractablesNoDel.EscapeShip.screen, nil, true, true);
			end);
			delay(200, function()
				v104({ "machinery", "parts" }, "mech4", l__workspace__1.InteractablesNoDel.EscapeShip.screen, nil, true, true);
			end);
			delay(240, function()
				v104({ "machinery", "parts" }, "mech5", l__workspace__1.InteractablesNoDel.EscapeShip.screen, nil, true, true);
			end);
			delay(280, function()
				v104({ "machinery", "parts" }, "mech6", l__workspace__1.InteractablesNoDel.EscapeShip.screen, nil, true, true);
			end);
			delay(317, function()
				v104({ "machinery", "parts" }, "end", l__workspace__1.InteractablesNoDel.EscapeShip.screen, nil, true, true);
			end);
			delay(321, function()
				u10 = 0;
				u8.poking = true;
				u8.staggering = true;
				u8.action = true;
				character.Torso.Anchored = true;
				v104({ "events" }, "shiparrive", nil, nil, true, true);
				v104({ "events" }, "shiparrive2", nil, nil, true, true);
				local v635 = l__game__6.ReplicatedStorage.misc.otherMenu:Clone();
				v635.Parent = ply.PlayerGui;
				character.Torso.CFrame = l__workspace__1.SpawnBox.mid.CFrame * CFrame.new(math.random(-10, 10), 0, math.random(-10, 10));
				delay(10, function()
					u87("rbxassetid://9853127974", true, 1);
					delay(5, function()
						local v636 = tick();
						while true do
							if tick() - v636 >= 0.03 then
								v636 = tick();
								v635.frame.Position = v635.frame.Position - UDim2.new(0, 0, 0.0015, 0);
							end;
							RS:wait();
							if v635.frame.Position.Y.Scale <= -7 then
								break;
							end;						
						end;
					end);
				end);
			end);
		end;
		return;
	end;
	if u9.Toxins then
		u9.Toxins.effects.currentduration = 0;
	end;
	if l__workspace__1.ServerStuff.game.holdout.Value == false and l__workspace__1.ServerStuff.game.raidboss.Value == false then
		maingui.TabMenu.bg.map.Image = "rbxassetid://6539803556";
	end;
	if u86 == true then
		u86 = false;
	else
		if u9["Death Morale 1"] then
			u9["Death Morale 1"].effects.currentduration = 0;
		end;
		if u9["Death Morale 2"] then
			u9["Death Morale 2"].effects.currentduration = 0;
		end;
		if u9["Death Morale 3"] then
			u9["Death Morale 3"].effects.currentduration = 0;
		end;
		if u9["Death Morale 4"] then
			u9["Death Morale 4"].effects.currentduration = 0;
		end;
	end;
	if all_aux[aux_name] then
		current_aux = all_aux[aux_name];
		aux_usage = current_aux.use_per_night;
	end;
	for v637, v638 in ipairs(maingui.UpperLower.auxcount:GetChildren()) do
		if v638.Name ~= "ex" then
			if tonumber(string.sub(v638.Name, 4, 6)) <= aux_usage then
				v638.inner.Visible = true;
			else
				v638.inner.Visible = false;
			end;
			if aux_usage == 0 then
				v638.inner.Visible = false;
			end;
		end;
	end;
	commendedplayer = {};
	commendedcount = 2;
	if p81 and p81 == "scavwar" then
		u87(l__game__6.ReplicatedStorage.soundLibrary.songs.scavwar.SoundId, nil, 1.2);
		return;
	end;
	if l__workspace__1.ServerStuff.game.holdout.Value ~= true then
		u87(l__game__6.ReplicatedStorage.soundLibrary.songs:FindFirstChild("roam" .. math.random(1, 4)).SoundId);
		return;
	end;
	local v639 = l__game__6.ReplicatedStorage.soundLibrary.songs:FindFirstChild("holdout_roam" .. math.random(1, 4));
	u87(v639.SoundId, nil, v639.Volume);
end);
alertplaytimer = 0;
alertplay = nil;
local u89 = nil;
function convertToShadow()
	if shadowForm == true then
		return;
	end;
	teamfolder = character.Parent;
	spawn(shadowrespawnflash);
	playerperks = {};
	perksactive = {};
	u18 = u18 + 1.7;
	nametag = "Reikgon's Shadow";
	spawn(function()
		alertplay("YOUR SOUL BELONGS TO REIKGON");
		delay(3, function()
			alertplay("REAP THEIR SOULS FOR REIKGON");
		end);
	end);
	spawn(function()
		local v640, v641, v642 = pairs(u9);
		while true do
			local v643, v644 = v640(v641, v642);
			if v643 then

			else
				break;
			end;
			v642 = v643;
			v644.effects.currentduration = 0;		
		end;
	end);
	v104({ "gamemode" }, "shadowidle", nil, nil, nil, true).Looped = true;
	l__game__6.ReplicatedStorage.effects.hiddenlight:Clone().Parent = character.Head;
	if character:FindFirstChild("HumanoidRootPart") then
		if character.HumanoidRootPart:FindFirstChild("flashpoint") then
			if character.HumanoidRootPart:FindFirstChild("flashpoint").Enabled == true then
				l__workspace__1.ServerStuff.toggleFlashlight:FireServer();
			end;
		end;
	end;
	spawn(function()
		u89("ShadowArms");
	end);
	local v645 = l__game__6.ReplicatedStorage.effects.wraithFX:Clone();
	v645.CFrame = l__CurrentCamera__1.CFrame;
	v645.Parent = l__CurrentCamera__1;
	local v646 = Instance.new("Motor6D");
	v646.Part0 = v645;
	v646.Part1 = cpart;
	v646.C1 = CFrame.new(0, 0, -0.4) * CFrame.Angles(0, 0, 0);
	v646.Parent = v645;
	shadowForm = true;
	if u16 then
		u16:Destroy();
	end;
	local v647, v648, v649 = pairs(v6);
	while true do
		local v650, v651 = v647(v648, v649);
		if v650 then

		else
			break;
		end;
		v649 = v650;
		v651[1] = "Fist";
		v651[3] = nil;	
	end;
	l__workspace__1.ServerStuff.useupItem:FireServer();
	u56("Fist");
	maingui.InventoryFrame.Visible = false;
	maingui.StaminaFrame.Visible = false;
	maingui.HealthFrame.Visible = false;
	invmanage("updatehud");
end;
local function u90(p82)
	if juggernaut == true then
		return;
	end;
	if u14.name == u20 or u9.Unwaivered then
		return;
	end;
	if hum.Health <= 0 or u8.swinging == true then
		return;
	end;
	if u8.action == true or u8.swapping == true then
		return;
	end;
	if tick() - drawlockout <= 0.5 then
		return;
	end;
	if u15 == "THand" then
		return;
	end;
	local v652 = false;
	remove_dual_wield();
	u20 = u14.name;
	local v653 = nil;
	for v654, v655 in pairs(v6) do
		if v655[2] == true and v655[3] ~= nil then
			v653 = v655[3];
		end;
	end;
	if u16:FindFirstChild("trapped") then
		v653 = "trapped";
	end;
	u16:Destroy();
	invmanage("updatehud");
	local v656 = nil;
	for v657, v658 in pairs(v6) do
		if v658[2] == true and v658[4] ~= nil then
			v656 = v658[4];
			v658[4] = nil;
			break;
		end;
	end;
	if v656 ~= nil then
		v653 = "AGENT" .. v656;
	end;
	RS:wait();
	for v659, v660 in pairs(v6) do
		if v660[2] == true and v660[1] == "Fist" then
			v652 = true;
		end;
	end;
	if v652 == false then
		for v661, v662 in pairs(v6) do
			if v662[2] == true then
				v662[1] = "Fist";
				v662[3] = nil;
				if v661 == 1 then
					primskin = nil;
				end;
			end;
		end;
		l__workspace__1.ServerStuff.throwWeapon:FireServer(u15, nil, l__CurrentCamera__1.CFrame, "drop", u14, v653, v6[1][2], v5, p82, v4);
		u56("Fist");
	end;
end;
local u91 = false;
function getPstats(p83)
	return l__workspace__1.ServerStuff.relayStats:InvokeServer(p83);
end;
crackcd = 0;
specialcrackcd = 0;
ricochetcrackcd = 0;
ping_cooldown = tick();
ping_amt = 0;
ping_chill = tick();
ping_chill_timer = 3;
ping_chll_limit = 5;
current_in_echo = false;
bloodtrail_cd = 0;
function bloodtrailfx(p84, p85, p86)
	if tick() - bloodtrail_cd <= 0.1 then
		return;
	end;
	bloodtrail_cd = tick();
	local v663 = math.clamp(p85 / 10, 1, 10);
	local v664 = 1 - 1;
	while true do
		local v665 = l__game__6.ReplicatedStorage.effects.bloodfxtrail:Clone();
		l__Debris__32:AddItem(v665, 5);
		v665.CFrame = CFrame.new(p84);
		if p86 == nil then
			v665.CFrame = CFrame.new(p84) * CFrame.new(math.random(-10, 10) / 20, math.random(-10, 10) / 20, math.random(-10, 10) / 20);
		end;
		v665.Parent = l__workspace__1.NoTarget;
		v665.Velocity = v665.Velocity + Vector3.new(math.random(-10, 10) / 5, v663, math.random(-10, 10) / 5);
		if 0 <= 1 then
			if v664 < v663 then

			else
				break;
			end;
		elseif v663 < v664 then

		else
			break;
		end;
		v664 = v664 + 1;	
	end;
end;
l__workspace__1.ServerStuff.dealDamage.OnClientEvent:Connect(function(p87, p88, p89, p90, p91, p92)
	local v666 = nil;
	if p88 then
		local v667 = CFrame.new(l__CurrentCamera__1.Focus.p, l__CurrentCamera__1.Focus.p + Vector3.new(l__CurrentCamera__1.CoordinateFrame.lookVector.x, 0, l__CurrentCamera__1.CoordinateFrame.lookVector.z).unit):inverse() * p88.HumanoidRootPart.Position;
		local l__unit__668 = Vector3.new(v667.x, v667.z).unit;
		v666 = math.deg(math.atan2(l__unit__668.y * 200, l__unit__668.x * 200)) + 90;
	end;
	if typeof(p89) ~= "string" then
		local v669 = p89 / 35;
		local v670 = math.clamp(3 - v669 * 2, 0.75, 3);
		local v671 = math.clamp(v669, 0.05, 0.8);
		if p90 > 0 then
			if hum.Health <= 15 and tick() - AGENT_debounces.low_health >= 15 then
				AGENT_debounces.low_health = tick();
				agent_speak("lowhealth", true);
			end;
			if p88 ~= character and u8.blocking == false then
				tpglobalanimsets.damage:Play(0.1, v671, v670);
			end;
			u29 = u29 + p89;
			u37();
			if u9.Painkillers == nil and u9["Bottle Buff"] == nil then
				shakecamera("damage", { p89 });
			end;
		end;
		if playerstats.Class == "sword" then
			if v64[3].dogtagsdamagetimer <= tick() - v63.dogtag_lose_timer then
				v63.dogtag_lose_damage = p89;
			else
				v63.dogtag_lose_damage = v63.dogtag_lose_damage + p89;
			end;
			v63.dogtag_lose_timer = tick();
			if v64[3].dogtagsheavydamage <= v63.dogtag_lose_damage then
				v63.dogtag_lose_damage = 0;
				v63.losetags(p89, false);
			end;
		elseif playerstats.Class == "fire" then
			local v672 = p89 * v64[3].overheat_cooldown_multiplier;
			if p87.weapontype == "Gun" then
				v672 = v672 * v64[3].overheat_gun_multiplier;
			end;
			v63.apply_overheat(v672, true);
		end;
		if playerstats.Class == "goggles" and v63.goggletakedamage and p89 > 2 then
			v63.goggletakedamage(p89);
		end;
		if v53 == true and (u14.weapontype == "Gun" or u14.weapontype == "Bow") then
			u90();
		end;
		if u9.Lazarus or u9["Defense Buff"] then
			local v673 = 8;
			if u9.Lazarus then
				v673 = v20.lazarus.activestats.min_heal;
			end;
			if hum.Health <= v673 then
				l__workspace__1.ServerStuff.dealDamage:FireServer("lazarusheal", p89, v5, v4);
			end;
		end;
		v104({ "hitsound", "general" }, "hitreceive", nil, nil, true, true);
		local v674 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS);
		if p87.weapontype == "Bludgeon" or p87.weapontype == "Blade" or p87.weapontype == "Axe" or p87.weapontype == "Spear" or p87.weapontype == "Fists" then
			if p88 and u32.tagged[p88.Name] and p89 and p89 >= 12 then
				u32.tagged[p88.Name] = nil;
				u32.ticktimers[p88.Name] = tick();
				u32.suslevels[p88.Name] = tick();
			end;
			local v675 = nil;
			if p87.weapontype == "Bludgeon" then
				v675 = v674.Crp;
				if p92.sub then
					u7 = math.clamp(u7 - p89 * v8.sub.efx[1] / 100, 0, v66);
				end;
			elseif p87.weapontype == "Blade" then
				v675 = v674.Bld;
				if p92.clot then
					clottingwound = p87.woundrating;
					clotting = tick();
				end;
			elseif p87.weapontype == "Axe" then
				v675 = v674.Bld;
			elseif p87.weapontype == "Spear" then
				v675 = v674.Crp;
			end;
			if (p87.weapontype == "Bludgeon" or p87.weapontype == "Blade") and u9.Silencer then
				v675 = nil;
			end;
			if p87.name == "Hidden Knife" and p89 >= 40 then
				local l__Crp__676 = v674.Crp;
				l__Crp__676.intensity = 4;
				afflictstatus(l__Crp__676);
			end;
			if v675 then
				v675.intensity = p87.woundrating;
				if p92.maniac and p87.weapontype == "Axe" then
					v675.intensity = v8.maniac.efx[1];
				end;
				local v677 = math.random(1, 10);
				if p92 and p92.backstab == true then
					v677 = 1;
				end;
				if v677 == 1 then
					if u9.Bleed and v675 == v674.Bld and u9["Bleed Prevention"] == nil then
						afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).HeavBld);
					end;
					if v675 == v674.Crp and math.random(1, 2) == 1 then
						v675 = v674.Frac;
					end;
					afflictstatus(v675);
					if p92.clot and p87.weapontype == "Blade" and v8.clot.efx[1] < tick() - clotting then
						spawn(function()
							while true do
								v675.intensity = clottingwound;
								afflictstatus(v675);
								RS:wait();
								if v8.clot.efx[1] < tick() - clotting then
									break;
								end;							
							end;
						end);
					end;
				end;
			end;
			if u79 == false then
				u79 = true;
			end;
			if u9.Armoured then
				u9.Armoured.effects.currentduration = u9.Armoured.effects.currentduration - p90 * 4;
			end;
			if u9.Snared then
				u9.Snared.effects.currentduration = 0;
			end;
			if u8.charging == true and u9.Unwaivered == nil then
				u8.charging = false;
			end;
			if u78 == false then
				u78 = true;
			end;
		elseif p87.weapontype == "Gun" then
			if p87.damagerating[3] + p87.damagerating[3] * 0.5 <= p89 then
				v104({ "hitsound", "general" }, "hitheadshot", nil, nil, true, true);
			end;
			if v63.aegisshieldup ~= nil and p89 > 1 then
				v63.aegisshieldup(p89 * v64[3].aegisrangeddamagemultiplier);
				p89 = 0;
			end;
			if p89 >= 5 then
				if math.random(1, 10) == 1 then
					if u9.Bleed and u9["Bleed Prevention"] == nil then
						afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).HeavBld);
					end;
					afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Bld);
				end;
				if math.random(1, 15) == 1 then
					if math.random(1, 2) == 1 then
						afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Crp);
					else
						afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Frac);
					end;
				end;
			end;
			if p87.name == "Alarm Gun" and playerperks.inhuman == nil then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Bcn);
				if p92 and p92.codered then
					local l__Bld__678 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Bld;
					l__Bld__678.intensity = v8.codered.efx[1];
					afflictstatus(l__Bld__678);
				end;
			end;
		end;
		if p87 == "grenade" or p87 == "grenadeairburst" or p87 == "grenadetinnitus" or p87 == "grenadetinnitusonly" then
			globalanimsets.explosion_waiver:Play(0.05, 1, 0.5);
			if playerperks.bomb == nil and v60 == false and p87 ~= "grenadetinnitusonly" then
				local l__Bld__679 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Bld;
				l__Bld__679.intensity = 1;
				afflictstatus(l__Bld__679);
				if p87 ~= "grenadeairburst" then
					local l__Crp__680 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Crp;
					l__Crp__680.intensity = 1;
					afflictstatus(l__Crp__680);
				end;
			end;
			if (p87 == "grenadetinnitus" or p87 == "grenadetinnitusonly") and v60 == false then
				v104({ "general" }, "tinnitus", nil, nil, true, true);
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
			end;
		end;
		if p87 == "hanger_influence" then
			start_influence();
		end;
		if p87[1] == "thrown" then
			if p87[2].name == "Poisoned Knife" then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Scs);
			elseif p87[2].name == "Hunting Axe" then
				if p90 == p87[2].damagerating[2] then
					local l__Bld__681 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Bld;
					l__Bld__681.intensity = v19.TAxe.sizerating;
					local l__Crp__682 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Crp;
					l__Crp__682.intensity = v19.TAxe.sizerating;
					afflictstatus(l__Bld__681);
					afflictstatus(l__Crp__682);
				end;
			elseif p87[2].name == "Throwing Javelin" then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Prc);
			end;
		end;
		if p87 == "caltrop" then
			local l__Bld__683 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Bld;
			l__Bld__683.intensity = 3;
			local l__Crp__684 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Crp;
			l__Crp__684.intensity = 3;
			afflictstatus(l__Bld__683);
			afflictstatus(l__Crp__684);
			l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "caltropstep", character.HumanoidRootPart, 0.25);
		elseif p87 == "Steel Punjis" or p87 == "Crafted Punjis" then
			afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Scs);
			l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "caltropstep", character.HumanoidRootPart, 0.25);
			l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "punjistep", character.HumanoidRootPart, 0.25);
		elseif p87 == "snare" then
			l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "snarestep", character.HumanoidRootPart, 0.25);
			afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Snr);
		elseif p87 == "TGas" or p87 == "CRSBomb" then
			afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Bnd);
			if p87 == "TGas" then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Psn);
			end;
		end;
		if p90 > 0 and p88 then
			v121.killcombo = 0;
			v121.damagetaken = v121.damagetaken + p90;
			l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "DamageTakenFrom", p90 });
			if tick() - hiddeneyescooldown > 2.5 and startperk.Value == "hiddenB" then
				hiddeneyescooldown = tick();
				l__workspace__1.ServerStuff.dealDamage:FireServer("hiddeneyes", nil, v5, v4);
			end;
			local v685 = maingui.Damage:Clone();
			v685.Rotation = v666;
			v685.Visible = true;
			spawn(function()
				for v686 = 1, 40 do
					v685.Indicator.ImageTransparency = v685.Indicator.ImageTransparency + 0.025;
					RS:wait();
				end;
				v685:Destroy();
			end);
			v685.Parent = maingui;
		end;
		if p87 == "minigunbash" and (u8.sprinting == true or u8.swinging == true or u8.charging == true or u8.blocking == true) then
			spawn(function()
				stagger("normal");
			end);
		end;
		if v666 and p88 then
			l__workspace__1.ServerStuff.flinchTarget:FireServer(character.Torso, character.HumanoidRootPart, v666, p89);
		end;
	elseif p89 == "shove" then
		if u8.blocking == true and u9.Unwaivered == nil and u8.blockrecoil == false then
			spawn(function()
				stagger("normal");
			end);
		else
			l__workspace__1.ServerStuff.flinchTarget:FireServer(character.Torso, character.HumanoidRootPart, v666, 3);
		end;
	elseif p89 == "clienthitblocked" then
		if u8.staggering == false then
			spawn(function()
				stagger("normal");
			end);
		end;
	elseif p89 == "ai_grapple" or p89 == "force_stagger" or p89 == "airburst_stagger" then
		if p89 == "airburst_stagger" and v60 == true then
			return;
		end;
		if v55 == true or p89 == "force_stagger" then
			spawn(function()
				stagger("normal");
			end);
		end;
	elseif p89 == "burning" then
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Brn);
	elseif p89 == "taser" then
		shakecamera("tased");
		applygore("tased");
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Vcd);
	elseif p89 == "dronetase" then
		shakecamera("tased");
		applygore("tased");
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Vcd);
	elseif p89 == "pepperspray" then
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Bnd);
	elseif p89 == "forcebleed" then
		local l__Bld__687 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Bld;
		l__Bld__687.intensity = 2;
		afflictstatus(l__Bld__687);
	elseif p89 == "disability" then
		local l__Crp__688 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Crp;
		l__Crp__688.intensity = v8.disab.efx[1];
		afflictstatus(l__Crp__688);
	elseif p89 == "ingas" then
		u91 = true;
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Psn);
	elseif p89 == "outgas" then
		u91 = false;
		if u9.Toxins then
			u9.Toxins.effects.currentduration = 0;
		end;
	elseif p89 == "shadowForm" then
		if shadowForm == true then
			shadowrespawnflash();
		else
			convertToShadow();
		end;
	end;
	return nil;
end);
local function u92(p93, p94, p95)
	local v689 = p95;
	local v690 = Color3.new(0, 0.8, 0.9);
	if p93.Parent.Name == "Heavy Ammo" or p93.Parent.Name == "Shells Ammo" or p93.Parent.Name == "Light Ammo" or p93.Parent.Name == "Long Ammo" or p93.Parent.Name == "Short Ammo" or p93.Parent.Name == "Medium Ammo" or p93.Parent.Name == "Small Ammo" then
		v690 = Color3.new(1, 0.8, 0);
	elseif p93.Name == "HarvestWood" or p93.Name == "HarvestStone" then
		v690 = Color3.new(0.8, 0, 0.8);
	elseif p93.Name == "JointGrip" then
		v690 = Color3.new(0.2, 0.9, 0);
	elseif p93.Name == "Head" then
		v690 = Color3.new(1, 0.1, 0);
	end;
	if p94 == true then
		v689 = 8;
	end;
	local v691 = l__game__6.ReplicatedStorage.misc.teammateindicator:Clone();
	l__Debris__32:AddItem(v691, v689);
	v691.AlwaysOnTop = true;
	v691.ImageLabel.ImageColor3 = v690;
	v691.Parent = p93;
	v691.Adornee = p93;
	if p94 == true then
		v691.ImageLabel.Rotation = 180;
		delay(p95 - 0.5, function()
			while true do
				v691.ImageLabel.ImageTransparency = v691.ImageLabel.ImageTransparency + 0.05;
				RS:wait();
				if v691 == nil then
					break;
				end;
				if v691.ImageLabel.ImageTransparency >= 1 then
					break;
				end;			
			end;
			v691:Destroy();
		end);
	end;
end;
function applygore(p96, p97, p98)
	if p96 ~= "bleed" then
		if p96 == "bloodhit" then
			if p97 ~= nil then
				if p97:FindFirstChild("Torso") == nil then
					return;
				end;
			else
				return;
			end;
			local v692 = l__game__6.ReplicatedStorage.effects.bloodSplatter:Clone();
			l__Debris__32:AddItem(v692, 2);
			v692.CFrame = CFrame.new(p97.Torso.Position);
			v692.Parent = l__workspace__1.NoTarget;
			local v693 = p98[1];
			if v693 == nil then
				v693 = 1;
			end;
			local v694 = v693 / 1.5;
			if v694 < 4 then
				v694 = 4;
			end;
			v692.fx1.Enabled = true;
			v692.fx1:Emit(math.random(v694, v694 + math.random(1, 3)));
			v692.fx1.Enabled = false;
			if p96 == "bloodhit" then
				local v695 = l__game__6.ReplicatedStorage.effects.bloodSplatter:Clone();
				l__Debris__32:AddItem(v695, 2);
				v695.CFrame = CFrame.new(p98[2]);
				v695.Parent = l__workspace__1.NoTarget;
				v695.fx2.Enabled = true;
				v695.fx2:Emit(math.random(1, 3));
				v695.fx2.Enabled = false;
				v695.fx3.Enabled = true;
				v695.fx3:Emit(math.random(5, 10));
				v695.fx3.Enabled = false;
				v695.fx4.Enabled = true;
				v695.fx4:Emit(math.random(5, 10));
				v695.fx4.Enabled = false;
				bloodtrailfx(p98[2], p98[1]);
				if p98[3] then
					local v696 = l__game__6.ReplicatedStorage.effects.bloodpen:Clone();
					l__Debris__32:AddItem(v696, 2);
					v696.Parent = l__workspace__1.NoTarget;
					v696.CFrame = CFrame.new(p98[2], p98[3]);
					v696.fx1:Emit(math.random(1, 3));
					v696.fx2:Emit(math.random(8, 15));
					v696.fx3:Emit(math.random(8, 15));
				end;
			end;
		elseif p96 == "blocksmoke" then
			local v697 = l__game__6.ReplicatedStorage.effects.smokeBlock:Clone();
			l__Debris__32:AddItem(v697, 1);
			v697.Parent = p97.Torso;
			v697.Enabled = true;
			v697:Emit(math.random(3, 5));
			v697.Enabled = false;
		elseif p96 == "wire_pull" then
			if p98[1] then
				if p98[1]:FindFirstChild("wrap") then
					local v698 = l__game__6.ReplicatedStorage.misc.cross_wire.beam:Clone();
					v698.Width0 = 0;
					v698.Width1 = 0;
					v698.Parent = p98[1];
					local v699 = Instance.new("Attachment");
					l__Debris__32:AddItem(v699, 3);
					if p97 == character then
						v699.Parent = fparms.LeftArm.LUpperArm;
						v699.Position = Vector3.new(0.19, -0.84, math.random(-19, 19) / 100);
					else
						v699.Parent = p97["Left Arm"];
						v699.Position = Vector3.new(-0.3, -0.9, math.random(-40, 40) / 100);
					end;
					v698.Attachment0 = p98[1].wrap.a;
					v698.Attachment1 = v699;
					spawn(function()
						if v698 then
							local v700 = 1 - 1;
							while true do
								if v698 then

								else
									break;
								end;
								v698.Width0 = v698.Width0 + 0.005;
								v698.Width1 = v698.Width1 + 0.005;
								RS:wait();
								if 0 <= 1 then
									if v700 < 10 then

									else
										return;
									end;
								elseif 10 < v700 then

								else
									return;
								end;
								v700 = v700 + 1;							
							end;
							return;
						end;
					end);
				end;
			end;
		elseif p96 == "return_wire_fx" then
			if p98 then
				if p98:FindFirstChild("wrap") then
					if p97 then
						if p97:FindFirstChild("Left Arm") then
							local v701 = l__game__6.ReplicatedStorage.effects.daggerreturn_trail:Clone();
							l__Debris__32:AddItem(v701, 3);
							v701.CFrame = p98.wrap.CFrame;
							v701.Parent = l__workspace__1.NoTarget;
							v701.CFrame = p98.wrap.CFrame;
							local v702 = p97["Left Arm"];
							if p97 == character then
								v702 = fparms.LeftArm.LUpperArm;
							end;
							spawn(function()
								while true do
									v701.CFrame = v701.CFrame:Lerp(v702.CFrame, 0.5);
									if v702 ~= nil then

									else
										break;
									end;
									if v701 == nil then
										break;
									end;
									RS:wait();
									if not ((v702.Position - v701.Position).magnitude <= 0.5) then

									else
										return;
									end;								
								end;
								if v701 then
									v701:Destroy();
								end;
							end);
						end;
					end;
				end;
			end;
		elseif p96 == "place_wire_icon" then
			if p98[1] then
				local v703 = l__game__6.ReplicatedStorage.misc.wireicon:Clone();
				v703.Parent = p98[1];
				v703.Adornee = p98[1];
				spawn(function()
					while true do
						if p98[1] ~= nil then

						else
							break;
						end;
						if v703 == nil then
							break;
						end;
						if (p98[1].Position - (l__CurrentCamera__1.CFrame.p + l__CurrentCamera__1.CFrame.lookVector * (v64[3].max_dagger_return_range - 5))).magnitude <= v64[3].max_dagger_return_range then
							v703.icon.ImageColor3 = Color3.new(0.9, 0, 0);
						else
							v703.icon.ImageColor3 = Color3.new(1, 1, 1);
						end;
						RS:wait();
						if p98[1] ~= nil then

						else
							if v703 then
								v703:Destroy();
							end;
							return;
						end;
						if v703 ~= nil then

						else
							if v703 then
								v703:Destroy();
							end;
							return;
						end;					
					end;
				end);
			end;
		elseif p96 == "laz_shock" then
			local v704 = { "Left Arm", "Torso", "Right Arm" };
			if p98[2] ~= nil then
				v704 = { "Left Arm", "Torso", "Right Arm", "Left Leg", "Right Leg" };
			end;
			if p97 == character then
				v704 = { "Torso" };
				afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Laz);
			end;
			local v705, v706, v707 = ipairs(v704);
			while true do
				local v708, v709 = v705(v706, v707);
				if v708 then

				else
					break;
				end;
				v707 = v708;
				if p97:FindFirstChild(v709) then
					local v710 = l__game__6.ReplicatedStorage.effects.electriclazarus:Clone();
					l__Debris__32:AddItem(v710, p98[1]);
					v710.Parent = p97:FindFirstChild(v709);
				end;			
			end;
		elseif p96 == "drifter_puff" then
			local v711 = l__game__6.ReplicatedStorage.effects.stealthfx:Clone();
			l__Debris__32:AddItem(v711, 5);
			v711.CFrame = p98;
			v711.Parent = l__workspace__1.NoTarget;
			v711.smoke1:Emit(math.random(10, 20));
			v711.smoke2:Emit(math.random(10, 20));
			v711.smoke3:Emit(math.random(5, 10));
		elseif p96 == "drifter_end" then
			if p97:FindFirstChild("Humanoid") == nil then
				return;
			end;
			if p97.Humanoid.Health <= 0 then
				return;
			end;
			if p97 ~= character then
				local v712, v713, v714 = ipairs(p97:GetDescendants());
				while true do
					local v715, v716 = v712(v713, v714);
					if v715 then

					else
						break;
					end;
					v714 = v715;
					if v716.Name == "cloakfx" then
						l__Debris__32:AddItem(v716, 3);
						v716.Enabled = false;
					end;				
				end;
			else
				local v717, v718, v719 = ipairs(fparms:GetDescendants());
				while true do
					local v720, v721 = v717(v718, v719);
					if v720 then

					else
						break;
					end;
					v719 = v720;
					if v721.Name == "drifterarm" then
						l__Debris__32:AddItem(v721, 3);
						v721.smokelimbfx.Enabled = false;
					end;				
				end;
			end;
		elseif p96 == "drifter_cloak" then
			if p97:FindFirstChild("Humanoid") == nil then
				return;
			end;
			if p97.Humanoid.Health <= 0 then
				return;
			end;
			if p97 ~= character then
				local v722 = l__game__6.ReplicatedStorage.misc.smokelimbfx:Clone();
				v722.Name = "cloakfx";
				v722.Parent = p97["Left Arm"];
				local v723 = l__game__6.ReplicatedStorage.misc.smokelimbfx:Clone();
				v723.Name = "cloakfx";
				v723.Parent = p97["Left Arm"];
				local v724 = l__game__6.ReplicatedStorage.misc.smokelimbfx:Clone();
				v724.Name = "cloakfx";
				v724.Parent = p97.Torso;
				local v725 = l__game__6.ReplicatedStorage.misc.smokecloakfx:Clone();
				v725.Name = "cloakfx";
				v725.Parent = p97.Torso;
			else
				local v726 = l__game__6.ReplicatedStorage.misc.drifterarm:Clone();
				v726.Parent = fparms.RightArm.RLowerArm;
				local v727 = Instance.new("Weld");
				v727.Part0 = fparms.RightArm.RLowerArm;
				v727.Part1 = v726;
				v727.Parent = v726;
				local v728 = l__game__6.ReplicatedStorage.misc.drifterarm:Clone();
				v728.Parent = fparms.RightArm.RUpperArm;
				local v729 = Instance.new("Weld");
				v729.Part0 = fparms.RightArm.RUpperArm;
				v729.Part1 = v728;
				v729.Parent = v728;
				local v730 = l__game__6.ReplicatedStorage.misc.drifterarm:Clone();
				v730.Parent = fparms.LeftArm.LLowerArm;
				local v731 = Instance.new("Weld");
				v731.Part0 = fparms.LeftArm.LLowerArm;
				v731.Part1 = v730;
				v731.Parent = v730;
				local v732 = l__game__6.ReplicatedStorage.misc.drifterarm:Clone();
				v732.Parent = fparms.LeftArm.LUpperArm;
				local v733 = Instance.new("Weld");
				v733.Part0 = fparms.LeftArm.LUpperArm;
				v733.Part1 = v732;
				v733.Parent = v732;
			end;
		elseif p96 == "lazarus_fire" then
			local v734 = l__game__6.ReplicatedStorage.effects.lazarusfx:Clone();
			l__Debris__32:AddItem(v734, 10);
			v734.CFrame = CFrame.new(p98[1]);
			v734.Parent = l__workspace__1.NoTarget;
			v734.attach.ring1:Emit(1);
			v734.attach.ring2:Emit(1);
			v734.attach.spark3:Emit(1);
			v734.attach.spark2:Emit(1);
			v734.leftover:Emit(math.random(30, 60));
			v734.leftover.Enabled = false;
			v734.attach.ring1.Enabled = false;
			v734.attach.ring2.Enabled = false;
			v734.attach.spark3.Enabled = false;
			v734.attach.spark2.Enabled = false;
			delay(0.2, function()
				v734.attach.sparks.Enabled = false;
			end);
			delay(1, function()
				v734.residual.Enabled = false;
			end);
			RS:wait();
			v104({ "perks" }, "laz_explosion", v734, 0.05, true, false);
		elseif p96 == "immolate_ability" then
			local v735 = l__game__6.ReplicatedStorage.effects.immolatorEffect:Clone();
			l__Debris__32:AddItem(v735, 10);
			v735.CFrame = p98[1];
			v735.Parent = l__workspace__1.NoTarget;
			RS:wait();
			v735.ember:Emit(math.random(30, 40));
			v735.flame:Emit(math.random(30, 40));
			v735.small:Emit(math.random(30, 40));
			v735.smoke:Emit(math.random(30, 40));
			v735.flamespread:Emit(math.random(20, 30));
			v104({ "perks" }, "flamer_ignite", v735, 0.05, true, false);
		elseif p96 == "shotshell_blast" then
			local v736 = l__game__6.ReplicatedStorage.misc.shotshellFX:Clone();
			l__Debris__32:AddItem(v736, 5);
			v736.CFrame = CFrame.new(p98[1]);
			if p98[2] then
				v736.Beam.Enabled = true;
				v736.trail.CFrame = CFrame.new(p98[2]);
			end;
			v736.Parent = l__workspace__1.NoTarget;
			v736.fx:Emit(math.random(10, 15));
			v736.fx2:Emit(math.random(8, 10));
			v736.fx3:Emit(math.random(20, 30));
			v736.fx4:Emit(1);
			if p98[2] then
				v736.largefx1:Emit(math.random(10, 15));
				v736.largefx2:Emit(math.random(15, 20));
				v736.largefx3:Emit(1);
				delay(0.5, function()
					local v737 = 1 - 1;
					while true do
						v736.Beam.Transparency = NumberSequence.new(v737 / 30);
						RS:wait();
						if 0 <= 1 then
							if v737 < 30 then

							else
								break;
							end;
						elseif 30 < v737 then

						else
							break;
						end;
						v737 = v737 + 1;					
					end;
				end);
			end;
		elseif p96 == "lazarus_laser" then
			local v738 = l__game__6.ReplicatedStorage.effects.laztrail:Clone();
			l__Debris__32:AddItem(v738, 3);
			v738.trailA.CFrame = CFrame.new(p98[1]);
			v738.trailB.CFrame = CFrame.new(p98[2]);
			v738.Parent = l__workspace__1.NoTarget;
			v738.trailA.crystal:Emit(math.random(3, 8));
			v738.trailA.flare:Emit(1);
			v738.trailA.spark:Emit(math.random(5, 10));
			v738.trailA.crystal.Enabled = false;
			v738.trailA.flare.Enabled = false;
			v738.trailA.spark.Enabled = false;
			delay(0.3, function()
				local v739 = 1 - 1;
				while true do
					v738.Beam.Transparency = NumberSequence.new(v739 / 25);
					RS:wait();
					if 0 <= 1 then
						if v739 < 25 then

						else
							break;
						end;
					elseif 25 < v739 then

					else
						break;
					end;
					v739 = v739 + 1;				
				end;
				v738:Destroy();
			end);
		elseif p96 == "harvestmat" then
			if p98[2] == nil then
				return;
			end;
			local v740 = l__game__6.ReplicatedStorage.effects.harvest_fx:Clone();
			l__Debris__32:AddItem(v740, 2);
			v740.CFrame = CFrame.new(p98[2]);
			v740.Parent = l__workspace__1.NoTarget;
			if p98[1] == "salvaged" then
				v740.smokeharvest.Enabled = true;
				v740.smokeharvest:Emit(1);
				v740.smokeharvest.Enabled = false;
			else
				v740[p98[1] .. "fx1"].Enabled = true;
				v740[p98[1] .. "fx1"]:Emit(math.random(2, 4));
				v740[p98[1] .. "fx1"].Enabled = false;
				v740[p98[1] .. "fx2"].Enabled = true;
				v740[p98[1] .. "fx2"]:Emit(math.random(2, 4));
				v740[p98[1] .. "fx2"].Enabled = false;
			end;
		elseif p96 == "fall_nullified" then
			local v741 = l__game__6.ReplicatedStorage.effects.fall_fx:Clone();
			v741.CFrame = p97.Torso.CFrame;
			l__Debris__32:AddItem(v741, 3);
			local v742 = Instance.new("Weld");
			v742.Part0 = p97.Torso;
			v742.Part1 = v741;
			v741.Parent = p97.Torso;
			v742.Parent = v741;
			RS:wait();
			v741.attach.effect:Emit(math.random(20, 30));
			v741.attach.effect2:Emit(math.random(15, 20));
			v741.attach.effect.Enabled = false;
			v741.attach.effect2.Enabled = false;
		elseif p96 == "lifesteal_fx" then
			if p98[1] ~= nil then
				if p98[2] == nil then
					return;
				end;
			else
				return;
			end;
			if p97 == character then
				if v64[1] == "shadow" then
					if v63.shadow_active then
						v63.shadow_active = v63.shadow_active - v64[3].cd_add_on_kill;
					elseif tick() - u88 < v64[3].cooldown then
						u88 = u88 - v64[3].cd_add_on_kill;
					end;
				end;
			end;
			v104({ "perks", "two" }, "summon_healed", p98[2], 0.05, true, false);
			spawn(function()
				local v743 = 1 - 1;
				while true do
					spawn(function()
						local v744 = l__game__6.ReplicatedStorage.effects.bloodstealfx:Clone();
						l__Debris__32:AddItem(v744, 5);
						v744.CFrame = CFrame.new(p98[2].Position);
						v744.Parent = l__workspace__1.NoTarget;
						local v745 = tick();
						local v746 = CFrame.new(p98[2].Position) * CFrame.new(math.random(-30, 30) / 10, math.random(-30, 30) / 10, math.random(-30, 30) / 10);
						while true do
							v744.CFrame = v744.CFrame:Lerp(v746, 0.4);
							RS:wait();
							if not (1 <= tick() - v745) then

							else
								break;
							end;						
						end;
						local v747 = tick();
						if p98[1] then
							if p98[1].Parent then
								if p98[1].Parent:FindFirstChild("Humanoid") then
									if 0 < p98[1].Parent.Humanoid.Health then
										while true do
											v744.CFrame = v744.CFrame:Lerp(p98[1].CFrame, 0.3);
											RS:wait();
											if not (0.5 <= tick() - v747) then

											else
												break;
											end;										
										end;
									end;
								end;
							end;
						end;
						v744.base.eyeglow.Enabled = false;
						v744.base.fx1.Enabled = false;
						v744.base.fx2.Enabled = false;
						v744.base.glow2.Enabled = false;
						v744.trailA.Enabled = false;
					end);
					if 0 <= 1 then
						if v743 < 5 then

						else
							break;
						end;
					elseif 5 < v743 then

					else
						break;
					end;
					v743 = v743 + 1;				
				end;
				local v748 = tick();
				while true do
					RS:wait();
					if not (1.5 <= tick() - v748) then

					else
						break;
					end;				
				end;
				if p98[1] then
					if p98[1].Parent then
						if p98[1].Parent:FindFirstChild("Humanoid") then
							if 0 < p98[1].Parent.Humanoid.Health then
								local v749 = l__game__6.ReplicatedStorage.effects.torsoheal:Clone();
								l__Debris__32:AddItem(v749, 3);
								v749.Parent = p98[1];
								RS:wait();
								v749:Emit(5);
							end;
						end;
					end;
				end;
			end);
		elseif p96 == "floorSplat" then
			if u8.air == false then
				local v750 = raycastline(p97.Torso.CFrame.p, -p97.Torso.CFrame.upVector, 8, { p97, character, l__workspace__1.NoTarget });
				if v750 then
					if v750.Name ~= "BLOODRoot" then
						local v751 = l__game__6.ReplicatedStorage.effects:FindFirstChild("floorblood" .. math.random(1, 4)):Clone();
						if p98 == nil then
							p98 = 20;
						end;
						local v752, v753, v754 = pairs(v751.BLOODRoot:GetChildren());
						while true do
							local v755, v756 = v752(v753, v754);
							if v755 then

							else
								break;
							end;
							v754 = v755;
							v756.Decal.Transparency = 0.5 - p98 / 65;						
						end;
						l__Debris__32:AddItem(v751, 23);
						v751:SetPrimaryPartCFrame(CFrame.new(p97.Torso.Position - Vector3.new(0, 2.9, 0)));
						delay(20, function()
							local v757 = nil;
							local v758 = nil;
							local v759 = nil;
							local v760 = nil;
							local v761 = nil;
							local v762 = nil;
							local v763 = nil;
							local v764 = nil;
							if v751:FindFirstChild("BLOODRoot") then
								local v765 = 1 - 1;
								while true do
									if v751 then

									else
										break;
									end;
									local v766, v767, v768 = pairs(v751.BLOODRoot:GetChildren());
									while true do
										local v769, v770 = v766(v767, v768);
										if v769 then

										else
											break;
										end;
										v768 = v769;
										v770.Decal.Transparency = v770.Decal.Transparency + 0.05;									
									end;
									RS:wait();
									if 0 <= 1 then
										if v765 < 20 then

										else
											v757 = v751;
											v759 = "Destroy";
											v758 = v757;
											v762 = v758;
											v760 = v757;
											v761 = v759;
											local v771 = v760[v761];
											v763 = v771;
											v764 = v762;
											v763(v764);
											return;
										end;
									elseif 20 < v765 then

									else
										v757 = v751;
										v759 = "Destroy";
										v758 = v757;
										v762 = v758;
										v760 = v757;
										v761 = v759;
										v771 = v760[v761];
										v763 = v771;
										v764 = v762;
										v763(v764);
										return;
									end;
									v765 = v765 + 1;								
								end;
								return;
							else
								v757 = v751;
								v759 = "Destroy";
								v758 = v757;
								v762 = v758;
								v760 = v757;
								v761 = v759;
								v771 = v760[v761];
								v763 = v771;
								v764 = v762;
								v763(v764);
								return;
							end;
							v757 = v751;
							v759 = "Destroy";
							v758 = v757;
							v762 = v758;
							v760 = v757;
							v761 = v759;
							v771 = v760[v761];
							v763 = v771;
							v764 = v762;
							v763(v764);
						end);
						v751.Parent = l__workspace__1.GoreEffects;
					end;
				end;
			elseif p96 == "firegun" then
				local v772 = l__game__6.ReplicatedStorage.effects.gunTrail:Clone();
				l__Debris__32:AddItem(v772, 3);
				v772.trailA.CFrame = CFrame.new(p98[1]);
				v772.trailB.CFrame = CFrame.new(p98[2]);
				v772.Parent = l__workspace__1.NoTarget;
				local v773 = 1;
				if p98[6] then
					if 80 <= p98[6] then
						v773 = 5;
					end;
				end;
				local v774 = l__game__6.ReplicatedStorage.effects.bullet_trail:Clone();
				l__Debris__32:AddItem(v774, v773);
				v774.CFrame = CFrame.new(p98[1], p98[2]);
				v774.CFrame = v774.CFrame + v774.CFrame.lookVector * math.random(2, 10);
				if p98[3] == false then
					v774.Parent = l__workspace__1.NoTarget;
					if p98[6] then
						if 80 <= p98[6] then
							v774.smoketrail2.Enabled = true;
						end;
					end;
					spawn(function()
						v774.Velocity = v774.Velocity + v774.CFrame.lookVector * 1000;
						v774.Touched:connect(function(p99)
							if v774 then
								if p99.Locked == false then
									v774.Anchored = true;
									v774.Transparency = 1;
								end;
							end;
						end);
					end);
				end;
				if p98[4] == nil then
					if 0.02 < tick() - crackcd then
						if p98[5] == nil then
							v104({ "firearms" }, "crack" .. math.random(1, 4), v772.trailB, 0.1, true, false);
						end;
						v104({ "firearms" }, "impact_bullet" .. math.random(1, 3), v772.trailB, 0.1, true, false);
						if p98[6] then
							if 80 <= p98[6] then
								v104({ "firearms" }, "large_impact", v772.trailB, 0.1, true, false);
							end;
						end;
					end;
					crackcd = tick();
					v772.trailB.debrisA.Enabled = true;
					v772.trailB.debrisB.Enabled = true;
					v772.trailB.smoke.Enabled = true;
					v772.trailB.spark.Enabled = true;
					v772.trailB.debrisA:Emit(math.random(3, 6));
					v772.trailB.debrisB:Emit(math.random(3, 6));
					v772.trailB.smoke:Emit(math.random(2, 4));
					v772.trailB.spark:Emit(math.random(8, 12));
					v772.trailB.debrisA.Enabled = false;
					v772.trailB.debrisB.Enabled = false;
					v772.trailB.smoke.Enabled = false;
					v772.trailB.spark.Enabled = false;
					if p98[6] then
						if 80 <= p98[6] then
							v772.trailB.strongsmoke1:Emit(math.random(4, 8));
							v772.trailB.strongsmoke2:Emit(math.random(6, 10));
						end;
					end;
				else
					v104({ "hitsound", "guns" }, "bullet_impact" .. math.random(1, 3), v772.trailB, 0.1, true, false);
					if p98[6] then
						if 80 <= p98[6] then
							v104({ "hitsound", "guns" }, "bullet_heavy" .. math.random(1, 3), v772.trailB, 0.1, true, false);
						end;
					end;
				end;
				if p98[5] == nil then
					local v775 = l__game__6.ReplicatedStorage.effects.gunFX:Clone();
					l__Debris__32:AddItem(v775, 1);
					v775.CFrame = CFrame.new(p98[1]);
					v775.Parent = l__workspace__1.NoTarget;
					spawn(function()
						if p98[3] == false then
							v775.flash.Enabled = true;
							v775.flash:Emit(1);
							v775.flash.Enabled = false;
							local v776 = l__game__6.ReplicatedStorage.misc.muzzleflash:Clone();
							l__Debris__32:AddItem(v776, 0.05);
							v776.Parent = v775;
						end;
						v775.smoke.Enabled = true;
						v775.smoke2.Enabled = true;
						v775.smoke:Emit(math.random(2, 4));
						v775.smoke2:Emit(math.random(4, 6));
						v775.smoke.Enabled = false;
						v775.smoke2.Enabled = false;
						if p98[6] then
							if 80 <= p98[6] then
								v775.strong_smoke:Emit(math.random(1, 2));
								v775.strong_smoke2:Emit(math.random(4, 6));
							end;
						end;
					end);
				end;
			elseif p96 == "gunricochet" then
				local v777 = l__game__6.ReplicatedStorage.effects.bulletricochet:Clone();
				l__Debris__32:AddItem(v777, 3);
				v777.CFrame = CFrame.new(p98[1]);
				v777.Parent = l__workspace__1.NoTarget;
				if 0.02 < tick() - ricochetcrackcd then
					ricochetcrackcd = tick();
					v104({ "firearms" }, "ricochet", v777, 0.1, true, false);
				end;
				ricochetcrackcd = tick();
				v777.spark:Emit(math.random(10, 15));
				v777.spark2:Emit(1);
				v777.spark3:Emit(1);
				spawn(function()
					local v778 = math.random(2, 4);
					local v779 = 1 - 1;
					while true do
						local v780 = l__game__6.ReplicatedStorage.effects.bulletricochettrail:Clone();
						l__Debris__32:AddItem(v777, 2);
						v780.CFrame = v777.CFrame;
						v780.Parent = l__workspace__1.NoTarget;
						v780.Velocity = Vector3.new(math.random(-100, 100), math.random(0, 100), math.random(-100, 100)) / 5;
						if 0 <= 1 then
							if v779 < v778 then

							else
								break;
							end;
						elseif v778 < v779 then

						else
							break;
						end;
						v779 = v779 + 1;					
					end;
				end);
			elseif p96 == "shadow_stake" then
				local v781 = l__game__6.ReplicatedStorage.misc.stake_trail:Clone();
				l__Debris__32:AddItem(v781, 2);
				v781.CFrame = CFrame.new(p98[1], p98[2]);
				v781.CFrame = v781.CFrame + v781.CFrame.lookVector;
				v781.Parent = l__workspace__1.NoTarget;
				spawn(function()
					RS:wait();
					v781.Velocity = v781.Velocity + v781.CFrame.lookVector * 400;
				end);
			elseif p96 == "incendiary_trail" then
				local v782 = l__game__6.ReplicatedStorage.effects.incendiary_trail:Clone();
				l__Debris__32:AddItem(v782, 3);
				v782.trailA.CFrame = CFrame.new(p98[1]);
				v782.trailB.CFrame = CFrame.new(p98[2]);
				v782.Parent = l__workspace__1.NoTarget;
				if 0.02 < tick() - specialcrackcd then
					v104({ "firearms" }, "incendiary_crack", v782.trailB, 0.1, true, false);
				end;
				specialcrackcd = tick();
				v782.trailB.ember:Emit(math.random(8, 12));
				v782.trailB.flame:Emit(math.random(5, 10));
				v782.trailB.small:Emit(math.random(5, 10));
				spawn(function()
					local v783 = 1 - 1;
					while true do
						v782.Beam.Transparency = NumberSequence.new(v783 / 20);
						RS:wait();
						if 0 <= 1 then
							if v783 < 20 then

							else
								break;
							end;
						elseif 20 < v783 then

						else
							break;
						end;
						v783 = v783 + 1;					
					end;
				end);
			elseif p96 == "muzzle_flash" then
				local v784 = l__game__6.ReplicatedStorage.effects.gunFX:Clone();
				l__Debris__32:AddItem(v784, 1);
				v784.CFrame = CFrame.new(p98[1]);
				v784.Parent = l__workspace__1.NoTarget;
				spawn(function()
					if p98[2] == false then
						v784.flash.Enabled = true;
						v784.flash:Emit(1);
						v784.flash.Enabled = false;
						local v785 = l__game__6.ReplicatedStorage.misc.muzzleflash:Clone();
						l__Debris__32:AddItem(v785, 0.05);
						v785.Parent = v784;
					end;
					v784.smoke.Enabled = true;
					v784.smoke2.Enabled = true;
					v784.smoke:Emit(math.random(4, 6));
					v784.smoke2:Emit(math.random(6, 8));
					v784.smoke.Enabled = false;
					v784.smoke2.Enabled = false;
					if p98[3] then
						if 80 <= p98[3] then
							v784.strong_smoke:Emit(math.random(2, 4));
							v784.strong_smoke2:Emit(math.random(6, 8));
						end;
					end;
				end);
			elseif p96 == "hangerPopup" then
				local function v786()
					local v787 = { "YOU ARE WORTHLESS", "USELESS", "YOU ARE HOPELESS", "HOPELESS", "DIE", "GIVE UP", "YOU ARE USELESS", "WORTHLESS", "MEANINGLESS", "YOU ARE MEANINGLESS" };
					if v64[1] == "shadow" then
						v787 = { "YOU ARE A FAKER", "HOPELESS", "JOIN US", "USURPER", "HERETIC", "GIVE UP", "FAKER", "TRAITOR", "YOU ARE A TRAITOR", "YOU ARE A HERETIC" };
					end;
					local v788 = l__game__6.ReplicatedStorage.soundLibrary.general_ui.static:Clone();
					v788.TimePosition = math.random(1, 30);
					v788.Parent = l__CurrentCamera__1;
					local v789 = { "4452726587", "4452726886", "4452727160", "4452727454" };
					local v790 = math.random(1, 4);
					local v791 = l__game__6.ReplicatedStorage.misc.hangertext:Clone();
					v791.static.Image = "rbxassetid://" .. v789[v790];
					v791.popuptext.Text = v787[math.random(1, #v787)];
					local v792 = math.random(20, 80) / 100;
					local v793 = math.random(10, 90) / 100;
					v791.popuptext.Position = UDim2.new(v792, 0, v793, 0);
					local u93 = 0;
					local u94 = v790;
					spawn(function()
						v788:Play();
						v791.Parent = ply.PlayerGui;
						local v794 = tick();
						while true do
							v791.popuptext.Position = UDim2.new(v792, math.random(-10, 10), v793, math.random(-10, 10));
							if 0.05 <= tick() - u93 then
								u93 = tick();
								u94 = u94 + 1;
								if 4 < u94 then
									u94 = 1;
								end;
								v791.static.Image = "rbxassetid://" .. v789[u94];
							end;
							RS:wait();
							if not (0.3 <= tick() - v794) then

							else
								break;
							end;						
						end;
						v791:Destroy();
						v788:Destroy();
					end);
				end;
				if character:FindFirstChild("HumanoidRootPart") then
					if (character:FindFirstChild("HumanoidRootPart").Position - p97.Position).magnitude <= 30 then
						v786();
						if (character:FindFirstChild("HumanoidRootPart").Position - p97.Position).magnitude <= 15 then
							delay(1.5, function()
								v786();
							end);
						end;
					end;
				end;
			elseif p96 == "firelaser" then
				local v795 = l__game__6.ReplicatedStorage.effects.laserTrail:Clone();
				l__Debris__32:AddItem(v795, 3);
				v795.trailA.CFrame = CFrame.new(p98[1]);
				v795.trailB.CFrame = CFrame.new(p98[2]);
				v795.Parent = l__workspace__1.NoTarget;
				if p98[4] == nil then
					if 0.02 < tick() - crackcd then
						v104({ "hitsound", "general" }, "plasma", v795.trailB, 0.1, true, false);
					end;
					crackcd = tick();
					v795.trailB.debrisA.Enabled = true;
					v795.trailB.debrisB.Enabled = true;
					v795.trailB.smoke.Enabled = true;
					v795.trailB.spark.Enabled = true;
					v795.trailB.debrisA:Emit(math.random(3, 6));
					v795.trailB.debrisB:Emit(math.random(3, 6));
					v795.trailB.smoke:Emit(math.random(2, 4));
					v795.trailB.spark:Emit(math.random(8, 12));
					v795.trailB.debrisA.Enabled = false;
					v795.trailB.debrisB.Enabled = false;
					v795.trailB.smoke.Enabled = false;
					v795.trailB.spark.Enabled = false;
				end;
				if p98[3] ~= nil then
					v795.Beam.Color = ColorSequence.new(Color3.new(0.6392156862745098, 0.13333333333333333, 1));
				end;
				delay(0.3, function()
					local v796 = 1 - 1;
					while true do
						v795.Beam.Transparency = NumberSequence.new(v796 / 25);
						RS:wait();
						if 0 <= 1 then
							if v796 < 25 then

							else
								break;
							end;
						elseif 25 < v796 then

						else
							break;
						end;
						v796 = v796 + 1;					
					end;
					v795:Destroy();
				end);
				local v797 = l__game__6.ReplicatedStorage.effects.laserFX:Clone();
				if p98[3] ~= nil then
					local v798, v799, v800 = ipairs(v797:GetChildren());
					while true do
						local v801, v802 = v798(v799, v800);
						if v801 then

						else
							break;
						end;
						v800 = v801;
						if v802:IsA("ParticleEmitter") then
							v802.Color = ColorSequence.new(Color3.new(0.6392156862745098, 0.13333333333333333, 1));
						end;					
					end;
				end;
				l__Debris__32:AddItem(v797, 1);
				v797.CFrame = CFrame.new(p98[1]);
				v797.Parent = l__workspace__1.NoTarget;
				spawn(function()
					v797.flash.Enabled = true;
					v797.flash:Emit(1);
					v797.flash.Enabled = false;
					v797.crystal.Enabled = true;
					v797.crystal:Emit(math.random(2, 4));
					v797.crystal.Enabled = false;
					v797.spark.Enabled = true;
					v797.spark:Emit(math.random(4, 8));
					v797.spark.Enabled = false;
					v797.flare.Enabled = true;
					v797.flare:Emit(1);
					v797.flare.Enabled = false;
				end);
			elseif p96 ~= "bowarrow" then
				if p96 == "bowarrow_ignore" then
					local v803 = l__game__6.ReplicatedStorage.effects.bowtrail:Clone();
					v803.CFrame = p98[1];
					v803.Parent = l__workspace__1.NoTarget;
					RS:wait();
					v803.CFrame = p98[1];
					local v804 = baselayer;
					if p96 == "bowarrow_ignore" then
						v804 = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, l__workspace__1.PlayerShootThroughs, l__workspace__1.activeFriendlies, l__workspace__1.activeHostiles };
					end;
					local v805, v806 = raycastline(p98[1].p, p98[1].LookVector + p98[2], 80, v804);
					RS:wait();
					v803.CFrame = CFrame.new(v806);
					if v805 == nil then
						local v807 = v806;
						local v808 = 1 - 1;
						while true do
							local v809, v810 = raycastline(v807, p98[1].LookVector + p98[2] + Vector3.new(0, -0.05, 0), 3, v804);
							v803.CFrame = CFrame.new(v810);
							if v809 then
								break;
							end;
							v807 = v810;
							RS:wait();
							if 0 <= 1 then
								if v808 < 200 then

								else
									break;
								end;
							elseif 200 < v808 then

							else
								break;
							end;
							v808 = v808 + 1;						
						end;
					end;
					l__Debris__32:AddItem(v803, 5);
				elseif p96 == "vomit" then
					if p97:FindFirstChild("Head") == nil then
						return;
					end;
					local v811 = l__game__6.ReplicatedStorage.effects.vomitBlock:Clone();
					v811.CFrame = p97.Head.CFrame;
					l__Debris__32:AddItem(v811, 3);
					local v812 = Instance.new("Weld");
					v812.Part0 = p97.Head;
					v812.Part1 = v811;
					v811.Parent = p97.Head;
					v812.Parent = v811;
					delay(1, function()
						v811.sickParticle.Enabled = false;
					end);
				elseif p96 == "lostecho" then
					if current_in_echo == true then
						return;
					end;
					current_in_echo = true;
					agent_speak("echo_start");
					local v813 = l__game__6.ReplicatedStorage.misc.echo_bg:Clone();
					v813.Parent = p98[1].hoverpart;
					v813.Adornee = p98[1].hoverpart;
					local v814 = 0;
					local v815 = tick();
					local v816 = 0.03;
					local v817 = 11;
					local v818 = tick();
					while true do
						if v816 <= tick() - v815 then
							v815 = tick();
							v816 = math.random(20, 40) / 1000;
							v814 = v814 + 1;
							v813.loading.Text = tostring(v814) .. "%";
							v813.loadingbar.bar.Size = UDim2.new(v814 / 100, 0, 3, 0);
						end;
						if 0.05 <= tick() - v818 then
							if 0 < v817 then
								v818 = tick();
								v817 = v817 - 1;
								v813.loadingbar.Visible = not v813.loadingbar.Visible;
							end;
						end;
						v813.loading.TextTransparency = v813.loading.TextTransparency - 0.03;
						v813.ring.ImageTransparency = v813.ring.ImageTransparency - 0.03;
						v813.ring.Size = v813.ring.Size:Lerp(UDim2.new(1, 0, 1, 0), 0.1);
						RS:wait();
						if not (100 <= v814) then

						else
							break;
						end;
						if p98[1] ~= nil then

						else
							break;
						end;					
					end;
					v813:Destroy();
					if p98[1] then
						v104({ "general_ui" }, "echo_open", p98[1].hoverpart, 0.01, true, false);
						local v819 = l__game__6.ReplicatedStorage.effects.echoball:Clone();
						l__Debris__32:AddItem(v819, 20);
						v819.CFrame = p98[1].hoverpart.CFrame;
						v819.Parent = l__CurrentCamera__1;
						spawn(function()
							while true do
								v819.Size = v819.Size + Vector3.new(1, 1, 1);
								v819.Transparency = v819.Transparency + 0.05;
								RS:wait();
								if not (1 <= v819.Transparency) then

								else
									break;
								end;							
							end;
							delay(1.5, function()
								v819.fx.Enabled = false;
							end);
						end);
						if l__game__6.ReplicatedStorage.echo:FindFirstChild(p98[2]) then
							local v820 = l__game__6.ReplicatedStorage.echo:FindFirstChild(p98[2]):Clone();
							v820.Parent = l__CurrentCamera__1;
							local v821, v822, v823 = ipairs(v820:GetChildren());
							while true do
								local v824, v825 = v821(v822, v823);
								if v824 then

								else
									break;
								end;
								v823 = v824;
								if v825:FindFirstChild("torso") then
									spawn(function()
										local v826 = l__game__6.ReplicatedStorage.effects.echoball:Clone();
										l__Debris__32:AddItem(v826, 10);
										v826.Material = Enum.Material.Neon;
										v826.CFrame = v825.torso.CFrame;
										v826.fx.Enabled = false;
										v826.Parent = l__CurrentCamera__1;
										v826.flash:Emit(math.random(10, 20));
										while true do
											v826.Size = v826.Size + Vector3.new(0.5, 0.5, 0.5);
											v826.Transparency = v826.Transparency + 0.1;
											RS:wait();
											if not (1 <= v826.Transparency) then

											else
												break;
											end;										
										end;
									end);
								end;							
							end;
							if p98[2] == "mountain" then
								delay(1.5, function()
									v104({ "echo_specific" }, "seat", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3.5, function()
									v104({ "firearms" }, "rack", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(1, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3, function()
									v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.2, function()
									v104({ "echo_specific" }, "seat", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(5.9, function()
									v104({ "weapons", "Fists" }, "swingvar2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6, function()
									v104({ "hitsound", "melee" }, "fists", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9, function()
									v104({ "general" }, "reloadpartial", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(12, function()
									v104({ "weapons", "RFL" }, "Model 870", p98[1].hoverpart, nil, true, false, true);
								end);
							elseif p98[2] == "ship" then
								delay(1, function()
									v104({ "echo_specific" }, "lighter", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2, function()
									v104({ "echo_specific" }, "lighter", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3, function()
									v104({ "echo_specific" }, "lighter", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(1.5, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2.5, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3.5, function()
									v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.5, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6, function()
									v104({ "world_item" }, "ration_pickup", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.5, function()
									v104({ "weapons", "1HBL" }, "draw", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9, function()
									v104({ "weapons", "1HBL" }, "chargeswing", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.3, function()
									v104({ "deaths" }, "axe_hit", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.3, function()
									v104({ "deaths" }, "slash", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.4, function()
									v104({ "world_item" }, "ration_pickup", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.4, function()
									v104({ "general" }, "reloaddone", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.6, function()
									v104({ "echo_specific" }, "running", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10, function()
									v104({ "weapons", "ASMG" }, "M60-E6", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(11, function()
									v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.11, function()
									v104({ "weapons", "ASMG" }, "M60-E6", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(11.11, function()
									v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.22, function()
									v104({ "weapons", "ASMG" }, "M60-E6", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.32, function()
									v104({ "firearms" }, "impact_bullet1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(11.22, function()
									v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.33, function()
									v104({ "weapons", "ASMG" }, "M60-E6", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(11.33, function()
									v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.44, function()
									v104({ "weapons", "ASMG" }, "M60-E6", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.54, function()
									v104({ "firearms" }, "impact_bullet2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(11.44, function()
									v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(11.1, function()
									v104({ "echo_specific" }, "running", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(13, function()
									v104({ "weapons", "Item" }, "medikitcap", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(13.5, function()
									v104({ "weapons", "Item" }, "medikitspit", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(14, function()
									v104({ "weapons", "Item" }, "medikitflick", p98[1].hoverpart, nil, true, false, true);
								end);
							elseif p98[2] == "valley" then
								delay(0.5, function()
									v104({ "weapons", "Item" }, "esmarch", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(1, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3.5, function()
									v104({ "general" }, "reloadpartial", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.8, function()
									v104({ "weapons", "2HPST" }, "draw", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.4, function()
									v104({ "weapons", "PST" }, "Glock 17", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.5, function()
									v104({ "firearms" }, "impact_bullet1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7.2, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.6, function()
									v104({ "reloads" }, "single_start", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7, function()
									v104({ "weapons", "PST" }, "Glock 17", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7.1, function()
									v104({ "firearms" }, "impact_bullet3", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8, function()
									v104({ "reloads" }, "pistol_mid", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7.2, function()
									v104({ "weapons", "2HPST" }, "Mark VII", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.4, function()
									v104({ "firearms" }, "casing_medium", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7.9, function()
									v104({ "hitsound", "extras" }, "grapple2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.6, function()
									v104({ "weapons", "2HPST" }, "Mark VII", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.6, function()
									v104({ "firearms" }, "casing_medium", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.7, function()
									v104({ "deaths" }, "headshot2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(11, function()
									v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(12, function()
									v104({ "weapons", "2HPST" }, "Mark VII", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(13, function()
									v104({ "firearms" }, "casing_medium", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(12, function()
									v104({ "deaths" }, "headshot1", p98[1].hoverpart, nil, true, false, true);
								end);
							elseif p98[2] == "market" then
								delay(1, function()
									v104({ "rations" }, "liquid_sip", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2, function()
									v104({ "rations" }, "liquid_sip", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3, function()
									v104({ "rations" }, "liquid_sip", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3.5, function()
									v104({ "movement_sounds" }, "movement", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3.8, function()
									v104({ "echo_specific" }, "seat", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.5, function()
									v104({ "weapons", "2HPST" }, "draw", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.6, function()
									v104({ "weapons", "ASMG" }, "draw", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.7, function()
									v104({ "weapons", "SMG" }, "draw", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.8, function()
									v104({ "weapons", "PST" }, "draw", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8, function()
									v104({ "general" }, "reloadpartial", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.5, function()
									v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.6, function()
									v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.7, function()
									v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.8, function()
									v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.9, function()
									v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9, function()
									v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.5, function()
									v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.7, function()
									v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.8, function()
									v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.9, function()
									v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.4, function()
									v104({ "weapons", "PST" }, "Glock 17", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.4, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.7, function()
									v104({ "weapons", "PST" }, "Glock 17", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.7, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9, function()
									v104({ "weapons", "PST" }, "Glock 17", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.7, function()
									v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.7, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.2, function()
									v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.2, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(11, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(12, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(13, function()
									v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(14, function()
									v104({ "world_item" }, "ration_pickup", p98[1].hoverpart, nil, true, false, true);
								end);
							elseif p98[2] == "base" then
								delay(0.5, function()
									v104({ "general" }, "writing", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(1, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(5, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6, function()
									v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4, function()
									v104({ "AGENT" }, "blip", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(5, function()
									v104({ "AGENT" }, "bliptwo", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7, function()
									v104({ "echo_specific" }, "glass", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8, function()
									v104({ "weapons", "PST" }, "draw", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.5, function()
									v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.7, function()
									v104({ "firearms" }, "impact_bullet2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.5, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9, function()
									v104({ "weapons", "SMG" }, "draw", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.2, function()
									v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.4, function()
									v104({ "firearms" }, "impact_bullet1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.2, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.5, function()
									v104({ "weapons", "2HPST" }, "A.J.M. 9", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.7, function()
									v104({ "hitsound", "guns" }, "bullet_impact1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.5, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.554, function()
									v104({ "weapons", "2HPST" }, "A.J.M. 9", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.754, function()
									v104({ "hitsound", "guns" }, "bullet_impact2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.8, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.608, function()
									v104({ "weapons", "2HPST" }, "A.J.M. 9", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.808, function()
									v104({ "hitsound", "guns" }, "bullet_impact3", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(11, function()
									v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(13, function()
									v104({ "world_item" }, "ration_pickup", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(13.5, function()
									v104({ "echo_specific" }, "running", p98[1].hoverpart, nil, true, false, true);
								end);
							elseif p98[2] == "tower" then
								delay(0.5, function()
									v104({ "weapons", "Fists" }, "swingvar2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(0.6, function()
									v104({ "hitsound", "melee" }, "fists", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(1.1, function()
									v104({ "weapons", "Fists" }, "swingvar1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(1.2, function()
									v104({ "hitsound", "melee" }, "fists", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2, function()
									v104({ "general" }, "shove", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2.1, function()
									v104({ "general" }, "shove_landed", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2.4, function()
									v104({ "echo_specific" }, "fall", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2.8, function()
									v104({ "general" }, "falldamage1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2.8, function()
									v104({ "echo_specific" }, "rope", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2.8, function()
									v104({ "echo_specific" }, "bone", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9, function()
									v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
							elseif p98[2] == "castle" then
								delay(0.5, function()
									v104({ "harvesting" }, "stonebreak", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(1.5, function()
									v104({ "harvesting" }, "stonebreak", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(1, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2, function()
									v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3, function()
									v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2.5, function()
									v104({ "harvesting" }, "stonebreak", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2.6, function()
									v104({ "echo_specific" }, "wall2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2.7, function()
									v104({ "echo_specific" }, "wall", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3, function()
									v104({ "ai" }, "ai_sprint", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(2.9, function()
									v104({ "shadow" }, "skinner_noise5", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3.5, function()
									v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4, function()
									v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.1, function()
									v104({ "firearms" }, "empty", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.4, function()
									v104({ "deaths" }, "cut_tear", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.45, function()
									v104({ "deaths" }, "flesh", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(3.5, function()
									v104({ "echo_specific" }, "running", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.8, function()
									v104({ "general" }, "blockraise", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(5.3, function()
									v104({ "hitsound", "general" }, "hitblocked", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.7, function()
									v104({ "hitsound", "general" }, "hitblocked", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.8, function()
									v104({ "weapons", "2H" }, "swingvar1", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.9, function()
									v104({ "deaths" }, "headbonk", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(4.5, function()
									v104({ "reloads" }, "rifle_mid", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(5, function()
									v104({ "general" }, "reloaddone", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.3, function()
									v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.392, function()
									v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.484, function()
									v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.576, function()
									v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.668, function()
									v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.76, function()
									v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.852, function()
									v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(6.944, function()
									v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7.036, function()
									v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7.1, function()
									v104({ "firearms" }, "empty", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7.5, function()
									v104({ "firearms" }, "click", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7.8, function()
									v104({ "firearms" }, "click", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.1, function()
									v104({ "firearms" }, "click", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(7.3, function()
									v104({ "shadow" }, "skinner_noise2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9, function()
									v104({ "ai" }, "ai_sprint", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(8.8, function()
									v104({ "weapons", "1HBL" }, "chargeswing", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9, function()
									v104({ "deaths" }, "neck", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9, function()
									v104({ "hitsound", "general" }, "hitblocked", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(9.5, function()
									v104({ "hitsound", "extras" }, "grapple2", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.3, function()
									v104({ "hitsound", "general" }, "hitbackstab", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(10.3, function()
									v104({ "deaths" }, "slash", p98[1].hoverpart, nil, true, false, true);
								end);
								delay(11, function()
									v104({ "shadow" }, "skinner_noise4", p98[1].hoverpart, nil, true, false, true);
								end);
							end;
							local v827 = tick();
							while true do
								RS:wait();
								if not (15 <= tick() - v827) then

								else
									break;
								end;							
							end;
							agent_speak("echo_end");
							local v828, v829, v830 = ipairs(v820:GetChildren());
							while true do
								local v831, v832 = v828(v829, v830);
								if v831 then

								else
									break;
								end;
								v830 = v831;
								if v832:FindFirstChild("torso") then
									local v833 = l__game__6.ReplicatedStorage.effects.echoball:Clone();
									l__Debris__32:AddItem(v833, 10);
									v833.Material = Enum.Material.Neon;
									v833.CFrame = v832.torso.CFrame;
									v833.fx.Enabled = false;
									v833.Parent = l__CurrentCamera__1;
									v833.flash:Emit(math.random(10, 20));
									spawn(function()
										while true do
											v833.Size = v833.Size + Vector3.new(0.5, 0.5, 0.5);
											v833.Transparency = v833.Transparency + 0.1;
											RS:wait();
											if not (1 <= v833.Transparency) then

											else
												break;
											end;										
										end;
									end);
								end;							
							end;
							v820:Destroy();
							v104({ "general_ui" }, "echo_close", p98[1].hoverpart, 0.01, true, false);
							current_in_echo = false;
						end;
					end;
				elseif p96 == "scanarea" then
					if p98[1] ~= nil then
						local l__activestats__834 = v20.scan.activestats;
						local v835 = l__game__6.ReplicatedStorage.effects.scanball:Clone();
						l__Debris__32:AddItem(v835, 20);
						v835.CFrame = p98[1];
						v835.Parent = l__CurrentCamera__1;
						if p97 == character then
							spawn(function()
								local v836 = tick();
								maingui.PerkFrame.durationbar.Visible = true;
								maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1, 0, 1, 0);
								while true do
									maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1 - math.clamp((tick() - v836) / l__activestats__834.scanlast, 0, 1), 0, 1, 0);
									RS:wait();
									if not (l__activestats__834.scanlast <= tick() - v836) then

									else
										break;
									end;								
								end;
								maingui.PerkFrame.durationbar.Visible = false;
							end);
						end;
						spawn(function()
							local v837, v838, v839 = ipairs(l__workspace__1.Interactables:GetChildren());
							while true do
								local v840, v841 = v837(v838, v839);
								if v840 then

								else
									break;
								end;
								if v841:FindFirstChild("Interact") then
									if (v841.Interact.Position - p98[1].p).magnitude <= l__activestats__834.studsscan then
										if v841.Name ~= "Heavy Ammo" then
											if v841.Name ~= "Shells Ammo" then
												if v841.Name ~= "Light Ammo" then
													if v841.Name ~= "Long Ammo" then
														if v841.Name ~= "Short Ammo" then
															if v841.Name ~= "Medium Ammo" then
																if v841.Name == "Small Ammo" then
																	u92(v841.Interact, false, l__activestats__834.scanlast);
																else
																	u92(v841.Interact, false, l__activestats__834.scanlast);
																end;
															else
																u92(v841.Interact, false, l__activestats__834.scanlast);
															end;
														else
															u92(v841.Interact, false, l__activestats__834.scanlast);
														end;
													else
														u92(v841.Interact, false, l__activestats__834.scanlast);
													end;
												else
													u92(v841.Interact, false, l__activestats__834.scanlast);
												end;
											else
												u92(v841.Interact, false, l__activestats__834.scanlast);
											end;
										else
											u92(v841.Interact, false, l__activestats__834.scanlast);
										end;
									end;
								end;
								if v841:FindFirstChild("HarvestWood") then
									if (v841.HarvestWood.Position - p98[1].p).magnitude <= l__activestats__834.studsscan then
										u92(v841.HarvestWood, false, l__activestats__834.scanlast);
									end;
								end;
								if v841:FindFirstChild("HarvestStone") then
									if (v841.HarvestStone.Position - p98[1].p).magnitude <= l__activestats__834.studsscan then
										u92(v841.HarvestStone, false, l__activestats__834.scanlast);
									end;
								end;							
							end;
							local v842, v843, v844 = ipairs(l__workspace__1.WeaponDrops:GetChildren());
							while true do
								local v845, v846 = v842(v843, v844);
								if v845 then

								else
									break;
								end;
								v844 = v845;
								if v846:FindFirstChild("JointGrip") then
									if (v846.JointGrip.Position - p98[1].p).magnitude <= l__activestats__834.studsscan then
										u92(v846.JointGrip, false, l__activestats__834.scanlast);
									end;
								end;							
							end;
							local v847, v848, v849 = ipairs(l__workspace__1.activeHostiles:GetChildren());
							while true do
								local v850, v851 = v847(v848, v849);
								if v850 then

								else
									break;
								end;
								v849 = v850;
								if v851:FindFirstChild("Torso") then
									if v851:FindFirstChild("Head") then
										if v851:FindFirstChild("Humanoid") then
											if 0 <= v851.Humanoid.Health then
												if (v851.Torso.Position - p98[1].p).magnitude <= l__activestats__834.studsscan then
													local v852 = l__game__6.ReplicatedStorage.effects.health_scanned:Clone();
													l__Debris__32:AddItem(v852, l__activestats__834.scanlast);
													v852.Adornee = v851.Torso;
													v852.Parent = ply.PlayerGui;
													v852.update_health.Disabled = false;
												end;
											end;
										end;
									end;
								end;							
							end;
						end);
						spawn(function()
							while true do
								v835.Size = v835.Size + Vector3.new(2, 2, 2);
								v835.Transparency = v835.Transparency + 0.025;
								RS:wait();
								if not (1 <= v835.Transparency) then

								else
									break;
								end;							
							end;
							delay(3, function()
								v835.fx.Enabled = false;
							end);
						end);
					end;
				elseif p96 == "player_ping" then
					if p98[1] ~= nil then
						if l__workspace__1.NoTarget:FindFirstChild(p98[2] .. "PING_CAT" .. p98[3]) then
							l__workspace__1.NoTarget:FindFirstChild(p98[2] .. "PING_CAT" .. p98[3]):Destroy();
						end;
						local v853 = l__game__6.ReplicatedStorage.misc.ping_indicator:Clone();
						v853.Name = p98[2] .. "PING_CAT" .. p98[3];
						l__Debris__32:AddItem(v853, 20);
						v853.CFrame = CFrame.new(p98[1]);
						v853.bb.pinger.Text = p98[2];
						v853.Parent = l__workspace__1.NoTarget;
						local v854 = v853.bb:FindFirstChild("ping_cat" .. p98[3]);
						if v854 then
							v854.Visible = true;
							local v855 = v854:Clone();
							v855.Parent = v853.bb;
							spawn(function()
								while true do
									if v855 then
										if v854 then
											v855.Size = v855.Size + UDim2.new(0, 2, 0, 2);
											v855.ImageTransparency = v855.ImageTransparency + 0.05;
										end;
									end;
									RS:wait();
									if not (1 <= v855.ImageTransparency) then

									else
										break;
									end;
									if v854 ~= nil then

									else
										break;
									end;								
								end;
								v855:Destroy();
							end);
						end;
						local v856 = "ping_area";
						if p98[3] == 2 then
							v856 = "ping_enemy";
						elseif p98[3] == 3 then
							v856 = "ping_item";
						end;
						v104({ "general_ui" }, v856, nil, nil, true, true);
						local v857 = maingui.teammatesframe:FindFirstChild(p98[2]);
						if v857 then
							if v857:FindFirstChild("empty") then
								local v858 = "[Moving Here]";
								local v859 = Color3.fromRGB(255, 182, 122);
								if p98[3] == 3 then
									v859 = Color3.fromRGB(122, 232, 92);
									v858 = "[Marked " .. p98[4] .. "]";
								elseif p98[3] == 2 then
									v859 = Color3.fromRGB(216, 60, 60);
									v858 = "[Hostile]";
								elseif p98[3] == 4 then
									v859 = Color3.fromRGB(102, 137, 255);
									v858 = "[Located " .. p98[4] .. "]";
								elseif p98[3] == 5 then
									v859 = Color3.fromRGB(183, 89, 255);
									v858 = "[" .. p98[4] .. "]";
								end;
								local v860 = l__game__6.ReplicatedStorage.misc.ping_text:Clone();
								l__Debris__32:AddItem(v860, 6);
								v860.TextColor3 = v859;
								v860.Text = v858;
								v860.bg.ImageColor3 = v859;
								if v857:FindFirstChild("empty"):FindFirstChild("ping_text") then
									v857:FindFirstChild("empty"):FindFirstChild("ping_text"):Destroy();
								end;
								v860.Parent = v857:FindFirstChild("empty");
								spawn(function()
									while true do
										if v860 then
											if v860:FindFirstChild("bg") then
												v860.bg.ImageTransparency = v860.bg.ImageTransparency + 0.05;
												v860.bg.Size = v860.bg.Size + UDim2.new(0, 2, 0, 0);
											end;
										end;
										RS:wait();
										if v860 ~= nil then

										else
											break;
										end;
										if v860:FindFirstChild("bg") ~= nil then

										else
											break;
										end;
										if not (1 <= v860.bg.ImageTransparency) then

										else
											break;
										end;									
									end;
								end);
							end;
						end;
					end;
				elseif p96 == "selfscan" then
					local l__activestats__95 = v20.scan.activestats;
					spawn(function()
						local v861, v862, v863 = ipairs(l__workspace__1.Interactables:GetChildren());
						while true do
							local v864, v865 = v861(v862, v863);
							if v864 then

							else
								break;
							end;
							if v865:FindFirstChild("Interact") then
								if (v865.Interact.Position - character.HumanoidRootPart.Position).magnitude <= l__activestats__95.scan_around then
									if v865.Name ~= "Heavy Ammo" then
										if v865.Name ~= "Shells Ammo" then
											if v865.Name ~= "Light Ammo" then
												if v865.Name ~= "Long Ammo" then
													if v865.Name ~= "Short Ammo" then
														if v865.Name ~= "Medium Ammo" then
															if v865.Name == "Small Ammo" then
																u92(v865.Interact, true, l__activestats__95.scan_around_timer);
															else
																u92(v865.Interact, true, l__activestats__95.scan_around_timer);
															end;
														else
															u92(v865.Interact, true, l__activestats__95.scan_around_timer);
														end;
													else
														u92(v865.Interact, true, l__activestats__95.scan_around_timer);
													end;
												else
													u92(v865.Interact, true, l__activestats__95.scan_around_timer);
												end;
											else
												u92(v865.Interact, true, l__activestats__95.scan_around_timer);
											end;
										else
											u92(v865.Interact, true, l__activestats__95.scan_around_timer);
										end;
									else
										u92(v865.Interact, true, l__activestats__95.scan_around_timer);
									end;
								end;
							end;
							if v865:FindFirstChild("HarvestWood") then
								if (v865.HarvestWood.Position - character.HumanoidRootPart.Position).magnitude <= l__activestats__95.scan_around then
									u92(v865.HarvestWood, true, l__activestats__95.scan_around_timer);
								end;
							end;
							if v865:FindFirstChild("HarvestStone") then
								if (v865.HarvestStone.Position - character.HumanoidRootPart.Position).magnitude <= l__activestats__95.scan_around then
									u92(v865.HarvestStone, true, l__activestats__95.scan_around_timer);
								end;
							end;						
						end;
						local v866, v867, v868 = ipairs(l__workspace__1.WeaponDrops:GetChildren());
						while true do
							local v869, v870 = v866(v867, v868);
							if v869 then

							else
								break;
							end;
							v868 = v869;
							if v870:FindFirstChild("JointGrip") then
								if (v870.JointGrip.Position - character.HumanoidRootPart.Position).magnitude <= l__activestats__95.scan_around then
									u92(v870.JointGrip, true, l__activestats__95.scan_around_timer);
								end;
							end;						
						end;
					end);
				elseif p96 == "tased" then
					local v871 = createfxoutline("tasedParticle", 1.7);
				elseif p96 == "decap" then
					if p97:FindFirstChild("Head") == nil then
						return;
					end;
					local l__Head__872 = p97.Head;
					local v873 = l__game__6.ReplicatedStorage.effects.gFX.decap.decapstump:Clone();
					v873.CFrame = p97.Torso.CFrame;
					local v874 = Instance.new("Weld");
					v874.Part0 = v873;
					v874.Part1 = p97.Torso;
					v874.C1 = CFrame.new(0, 1, 0);
					v874.Parent = v873;
					v873.Parent = p97;
					local v875 = l__game__6.ReplicatedStorage.effects.gFX.decap.decapblock:Clone();
					local v876 = Instance.new("Weld");
					v876.Part0 = v875;
					v876.Part1 = l__Head__872;
					v876.Parent = v875;
					v876.Parent = p97;
					v875.Parent = p97;
					spawn(function()
						local v877 = tick();
						local v878 = tick();
						while true do
							if v873 then

							else
								break;
							end;
							if 0.5 <= tick() - v878 then
								v878 = tick();
								bloodtrailfx(v873.Position, 40, true);
							end;
							RS:wait();
							if not (3 <= tick() - v877) then

							else
								return;
							end;						
						end;
					end);
					l__Head__872.CFrame = l__Head__872.CFrame * CFrame.new(0, 0.2, 0);
					RS:wait();
					l__Head__872.Velocity = l__Head__872.Velocity + Vector3.new(math.random(-10, 10), 25, math.random(-10, 10));
				elseif p96 == "crush" then
					local v879, v880, v881 = ipairs(p97:GetChildren());
					while true do
						local v882, v883 = v879(v880, v881);
						if v882 then

						else
							break;
						end;
						v881 = v882;
						if v883:IsA("Accessory") then
							v883:Destroy();
						end;					
					end;
					local v884, v885, v886 = ipairs(p97.Head:GetChildren());
					while true do
						local v887, v888 = v884(v885, v886);
						if v887 then

						else
							break;
						end;
						v886 = v887;
						if v888:IsA("Decal") then
							v888:Destroy();
						end;					
					end;
					if p97:FindFirstChild("Outfit") then
						if p97:FindFirstChild("Outfit"):FindFirstChild("Head") then
							local v889, v890, v891 = ipairs(p97:FindFirstChild("Outfit"):GetChildren());
							while true do
								local v892, v893 = v889(v890, v891);
								if v892 then

								else
									break;
								end;
								v891 = v892;
								if v893.Name == "Head" then
									v893:Destroy();
								end;							
							end;
						end;
					end;
					local l__Head__894 = p97.Head;
					local v895 = l__game__6.ReplicatedStorage.effects.gFX.crush.splat:Clone();
					l__Debris__32:AddItem(v895, 9);
					v895.CFrame = p97.Head.CFrame;
					v895.fx1:Emit(math.random(5, 10));
					v895.fx2:Emit(math.random(3, 5));
					v895.Parent = l__workspace__1.NoTarget;
					local v896 = l__game__6.ReplicatedStorage.effects.gFX.crush.bonestump:Clone();
					v896.CFrame = p97.Torso.CFrame;
					local v897 = Instance.new("Weld");
					v897.Part0 = v896;
					v897.Part1 = p97.Torso;
					v897.C1 = CFrame.new(0, 1, 0);
					v897.Parent = v896;
					v896.Parent = p97;
					bloodtrailfx(v896.Position, 80, true);
					p97.Head:Destroy();
					local v898 = { "gib", "bone" };
					local v899 = math.random(8, 15);
					local v900 = 1 - 1;
					while true do
						local v901 = l__game__6.ReplicatedStorage.effects.gFX.crush[v898[math.random(1, 2)]]:Clone();
						l__Debris__32:AddItem(v901, 7);
						v901.CFrame = l__Head__894.CFrame * CFrame.new(math.random(-15, 10) / 100, math.random(-15, 10) / 100, math.random(-15, 10) / 100);
						v901.Parent = l__workspace__1.NoTarget;
						v901.Velocity = v901.Velocity + Vector3.new(math.random(-6, 6), math.random(5, 15), math.random(-6, 6));
						if 0 <= 1 then
							if v900 < v899 then

							else
								break;
							end;
						elseif v899 < v900 then

						else
							break;
						end;
						v900 = v900 + 1;					
					end;
				elseif p96 == "arrowimpact" then
					local v902 = l__game__6.ReplicatedStorage.effects.gFX.arrowdeath.arrowimpact:Clone();
					v902.CFrame = p97.Head.CFrame;
					local v903 = Instance.new("Weld");
					v903.Part0 = v902;
					v903.Part1 = p97.Head;
					v903.Parent = v902;
					v902.Parent = p97;
					v902.gorepoint.bleedpoint1.splat.Enabled = true;
					v902.gorepoint.bleedpoint2.splat.Enabled = true;
					v902.gorepoint.bleedpoint1.splat:Emit(30, 50);
					v902.gorepoint.bleedpoint2.splat:Emit(30, 50);
					v902.gorepoint.bleedpoint1.splat.Enabled = false;
					v902.gorepoint.bleedpoint2.splat.Enabled = false;
				elseif p96 == "headshot_gun" then
					local v904 = l__game__6.ReplicatedStorage.effects.gFX.headshotdeath.headshotimpact:Clone();
					v904.CFrame = p97.Head.CFrame;
					local v905 = Instance.new("Weld");
					v905.Part0 = v904;
					v905.Part1 = p97.Head;
					v905.Parent = v904;
					v904.Parent = p97;
					v904.gorepoint.bleedpoint1.splat.Enabled = true;
					v904.gorepoint.bleedpoint1.cloud.Enabled = true;
					v904.gorepoint.bleedpoint2.splat.Enabled = true;
					v904.gorepoint.bleedpoint1.cloud:Emit(1, 3);
					v904.gorepoint.bleedpoint1.splat:Emit(30, 50);
					v904.gorepoint.bleedpoint2.splat:Emit(30, 50);
					v904.gorepoint.bleedpoint1.splat.Enabled = false;
					v904.gorepoint.bleedpoint1.cloud.Enabled = false;
					v904.gorepoint.bleedpoint2.splat.Enabled = false;
					v104({ "deaths" }, "headshot" .. math.random(1, 2), p97.Head, nil, true, false);
					v104({ "deaths" }, "decap", p97.Head, nil, true, false);
					spawn(function()
						local v906 = tick();
						local v907 = tick();
						while true do
							if p97 then

							else
								break;
							end;
							if p97:FindFirstChild("Head") then

							else
								break;
							end;
							if 0.2 <= tick() - v907 then
								v907 = tick();
								bloodtrailfx(p97.Head.Position, 10, true);
							end;
							RS:wait();
							if not (3 <= tick() - v906) then

							else
								return;
							end;						
						end;
					end);
					if p98 ~= nil then
						if p98 == "self" then
							v904.gorepoint.Transparency = 1;
							v904.gorepoint.bleedpoint1.drip.Enabled = false;
							v904.gorepoint.bleedpoint2.drip.Enabled = false;
						end;
					end;
				elseif p96 ~= "head_bonk" then
					if p96 == "axe_embed" then
						local v908 = l__game__6.ReplicatedStorage.effects.gFX.blunthead.headbonk:Clone();
						v908.CFrame = p97.Head.CFrame;
						local v909 = Instance.new("Weld");
						v909.Part0 = v908;
						v909.Part1 = p97.Head;
						v909.Parent = v908;
						v908.Parent = p97;
						RS:wait();
						v908.gorepoint.bleedpoint1.splat.Enabled = true;
						v908.gorepoint.bleedpoint1.cloud.Enabled = true;
						v908.gorepoint.bleedpoint1.cloud:Emit(1, 3);
						v908.gorepoint.bleedpoint1.splat:Emit(15, 30);
						v908.gorepoint.bleedpoint1.splat.Enabled = false;
						v908.gorepoint.bleedpoint1.cloud.Enabled = false;
						if p96 == "head_bonk" then
							v104({ "deaths" }, "headbonk", p97.Head, nil, true, false);
						else
							local v910 = l__game__6.ReplicatedStorage.effects.gFX.axe_head.axed:Clone();
							v910.CFrame = p97.Head.CFrame;
							local v911 = Instance.new("Weld");
							v911.Part0 = v910;
							v911.Part1 = p97.Head;
							v911.Parent = v910;
							v910.Parent = p97;
							v104({ "deaths" }, "tear", p97.Head, nil, true, false);
							v104({ "deaths" }, "axe_hit", p97.Head, nil, true, false);
						end;
					elseif p96 ~= "take_limbs_arms" then
						if p96 == "take_limbs_legs" then
							local v912 = l__game__6.ReplicatedStorage.effects.gFX.limbremove.torsopart:Clone();
							v912.CFrame = p97.Torso.CFrame;
							local v913 = Instance.new("Weld");
							v913.Part0 = v912;
							v913.Part1 = p97.Torso;
							v913.Parent = v912;
							local v914 = "Left Arm";
							if math.random(1, 2) == 1 then
								v914 = "Right Arm";
							end;
							if p96 == "take_limbs_legs" then
								v914 = "Left Leg";
								if math.random(1, 2) == 1 then
									v914 = "Right Leg";
								end;
							end;
							local v915, v916, v917 = ipairs(v912:GetChildren());
							while true do
								local v918, v919 = v915(v916, v917);
								if v918 then

								else
									break;
								end;
								v917 = v918;
								if v919:IsA("BasePart") then
									if v919.Name ~= v914 then
										v919:Destroy();
									end;
								end;							
							end;
							v912.Parent = p97;
							if p97:FindFirstChild(v914) then
								p97:FindFirstChild(v914):Destroy();
							end;
							if p97:FindFirstChild("Outfit") then
								if p96 == "take_limbs_legs" then
									if p97.Outfit:FindFirstChild("Bottom") then
										if p97.Outfit.Bottom:FindFirstChild(v914) then
											p97.Outfit.Bottom:FindFirstChild(v914):Destroy();
										end;
									end;
								elseif p97.Outfit:FindFirstChild("Top") then
									if p97.Outfit.Top:FindFirstChild(v914) then
										p97.Outfit.Top:FindFirstChild(v914):Destroy();
									end;
								end;
							end;
							v104({ "deaths" }, "flesh", p97.Torso, nil, true, false);
							v104({ "deaths" }, "gurgle", p97.Torso, nil, true, false);
							v912:FindFirstChild(v914).attach.cloud.Enabled = true;
							v912:FindFirstChild(v914).attach.gib.Enabled = true;
							v912:FindFirstChild(v914).attach.cloud:Emit(math.random(1, 3));
							v912:FindFirstChild(v914).attach.gib:Emit(math.random(3, 7));
							v912:FindFirstChild(v914).attach.cloud.Enabled = false;
							v912:FindFirstChild(v914).attach.gib.Enabled = false;
						elseif p96 == "torso_cut" then
							local v920 = l__game__6.ReplicatedStorage.effects.gFX.torsocut.Torso:Clone();
							v920.CFrame = p97.Torso.CFrame;
							local v921 = Instance.new("Weld");
							v921.Part0 = v920;
							v921.Part1 = p97.Torso;
							v921.Parent = v920;
							v920.Parent = p97.Torso;
						elseif p96 == "pukedeath" then
							v104({ "deaths" }, "gurgle", p97.Head, nil, true, false);
							delay(0.5, function()
								v104({ "deaths" }, "puke", p97.Head, nil, true, false);
								local v922 = l__game__6.ReplicatedStorage.effects.gFX.pukedeath.puke:Clone();
								v922.CFrame = p97.Head.CFrame;
								local v923 = Instance.new("Weld");
								v923.Part0 = v922;
								v923.Part1 = p97.Head;
								v923.Parent = v922;
								v922.Parent = p97;
								v922.pukepoint.splat.Enabled = true;
								v922.pukepoint.splat2.Enabled = true;
								v922.pukepoint.splat:Emit(math.random(10, 20));
								v922.pukepoint.splat2:Emit(math.random(10, 20));
								RS:wait();
								v922.pukepoint.splat.Enabled = false;
								v922.pukepoint.splat2.Enabled = false;
							end);
						elseif p96 == "stomachrip" then
							local v924 = l__game__6.ReplicatedStorage.effects.gFX.spearstomach.torsoFX:Clone();
							v924.CFrame = p97.Torso.CFrame;
							local v925 = Instance.new("Weld");
							v925.Part0 = v924;
							v925.Part1 = p97.Torso;
							v925.Parent = v924;
							v924.Parent = p97;
							v924.fxpart.splat:Emit(30, 50);
							v924.fxpart.splat2:Emit(15, 30);
							local v926 = math.random(6, 10);
							local v927 = 1 - 1;
							while true do
								local v928 = l__game__6.ReplicatedStorage.effects.gFX.spearstomach.gib:Clone();
								l__Debris__32:AddItem(v928, 7);
								v928.CFrame = p97.Torso.CFrame * CFrame.new(math.random(-15, 10) / 100, math.random(-15, 10) / 100, math.random(-15, 10) / 100);
								v928.Parent = l__workspace__1.NoTarget;
								v928.Velocity = v928.Velocity + p97.Torso.CFrame.lookVector * 3;
								if 0 <= 1 then
									if v927 < v926 then

									else
										break;
									end;
								elseif v926 < v927 then

								else
									break;
								end;
								v927 = v927 + 1;							
							end;
						elseif p96 == "neckcut" then
							local v929 = l__game__6.ReplicatedStorage.effects.gFX.neckcut.fx:Clone();
							l__Debris__32:AddItem(v929, 9);
							v929.CFrame = p97.Torso.CFrame;
							local v930 = Instance.new("Weld");
							v930.Part0 = v929;
							v930.Part1 = p97.Torso;
							v930.Parent = v929;
							v930.Parent = p97;
							v929.Parent = p97;
							delay(2, function()
								v929.point.drip.Enabled = false;
								v929.point.fx1.Enabled = false;
							end);
							v929.point.fx2:Emit(1);
							v929.point.gib:Emit(math.random(2, 5));
							local v931 = l__game__6.ReplicatedStorage.effects.gFX.neckcut.neckpart:Clone();
							l__Debris__32:AddItem(v931, 7);
							v931.CFrame = p97.Head.CFrame + p97.Head.CFrame.lookVector * 1;
							v931.Parent = l__workspace__1.NoTarget;
							v931.Velocity = v931.Velocity + p97.Head.CFrame.lookVector * 3;
							spawn(function()
								local v932 = tick();
								local v933 = tick();
								while true do
									if v929 then

									else
										break;
									end;
									if 0.4 <= tick() - v933 then
										v933 = tick();
										bloodtrailfx(v929.point.WorldPosition, 1, true);
									end;
									RS:wait();
									if not (4 <= tick() - v932) then

									else
										return;
									end;								
								end;
							end);
						elseif p96 == "explosive" then
							local l__HumanoidRootPart__934 = p97:FindFirstChild("HumanoidRootPart");
							if l__HumanoidRootPart__934 then

							else
								return;
							end;
							local v935, v936, v937 = ipairs(p97:GetChildren());
							while true do
								local v938, v939 = v935(v936, v937);
								if v938 then

								else
									break;
								end;
								v937 = v938;
								if v939.Name ~= "Torso" then
									if v939.Name ~= "Humanoid" then
										if v939.Name ~= "active" then
											v939:Destroy();
										elseif v939:IsA("BasePart") then
											v939.Transparency = 1;
											local v940, v941, v942 = ipairs(v939:GetChildren());
											while true do
												local v943, v944 = v940(v941, v942);
												if v943 then

												else
													break;
												end;
												v942 = v943;
												if v944:IsA("Decal") then
													v944:Destroy();
												end;											
											end;
										end;
									elseif v939:IsA("BasePart") then
										v939.Transparency = 1;
										v940, v941, v942 = ipairs(v939:GetChildren());
										while true do
											v943, v944 = v940(v941, v942);
											if v943 then

											else
												break;
											end;
											v942 = v943;
											if v944:IsA("Decal") then
												v944:Destroy();
											end;										
										end;
									end;
								elseif v939:IsA("BasePart") then
									v939.Transparency = 1;
									v940, v941, v942 = ipairs(v939:GetChildren());
									while true do
										v943, v944 = v940(v941, v942);
										if v943 then

										else
											break;
										end;
										v942 = v943;
										if v944:IsA("Decal") then
											v944:Destroy();
										end;									
									end;
								end;							
							end;
							if p97:FindFirstChild("Torso") then
								p97:FindFirstChild("Torso").Anchored = true;
								p97:FindFirstChild("Torso").Transparency = 1;
							end;
							local v945 = l__game__6.ReplicatedStorage.effects.gFX.explosion.explosiongib:Clone();
							l__Debris__32:AddItem(v945, 10);
							v945.CFrame = CFrame.new(l__HumanoidRootPart__934.Position) * CFrame.new(0, 1, 0);
							v945.Parent = l__workspace__1.NoTarget;
							v945.cloud:Emit(math.random(5, 8));
							v945.dust:Emit(math.random(5, 8));
							v945.expandcloud:Emit(math.random(5, 8));
							v945.gib:Emit(math.random(8, 12));
							local v946 = math.random(8, 12);
							local v947 = 1 - 1;
							while true do
								local v948 = l__game__6.ReplicatedStorage.effects.gFX.crush.gib:Clone();
								l__Debris__32:AddItem(v948, 7);
								v948.CFrame = v945.CFrame * CFrame.new(math.random(-15, 10) / 100, math.random(-15, 10) / 100, math.random(-15, 10) / 100);
								v948.Parent = l__workspace__1.NoTarget;
								v948.Velocity = v948.Velocity + Vector3.new(math.random(-12, 12), math.random(15, 20), math.random(-12, 12));
								if 0 <= 1 then
									if v947 < v946 then

									else
										break;
									end;
								elseif v946 < v947 then

								else
									break;
								end;
								v947 = v947 + 1;							
							end;
						elseif p96 == "armcut" then
							local v949 = l__game__6.ReplicatedStorage.effects.gFX.armcut.cutarm:Clone();
							local u96 = l__game__6.ReplicatedStorage.effects.gFX.armcut.torsocopy:Clone();
							spawn(function()
								local v950 = tick();
								local v951 = tick();
								while true do
									if u96 then

									else
										break;
									end;
									if 0.4 <= tick() - v951 then
										v951 = tick();
										bloodtrailfx(u96.a0.WorldPosition, 1, true);
									end;
									RS:wait();
									if not (3 <= tick() - v950) then

									else
										return;
									end;								
								end;
							end);
							u96.beam.Attachment0 = u96.a0;
							u96.beam.Attachment1 = v949.a1;
							local v952 = Instance.new("Weld");
							v952.Part0 = u96;
							v952.Part1 = p97.Torso;
							v952.Parent = u96;
							u96.Parent = p97;
							v949.CFrame = p97["Left Arm"].CFrame;
							local v953 = Instance.new("Weld");
							v953.Part0 = v949;
							v953.Part1 = p97["Left Arm"];
							v953.Parent = v949;
							v949.Parent = p97["Left Arm"];
							bloodtrailfx(p97["Left Arm"].Position, 30);
							p97["Left Arm"].Velocity = p97["Left Arm"].Velocity + -p97.Torso.CFrame.rightVector * 5;
							delay(0.5, function()
								local v954 = 1 - 1;
								while true do
									local v955 = 1.5 * (1 - v954 / 15);
									u96.beam.Width0 = v955;
									u96.beam.Width1 = v955;
									RS:wait();
									if 0 <= 1 then
										if v954 < 15 then

										else
											break;
										end;
									elseif 15 < v954 then

									else
										break;
									end;
									v954 = v954 + 1;								
								end;
								u96.beam:Destroy();
							end);
						elseif p96 == "slice" then
							local v956, v957, v958 = ipairs(p97.Torso:GetChildren());
							while true do
								local v959, v960 = v956(v957, v958);
								if v959 then

								else
									break;
								end;
								v958 = v959;
								if v960:IsA("Decal") then
									v960:Destroy();
								end;							
							end;
							local l__Shirt__961 = p97:FindFirstChild("Shirt");
							if l__Shirt__961 == nil then
								local l__Pants__962 = p97:FindFirstChild("Pants");
								if l__Pants__962 == nil then
									local v963 = "";
								else
									v963 = l__Pants__962.PantsTemplate;
								end;
							else
								v963 = l__Shirt__961.ShirtTemplate;
							end;
							local v964 = l__game__6.ReplicatedStorage.effects.gFX.slice.slicehalf:Clone();
							v964.BrickColor = p97.Torso.BrickColor;
							v964.TextureID = v963;
							v964.CFrame = p97.Torso.CFrame;
							local v965 = Instance.new("Weld");
							v965.Part0 = v964;
							v965.Part1 = p97.Torso;
							v965.C1 = CFrame.new(0.6, 0, 0);
							v965.Parent = v964;
							v964.Parent = p97;
							bloodtrailfx(v964.b0.WorldPosition, 80);
							p97.Torso.Transparency = 1;
							local v966 = l__game__6.ReplicatedStorage.effects.gFX.slice.otherslicehalf:Clone();
							local l__Shirt__967 = p97:FindFirstChild("Shirt");
							if l__Shirt__967 then
								l__Shirt__967:Clone().Parent = v966;
							end;
							local l__Pants__968 = p97:FindFirstChild("Pants");
							if l__Pants__968 then
								l__Pants__968:Clone().Parent = v966;
							end;
							local v969, v970, v971 = ipairs(v966:GetChildren());
							while true do
								local v972, v973 = v969(v970, v971);
								if v972 then

								else
									break;
								end;
								v971 = v972;
								if p97:FindFirstChild(v973.Name) then
									if v973:IsA("BasePart") then
										v973.BrickColor = p97:FindFirstChild(v973.Name).BrickColor;
									end;
								end;							
							end;
							v966.Torso.otherhalf.BrickColor = p97.Torso.BrickColor;
							v966.Torso.otherhalf.TextureID = v963;
							v966:SetPrimaryPartCFrame(p97.Torso.CFrame);
							v966.Parent = p97;
							v964.beam1.Attachment1 = v966.Torso.otherhalf.a1;
							v964.beam2.Attachment1 = v966.Torso.otherhalf.b1;
							v964.beam3.Attachment1 = v966.Torso.otherhalf.c1;
							p97["Left Arm"]:Destroy();
							p97["Left Leg"]:Destroy();
							RS:wait();
							v966.Humanoid.PlatformStand = true;
							v966.Torso.Velocity = v966.Torso.Velocity + v966.Torso.CFrame.rightVector * 6;
							if p97.Torso:FindFirstChild("Neck") then
								p97.Torso.Neck.C1 = CFrame.new(-0.341941595, -0.544243574, 0.0124545023, -0.951813221, 0, -0.306678385, -0.301639259, 0.180534005, 0.936173737, 0.0553658754, 0.983568728, -0.171834648);
								p97.Torso.Neck.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0);
							end;
							delay(0.5, function()
								local v974 = 1 - 1;
								while true do
									local v975 = 1.5 * (1 - v974 / 15);
									v964.beam1.Width0 = v975;
									v964.beam1.Width1 = v975;
									v964.beam2.Width0 = v975;
									v964.beam2.Width1 = v975;
									v964.beam3.Width0 = v975;
									v964.beam3.Width1 = v975;
									RS:wait();
									if 0 <= 1 then
										if v974 < 15 then

										else
											break;
										end;
									elseif 15 < v974 then

									else
										break;
									end;
									v974 = v974 + 1;								
								end;
								v964.beam1:Destroy();
								v964.beam2:Destroy();
								v964.beam3:Destroy();
							end);
						end;
					else
						v912 = l__game__6.ReplicatedStorage.effects.gFX.limbremove.torsopart:Clone();
						v912.CFrame = p97.Torso.CFrame;
						v913 = Instance.new("Weld");
						v913.Part0 = v912;
						v913.Part1 = p97.Torso;
						v913.Parent = v912;
						v914 = "Left Arm";
						if math.random(1, 2) == 1 then
							v914 = "Right Arm";
						end;
						if p96 == "take_limbs_legs" then
							v914 = "Left Leg";
							if math.random(1, 2) == 1 then
								v914 = "Right Leg";
							end;
						end;
						v915, v916, v917 = ipairs(v912:GetChildren());
						while true do
							v918, v919 = v915(v916, v917);
							if v918 then

							else
								break;
							end;
							v917 = v918;
							if v919:IsA("BasePart") then
								if v919.Name ~= v914 then
									v919:Destroy();
								end;
							end;						
						end;
						v912.Parent = p97;
						if p97:FindFirstChild(v914) then
							p97:FindFirstChild(v914):Destroy();
						end;
						if p97:FindFirstChild("Outfit") then
							if p96 == "take_limbs_legs" then
								if p97.Outfit:FindFirstChild("Bottom") then
									if p97.Outfit.Bottom:FindFirstChild(v914) then
										p97.Outfit.Bottom:FindFirstChild(v914):Destroy();
									end;
								end;
							elseif p97.Outfit:FindFirstChild("Top") then
								if p97.Outfit.Top:FindFirstChild(v914) then
									p97.Outfit.Top:FindFirstChild(v914):Destroy();
								end;
							end;
						end;
						v104({ "deaths" }, "flesh", p97.Torso, nil, true, false);
						v104({ "deaths" }, "gurgle", p97.Torso, nil, true, false);
						v912:FindFirstChild(v914).attach.cloud.Enabled = true;
						v912:FindFirstChild(v914).attach.gib.Enabled = true;
						v912:FindFirstChild(v914).attach.cloud:Emit(math.random(1, 3));
						v912:FindFirstChild(v914).attach.gib:Emit(math.random(3, 7));
						v912:FindFirstChild(v914).attach.cloud.Enabled = false;
						v912:FindFirstChild(v914).attach.gib.Enabled = false;
					end;
				else
					v908 = l__game__6.ReplicatedStorage.effects.gFX.blunthead.headbonk:Clone();
					v908.CFrame = p97.Head.CFrame;
					v909 = Instance.new("Weld");
					v909.Part0 = v908;
					v909.Part1 = p97.Head;
					v909.Parent = v908;
					v908.Parent = p97;
					RS:wait();
					v908.gorepoint.bleedpoint1.splat.Enabled = true;
					v908.gorepoint.bleedpoint1.cloud.Enabled = true;
					v908.gorepoint.bleedpoint1.cloud:Emit(1, 3);
					v908.gorepoint.bleedpoint1.splat:Emit(15, 30);
					v908.gorepoint.bleedpoint1.splat.Enabled = false;
					v908.gorepoint.bleedpoint1.cloud.Enabled = false;
					if p96 == "head_bonk" then
						v104({ "deaths" }, "headbonk", p97.Head, nil, true, false);
					else
						v910 = l__game__6.ReplicatedStorage.effects.gFX.axe_head.axed:Clone();
						v910.CFrame = p97.Head.CFrame;
						v911 = Instance.new("Weld");
						v911.Part0 = v910;
						v911.Part1 = p97.Head;
						v911.Parent = v910;
						v910.Parent = p97;
						v104({ "deaths" }, "tear", p97.Head, nil, true, false);
						v104({ "deaths" }, "axe_hit", p97.Head, nil, true, false);
					end;
				end;
			else
				v803 = l__game__6.ReplicatedStorage.effects.bowtrail:Clone();
				v803.CFrame = p98[1];
				v803.Parent = l__workspace__1.NoTarget;
				RS:wait();
				v803.CFrame = p98[1];
				v804 = baselayer;
				if p96 == "bowarrow_ignore" then
					v804 = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, l__workspace__1.PlayerShootThroughs, l__workspace__1.activeFriendlies, l__workspace__1.activeHostiles };
				end;
				v805, v806 = raycastline(p98[1].p, p98[1].LookVector + p98[2], 80, v804);
				RS:wait();
				v803.CFrame = CFrame.new(v806);
				if v805 == nil then
					v807 = v806;
					v808 = 1 - 1;
					while true do
						v809, v810 = raycastline(v807, p98[1].LookVector + p98[2] + Vector3.new(0, -0.05, 0), 3, v804);
						v803.CFrame = CFrame.new(v810);
						if v809 then
							break;
						end;
						v807 = v810;
						RS:wait();
						if 0 <= 1 then
							if v808 < 200 then

							else
								break;
							end;
						elseif 200 < v808 then

						else
							break;
						end;
						v808 = v808 + 1;					
					end;
				end;
				l__Debris__32:AddItem(v803, 5);
			end;
		elseif p96 == "firegun" then
			v772 = l__game__6.ReplicatedStorage.effects.gunTrail:Clone();
			l__Debris__32:AddItem(v772, 3);
			v772.trailA.CFrame = CFrame.new(p98[1]);
			v772.trailB.CFrame = CFrame.new(p98[2]);
			v772.Parent = l__workspace__1.NoTarget;
			v773 = 1;
			if p98[6] then
				if 80 <= p98[6] then
					v773 = 5;
				end;
			end;
			v774 = l__game__6.ReplicatedStorage.effects.bullet_trail:Clone();
			l__Debris__32:AddItem(v774, v773);
			v774.CFrame = CFrame.new(p98[1], p98[2]);
			v774.CFrame = v774.CFrame + v774.CFrame.lookVector * math.random(2, 10);
			if p98[3] == false then
				v774.Parent = l__workspace__1.NoTarget;
				if p98[6] then
					if 80 <= p98[6] then
						v774.smoketrail2.Enabled = true;
					end;
				end;
				spawn(function()
					v774.Velocity = v774.Velocity + v774.CFrame.lookVector * 1000;
					v774.Touched:connect(function(p99)
						if v774 then
							if p99.Locked == false then
								v774.Anchored = true;
								v774.Transparency = 1;
							end;
						end;
					end);
				end);
			end;
			if p98[4] == nil then
				if 0.02 < tick() - crackcd then
					if p98[5] == nil then
						v104({ "firearms" }, "crack" .. math.random(1, 4), v772.trailB, 0.1, true, false);
					end;
					v104({ "firearms" }, "impact_bullet" .. math.random(1, 3), v772.trailB, 0.1, true, false);
					if p98[6] then
						if 80 <= p98[6] then
							v104({ "firearms" }, "large_impact", v772.trailB, 0.1, true, false);
						end;
					end;
				end;
				crackcd = tick();
				v772.trailB.debrisA.Enabled = true;
				v772.trailB.debrisB.Enabled = true;
				v772.trailB.smoke.Enabled = true;
				v772.trailB.spark.Enabled = true;
				v772.trailB.debrisA:Emit(math.random(3, 6));
				v772.trailB.debrisB:Emit(math.random(3, 6));
				v772.trailB.smoke:Emit(math.random(2, 4));
				v772.trailB.spark:Emit(math.random(8, 12));
				v772.trailB.debrisA.Enabled = false;
				v772.trailB.debrisB.Enabled = false;
				v772.trailB.smoke.Enabled = false;
				v772.trailB.spark.Enabled = false;
				if p98[6] then
					if 80 <= p98[6] then
						v772.trailB.strongsmoke1:Emit(math.random(4, 8));
						v772.trailB.strongsmoke2:Emit(math.random(6, 10));
					end;
				end;
			else
				v104({ "hitsound", "guns" }, "bullet_impact" .. math.random(1, 3), v772.trailB, 0.1, true, false);
				if p98[6] then
					if 80 <= p98[6] then
						v104({ "hitsound", "guns" }, "bullet_heavy" .. math.random(1, 3), v772.trailB, 0.1, true, false);
					end;
				end;
			end;
			if p98[5] == nil then
				v775 = l__game__6.ReplicatedStorage.effects.gunFX:Clone();
				l__Debris__32:AddItem(v775, 1);
				v775.CFrame = CFrame.new(p98[1]);
				v775.Parent = l__workspace__1.NoTarget;
				spawn(function()
					if p98[3] == false then
						v775.flash.Enabled = true;
						v775.flash:Emit(1);
						v775.flash.Enabled = false;
						v776 = l__game__6.ReplicatedStorage.misc.muzzleflash:Clone();
						l__Debris__32:AddItem(v776, 0.05);
						v776.Parent = v775;
					end;
					v775.smoke.Enabled = true;
					v775.smoke2.Enabled = true;
					v775.smoke:Emit(math.random(2, 4));
					v775.smoke2:Emit(math.random(4, 6));
					v775.smoke.Enabled = false;
					v775.smoke2.Enabled = false;
					if p98[6] then
						if 80 <= p98[6] then
							v775.strong_smoke:Emit(math.random(1, 2));
							v775.strong_smoke2:Emit(math.random(4, 6));
						end;
					end;
				end);
			end;
		elseif p96 == "gunricochet" then
			v777 = l__game__6.ReplicatedStorage.effects.bulletricochet:Clone();
			l__Debris__32:AddItem(v777, 3);
			v777.CFrame = CFrame.new(p98[1]);
			v777.Parent = l__workspace__1.NoTarget;
			if 0.02 < tick() - ricochetcrackcd then
				ricochetcrackcd = tick();
				v104({ "firearms" }, "ricochet", v777, 0.1, true, false);
			end;
			ricochetcrackcd = tick();
			v777.spark:Emit(math.random(10, 15));
			v777.spark2:Emit(1);
			v777.spark3:Emit(1);
			spawn(function()
				v778 = math.random(2, 4);
				v779 = 1 - 1;
				while true do
					v780 = l__game__6.ReplicatedStorage.effects.bulletricochettrail:Clone();
					l__Debris__32:AddItem(v777, 2);
					v780.CFrame = v777.CFrame;
					v780.Parent = l__workspace__1.NoTarget;
					v780.Velocity = Vector3.new(math.random(-100, 100), math.random(0, 100), math.random(-100, 100)) / 5;
					if 0 <= 1 then
						if v779 < v778 then

						else
							break;
						end;
					elseif v778 < v779 then

					else
						break;
					end;
					v779 = v779 + 1;				
				end;
			end);
		elseif p96 == "shadow_stake" then
			v781 = l__game__6.ReplicatedStorage.misc.stake_trail:Clone();
			l__Debris__32:AddItem(v781, 2);
			v781.CFrame = CFrame.new(p98[1], p98[2]);
			v781.CFrame = v781.CFrame + v781.CFrame.lookVector;
			v781.Parent = l__workspace__1.NoTarget;
			spawn(function()
				RS:wait();
				v781.Velocity = v781.Velocity + v781.CFrame.lookVector * 400;
			end);
		elseif p96 == "incendiary_trail" then
			v782 = l__game__6.ReplicatedStorage.effects.incendiary_trail:Clone();
			l__Debris__32:AddItem(v782, 3);
			v782.trailA.CFrame = CFrame.new(p98[1]);
			v782.trailB.CFrame = CFrame.new(p98[2]);
			v782.Parent = l__workspace__1.NoTarget;
			if 0.02 < tick() - specialcrackcd then
				v104({ "firearms" }, "incendiary_crack", v782.trailB, 0.1, true, false);
			end;
			specialcrackcd = tick();
			v782.trailB.ember:Emit(math.random(8, 12));
			v782.trailB.flame:Emit(math.random(5, 10));
			v782.trailB.small:Emit(math.random(5, 10));
			spawn(function()
				v783 = 1 - 1;
				while true do
					v782.Beam.Transparency = NumberSequence.new(v783 / 20);
					RS:wait();
					if 0 <= 1 then
						if v783 < 20 then

						else
							break;
						end;
					elseif 20 < v783 then

					else
						break;
					end;
					v783 = v783 + 1;				
				end;
			end);
		elseif p96 == "muzzle_flash" then
			v784 = l__game__6.ReplicatedStorage.effects.gunFX:Clone();
			l__Debris__32:AddItem(v784, 1);
			v784.CFrame = CFrame.new(p98[1]);
			v784.Parent = l__workspace__1.NoTarget;
			spawn(function()
				if p98[2] == false then
					v784.flash.Enabled = true;
					v784.flash:Emit(1);
					v784.flash.Enabled = false;
					v785 = l__game__6.ReplicatedStorage.misc.muzzleflash:Clone();
					l__Debris__32:AddItem(v785, 0.05);
					v785.Parent = v784;
				end;
				v784.smoke.Enabled = true;
				v784.smoke2.Enabled = true;
				v784.smoke:Emit(math.random(4, 6));
				v784.smoke2:Emit(math.random(6, 8));
				v784.smoke.Enabled = false;
				v784.smoke2.Enabled = false;
				if p98[3] then
					if 80 <= p98[3] then
						v784.strong_smoke:Emit(math.random(2, 4));
						v784.strong_smoke2:Emit(math.random(6, 8));
					end;
				end;
			end);
		elseif p96 == "hangerPopup" then
			local function v786()
				v787 = { "YOU ARE WORTHLESS", "USELESS", "YOU ARE HOPELESS", "HOPELESS", "DIE", "GIVE UP", "YOU ARE USELESS", "WORTHLESS", "MEANINGLESS", "YOU ARE MEANINGLESS" };
				if v64[1] == "shadow" then
					v787 = { "YOU ARE A FAKER", "HOPELESS", "JOIN US", "USURPER", "HERETIC", "GIVE UP", "FAKER", "TRAITOR", "YOU ARE A TRAITOR", "YOU ARE A HERETIC" };
				end;
				v788 = l__game__6.ReplicatedStorage.soundLibrary.general_ui.static:Clone();
				v788.TimePosition = math.random(1, 30);
				v788.Parent = l__CurrentCamera__1;
				v789 = { "4452726587", "4452726886", "4452727160", "4452727454" };
				v790 = math.random(1, 4);
				v791 = l__game__6.ReplicatedStorage.misc.hangertext:Clone();
				v791.static.Image = "rbxassetid://" .. v789[v790];
				v791.popuptext.Text = v787[math.random(1, #v787)];
				v792 = math.random(20, 80) / 100;
				v793 = math.random(10, 90) / 100;
				v791.popuptext.Position = UDim2.new(v792, 0, v793, 0);
				u93 = 0;
				u94 = v790;
				spawn(function()
					v788:Play();
					v791.Parent = ply.PlayerGui;
					v794 = tick();
					while true do
						v791.popuptext.Position = UDim2.new(v792, math.random(-10, 10), v793, math.random(-10, 10));
						if 0.05 <= tick() - u93 then
							u93 = tick();
							u94 = u94 + 1;
							if 4 < u94 then
								u94 = 1;
							end;
							v791.static.Image = "rbxassetid://" .. v789[u94];
						end;
						RS:wait();
						if not (0.3 <= tick() - v794) then

						else
							break;
						end;					
					end;
					v791:Destroy();
					v788:Destroy();
				end);
			end;
			if character:FindFirstChild("HumanoidRootPart") then
				if (character:FindFirstChild("HumanoidRootPart").Position - p97.Position).magnitude <= 30 then
					v786();
					if (character:FindFirstChild("HumanoidRootPart").Position - p97.Position).magnitude <= 15 then
						delay(1.5, function()
							v786();
						end);
					end;
				end;
			end;
		elseif p96 == "firelaser" then
			v795 = l__game__6.ReplicatedStorage.effects.laserTrail:Clone();
			l__Debris__32:AddItem(v795, 3);
			v795.trailA.CFrame = CFrame.new(p98[1]);
			v795.trailB.CFrame = CFrame.new(p98[2]);
			v795.Parent = l__workspace__1.NoTarget;
			if p98[4] == nil then
				if 0.02 < tick() - crackcd then
					v104({ "hitsound", "general" }, "plasma", v795.trailB, 0.1, true, false);
				end;
				crackcd = tick();
				v795.trailB.debrisA.Enabled = true;
				v795.trailB.debrisB.Enabled = true;
				v795.trailB.smoke.Enabled = true;
				v795.trailB.spark.Enabled = true;
				v795.trailB.debrisA:Emit(math.random(3, 6));
				v795.trailB.debrisB:Emit(math.random(3, 6));
				v795.trailB.smoke:Emit(math.random(2, 4));
				v795.trailB.spark:Emit(math.random(8, 12));
				v795.trailB.debrisA.Enabled = false;
				v795.trailB.debrisB.Enabled = false;
				v795.trailB.smoke.Enabled = false;
				v795.trailB.spark.Enabled = false;
			end;
			if p98[3] ~= nil then
				v795.Beam.Color = ColorSequence.new(Color3.new(0.6392156862745098, 0.13333333333333333, 1));
			end;
			delay(0.3, function()
				v796 = 1 - 1;
				while true do
					v795.Beam.Transparency = NumberSequence.new(v796 / 25);
					RS:wait();
					if 0 <= 1 then
						if v796 < 25 then

						else
							break;
						end;
					elseif 25 < v796 then

					else
						break;
					end;
					v796 = v796 + 1;				
				end;
				v795:Destroy();
			end);
			v797 = l__game__6.ReplicatedStorage.effects.laserFX:Clone();
			if p98[3] ~= nil then
				v798, v799, v800 = ipairs(v797:GetChildren());
				while true do
					v801, v802 = v798(v799, v800);
					if v801 then

					else
						break;
					end;
					v800 = v801;
					if v802:IsA("ParticleEmitter") then
						v802.Color = ColorSequence.new(Color3.new(0.6392156862745098, 0.13333333333333333, 1));
					end;				
				end;
			end;
			l__Debris__32:AddItem(v797, 1);
			v797.CFrame = CFrame.new(p98[1]);
			v797.Parent = l__workspace__1.NoTarget;
			spawn(function()
				v797.flash.Enabled = true;
				v797.flash:Emit(1);
				v797.flash.Enabled = false;
				v797.crystal.Enabled = true;
				v797.crystal:Emit(math.random(2, 4));
				v797.crystal.Enabled = false;
				v797.spark.Enabled = true;
				v797.spark:Emit(math.random(4, 8));
				v797.spark.Enabled = false;
				v797.flare.Enabled = true;
				v797.flare:Emit(1);
				v797.flare.Enabled = false;
			end);
		elseif p96 ~= "bowarrow" then
			if p96 == "bowarrow_ignore" then
				v803 = l__game__6.ReplicatedStorage.effects.bowtrail:Clone();
				v803.CFrame = p98[1];
				v803.Parent = l__workspace__1.NoTarget;
				RS:wait();
				v803.CFrame = p98[1];
				v804 = baselayer;
				if p96 == "bowarrow_ignore" then
					v804 = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, l__workspace__1.PlayerShootThroughs, l__workspace__1.activeFriendlies, l__workspace__1.activeHostiles };
				end;
				v805, v806 = raycastline(p98[1].p, p98[1].LookVector + p98[2], 80, v804);
				RS:wait();
				v803.CFrame = CFrame.new(v806);
				if v805 == nil then
					v807 = v806;
					v808 = 1 - 1;
					while true do
						v809, v810 = raycastline(v807, p98[1].LookVector + p98[2] + Vector3.new(0, -0.05, 0), 3, v804);
						v803.CFrame = CFrame.new(v810);
						if v809 then
							break;
						end;
						v807 = v810;
						RS:wait();
						if 0 <= 1 then
							if v808 < 200 then

							else
								break;
							end;
						elseif 200 < v808 then

						else
							break;
						end;
						v808 = v808 + 1;					
					end;
				end;
				l__Debris__32:AddItem(v803, 5);
			elseif p96 == "vomit" then
				if p97:FindFirstChild("Head") == nil then
					return;
				end;
				v811 = l__game__6.ReplicatedStorage.effects.vomitBlock:Clone();
				v811.CFrame = p97.Head.CFrame;
				l__Debris__32:AddItem(v811, 3);
				v812 = Instance.new("Weld");
				v812.Part0 = p97.Head;
				v812.Part1 = v811;
				v811.Parent = p97.Head;
				v812.Parent = v811;
				delay(1, function()
					v811.sickParticle.Enabled = false;
				end);
			elseif p96 == "lostecho" then
				if current_in_echo == true then
					return;
				end;
				current_in_echo = true;
				agent_speak("echo_start");
				v813 = l__game__6.ReplicatedStorage.misc.echo_bg:Clone();
				v813.Parent = p98[1].hoverpart;
				v813.Adornee = p98[1].hoverpart;
				v814 = 0;
				v815 = tick();
				v816 = 0.03;
				v817 = 11;
				v818 = tick();
				while true do
					if v816 <= tick() - v815 then
						v815 = tick();
						v816 = math.random(20, 40) / 1000;
						v814 = v814 + 1;
						v813.loading.Text = tostring(v814) .. "%";
						v813.loadingbar.bar.Size = UDim2.new(v814 / 100, 0, 3, 0);
					end;
					if 0.05 <= tick() - v818 then
						if 0 < v817 then
							v818 = tick();
							v817 = v817 - 1;
							v813.loadingbar.Visible = not v813.loadingbar.Visible;
						end;
					end;
					v813.loading.TextTransparency = v813.loading.TextTransparency - 0.03;
					v813.ring.ImageTransparency = v813.ring.ImageTransparency - 0.03;
					v813.ring.Size = v813.ring.Size:Lerp(UDim2.new(1, 0, 1, 0), 0.1);
					RS:wait();
					if not (100 <= v814) then

					else
						break;
					end;
					if p98[1] ~= nil then

					else
						break;
					end;				
				end;
				v813:Destroy();
				if p98[1] then
					v104({ "general_ui" }, "echo_open", p98[1].hoverpart, 0.01, true, false);
					v819 = l__game__6.ReplicatedStorage.effects.echoball:Clone();
					l__Debris__32:AddItem(v819, 20);
					v819.CFrame = p98[1].hoverpart.CFrame;
					v819.Parent = l__CurrentCamera__1;
					spawn(function()
						while true do
							v819.Size = v819.Size + Vector3.new(1, 1, 1);
							v819.Transparency = v819.Transparency + 0.05;
							RS:wait();
							if not (1 <= v819.Transparency) then

							else
								break;
							end;						
						end;
						delay(1.5, function()
							v819.fx.Enabled = false;
						end);
					end);
					if l__game__6.ReplicatedStorage.echo:FindFirstChild(p98[2]) then
						v820 = l__game__6.ReplicatedStorage.echo:FindFirstChild(p98[2]):Clone();
						v820.Parent = l__CurrentCamera__1;
						v821, v822, v823 = ipairs(v820:GetChildren());
						while true do
							v824, v825 = v821(v822, v823);
							if v824 then

							else
								break;
							end;
							v823 = v824;
							if v825:FindFirstChild("torso") then
								spawn(function()
									v826 = l__game__6.ReplicatedStorage.effects.echoball:Clone();
									l__Debris__32:AddItem(v826, 10);
									v826.Material = Enum.Material.Neon;
									v826.CFrame = v825.torso.CFrame;
									v826.fx.Enabled = false;
									v826.Parent = l__CurrentCamera__1;
									v826.flash:Emit(math.random(10, 20));
									while true do
										v826.Size = v826.Size + Vector3.new(0.5, 0.5, 0.5);
										v826.Transparency = v826.Transparency + 0.1;
										RS:wait();
										if not (1 <= v826.Transparency) then

										else
											break;
										end;									
									end;
								end);
							end;						
						end;
						if p98[2] == "mountain" then
							delay(1.5, function()
								v104({ "echo_specific" }, "seat", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3.5, function()
								v104({ "firearms" }, "rack", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(1, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3, function()
								v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.2, function()
								v104({ "echo_specific" }, "seat", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(5.9, function()
								v104({ "weapons", "Fists" }, "swingvar2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6, function()
								v104({ "hitsound", "melee" }, "fists", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9, function()
								v104({ "general" }, "reloadpartial", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(12, function()
								v104({ "weapons", "RFL" }, "Model 870", p98[1].hoverpart, nil, true, false, true);
							end);
						elseif p98[2] == "ship" then
							delay(1, function()
								v104({ "echo_specific" }, "lighter", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2, function()
								v104({ "echo_specific" }, "lighter", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3, function()
								v104({ "echo_specific" }, "lighter", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(1.5, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2.5, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3.5, function()
								v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.5, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6, function()
								v104({ "world_item" }, "ration_pickup", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.5, function()
								v104({ "weapons", "1HBL" }, "draw", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9, function()
								v104({ "weapons", "1HBL" }, "chargeswing", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.3, function()
								v104({ "deaths" }, "axe_hit", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.3, function()
								v104({ "deaths" }, "slash", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.4, function()
								v104({ "world_item" }, "ration_pickup", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.4, function()
								v104({ "general" }, "reloaddone", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.6, function()
								v104({ "echo_specific" }, "running", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10, function()
								v104({ "weapons", "ASMG" }, "M60-E6", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(11, function()
								v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.11, function()
								v104({ "weapons", "ASMG" }, "M60-E6", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(11.11, function()
								v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.22, function()
								v104({ "weapons", "ASMG" }, "M60-E6", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.32, function()
								v104({ "firearms" }, "impact_bullet1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(11.22, function()
								v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.33, function()
								v104({ "weapons", "ASMG" }, "M60-E6", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(11.33, function()
								v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.44, function()
								v104({ "weapons", "ASMG" }, "M60-E6", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.54, function()
								v104({ "firearms" }, "impact_bullet2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(11.44, function()
								v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(11.1, function()
								v104({ "echo_specific" }, "running", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(13, function()
								v104({ "weapons", "Item" }, "medikitcap", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(13.5, function()
								v104({ "weapons", "Item" }, "medikitspit", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(14, function()
								v104({ "weapons", "Item" }, "medikitflick", p98[1].hoverpart, nil, true, false, true);
							end);
						elseif p98[2] == "valley" then
							delay(0.5, function()
								v104({ "weapons", "Item" }, "esmarch", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(1, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3.5, function()
								v104({ "general" }, "reloadpartial", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.8, function()
								v104({ "weapons", "2HPST" }, "draw", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.4, function()
								v104({ "weapons", "PST" }, "Glock 17", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.5, function()
								v104({ "firearms" }, "impact_bullet1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7.2, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.6, function()
								v104({ "reloads" }, "single_start", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7, function()
								v104({ "weapons", "PST" }, "Glock 17", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7.1, function()
								v104({ "firearms" }, "impact_bullet3", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8, function()
								v104({ "reloads" }, "pistol_mid", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7.2, function()
								v104({ "weapons", "2HPST" }, "Mark VII", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.4, function()
								v104({ "firearms" }, "casing_medium", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7.9, function()
								v104({ "hitsound", "extras" }, "grapple2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.6, function()
								v104({ "weapons", "2HPST" }, "Mark VII", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.6, function()
								v104({ "firearms" }, "casing_medium", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.7, function()
								v104({ "deaths" }, "headshot2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(11, function()
								v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(12, function()
								v104({ "weapons", "2HPST" }, "Mark VII", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(13, function()
								v104({ "firearms" }, "casing_medium", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(12, function()
								v104({ "deaths" }, "headshot1", p98[1].hoverpart, nil, true, false, true);
							end);
						elseif p98[2] == "market" then
							delay(1, function()
								v104({ "rations" }, "liquid_sip", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2, function()
								v104({ "rations" }, "liquid_sip", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3, function()
								v104({ "rations" }, "liquid_sip", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3.5, function()
								v104({ "movement_sounds" }, "movement", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3.8, function()
								v104({ "echo_specific" }, "seat", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.5, function()
								v104({ "weapons", "2HPST" }, "draw", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.6, function()
								v104({ "weapons", "ASMG" }, "draw", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.7, function()
								v104({ "weapons", "SMG" }, "draw", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.8, function()
								v104({ "weapons", "PST" }, "draw", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8, function()
								v104({ "general" }, "reloadpartial", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.5, function()
								v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.6, function()
								v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.7, function()
								v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.8, function()
								v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.9, function()
								v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9, function()
								v104({ "weapons", "ASMG" }, "Modded AKM", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.5, function()
								v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.7, function()
								v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.8, function()
								v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.9, function()
								v104({ "firearms" }, "casing_heavy", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.4, function()
								v104({ "weapons", "PST" }, "Glock 17", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.4, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.7, function()
								v104({ "weapons", "PST" }, "Glock 17", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.7, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9, function()
								v104({ "weapons", "PST" }, "Glock 17", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.7, function()
								v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.7, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.2, function()
								v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.2, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(11, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(12, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(13, function()
								v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(14, function()
								v104({ "world_item" }, "ration_pickup", p98[1].hoverpart, nil, true, false, true);
							end);
						elseif p98[2] == "base" then
							delay(0.5, function()
								v104({ "general" }, "writing", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(1, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(5, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6, function()
								v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4, function()
								v104({ "AGENT" }, "blip", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(5, function()
								v104({ "AGENT" }, "bliptwo", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7, function()
								v104({ "echo_specific" }, "glass", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8, function()
								v104({ "weapons", "PST" }, "draw", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.5, function()
								v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.7, function()
								v104({ "firearms" }, "impact_bullet2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.5, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9, function()
								v104({ "weapons", "SMG" }, "draw", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.2, function()
								v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.4, function()
								v104({ "firearms" }, "impact_bullet1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.2, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.5, function()
								v104({ "weapons", "2HPST" }, "A.J.M. 9", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.7, function()
								v104({ "hitsound", "guns" }, "bullet_impact1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.5, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.554, function()
								v104({ "weapons", "2HPST" }, "A.J.M. 9", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.754, function()
								v104({ "hitsound", "guns" }, "bullet_impact2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.8, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.608, function()
								v104({ "weapons", "2HPST" }, "A.J.M. 9", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.808, function()
								v104({ "hitsound", "guns" }, "bullet_impact3", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(11, function()
								v104({ "firearms" }, "casing_light", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(13, function()
								v104({ "world_item" }, "ration_pickup", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(13.5, function()
								v104({ "echo_specific" }, "running", p98[1].hoverpart, nil, true, false, true);
							end);
						elseif p98[2] == "tower" then
							delay(0.5, function()
								v104({ "weapons", "Fists" }, "swingvar2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(0.6, function()
								v104({ "hitsound", "melee" }, "fists", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(1.1, function()
								v104({ "weapons", "Fists" }, "swingvar1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(1.2, function()
								v104({ "hitsound", "melee" }, "fists", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2, function()
								v104({ "general" }, "shove", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2.1, function()
								v104({ "general" }, "shove_landed", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2.4, function()
								v104({ "echo_specific" }, "fall", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2.8, function()
								v104({ "general" }, "falldamage1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2.8, function()
								v104({ "echo_specific" }, "rope", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2.8, function()
								v104({ "echo_specific" }, "bone", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9, function()
								v104({ "movement_sounds" }, "step4", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
						elseif p98[2] == "castle" then
							delay(0.5, function()
								v104({ "harvesting" }, "stonebreak", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(1.5, function()
								v104({ "harvesting" }, "stonebreak", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(1, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2, function()
								v104({ "movement_sounds" }, "step2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3, function()
								v104({ "movement_sounds" }, "step1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2.5, function()
								v104({ "harvesting" }, "stonebreak", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2.6, function()
								v104({ "echo_specific" }, "wall2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2.7, function()
								v104({ "echo_specific" }, "wall", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3, function()
								v104({ "ai" }, "ai_sprint", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(2.9, function()
								v104({ "shadow" }, "skinner_noise5", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3.5, function()
								v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4, function()
								v104({ "weapons", "PST" }, "M1911A1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.1, function()
								v104({ "firearms" }, "empty", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.4, function()
								v104({ "deaths" }, "cut_tear", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.45, function()
								v104({ "deaths" }, "flesh", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(3.5, function()
								v104({ "echo_specific" }, "running", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.8, function()
								v104({ "general" }, "blockraise", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(5.3, function()
								v104({ "hitsound", "general" }, "hitblocked", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.7, function()
								v104({ "hitsound", "general" }, "hitblocked", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.8, function()
								v104({ "weapons", "2H" }, "swingvar1", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.9, function()
								v104({ "deaths" }, "headbonk", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(4.5, function()
								v104({ "reloads" }, "rifle_mid", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(5, function()
								v104({ "general" }, "reloaddone", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.3, function()
								v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.392, function()
								v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.484, function()
								v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.576, function()
								v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.668, function()
								v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.76, function()
								v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.852, function()
								v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(6.944, function()
								v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7.036, function()
								v104({ "weapons", "ASMG" }, "AK-74", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7.1, function()
								v104({ "firearms" }, "empty", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7.5, function()
								v104({ "firearms" }, "click", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7.8, function()
								v104({ "firearms" }, "click", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.1, function()
								v104({ "firearms" }, "click", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(7.3, function()
								v104({ "shadow" }, "skinner_noise2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9, function()
								v104({ "ai" }, "ai_sprint", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(8.8, function()
								v104({ "weapons", "1HBL" }, "chargeswing", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9, function()
								v104({ "deaths" }, "neck", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9, function()
								v104({ "hitsound", "general" }, "hitblocked", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(9.5, function()
								v104({ "hitsound", "extras" }, "grapple2", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.3, function()
								v104({ "hitsound", "general" }, "hitbackstab", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(10.3, function()
								v104({ "deaths" }, "slash", p98[1].hoverpart, nil, true, false, true);
							end);
							delay(11, function()
								v104({ "shadow" }, "skinner_noise4", p98[1].hoverpart, nil, true, false, true);
							end);
						end;
						v827 = tick();
						while true do
							RS:wait();
							if not (15 <= tick() - v827) then

							else
								break;
							end;						
						end;
						agent_speak("echo_end");
						v828, v829, v830 = ipairs(v820:GetChildren());
						while true do
							v831, v832 = v828(v829, v830);
							if v831 then

							else
								break;
							end;
							v830 = v831;
							if v832:FindFirstChild("torso") then
								v833 = l__game__6.ReplicatedStorage.effects.echoball:Clone();
								l__Debris__32:AddItem(v833, 10);
								v833.Material = Enum.Material.Neon;
								v833.CFrame = v832.torso.CFrame;
								v833.fx.Enabled = false;
								v833.Parent = l__CurrentCamera__1;
								v833.flash:Emit(math.random(10, 20));
								spawn(function()
									while true do
										v833.Size = v833.Size + Vector3.new(0.5, 0.5, 0.5);
										v833.Transparency = v833.Transparency + 0.1;
										RS:wait();
										if not (1 <= v833.Transparency) then

										else
											break;
										end;									
									end;
								end);
							end;						
						end;
						v820:Destroy();
						v104({ "general_ui" }, "echo_close", p98[1].hoverpart, 0.01, true, false);
						current_in_echo = false;
					end;
				end;
			elseif p96 == "scanarea" then
				if p98[1] ~= nil then
					l__activestats__834 = v20.scan.activestats;
					v835 = l__game__6.ReplicatedStorage.effects.scanball:Clone();
					l__Debris__32:AddItem(v835, 20);
					v835.CFrame = p98[1];
					v835.Parent = l__CurrentCamera__1;
					if p97 == character then
						spawn(function()
							v836 = tick();
							maingui.PerkFrame.durationbar.Visible = true;
							maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1, 0, 1, 0);
							while true do
								maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1 - math.clamp((tick() - v836) / l__activestats__834.scanlast, 0, 1), 0, 1, 0);
								RS:wait();
								if not (l__activestats__834.scanlast <= tick() - v836) then

								else
									break;
								end;							
							end;
							maingui.PerkFrame.durationbar.Visible = false;
						end);
					end;
					spawn(function()
						v837, v838, v839 = ipairs(l__workspace__1.Interactables:GetChildren());
						while true do
							v840, v841 = v837(v838, v839);
							if v840 then

							else
								break;
							end;
							if v841:FindFirstChild("Interact") then
								if (v841.Interact.Position - p98[1].p).magnitude <= l__activestats__834.studsscan then
									if v841.Name ~= "Heavy Ammo" then
										if v841.Name ~= "Shells Ammo" then
											if v841.Name ~= "Light Ammo" then
												if v841.Name ~= "Long Ammo" then
													if v841.Name ~= "Short Ammo" then
														if v841.Name ~= "Medium Ammo" then
															if v841.Name == "Small Ammo" then
																u92(v841.Interact, false, l__activestats__834.scanlast);
															else
																u92(v841.Interact, false, l__activestats__834.scanlast);
															end;
														else
															u92(v841.Interact, false, l__activestats__834.scanlast);
														end;
													else
														u92(v841.Interact, false, l__activestats__834.scanlast);
													end;
												else
													u92(v841.Interact, false, l__activestats__834.scanlast);
												end;
											else
												u92(v841.Interact, false, l__activestats__834.scanlast);
											end;
										else
											u92(v841.Interact, false, l__activestats__834.scanlast);
										end;
									else
										u92(v841.Interact, false, l__activestats__834.scanlast);
									end;
								end;
							end;
							if v841:FindFirstChild("HarvestWood") then
								if (v841.HarvestWood.Position - p98[1].p).magnitude <= l__activestats__834.studsscan then
									u92(v841.HarvestWood, false, l__activestats__834.scanlast);
								end;
							end;
							if v841:FindFirstChild("HarvestStone") then
								if (v841.HarvestStone.Position - p98[1].p).magnitude <= l__activestats__834.studsscan then
									u92(v841.HarvestStone, false, l__activestats__834.scanlast);
								end;
							end;						
						end;
						v842, v843, v844 = ipairs(l__workspace__1.WeaponDrops:GetChildren());
						while true do
							v845, v846 = v842(v843, v844);
							if v845 then

							else
								break;
							end;
							v844 = v845;
							if v846:FindFirstChild("JointGrip") then
								if (v846.JointGrip.Position - p98[1].p).magnitude <= l__activestats__834.studsscan then
									u92(v846.JointGrip, false, l__activestats__834.scanlast);
								end;
							end;						
						end;
						v847, v848, v849 = ipairs(l__workspace__1.activeHostiles:GetChildren());
						while true do
							v850, v851 = v847(v848, v849);
							if v850 then

							else
								break;
							end;
							v849 = v850;
							if v851:FindFirstChild("Torso") then
								if v851:FindFirstChild("Head") then
									if v851:FindFirstChild("Humanoid") then
										if 0 <= v851.Humanoid.Health then
											if (v851.Torso.Position - p98[1].p).magnitude <= l__activestats__834.studsscan then
												v852 = l__game__6.ReplicatedStorage.effects.health_scanned:Clone();
												l__Debris__32:AddItem(v852, l__activestats__834.scanlast);
												v852.Adornee = v851.Torso;
												v852.Parent = ply.PlayerGui;
												v852.update_health.Disabled = false;
											end;
										end;
									end;
								end;
							end;						
						end;
					end);
					spawn(function()
						while true do
							v835.Size = v835.Size + Vector3.new(2, 2, 2);
							v835.Transparency = v835.Transparency + 0.025;
							RS:wait();
							if not (1 <= v835.Transparency) then

							else
								break;
							end;						
						end;
						delay(3, function()
							v835.fx.Enabled = false;
						end);
					end);
				end;
			elseif p96 == "player_ping" then
				if p98[1] ~= nil then
					if l__workspace__1.NoTarget:FindFirstChild(p98[2] .. "PING_CAT" .. p98[3]) then
						l__workspace__1.NoTarget:FindFirstChild(p98[2] .. "PING_CAT" .. p98[3]):Destroy();
					end;
					v853 = l__game__6.ReplicatedStorage.misc.ping_indicator:Clone();
					v853.Name = p98[2] .. "PING_CAT" .. p98[3];
					l__Debris__32:AddItem(v853, 20);
					v853.CFrame = CFrame.new(p98[1]);
					v853.bb.pinger.Text = p98[2];
					v853.Parent = l__workspace__1.NoTarget;
					v854 = v853.bb:FindFirstChild("ping_cat" .. p98[3]);
					if v854 then
						v854.Visible = true;
						v855 = v854:Clone();
						v855.Parent = v853.bb;
						spawn(function()
							while true do
								if v855 then
									if v854 then
										v855.Size = v855.Size + UDim2.new(0, 2, 0, 2);
										v855.ImageTransparency = v855.ImageTransparency + 0.05;
									end;
								end;
								RS:wait();
								if not (1 <= v855.ImageTransparency) then

								else
									break;
								end;
								if v854 ~= nil then

								else
									break;
								end;							
							end;
							v855:Destroy();
						end);
					end;
					v856 = "ping_area";
					if p98[3] == 2 then
						v856 = "ping_enemy";
					elseif p98[3] == 3 then
						v856 = "ping_item";
					end;
					v104({ "general_ui" }, v856, nil, nil, true, true);
					v857 = maingui.teammatesframe:FindFirstChild(p98[2]);
					if v857 then
						if v857:FindFirstChild("empty") then
							v858 = "[Moving Here]";
							v859 = Color3.fromRGB(255, 182, 122);
							if p98[3] == 3 then
								v859 = Color3.fromRGB(122, 232, 92);
								v858 = "[Marked " .. p98[4] .. "]";
							elseif p98[3] == 2 then
								v859 = Color3.fromRGB(216, 60, 60);
								v858 = "[Hostile]";
							elseif p98[3] == 4 then
								v859 = Color3.fromRGB(102, 137, 255);
								v858 = "[Located " .. p98[4] .. "]";
							elseif p98[3] == 5 then
								v859 = Color3.fromRGB(183, 89, 255);
								v858 = "[" .. p98[4] .. "]";
							end;
							v860 = l__game__6.ReplicatedStorage.misc.ping_text:Clone();
							l__Debris__32:AddItem(v860, 6);
							v860.TextColor3 = v859;
							v860.Text = v858;
							v860.bg.ImageColor3 = v859;
							if v857:FindFirstChild("empty"):FindFirstChild("ping_text") then
								v857:FindFirstChild("empty"):FindFirstChild("ping_text"):Destroy();
							end;
							v860.Parent = v857:FindFirstChild("empty");
							spawn(function()
								while true do
									if v860 then
										if v860:FindFirstChild("bg") then
											v860.bg.ImageTransparency = v860.bg.ImageTransparency + 0.05;
											v860.bg.Size = v860.bg.Size + UDim2.new(0, 2, 0, 0);
										end;
									end;
									RS:wait();
									if v860 ~= nil then

									else
										break;
									end;
									if v860:FindFirstChild("bg") ~= nil then

									else
										break;
									end;
									if not (1 <= v860.bg.ImageTransparency) then

									else
										break;
									end;								
								end;
							end);
						end;
					end;
				end;
			elseif p96 == "selfscan" then
				l__activestats__95 = v20.scan.activestats;
				spawn(function()
					v861, v862, v863 = ipairs(l__workspace__1.Interactables:GetChildren());
					while true do
						v864, v865 = v861(v862, v863);
						if v864 then

						else
							break;
						end;
						if v865:FindFirstChild("Interact") then
							if (v865.Interact.Position - character.HumanoidRootPart.Position).magnitude <= l__activestats__95.scan_around then
								if v865.Name ~= "Heavy Ammo" then
									if v865.Name ~= "Shells Ammo" then
										if v865.Name ~= "Light Ammo" then
											if v865.Name ~= "Long Ammo" then
												if v865.Name ~= "Short Ammo" then
													if v865.Name ~= "Medium Ammo" then
														if v865.Name == "Small Ammo" then
															u92(v865.Interact, true, l__activestats__95.scan_around_timer);
														else
															u92(v865.Interact, true, l__activestats__95.scan_around_timer);
														end;
													else
														u92(v865.Interact, true, l__activestats__95.scan_around_timer);
													end;
												else
													u92(v865.Interact, true, l__activestats__95.scan_around_timer);
												end;
											else
												u92(v865.Interact, true, l__activestats__95.scan_around_timer);
											end;
										else
											u92(v865.Interact, true, l__activestats__95.scan_around_timer);
										end;
									else
										u92(v865.Interact, true, l__activestats__95.scan_around_timer);
									end;
								else
									u92(v865.Interact, true, l__activestats__95.scan_around_timer);
								end;
							end;
						end;
						if v865:FindFirstChild("HarvestWood") then
							if (v865.HarvestWood.Position - character.HumanoidRootPart.Position).magnitude <= l__activestats__95.scan_around then
								u92(v865.HarvestWood, true, l__activestats__95.scan_around_timer);
							end;
						end;
						if v865:FindFirstChild("HarvestStone") then
							if (v865.HarvestStone.Position - character.HumanoidRootPart.Position).magnitude <= l__activestats__95.scan_around then
								u92(v865.HarvestStone, true, l__activestats__95.scan_around_timer);
							end;
						end;					
					end;
					v866, v867, v868 = ipairs(l__workspace__1.WeaponDrops:GetChildren());
					while true do
						v869, v870 = v866(v867, v868);
						if v869 then

						else
							break;
						end;
						v868 = v869;
						if v870:FindFirstChild("JointGrip") then
							if (v870.JointGrip.Position - character.HumanoidRootPart.Position).magnitude <= l__activestats__95.scan_around then
								u92(v870.JointGrip, true, l__activestats__95.scan_around_timer);
							end;
						end;					
					end;
				end);
			elseif p96 == "tased" then
				v871 = createfxoutline("tasedParticle", 1.7);
			elseif p96 == "decap" then
				if p97:FindFirstChild("Head") == nil then
					return;
				end;
				l__Head__872 = p97.Head;
				v873 = l__game__6.ReplicatedStorage.effects.gFX.decap.decapstump:Clone();
				v873.CFrame = p97.Torso.CFrame;
				v874 = Instance.new("Weld");
				v874.Part0 = v873;
				v874.Part1 = p97.Torso;
				v874.C1 = CFrame.new(0, 1, 0);
				v874.Parent = v873;
				v873.Parent = p97;
				v875 = l__game__6.ReplicatedStorage.effects.gFX.decap.decapblock:Clone();
				v876 = Instance.new("Weld");
				v876.Part0 = v875;
				v876.Part1 = l__Head__872;
				v876.Parent = v875;
				v876.Parent = p97;
				v875.Parent = p97;
				spawn(function()
					v877 = tick();
					v878 = tick();
					while true do
						if v873 then

						else
							break;
						end;
						if 0.5 <= tick() - v878 then
							v878 = tick();
							bloodtrailfx(v873.Position, 40, true);
						end;
						RS:wait();
						if not (3 <= tick() - v877) then

						else
							return;
						end;					
					end;
				end);
				l__Head__872.CFrame = l__Head__872.CFrame * CFrame.new(0, 0.2, 0);
				RS:wait();
				l__Head__872.Velocity = l__Head__872.Velocity + Vector3.new(math.random(-10, 10), 25, math.random(-10, 10));
			elseif p96 == "crush" then
				v879, v880, v881 = ipairs(p97:GetChildren());
				while true do
					v882, v883 = v879(v880, v881);
					if v882 then

					else
						break;
					end;
					v881 = v882;
					if v883:IsA("Accessory") then
						v883:Destroy();
					end;				
				end;
				v884, v885, v886 = ipairs(p97.Head:GetChildren());
				while true do
					v887, v888 = v884(v885, v886);
					if v887 then

					else
						break;
					end;
					v886 = v887;
					if v888:IsA("Decal") then
						v888:Destroy();
					end;				
				end;
				if p97:FindFirstChild("Outfit") then
					if p97:FindFirstChild("Outfit"):FindFirstChild("Head") then
						v889, v890, v891 = ipairs(p97:FindFirstChild("Outfit"):GetChildren());
						while true do
							v892, v893 = v889(v890, v891);
							if v892 then

							else
								break;
							end;
							v891 = v892;
							if v893.Name == "Head" then
								v893:Destroy();
							end;						
						end;
					end;
				end;
				l__Head__894 = p97.Head;
				v895 = l__game__6.ReplicatedStorage.effects.gFX.crush.splat:Clone();
				l__Debris__32:AddItem(v895, 9);
				v895.CFrame = p97.Head.CFrame;
				v895.fx1:Emit(math.random(5, 10));
				v895.fx2:Emit(math.random(3, 5));
				v895.Parent = l__workspace__1.NoTarget;
				v896 = l__game__6.ReplicatedStorage.effects.gFX.crush.bonestump:Clone();
				v896.CFrame = p97.Torso.CFrame;
				v897 = Instance.new("Weld");
				v897.Part0 = v896;
				v897.Part1 = p97.Torso;
				v897.C1 = CFrame.new(0, 1, 0);
				v897.Parent = v896;
				v896.Parent = p97;
				bloodtrailfx(v896.Position, 80, true);
				p97.Head:Destroy();
				v898 = { "gib", "bone" };
				v899 = math.random(8, 15);
				v900 = 1 - 1;
				while true do
					v901 = l__game__6.ReplicatedStorage.effects.gFX.crush[v898[math.random(1, 2)]]:Clone();
					l__Debris__32:AddItem(v901, 7);
					v901.CFrame = l__Head__894.CFrame * CFrame.new(math.random(-15, 10) / 100, math.random(-15, 10) / 100, math.random(-15, 10) / 100);
					v901.Parent = l__workspace__1.NoTarget;
					v901.Velocity = v901.Velocity + Vector3.new(math.random(-6, 6), math.random(5, 15), math.random(-6, 6));
					if 0 <= 1 then
						if v900 < v899 then

						else
							break;
						end;
					elseif v899 < v900 then

					else
						break;
					end;
					v900 = v900 + 1;				
				end;
			elseif p96 == "arrowimpact" then
				v902 = l__game__6.ReplicatedStorage.effects.gFX.arrowdeath.arrowimpact:Clone();
				v902.CFrame = p97.Head.CFrame;
				v903 = Instance.new("Weld");
				v903.Part0 = v902;
				v903.Part1 = p97.Head;
				v903.Parent = v902;
				v902.Parent = p97;
				v902.gorepoint.bleedpoint1.splat.Enabled = true;
				v902.gorepoint.bleedpoint2.splat.Enabled = true;
				v902.gorepoint.bleedpoint1.splat:Emit(30, 50);
				v902.gorepoint.bleedpoint2.splat:Emit(30, 50);
				v902.gorepoint.bleedpoint1.splat.Enabled = false;
				v902.gorepoint.bleedpoint2.splat.Enabled = false;
			elseif p96 == "headshot_gun" then
				v904 = l__game__6.ReplicatedStorage.effects.gFX.headshotdeath.headshotimpact:Clone();
				v904.CFrame = p97.Head.CFrame;
				v905 = Instance.new("Weld");
				v905.Part0 = v904;
				v905.Part1 = p97.Head;
				v905.Parent = v904;
				v904.Parent = p97;
				v904.gorepoint.bleedpoint1.splat.Enabled = true;
				v904.gorepoint.bleedpoint1.cloud.Enabled = true;
				v904.gorepoint.bleedpoint2.splat.Enabled = true;
				v904.gorepoint.bleedpoint1.cloud:Emit(1, 3);
				v904.gorepoint.bleedpoint1.splat:Emit(30, 50);
				v904.gorepoint.bleedpoint2.splat:Emit(30, 50);
				v904.gorepoint.bleedpoint1.splat.Enabled = false;
				v904.gorepoint.bleedpoint1.cloud.Enabled = false;
				v904.gorepoint.bleedpoint2.splat.Enabled = false;
				v104({ "deaths" }, "headshot" .. math.random(1, 2), p97.Head, nil, true, false);
				v104({ "deaths" }, "decap", p97.Head, nil, true, false);
				spawn(function()
					v906 = tick();
					v907 = tick();
					while true do
						if p97 then

						else
							break;
						end;
						if p97:FindFirstChild("Head") then

						else
							break;
						end;
						if 0.2 <= tick() - v907 then
							v907 = tick();
							bloodtrailfx(p97.Head.Position, 10, true);
						end;
						RS:wait();
						if not (3 <= tick() - v906) then

						else
							return;
						end;					
					end;
				end);
				if p98 ~= nil then
					if p98 == "self" then
						v904.gorepoint.Transparency = 1;
						v904.gorepoint.bleedpoint1.drip.Enabled = false;
						v904.gorepoint.bleedpoint2.drip.Enabled = false;
					end;
				end;
			elseif p96 ~= "head_bonk" then
				if p96 == "axe_embed" then
					v908 = l__game__6.ReplicatedStorage.effects.gFX.blunthead.headbonk:Clone();
					v908.CFrame = p97.Head.CFrame;
					v909 = Instance.new("Weld");
					v909.Part0 = v908;
					v909.Part1 = p97.Head;
					v909.Parent = v908;
					v908.Parent = p97;
					RS:wait();
					v908.gorepoint.bleedpoint1.splat.Enabled = true;
					v908.gorepoint.bleedpoint1.cloud.Enabled = true;
					v908.gorepoint.bleedpoint1.cloud:Emit(1, 3);
					v908.gorepoint.bleedpoint1.splat:Emit(15, 30);
					v908.gorepoint.bleedpoint1.splat.Enabled = false;
					v908.gorepoint.bleedpoint1.cloud.Enabled = false;
					if p96 == "head_bonk" then
						v104({ "deaths" }, "headbonk", p97.Head, nil, true, false);
					else
						v910 = l__game__6.ReplicatedStorage.effects.gFX.axe_head.axed:Clone();
						v910.CFrame = p97.Head.CFrame;
						v911 = Instance.new("Weld");
						v911.Part0 = v910;
						v911.Part1 = p97.Head;
						v911.Parent = v910;
						v910.Parent = p97;
						v104({ "deaths" }, "tear", p97.Head, nil, true, false);
						v104({ "deaths" }, "axe_hit", p97.Head, nil, true, false);
					end;
				elseif p96 ~= "take_limbs_arms" then
					if p96 == "take_limbs_legs" then
						v912 = l__game__6.ReplicatedStorage.effects.gFX.limbremove.torsopart:Clone();
						v912.CFrame = p97.Torso.CFrame;
						v913 = Instance.new("Weld");
						v913.Part0 = v912;
						v913.Part1 = p97.Torso;
						v913.Parent = v912;
						v914 = "Left Arm";
						if math.random(1, 2) == 1 then
							v914 = "Right Arm";
						end;
						if p96 == "take_limbs_legs" then
							v914 = "Left Leg";
							if math.random(1, 2) == 1 then
								v914 = "Right Leg";
							end;
						end;
						v915, v916, v917 = ipairs(v912:GetChildren());
						while true do
							v918, v919 = v915(v916, v917);
							if v918 then

							else
								break;
							end;
							v917 = v918;
							if v919:IsA("BasePart") then
								if v919.Name ~= v914 then
									v919:Destroy();
								end;
							end;						
						end;
						v912.Parent = p97;
						if p97:FindFirstChild(v914) then
							p97:FindFirstChild(v914):Destroy();
						end;
						if p97:FindFirstChild("Outfit") then
							if p96 == "take_limbs_legs" then
								if p97.Outfit:FindFirstChild("Bottom") then
									if p97.Outfit.Bottom:FindFirstChild(v914) then
										p97.Outfit.Bottom:FindFirstChild(v914):Destroy();
									end;
								end;
							elseif p97.Outfit:FindFirstChild("Top") then
								if p97.Outfit.Top:FindFirstChild(v914) then
									p97.Outfit.Top:FindFirstChild(v914):Destroy();
								end;
							end;
						end;
						v104({ "deaths" }, "flesh", p97.Torso, nil, true, false);
						v104({ "deaths" }, "gurgle", p97.Torso, nil, true, false);
						v912:FindFirstChild(v914).attach.cloud.Enabled = true;
						v912:FindFirstChild(v914).attach.gib.Enabled = true;
						v912:FindFirstChild(v914).attach.cloud:Emit(math.random(1, 3));
						v912:FindFirstChild(v914).attach.gib:Emit(math.random(3, 7));
						v912:FindFirstChild(v914).attach.cloud.Enabled = false;
						v912:FindFirstChild(v914).attach.gib.Enabled = false;
					elseif p96 == "torso_cut" then
						v920 = l__game__6.ReplicatedStorage.effects.gFX.torsocut.Torso:Clone();
						v920.CFrame = p97.Torso.CFrame;
						v921 = Instance.new("Weld");
						v921.Part0 = v920;
						v921.Part1 = p97.Torso;
						v921.Parent = v920;
						v920.Parent = p97.Torso;
					elseif p96 == "pukedeath" then
						v104({ "deaths" }, "gurgle", p97.Head, nil, true, false);
						delay(0.5, function()
							v104({ "deaths" }, "puke", p97.Head, nil, true, false);
							v922 = l__game__6.ReplicatedStorage.effects.gFX.pukedeath.puke:Clone();
							v922.CFrame = p97.Head.CFrame;
							v923 = Instance.new("Weld");
							v923.Part0 = v922;
							v923.Part1 = p97.Head;
							v923.Parent = v922;
							v922.Parent = p97;
							v922.pukepoint.splat.Enabled = true;
							v922.pukepoint.splat2.Enabled = true;
							v922.pukepoint.splat:Emit(math.random(10, 20));
							v922.pukepoint.splat2:Emit(math.random(10, 20));
							RS:wait();
							v922.pukepoint.splat.Enabled = false;
							v922.pukepoint.splat2.Enabled = false;
						end);
					elseif p96 == "stomachrip" then
						v924 = l__game__6.ReplicatedStorage.effects.gFX.spearstomach.torsoFX:Clone();
						v924.CFrame = p97.Torso.CFrame;
						v925 = Instance.new("Weld");
						v925.Part0 = v924;
						v925.Part1 = p97.Torso;
						v925.Parent = v924;
						v924.Parent = p97;
						v924.fxpart.splat:Emit(30, 50);
						v924.fxpart.splat2:Emit(15, 30);
						v926 = math.random(6, 10);
						v927 = 1 - 1;
						while true do
							v928 = l__game__6.ReplicatedStorage.effects.gFX.spearstomach.gib:Clone();
							l__Debris__32:AddItem(v928, 7);
							v928.CFrame = p97.Torso.CFrame * CFrame.new(math.random(-15, 10) / 100, math.random(-15, 10) / 100, math.random(-15, 10) / 100);
							v928.Parent = l__workspace__1.NoTarget;
							v928.Velocity = v928.Velocity + p97.Torso.CFrame.lookVector * 3;
							if 0 <= 1 then
								if v927 < v926 then

								else
									break;
								end;
							elseif v926 < v927 then

							else
								break;
							end;
							v927 = v927 + 1;						
						end;
					elseif p96 == "neckcut" then
						v929 = l__game__6.ReplicatedStorage.effects.gFX.neckcut.fx:Clone();
						l__Debris__32:AddItem(v929, 9);
						v929.CFrame = p97.Torso.CFrame;
						v930 = Instance.new("Weld");
						v930.Part0 = v929;
						v930.Part1 = p97.Torso;
						v930.Parent = v929;
						v930.Parent = p97;
						v929.Parent = p97;
						delay(2, function()
							v929.point.drip.Enabled = false;
							v929.point.fx1.Enabled = false;
						end);
						v929.point.fx2:Emit(1);
						v929.point.gib:Emit(math.random(2, 5));
						v931 = l__game__6.ReplicatedStorage.effects.gFX.neckcut.neckpart:Clone();
						l__Debris__32:AddItem(v931, 7);
						v931.CFrame = p97.Head.CFrame + p97.Head.CFrame.lookVector * 1;
						v931.Parent = l__workspace__1.NoTarget;
						v931.Velocity = v931.Velocity + p97.Head.CFrame.lookVector * 3;
						spawn(function()
							v932 = tick();
							v933 = tick();
							while true do
								if v929 then

								else
									break;
								end;
								if 0.4 <= tick() - v933 then
									v933 = tick();
									bloodtrailfx(v929.point.WorldPosition, 1, true);
								end;
								RS:wait();
								if not (4 <= tick() - v932) then

								else
									return;
								end;							
							end;
						end);
					elseif p96 == "explosive" then
						l__HumanoidRootPart__934 = p97:FindFirstChild("HumanoidRootPart");
						if l__HumanoidRootPart__934 then

						else
							return;
						end;
						v935, v936, v937 = ipairs(p97:GetChildren());
						while true do
							v938, v939 = v935(v936, v937);
							if v938 then

							else
								break;
							end;
							v937 = v938;
							if v939.Name ~= "Torso" then
								if v939.Name ~= "Humanoid" then
									if v939.Name ~= "active" then
										v939:Destroy();
									elseif v939:IsA("BasePart") then
										v939.Transparency = 1;
										v940, v941, v942 = ipairs(v939:GetChildren());
										while true do
											v943, v944 = v940(v941, v942);
											if v943 then

											else
												break;
											end;
											v942 = v943;
											if v944:IsA("Decal") then
												v944:Destroy();
											end;										
										end;
									end;
								elseif v939:IsA("BasePart") then
									v939.Transparency = 1;
									v940, v941, v942 = ipairs(v939:GetChildren());
									while true do
										v943, v944 = v940(v941, v942);
										if v943 then

										else
											break;
										end;
										v942 = v943;
										if v944:IsA("Decal") then
											v944:Destroy();
										end;									
									end;
								end;
							elseif v939:IsA("BasePart") then
								v939.Transparency = 1;
								v940, v941, v942 = ipairs(v939:GetChildren());
								while true do
									v943, v944 = v940(v941, v942);
									if v943 then

									else
										break;
									end;
									v942 = v943;
									if v944:IsA("Decal") then
										v944:Destroy();
									end;								
								end;
							end;						
						end;
						if p97:FindFirstChild("Torso") then
							p97:FindFirstChild("Torso").Anchored = true;
							p97:FindFirstChild("Torso").Transparency = 1;
						end;
						v945 = l__game__6.ReplicatedStorage.effects.gFX.explosion.explosiongib:Clone();
						l__Debris__32:AddItem(v945, 10);
						v945.CFrame = CFrame.new(l__HumanoidRootPart__934.Position) * CFrame.new(0, 1, 0);
						v945.Parent = l__workspace__1.NoTarget;
						v945.cloud:Emit(math.random(5, 8));
						v945.dust:Emit(math.random(5, 8));
						v945.expandcloud:Emit(math.random(5, 8));
						v945.gib:Emit(math.random(8, 12));
						v946 = math.random(8, 12);
						v947 = 1 - 1;
						while true do
							v948 = l__game__6.ReplicatedStorage.effects.gFX.crush.gib:Clone();
							l__Debris__32:AddItem(v948, 7);
							v948.CFrame = v945.CFrame * CFrame.new(math.random(-15, 10) / 100, math.random(-15, 10) / 100, math.random(-15, 10) / 100);
							v948.Parent = l__workspace__1.NoTarget;
							v948.Velocity = v948.Velocity + Vector3.new(math.random(-12, 12), math.random(15, 20), math.random(-12, 12));
							if 0 <= 1 then
								if v947 < v946 then

								else
									break;
								end;
							elseif v946 < v947 then

							else
								break;
							end;
							v947 = v947 + 1;						
						end;
					elseif p96 == "armcut" then
						v949 = l__game__6.ReplicatedStorage.effects.gFX.armcut.cutarm:Clone();
						u96 = l__game__6.ReplicatedStorage.effects.gFX.armcut.torsocopy:Clone();
						spawn(function()
							v950 = tick();
							v951 = tick();
							while true do
								if u96 then

								else
									break;
								end;
								if 0.4 <= tick() - v951 then
									v951 = tick();
									bloodtrailfx(u96.a0.WorldPosition, 1, true);
								end;
								RS:wait();
								if not (3 <= tick() - v950) then

								else
									return;
								end;							
							end;
						end);
						u96.beam.Attachment0 = u96.a0;
						u96.beam.Attachment1 = v949.a1;
						v952 = Instance.new("Weld");
						v952.Part0 = u96;
						v952.Part1 = p97.Torso;
						v952.Parent = u96;
						u96.Parent = p97;
						v949.CFrame = p97["Left Arm"].CFrame;
						v953 = Instance.new("Weld");
						v953.Part0 = v949;
						v953.Part1 = p97["Left Arm"];
						v953.Parent = v949;
						v949.Parent = p97["Left Arm"];
						bloodtrailfx(p97["Left Arm"].Position, 30);
						p97["Left Arm"].Velocity = p97["Left Arm"].Velocity + -p97.Torso.CFrame.rightVector * 5;
						delay(0.5, function()
							v954 = 1 - 1;
							while true do
								v955 = 1.5 * (1 - v954 / 15);
								u96.beam.Width0 = v955;
								u96.beam.Width1 = v955;
								RS:wait();
								if 0 <= 1 then
									if v954 < 15 then

									else
										break;
									end;
								elseif 15 < v954 then

								else
									break;
								end;
								v954 = v954 + 1;							
							end;
							u96.beam:Destroy();
						end);
					elseif p96 == "slice" then
						v956, v957, v958 = ipairs(p97.Torso:GetChildren());
						while true do
							v959, v960 = v956(v957, v958);
							if v959 then

							else
								break;
							end;
							v958 = v959;
							if v960:IsA("Decal") then
								v960:Destroy();
							end;						
						end;
						l__Shirt__961 = p97:FindFirstChild("Shirt");
						if l__Shirt__961 == nil then
							l__Pants__962 = p97:FindFirstChild("Pants");
							if l__Pants__962 == nil then
								v963 = "";
							else
								v963 = l__Pants__962.PantsTemplate;
							end;
						else
							v963 = l__Shirt__961.ShirtTemplate;
						end;
						v964 = l__game__6.ReplicatedStorage.effects.gFX.slice.slicehalf:Clone();
						v964.BrickColor = p97.Torso.BrickColor;
						v964.TextureID = v963;
						v964.CFrame = p97.Torso.CFrame;
						v965 = Instance.new("Weld");
						v965.Part0 = v964;
						v965.Part1 = p97.Torso;
						v965.C1 = CFrame.new(0.6, 0, 0);
						v965.Parent = v964;
						v964.Parent = p97;
						bloodtrailfx(v964.b0.WorldPosition, 80);
						p97.Torso.Transparency = 1;
						v966 = l__game__6.ReplicatedStorage.effects.gFX.slice.otherslicehalf:Clone();
						l__Shirt__967 = p97:FindFirstChild("Shirt");
						if l__Shirt__967 then
							l__Shirt__967:Clone().Parent = v966;
						end;
						l__Pants__968 = p97:FindFirstChild("Pants");
						if l__Pants__968 then
							l__Pants__968:Clone().Parent = v966;
						end;
						v969, v970, v971 = ipairs(v966:GetChildren());
						while true do
							v972, v973 = v969(v970, v971);
							if v972 then

							else
								break;
							end;
							v971 = v972;
							if p97:FindFirstChild(v973.Name) then
								if v973:IsA("BasePart") then
									v973.BrickColor = p97:FindFirstChild(v973.Name).BrickColor;
								end;
							end;						
						end;
						v966.Torso.otherhalf.BrickColor = p97.Torso.BrickColor;
						v966.Torso.otherhalf.TextureID = v963;
						v966:SetPrimaryPartCFrame(p97.Torso.CFrame);
						v966.Parent = p97;
						v964.beam1.Attachment1 = v966.Torso.otherhalf.a1;
						v964.beam2.Attachment1 = v966.Torso.otherhalf.b1;
						v964.beam3.Attachment1 = v966.Torso.otherhalf.c1;
						p97["Left Arm"]:Destroy();
						p97["Left Leg"]:Destroy();
						RS:wait();
						v966.Humanoid.PlatformStand = true;
						v966.Torso.Velocity = v966.Torso.Velocity + v966.Torso.CFrame.rightVector * 6;
						if p97.Torso:FindFirstChild("Neck") then
							p97.Torso.Neck.C1 = CFrame.new(-0.341941595, -0.544243574, 0.0124545023, -0.951813221, 0, -0.306678385, -0.301639259, 0.180534005, 0.936173737, 0.0553658754, 0.983568728, -0.171834648);
							p97.Torso.Neck.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0);
						end;
						delay(0.5, function()
							v974 = 1 - 1;
							while true do
								v975 = 1.5 * (1 - v974 / 15);
								v964.beam1.Width0 = v975;
								v964.beam1.Width1 = v975;
								v964.beam2.Width0 = v975;
								v964.beam2.Width1 = v975;
								v964.beam3.Width0 = v975;
								v964.beam3.Width1 = v975;
								RS:wait();
								if 0 <= 1 then
									if v974 < 15 then

									else
										break;
									end;
								elseif 15 < v974 then

								else
									break;
								end;
								v974 = v974 + 1;							
							end;
							v964.beam1:Destroy();
							v964.beam2:Destroy();
							v964.beam3:Destroy();
						end);
					end;
				else
					v912 = l__game__6.ReplicatedStorage.effects.gFX.limbremove.torsopart:Clone();
					v912.CFrame = p97.Torso.CFrame;
					v913 = Instance.new("Weld");
					v913.Part0 = v912;
					v913.Part1 = p97.Torso;
					v913.Parent = v912;
					v914 = "Left Arm";
					if math.random(1, 2) == 1 then
						v914 = "Right Arm";
					end;
					if p96 == "take_limbs_legs" then
						v914 = "Left Leg";
						if math.random(1, 2) == 1 then
							v914 = "Right Leg";
						end;
					end;
					v915, v916, v917 = ipairs(v912:GetChildren());
					while true do
						v918, v919 = v915(v916, v917);
						if v918 then

						else
							break;
						end;
						v917 = v918;
						if v919:IsA("BasePart") then
							if v919.Name ~= v914 then
								v919:Destroy();
							end;
						end;					
					end;
					v912.Parent = p97;
					if p97:FindFirstChild(v914) then
						p97:FindFirstChild(v914):Destroy();
					end;
					if p97:FindFirstChild("Outfit") then
						if p96 == "take_limbs_legs" then
							if p97.Outfit:FindFirstChild("Bottom") then
								if p97.Outfit.Bottom:FindFirstChild(v914) then
									p97.Outfit.Bottom:FindFirstChild(v914):Destroy();
								end;
							end;
						elseif p97.Outfit:FindFirstChild("Top") then
							if p97.Outfit.Top:FindFirstChild(v914) then
								p97.Outfit.Top:FindFirstChild(v914):Destroy();
							end;
						end;
					end;
					v104({ "deaths" }, "flesh", p97.Torso, nil, true, false);
					v104({ "deaths" }, "gurgle", p97.Torso, nil, true, false);
					v912:FindFirstChild(v914).attach.cloud.Enabled = true;
					v912:FindFirstChild(v914).attach.gib.Enabled = true;
					v912:FindFirstChild(v914).attach.cloud:Emit(math.random(1, 3));
					v912:FindFirstChild(v914).attach.gib:Emit(math.random(3, 7));
					v912:FindFirstChild(v914).attach.cloud.Enabled = false;
					v912:FindFirstChild(v914).attach.gib.Enabled = false;
				end;
			else
				v908 = l__game__6.ReplicatedStorage.effects.gFX.blunthead.headbonk:Clone();
				v908.CFrame = p97.Head.CFrame;
				v909 = Instance.new("Weld");
				v909.Part0 = v908;
				v909.Part1 = p97.Head;
				v909.Parent = v908;
				v908.Parent = p97;
				RS:wait();
				v908.gorepoint.bleedpoint1.splat.Enabled = true;
				v908.gorepoint.bleedpoint1.cloud.Enabled = true;
				v908.gorepoint.bleedpoint1.cloud:Emit(1, 3);
				v908.gorepoint.bleedpoint1.splat:Emit(15, 30);
				v908.gorepoint.bleedpoint1.splat.Enabled = false;
				v908.gorepoint.bleedpoint1.cloud.Enabled = false;
				if p96 == "head_bonk" then
					v104({ "deaths" }, "headbonk", p97.Head, nil, true, false);
				else
					v910 = l__game__6.ReplicatedStorage.effects.gFX.axe_head.axed:Clone();
					v910.CFrame = p97.Head.CFrame;
					v911 = Instance.new("Weld");
					v911.Part0 = v910;
					v911.Part1 = p97.Head;
					v911.Parent = v910;
					v910.Parent = p97;
					v104({ "deaths" }, "tear", p97.Head, nil, true, false);
					v104({ "deaths" }, "axe_hit", p97.Head, nil, true, false);
				end;
			end;
		else
			v803 = l__game__6.ReplicatedStorage.effects.bowtrail:Clone();
			v803.CFrame = p98[1];
			v803.Parent = l__workspace__1.NoTarget;
			RS:wait();
			v803.CFrame = p98[1];
			v804 = baselayer;
			if p96 == "bowarrow_ignore" then
				v804 = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, l__workspace__1.PlayerShootThroughs, l__workspace__1.activeFriendlies, l__workspace__1.activeHostiles };
			end;
			v805, v806 = raycastline(p98[1].p, p98[1].LookVector + p98[2], 80, v804);
			RS:wait();
			v803.CFrame = CFrame.new(v806);
			if v805 == nil then
				v807 = v806;
				v808 = 1 - 1;
				while true do
					v809, v810 = raycastline(v807, p98[1].LookVector + p98[2] + Vector3.new(0, -0.05, 0), 3, v804);
					v803.CFrame = CFrame.new(v810);
					if v809 then
						break;
					end;
					v807 = v810;
					RS:wait();
					if 0 <= 1 then
						if v808 < 200 then

						else
							break;
						end;
					elseif 200 < v808 then

					else
						break;
					end;
					v808 = v808 + 1;				
				end;
			end;
			l__Debris__32:AddItem(v803, 5);
		end;
	else
		if p97 ~= nil then
			if p97:FindFirstChild("Torso") == nil then
				return;
			end;
		else
			return;
		end;
		v692 = l__game__6.ReplicatedStorage.effects.bloodSplatter:Clone();
		l__Debris__32:AddItem(v692, 2);
		v692.CFrame = CFrame.new(p97.Torso.Position);
		v692.Parent = l__workspace__1.NoTarget;
		v693 = p98[1];
		if v693 == nil then
			v693 = 1;
		end;
		v694 = v693 / 1.5;
		if v694 < 4 then
			v694 = 4;
		end;
		v692.fx1.Enabled = true;
		v692.fx1:Emit(math.random(v694, v694 + math.random(1, 3)));
		v692.fx1.Enabled = false;
		if p96 == "bloodhit" then
			v695 = l__game__6.ReplicatedStorage.effects.bloodSplatter:Clone();
			l__Debris__32:AddItem(v695, 2);
			v695.CFrame = CFrame.new(p98[2]);
			v695.Parent = l__workspace__1.NoTarget;
			v695.fx2.Enabled = true;
			v695.fx2:Emit(math.random(1, 3));
			v695.fx2.Enabled = false;
			v695.fx3.Enabled = true;
			v695.fx3:Emit(math.random(5, 10));
			v695.fx3.Enabled = false;
			v695.fx4.Enabled = true;
			v695.fx4:Emit(math.random(5, 10));
			v695.fx4.Enabled = false;
			bloodtrailfx(p98[2], p98[1]);
			if p98[3] then
				v696 = l__game__6.ReplicatedStorage.effects.bloodpen:Clone();
				l__Debris__32:AddItem(v696, 2);
				v696.Parent = l__workspace__1.NoTarget;
				v696.CFrame = CFrame.new(p98[2], p98[3]);
				v696.fx1:Emit(math.random(1, 3));
				v696.fx2:Emit(math.random(8, 15));
				v696.fx3:Emit(math.random(8, 15));
			end;
		end;
	end;
end;
l__workspace__1.ServerStuff.applyGore.OnClientEvent:Connect(applygore);
l__workspace__1.ServerStuff.relayStats.OnClientInvoke = function(p100)
	local v976 = {};
	for v977, v978 in pairs(u9) do
		v976[v978.effects.corename] = { v978.mainstats.intensity, (v978.effects.maxduration - (tick() - v978.effects.currentduration)) / v978.effects.maxduration };
	end;
	return { hum.Health, u7, v976, u8.blocking, { hum.WalkSpeed, u18 + u36, u17 }, hum.MaxHealth, nametag, v6, playerstats, v66, { u59, u13, { ration_system_handler.Beans, ration_system_handler.MRE, ration_system_handler.Soda, ration_system_handler.Bottle } } };
end;
local u97 = 0;
local u98 = nil;
function invmanage(p101, p102)
	if p101 == "swap" then
		if u8.action == true then
			if u8.swapping == false then
				return;
			end;
		end;
		local v979 = true;
		if p102[2] == true then
			p102 = tonumber(string.char(p102[1].Value));
		else
			v979 = false;
			p102 = p102[1];
		end;
		if v6[p102][2] ~= true then
			local v980, v981, v982 = pairs(v6);
			while true do
				local v983, v984 = v980(v981, v982);
				if v983 then

				else
					break;
				end;
				v982 = v983;
				v984[2] = false;			
			end;
			v6[p102][2] = true;
			if v979 == true then
				u56(v6[p102][1]);
				return;
			end;
		end;
	elseif p101 == "updatehud" then
		local v985, v986, v987 = pairs(v6);
		while true do
			local v988, v989 = v985(v986, v987);
			if v988 then

			else
				break;
			end;
			v987 = v988;
			local v990 = maingui.InventoryFrame:FindFirstChild(tostring("slot" .. v988));
			if v990 then
				local v991 = v19[v989[1]];
				local v992 = v991.name;
				local v993 = nil;
				local v994 = nil;
				if v992 == "Fists" then
					v992 = "EMPTY";
					if v989[2] == true then
						if playerstats.Exotic ~= "none" then
							if v21[playerstats.Exotic] then
								v992 = v21[playerstats.Exotic].name;
								v993 = v992;
								v994 = v21[playerstats.Exotic].param[3];
							end;
						end;
					end;
				end;
				if primskin then
					if v988 == 1 then
						v992 = primskin.name;
						v993 = primskin.name;
						v994 = primskin.param[3];
					end;
				end;
				v990.slotarea.slotname.Text = string.upper(v992);
				if v989[2] == true then
					if v989[3] ~= nil then
						maingui.LowerHudFrame.main.Visible = true;
						maingui.LowerHudFrame.reserve.Visible = true;
						if v991.ability ~= nil then
							maingui.LowerHudFrame.altitem.Visible = true;
							maingui.LowerHudFrame.altitem.Text = v991.ability;
						end;
						maingui.LowerHudFrame.itemusage.Visible = false;
						if v991.ammoused ~= nil then
							maingui.LowerHudFrame.altitem.Visible = true;
							maingui.LowerHudFrame.altitem.Text = "Uses " .. v991.ammoused .. " ammo.";
							maingui.LowerHudFrame.reserve.label.Text = u59[v991.ammoused];
						else
							maingui.LowerHudFrame.reserve.label.Text = "USES";
						end;
						maingui.LowerHudFrame.main.label.Text = tostring(v989[3]);
						if akimbo_factors.active == true then
							maingui.LowerHudFrame.altitem.Text = "RESERVE: " .. u59[akimbo_factors.alt_weapon_stats.ammoused];
							maingui.LowerHudFrame.main.label.Text = tostring(v6[akimbo_factors.weapon_slot][3]) .. "/" .. tostring(v989[3]);
						end;
					else
						maingui.LowerHudFrame.main.Visible = false;
						maingui.LowerHudFrame.reserve.Visible = false;
						maingui.LowerHudFrame.altitem.Visible = false;
						if v991.ability ~= nil then
							maingui.LowerHudFrame.itemusage.Visible = true;
							local v995 = "";
							if v991.rarity ~= nil then
								v995 = "Tier " .. v991.rarity .. " / ";
							end;
							maingui.LowerHudFrame.itemusage.Text = v995 .. v991.ability;
							if v994 then
								maingui.LowerHudFrame.itemusage.Text = v995 .. v994;
							end;
						end;
					end;
					v990.BackgroundColor3 = Color3.new(0, 0, 0);
					v990.slotarea.BackgroundColor3 = Color3.new(0, 0, 0);
					v990.highlight.Visible = true;
					v990.slotarea.Size = UDim2.new(1, 0, 0, 45);
					maingui.LowerHudFrame.itemname.Text = v991.name;
					if v993 then
						maingui.LowerHudFrame.itemname.Text = v993;
					end;
				else
					v990.highlight.Visible = false;
					v990.BackgroundColor3 = Color3.new(1, 1, 1);
					v990.slotarea.Size = UDim2.new(1, 0, 0, 25);
					v990.slotarea.BackgroundColor3 = Color3.new(1, 1, 1);
				end;
			end;		
		end;
	end;
end;
local u99 = {
	["come at me"] = 0.5, 
	facepalm = 0.5, 
	["raise weapon"] = 0.4
};
local u100 = false;
local function u101(p103, p104)
	p103.status.Visible = true;
	local v996 = tick();
	while true do
		p103.hunted.Position = p103.hunted.Position:Lerp(UDim2.new(0.5, 0, 0.2, 0), 0.1);
		p103.focus.Position = p103.focus.Position:Lerp(UDim2.new(1.5, 0, 0.6, 0), 0.3);
		p103.status.Position = p103.status.Position:Lerp(UDim2.new(0.5, 0, 1, 0), 0.1);
		RS:wait();
		if tick() - v996 >= 2 then
			break;
		end;	
	end;
	playerstats = l__workspace__1.ServerStuff.retrieveStats:InvokeServer();
	if p104 == "loss" then
		p103.status.spectate.Visible = false;
		p103.status.menu.Visible = true;
		local v997 = { "WHAT THE HELL WERE YOU DOING?", "I'M BEWILDERED", "THAT'S JUST SAD", "UNFORTUNATE", "YOU DISAPPOINT ME", "HOW DID YOU MANAGE THAT?", "IMPRESSIVE", "SMOOTH MOVES", "EVERYONE MAKES MISTAKES", "THE MISTAKE HERE IS YOU", "UNFORTUNATE ACCIDENT", "THAT'S RATHER SAD", "DAMN", "WELL YOU TRIED", "YOU GET POINTS FOR TRYING" };
		p103.status.reports.killedby.eliminatedlevel.Text = v997[math.random(1, #v997)];
		if v121.killer ~= nil and (l__game__6.Players:FindFirstChild(v121.killer) or v121.killer == "Contestant") then
			local v998 = l__workspace__1.ServerStuff.relaylobbystat:InvokeServer(v121.killer);
			if v998 then
				local v999 = v121.killer;
				local v1000 = v998.Level;
				if v998.Settings.Anonymous == true then
					if l__game__6.Players:FindFirstChild(v121.killer).Character and l__game__6.Players:FindFirstChild(v121.killer).Character:FindFirstChild("playerID") then
						local v1001 = "Contestant #" .. l__game__6.Players:FindFirstChild(v121.killer).Character:FindFirstChild("playerID").Value;
					end;
					v999 = "Contestant";
					v1000 = 0;
				end;
				p103.status.reports.killedby.eliminated.Text = "ELIMINATED BY: " .. v999;
				p103.status.reports.killedby.eliminatedlevel.Text = "LEVEL " .. v1000;
			else
				p103.status.reports.killedby.eliminated.Text = "ELIMINATED BY: Contestant";
				p103.status.reports.killedby.eliminatedlevel.Text = "LEVEL " .. 0;
			end;
		end;
	else
		p103.status.reports.killedby.eliminated.Text = "TOTAL WINS: " .. playerstats.MainStats.Wins;
		p103.status.reports.killedby.eliminatedlevel.Text = "WIN STREAK: " .. playerstats.MainStats.WinStreak;
	end;
	p103.status.reports.rankings.damage.Text = "MELEE DAMAGE DONE: " .. math.ceil(v121.damage);
	p103.status.reports.rankings.eliminations.Text = "ELIMINATIONS: " .. v121.kills;
	p103.status.reports.rankings.timealive.Text = "TIME ALIVE: " .. math.ceil((tick() - v121.timealive) / 60) .. "M";
	p103.status.reports.fansearned.amt.Text = "FANS EARNED: " .. playerstats.MatchXP;
	local v1002 = "ST";
	if v121.placed == 2 then
		v1002 = "ND";
	elseif v121.placed == 3 then
		v1002 = "RD";
	elseif v121.placed > 3 then
		v1002 = "TH";
	end;
	p103.status.reports.rankings.place.Text = "PLACED: " .. v121.placed .. v1002;
	if p104 == "siege" then
		p103.status.reports.rankings.place.Visible = false;
	end;
	local function v1003(p105)
		local v1004 = 0;
		local v1005 = tick();
		while true do
			p105.Visible = true;
			if tick() - v1005 >= 0.075 then
				v1005 = tick();
				v1004 = v1004 + 1;
				p105.Visible = false;
			end;
			RS:wait();
			if v1004 >= 5 then
				break;
			end;		
		end;
		p105.Visible = true;
	end;
	v1003(p103.status.reports.killedby);
	spawn(function()
		v1003(p103.status.reports.rankings);
	end);
	spawn(function()
		v1003(p103.status.reports.fansearned);
	end);
end;
local u102 = nil;
local u103 = nil;
local u104 = nil;
local u105 = nil;
function alertplay(p106, p107)
	if typeof(p106) == "table" then

	else
		local v1006 = nil;
		local v1007 = nil;
		local v1008 = nil;
		local v1009 = nil;
		local v1010 = nil;
		local v1011 = nil;
		local v1012 = nil;
		local v1013 = nil;
		local v1014 = nil;
		local v1015 = nil;
		local v1016 = nil;
		local v1017 = nil;
		local v1018 = nil;
		local v1019 = nil;
		local v1020 = nil;
		local v1021 = nil;
		local v1022 = nil;
		local v1023 = nil;
		local v1024 = nil;
		local v1025 = nil;
		local v1026 = nil;
		local v1027 = nil;
		local v1028 = nil;
		local v1029 = nil;
		local v1030 = nil;
		local v1031 = nil;
		local v1032 = nil;
		local v1033 = nil;
		local v1034 = nil;
		local v1035 = nil;
		local v1036 = nil;
		if p106 == "THE SIEGE HAS BEGUN" then
			if startperk.Value == "hubbing" then
				return;
			else
				v104({ "gamemode" }, "horn", nil, nil, true, true);
				if startperk.Value ~= "emperor" then
					if startperk.Value ~= "commander" then
						if startperk.Value ~= "hiddenB" then

						else
							lastchatter = tick();
							l__workspace__1.ServerStuff.voiceline:FireServer(startperk, "begin");
						end;
					else
						lastchatter = tick();
						l__workspace__1.ServerStuff.voiceline:FireServer(startperk, "begin");
					end;
				else
					lastchatter = tick();
					l__workspace__1.ServerStuff.voiceline:FireServer(startperk, "begin");
				end;
				v1006 = false;
				v1007 = maingui;
				v1008 = "alert";
				v1009 = v1007;
				v1010 = v1008;
				v1011 = v1009[v1010];
				local v1037 = "TextTransparency";
				v1012 = v1011;
				v1013 = v1037;
				v1014 = v1012[v1013];
				local v1038 = 1;
				v1015 = v1014;
				v1016 = v1038;
				if v1015 == v1016 then
					v1006 = true;
				end;
				local v1039 = tick;
				v1017 = v1039;
				local v1040 = v1017();
				v1018 = v1040;
				alertplaytimer = v1018;
				local v1041 = maingui;
				local v1042 = "alert";
				v1019 = v1041;
				v1020 = v1042;
				local v1043 = v1019[v1020];
				local v1044 = "Text";
				v1021 = v1043;
				v1022 = v1044;
				v1023 = p106;
				v1021[v1022] = v1023;
				local v1045 = maingui;
				local v1046 = "alert";
				v1024 = v1045;
				v1025 = v1046;
				local v1047 = v1024[v1025];
				local v1048 = 0;
				local v1049 = "TextTransparency";
				v1026 = v1047;
				v1027 = v1049;
				v1028 = v1048;
				v1026[v1027] = v1028;
				local v1050 = maingui;
				local v1051 = "alert";
				v1029 = v1050;
				v1030 = v1051;
				local v1052 = v1029[v1030];
				local v1053 = 0;
				local v1054 = "TextStrokeTransparency";
				v1031 = v1052;
				v1032 = v1054;
				v1033 = v1053;
				v1031[v1032] = v1033;
				v1034 = p107;
				if v1034 then
					if p107 == "scavwar" then
						if maingui.NightEvent.Visible == false then
							maingui.NightEvent.Visible = true;
							maingui.NightEvent.lefticon.ImageTransparency = 0;
							maingui.NightEvent.righticon.ImageTransparency = 0;
							maingui.NightEvent.middletext.ImageTransparency = 0;
							maingui.NightEvent.lefticon.Position = UDim2.new(-0.2, 0, 0.5, 0);
							maingui.NightEvent.righticon.Position = UDim2.new(1.2, 0, 0.5, 0);
							maingui.NightEvent.lefticon.Visible = true;
							maingui.NightEvent.middletext.Visible = false;
							maingui.NightEvent.righticon.Visible = true;
							spawn(function()
								v104({ "general_ui" }, "nightevent_start", nil, nil, true, true);
								local v1055 = 1 - 1;
								while true do
									maingui.NightEvent.lefticon.Position = maingui.NightEvent.lefticon.Position + UDim2.new(0.055, 0, 0, 0);
									maingui.NightEvent.righticon.Position = maingui.NightEvent.righticon.Position - UDim2.new(0.055, 0, 0, 0);
									RS:wait();
									if 0 <= 1 then
										if v1055 < 10 then

										else
											break;
										end;
									elseif 10 < v1055 then

									else
										break;
									end;
									v1055 = v1055 + 1;								
								end;
								maingui.NightEvent.lefticon.Position = UDim2.new(0.35, 0, 0.5, 0);
								maingui.NightEvent.righticon.Position = UDim2.new(0.65, 0, 0.5, 0);
								v104({ "general_ui" }, "nightevent_mid", nil, nil, true, true);
								v104({ "general_ui" }, "nightevent_scav", nil, nil, true, true);
								local v1056 = Instance.new("Frame");
								v1056.Name = "flashwhite";
								v1056.BorderSizePixel = 0;
								v1056.BackgroundColor3 = Color3.new(1, 1, 1);
								v1056.Size = UDim2.new(1, 0, 1, 0);
								v1056.ZIndex = 3;
								v1056.Parent = maingui;
								maingui.NightEvent.middletext.Visible = true;
								local v1057 = tick();
								while true do
									v1056.BackgroundTransparency = v1056.BackgroundTransparency + 0.05;
									RS:wait();
									if not (4 <= tick() - v1057) then

									else
										break;
									end;								
								end;
								v1056:Destroy();
								while true do
									maingui.NightEvent.middletext.ImageTransparency = maingui.NightEvent.middletext.ImageTransparency + 0.05;
									maingui.NightEvent.lefticon.ImageTransparency = maingui.NightEvent.middletext.ImageTransparency;
									maingui.NightEvent.righticon.ImageTransparency = maingui.NightEvent.middletext.ImageTransparency;
									RS:wait();
									if not (1 <= maingui.NightEvent.middletext.ImageTransparency) then

									else
										break;
									end;								
								end;
								maingui.NightEvent.lefticon.Visible = false;
								maingui.NightEvent.middletext.Visible = false;
								maingui.NightEvent.righticon.Visible = false;
								maingui.NightEvent.Visible = false;
							end);
						end;
					end;
				end;
				local v1058 = true;
				v1035 = v1006;
				v1036 = v1058;
				if v1035 == v1036 then
					spawn(function()
						while true do
							if 7 < tick() - alertplaytimer then
								maingui.alert.TextTransparency = maingui.alert.TextTransparency + 0.05;
							else
								maingui.alert.TextTransparency = 0;
							end;
							maingui.alert.TextStrokeTransparency = maingui.alert.TextTransparency;
							RS:wait();
							if not (1 <= maingui.alert.TextTransparency) then

							else
								break;
							end;						
						end;
						maingui.alert.TextTransparency = 1;
						maingui.alert.TextStrokeTransparency = maingui.alert.TextTransparency;
					end);
				end;
				return;
			end;
		elseif p106 == "THE SIEGE IS ABOUT TO COMMENCE" then
			if startperk.Value == "hubbing" then
				return;
			else
				spawn(function()
					if playerstats.Settings.MuteMusic == false then
						while true do
							l__workspace__1.clientmusic.Volume = l__workspace__1.clientmusic.Volume - 0.035;
							RS:wait();
							if not (l__workspace__1.clientmusic.Volume <= 0) then

							else
								break;
							end;						
						end;
						l__workspace__1.clientmusic.Volume = 1;
						l__workspace__1.clientmusic.Looped = false;
						l__workspace__1.clientmusic.SoundId = l__game__6.ReplicatedStorage.soundLibrary.gamemode.siegebeginning.SoundId;
						l__workspace__1.clientmusic:Play();
					end;
				end);
				v1006 = false;
				v1007 = maingui;
				v1008 = "alert";
				v1009 = v1007;
				v1010 = v1008;
				v1011 = v1009[v1010];
				v1037 = "TextTransparency";
				v1012 = v1011;
				v1013 = v1037;
				v1014 = v1012[v1013];
				v1038 = 1;
				v1015 = v1014;
				v1016 = v1038;
				if v1015 == v1016 then
					v1006 = true;
				end;
				v1039 = tick;
				v1017 = v1039;
				v1040 = v1017();
				v1018 = v1040;
				alertplaytimer = v1018;
				v1041 = maingui;
				v1042 = "alert";
				v1019 = v1041;
				v1020 = v1042;
				v1043 = v1019[v1020];
				v1044 = "Text";
				v1021 = v1043;
				v1022 = v1044;
				v1023 = p106;
				v1021[v1022] = v1023;
				v1045 = maingui;
				v1046 = "alert";
				v1024 = v1045;
				v1025 = v1046;
				v1047 = v1024[v1025];
				v1048 = 0;
				v1049 = "TextTransparency";
				v1026 = v1047;
				v1027 = v1049;
				v1028 = v1048;
				v1026[v1027] = v1028;
				v1050 = maingui;
				v1051 = "alert";
				v1029 = v1050;
				v1030 = v1051;
				v1052 = v1029[v1030];
				v1053 = 0;
				v1054 = "TextStrokeTransparency";
				v1031 = v1052;
				v1032 = v1054;
				v1033 = v1053;
				v1031[v1032] = v1033;
				v1034 = p107;
				if v1034 then
					if p107 == "scavwar" then
						if maingui.NightEvent.Visible == false then
							maingui.NightEvent.Visible = true;
							maingui.NightEvent.lefticon.ImageTransparency = 0;
							maingui.NightEvent.righticon.ImageTransparency = 0;
							maingui.NightEvent.middletext.ImageTransparency = 0;
							maingui.NightEvent.lefticon.Position = UDim2.new(-0.2, 0, 0.5, 0);
							maingui.NightEvent.righticon.Position = UDim2.new(1.2, 0, 0.5, 0);
							maingui.NightEvent.lefticon.Visible = true;
							maingui.NightEvent.middletext.Visible = false;
							maingui.NightEvent.righticon.Visible = true;
							spawn(function()
								v104({ "general_ui" }, "nightevent_start", nil, nil, true, true);
								v1055 = 1 - 1;
								while true do
									maingui.NightEvent.lefticon.Position = maingui.NightEvent.lefticon.Position + UDim2.new(0.055, 0, 0, 0);
									maingui.NightEvent.righticon.Position = maingui.NightEvent.righticon.Position - UDim2.new(0.055, 0, 0, 0);
									RS:wait();
									if 0 <= 1 then
										if v1055 < 10 then

										else
											break;
										end;
									elseif 10 < v1055 then

									else
										break;
									end;
									v1055 = v1055 + 1;								
								end;
								maingui.NightEvent.lefticon.Position = UDim2.new(0.35, 0, 0.5, 0);
								maingui.NightEvent.righticon.Position = UDim2.new(0.65, 0, 0.5, 0);
								v104({ "general_ui" }, "nightevent_mid", nil, nil, true, true);
								v104({ "general_ui" }, "nightevent_scav", nil, nil, true, true);
								v1056 = Instance.new("Frame");
								v1056.Name = "flashwhite";
								v1056.BorderSizePixel = 0;
								v1056.BackgroundColor3 = Color3.new(1, 1, 1);
								v1056.Size = UDim2.new(1, 0, 1, 0);
								v1056.ZIndex = 3;
								v1056.Parent = maingui;
								maingui.NightEvent.middletext.Visible = true;
								v1057 = tick();
								while true do
									v1056.BackgroundTransparency = v1056.BackgroundTransparency + 0.05;
									RS:wait();
									if not (4 <= tick() - v1057) then

									else
										break;
									end;								
								end;
								v1056:Destroy();
								while true do
									maingui.NightEvent.middletext.ImageTransparency = maingui.NightEvent.middletext.ImageTransparency + 0.05;
									maingui.NightEvent.lefticon.ImageTransparency = maingui.NightEvent.middletext.ImageTransparency;
									maingui.NightEvent.righticon.ImageTransparency = maingui.NightEvent.middletext.ImageTransparency;
									RS:wait();
									if not (1 <= maingui.NightEvent.middletext.ImageTransparency) then

									else
										break;
									end;								
								end;
								maingui.NightEvent.lefticon.Visible = false;
								maingui.NightEvent.middletext.Visible = false;
								maingui.NightEvent.righticon.Visible = false;
								maingui.NightEvent.Visible = false;
							end);
						end;
					end;
				end;
				v1058 = true;
				v1035 = v1006;
				v1036 = v1058;
				if v1035 == v1036 then
					spawn(function()
						while true do
							if 7 < tick() - alertplaytimer then
								maingui.alert.TextTransparency = maingui.alert.TextTransparency + 0.05;
							else
								maingui.alert.TextTransparency = 0;
							end;
							maingui.alert.TextStrokeTransparency = maingui.alert.TextTransparency;
							RS:wait();
							if not (1 <= maingui.alert.TextTransparency) then

							else
								break;
							end;						
						end;
						maingui.alert.TextTransparency = 1;
						maingui.alert.TextStrokeTransparency = maingui.alert.TextTransparency;
					end);
				end;
				return;
			end;
		else
			if p106 == "TRANSPORT SHIP IS HERE - GOOD WORK OUT THERE, EVERYONE" then
				l__workspace__1.clientmusic.Volume = 1;
				l__workspace__1.clientmusic.Looped = false;
				l__workspace__1.clientmusic:Stop();
			elseif p106 == "DAMNIT! WE'RE HIT BY AN ORBITAL BOMBARDMENT!" then
				l__workspace__1.clientmusic.Volume = 1;
				l__workspace__1.clientmusic.Looped = false;
				l__workspace__1.clientmusic.SoundId = l__game__6.ReplicatedStorage.soundLibrary.gamemode.gamemodeA.SoundId;
				l__workspace__1.clientmusic:Play();
			elseif p106 == "ANOTHER WAVE INCOMING! WE'VE GOT SOME MORE SUPPLIES FOR YOU!" then
				l__workspace__1.clientmusic.Volume = 1;
				l__workspace__1.clientmusic.Looped = true;
				l__workspace__1.clientmusic.SoundId = l__game__6.ReplicatedStorage.soundLibrary.gamemode.gamemodeC.SoundId;
				l__workspace__1.clientmusic:Play();
			elseif p106 == "'You believe you can stand against Ulacylon? I'll personally sign your death report!'" then
				l__workspace__1.clientmusic.Volume = 1;
				l__workspace__1.clientmusic.Looped = false;
				l__workspace__1.clientmusic.SoundId = l__game__6.ReplicatedStorage.soundLibrary.gamemode.gamemodeB.SoundId;
				l__workspace__1.clientmusic:Play();
			elseif p106 == "DUEL BEGINNING" then
				l__game__6.ReplicatedStorage.effects.spawnFX:Clone().Parent = ply.PlayerGui;
				maingui.hubframe.hubdisp.Text = "PRESS K TO FORFEIT";
				maingui.HealthFrame.Visible = true;
				maingui.StaminaFrame.Visible = true;
				u102 = mouse.Button1Down:connect(u103);
				u104 = mouse.Button2Down:connect(u105);
				maingui.Centre.Visible = true;
			end;
			v1006 = false;
			v1007 = maingui;
			v1008 = "alert";
			v1009 = v1007;
			v1010 = v1008;
			v1011 = v1009[v1010];
			v1037 = "TextTransparency";
			v1012 = v1011;
			v1013 = v1037;
			v1014 = v1012[v1013];
			v1038 = 1;
			v1015 = v1014;
			v1016 = v1038;
			if v1015 == v1016 then
				v1006 = true;
			end;
			v1039 = tick;
			v1017 = v1039;
			v1040 = v1017();
			v1018 = v1040;
			alertplaytimer = v1018;
			v1041 = maingui;
			v1042 = "alert";
			v1019 = v1041;
			v1020 = v1042;
			v1043 = v1019[v1020];
			v1044 = "Text";
			v1021 = v1043;
			v1022 = v1044;
			v1023 = p106;
			v1021[v1022] = v1023;
			v1045 = maingui;
			v1046 = "alert";
			v1024 = v1045;
			v1025 = v1046;
			v1047 = v1024[v1025];
			v1048 = 0;
			v1049 = "TextTransparency";
			v1026 = v1047;
			v1027 = v1049;
			v1028 = v1048;
			v1026[v1027] = v1028;
			v1050 = maingui;
			v1051 = "alert";
			v1029 = v1050;
			v1030 = v1051;
			v1052 = v1029[v1030];
			v1053 = 0;
			v1054 = "TextStrokeTransparency";
			v1031 = v1052;
			v1032 = v1054;
			v1033 = v1053;
			v1031[v1032] = v1033;
			v1034 = p107;
			if v1034 then
				if p107 == "scavwar" then
					if maingui.NightEvent.Visible == false then
						maingui.NightEvent.Visible = true;
						maingui.NightEvent.lefticon.ImageTransparency = 0;
						maingui.NightEvent.righticon.ImageTransparency = 0;
						maingui.NightEvent.middletext.ImageTransparency = 0;
						maingui.NightEvent.lefticon.Position = UDim2.new(-0.2, 0, 0.5, 0);
						maingui.NightEvent.righticon.Position = UDim2.new(1.2, 0, 0.5, 0);
						maingui.NightEvent.lefticon.Visible = true;
						maingui.NightEvent.middletext.Visible = false;
						maingui.NightEvent.righticon.Visible = true;
						spawn(function()
							v104({ "general_ui" }, "nightevent_start", nil, nil, true, true);
							v1055 = 1 - 1;
							while true do
								maingui.NightEvent.lefticon.Position = maingui.NightEvent.lefticon.Position + UDim2.new(0.055, 0, 0, 0);
								maingui.NightEvent.righticon.Position = maingui.NightEvent.righticon.Position - UDim2.new(0.055, 0, 0, 0);
								RS:wait();
								if 0 <= 1 then
									if v1055 < 10 then

									else
										break;
									end;
								elseif 10 < v1055 then

								else
									break;
								end;
								v1055 = v1055 + 1;							
							end;
							maingui.NightEvent.lefticon.Position = UDim2.new(0.35, 0, 0.5, 0);
							maingui.NightEvent.righticon.Position = UDim2.new(0.65, 0, 0.5, 0);
							v104({ "general_ui" }, "nightevent_mid", nil, nil, true, true);
							v104({ "general_ui" }, "nightevent_scav", nil, nil, true, true);
							v1056 = Instance.new("Frame");
							v1056.Name = "flashwhite";
							v1056.BorderSizePixel = 0;
							v1056.BackgroundColor3 = Color3.new(1, 1, 1);
							v1056.Size = UDim2.new(1, 0, 1, 0);
							v1056.ZIndex = 3;
							v1056.Parent = maingui;
							maingui.NightEvent.middletext.Visible = true;
							v1057 = tick();
							while true do
								v1056.BackgroundTransparency = v1056.BackgroundTransparency + 0.05;
								RS:wait();
								if not (4 <= tick() - v1057) then

								else
									break;
								end;							
							end;
							v1056:Destroy();
							while true do
								maingui.NightEvent.middletext.ImageTransparency = maingui.NightEvent.middletext.ImageTransparency + 0.05;
								maingui.NightEvent.lefticon.ImageTransparency = maingui.NightEvent.middletext.ImageTransparency;
								maingui.NightEvent.righticon.ImageTransparency = maingui.NightEvent.middletext.ImageTransparency;
								RS:wait();
								if not (1 <= maingui.NightEvent.middletext.ImageTransparency) then

								else
									break;
								end;							
							end;
							maingui.NightEvent.lefticon.Visible = false;
							maingui.NightEvent.middletext.Visible = false;
							maingui.NightEvent.righticon.Visible = false;
							maingui.NightEvent.Visible = false;
						end);
					end;
				end;
			end;
			v1058 = true;
			v1035 = v1006;
			v1036 = v1058;
			if v1035 == v1036 then
				spawn(function()
					while true do
						if 7 < tick() - alertplaytimer then
							maingui.alert.TextTransparency = maingui.alert.TextTransparency + 0.05;
						else
							maingui.alert.TextTransparency = 0;
						end;
						maingui.alert.TextStrokeTransparency = maingui.alert.TextTransparency;
						RS:wait();
						if not (1 <= maingui.alert.TextTransparency) then

						else
							break;
						end;					
					end;
					maingui.alert.TextTransparency = 1;
					maingui.alert.TextStrokeTransparency = maingui.alert.TextTransparency;
				end);
			end;
			return;
		end;
	end;
	if startperk.Value == "hubbing" then
		return;
	end;
	if p106[1] == ply.Name then
		v121.placed = 1;
		if playerstats.Settings.MuteMusic == false then
			l__workspace__1.clientmusic:Stop();
			l__workspace__1.clientmusic.SoundId = l__game__6.ReplicatedStorage.soundLibrary.gamemode.matchwin.SoundId;
			l__workspace__1.clientmusic.Volume = 1.5;
			l__workspace__1.clientmusic:Play();
		end;
		local v1059, v1060, v1061 = ipairs(maingui:GetChildren());
		while true do
			local v1062, v1063 = v1059(v1060, v1061);
			if v1062 then

			else
				break;
			end;
			v1061 = v1062;
			if v1063:IsA("ScreenGui") ~= true then
				v1063.Visible = false;
			end;		
		end;
		character.HumanoidRootPart.Anchored = true;
		delay(1.5, function()
			maingui.victoryframe.Visible = true;
		end);
		delay(5, function()
			while true do
				ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency - 0.05;
				RS:wait();
				if not (ply.PlayerGui.fadetoblack.frame.BackgroundTransparency <= 0) then

				else
					break;
				end;			
			end;
			delay(1, function()
				maingui.victoryframe.Visible = false;
				character.HumanoidRootPart.Anchored = false;
				character.HumanoidRootPart.CFrame = l__workspace__1.VictoryPodium.tpto.CFrame;
				l__game__6:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
				delay(0.5, function()
					v104({ "gamemode" }, "cheer", nil, nil, true, true);
					v104({ "gamemode" }, "fireworks", nil, nil, true, true);
					while true do
						ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency + 0.05;
						RS:wait();
						if not (1 <= ply.PlayerGui.fadetoblack.frame.BackgroundTransparency) then

						else
							break;
						end;					
					end;
					delay(2, function()
						local v1064 = l__game__6.ReplicatedStorage.effects.endgamegui:Clone();
						v1064.Parent = ply.PlayerGui;
						u101(v1064, "win");
						delay(25, function()
							while true do
								ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency - 0.05;
								RS:wait();
								if not (ply.PlayerGui.fadetoblack.frame.BackgroundTransparency <= 0) then

								else
									break;
								end;							
							end;
						end);
					end);
				end);
			end);
		end);
		return;
	end;
	if p106[1] ~= "TeamA" then
		if p106[1] == "TeamB" then

		elseif p106[1] == "event" then
			if l__workspace__1.ServerStuff.game.stage.Value ~= "gameinprogress" then
				return;
			else
				if playerstats.Settings.MuteMusic == false then
					v104({ "events", "survevents" }, p106[2], nil, nil, true, true);
				end;
				delay(0.3, function()
					local v1065 = maingui.eventframe.frameofevent:Clone();
					if p106[2] == "killswitch" then
						v1065.eventname.Text = "The KillSwitch!";
						v1065.desc.Text = "A master KillSwitch Panel has been placed in the center of the map!\nActivate it and see what happens!";
					elseif p106[2] == "monte" then
						v1065.eventname.Text = "Three Crate Monte!";
						v1065.desc.Text = "One Ulacylon Special airdrop have been delivered to the center arena!\nThe other two will go boom!";
					elseif p106[2] == "bloodrush" then
						v1065.eventname.Text = "Blood Rush!";
						v1065.desc.Text = "Soon, every contestant will be marked through walls with their health status!\nKills will grant a health bonus!";
						delay(7, function()
							local v1066 = l__game__6.ReplicatedStorage.effects.bloodrushflash:Clone();
							l__Debris__32:AddItem(v1066, 5);
							v104({ "events" }, "bloodrushsfx", nil, nil, true, true);
							afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS)["Speedy Thrusts"]);
							v1066.Parent = ply.PlayerGui;
							spawn(function()
								while true do
									v1066.frame.BackgroundTransparency = v1066.frame.BackgroundTransparency + 0.05;
									RS:wait();
									if not (1 <= v1066.frame.BackgroundTransparency) then

									else
										break;
									end;								
								end;
							end);
							l__game__6.ReplicatedStorage.effects.bloodrush:Clone().Parent = l__game__6.Lighting;
							local v1067, v1068, v1069 = ipairs(l__workspace__1.activePlayers:GetChildren());
							while true do
								local v1070, v1071 = v1067(v1068, v1069);
								if v1070 then

								else
									break;
								end;
								v1069 = v1070;
								if v1071.Name ~= character.Name then
									if v1071:FindFirstChild("Humanoid") then
										if 0 < v1071:FindFirstChild("Humanoid").Health then
											if v1071:FindFirstChild("Head") then
												local v1072 = l__game__6.ReplicatedStorage.misc.teammateindicator:Clone();
												v1072.Name = "BloodRushMarker";
												v1072.AlwaysOnTop = true;
												local v1073 = v1071:FindFirstChild("Humanoid").Health / v1071:FindFirstChild("Humanoid").MaxHealth;
												if v1073 <= 0.5 then
													v1073 = v1073 - 0.1;
												end;
												v1072.ImageLabel.ImageColor3 = Color3.new(1, v1073, v1073);
												v1072.Adornee = v1071.Head;
												v1072.Parent = ply.PlayerGui;
												v1071.Humanoid.Died:Connect(function()
													v1072:Destroy();
												end);
											end;
										end;
									end;
								end;							
							end;
							delay(20, function()
								local v1074 = l__game__6.ReplicatedStorage.effects.bloodrushflash:Clone();
								l__Debris__32:AddItem(v1074, 5);
								v1074.Parent = ply.PlayerGui;
								spawn(function()
									while true do
										v1074.frame.BackgroundTransparency = v1074.frame.BackgroundTransparency + 0.05;
										RS:wait();
										if not (1 <= v1074.frame.BackgroundTransparency) then

										else
											break;
										end;									
									end;
								end);
								if l__game__6.Lighting:FindFirstChild("bloodrush") then
									l__game__6.Lighting:FindFirstChild("bloodrush"):Destroy();
								end;
								if u9["Speed Buff"] then
									u9["Speed Buff"].effects.currentduration = 0;
								end;
								local v1075, v1076, v1077 = ipairs(ply.PlayerGui:GetChildren());
								while true do
									local v1078, v1079 = v1075(v1076, v1077);
									if v1078 then

									else
										break;
									end;
									v1077 = v1078;
									if v1079.Name == "BloodRushMarker" then
										v1079:Destroy();
									end;								
								end;
							end);
						end);
					elseif p106[2] == "flareraid" then
						v1065.eventname.Text = "Flare Raid!";
						v1065.desc.Text = "Three Drones will fly over the arena and drop a Flare Box!\nGrab them while it's hot!";
					elseif p106[2] == "exotic" then
						v1065.eventname.Text = "Exotic Armoury!";
						v1065.desc.Text = "A very slow drone carrying an Airdrop with an exceedingly dangerous weapon will arrive at the map centre!";
					elseif p106[2] == "thunder" then
						v1065.eventname.Text = "Rolling Thunder!";
						v1065.desc.Text = "Soon, missiles will embed across the arena before exploding!\nGet to a safe bunker!";
					end;
					v1065.Parent = maingui.eventframe;
					spawn(function()
						local v1080 = 1 - 1;
						while true do
							v1065.Position = v1065.Position:Lerp(UDim2.new(0, 0, 0, 0), 0.1);
							RS:wait();
							if 0 <= 1 then
								if v1080 < 60 then

								else
									break;
								end;
							elseif 60 < v1080 then

							else
								break;
							end;
							v1080 = v1080 + 1;						
						end;
						delay(8, function()
							local v1081 = 1 - 1;
							while true do
								v1065.Position = v1065.Position:Lerp(UDim2.new(-1.5, 0, 0, 0), 0.1);
								RS:wait();
								if 0 <= 1 then
									if v1081 < 60 then

									else
										break;
									end;
								elseif 60 < v1081 then

								else
									break;
								end;
								v1081 = v1081 + 1;							
							end;
							v1065:Destroy();
						end);
					end);
				end);
				return;
			end;
		else
			delay(5, function()
				while true do
					ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency - 0.05;
					RS:wait();
					if not (ply.PlayerGui.fadetoblack.frame.BackgroundTransparency <= 0) then

					else
						break;
					end;				
				end;
				l__CurrentCamera__1.CameraType = "Scriptable";
				l__CurrentCamera__1.CameraSubject = nil;
				l__CurrentCamera__1.FieldOfView = 40;
				l__CurrentCamera__1.CFrame = CFrame.new(-0.148798391, -353.016663, -454.323242, 0.999984622, -0.000636289711, -0.00550709572, -5.82076609E-11, 0.993391395, -0.114776433, 0.00554373208, 0.114774667, 0.993376136);
				delay(3, function()
					while true do
						ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency + 0.05;
						RS:wait();
						if not (1 <= ply.PlayerGui.fadetoblack.frame.BackgroundTransparency) then

						else
							break;
						end;					
					end;
					delay(30, function()
						while true do
							ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency - 0.05;
							RS:wait();
							if not (ply.PlayerGui.fadetoblack.frame.BackgroundTransparency <= 0) then

							else
								break;
							end;						
						end;
					end);
				end);
			end);
			return;
		end;
	end;
	local v1082 = true;
	if p106[1] == "TeamA" then
		if startperk.Value ~= "siegeB" then
			if startperk.Value ~= "tElimB" then
				if startperk.Value ~= "hiddenB" then
					if startperk.Value ~= "turfwarB" then
						if startperk.Value ~= "jElimB" then
							if startperk.Value ~= "shadowForm" then
								if startperk.Value ~= "commander" then
									if p106[1] == "TeamB" then
										if startperk.Value ~= "siegeA" then
											if startperk.Value ~= "tElimA" then
												if startperk.Value ~= "hiddenA" then
													if startperk.Value ~= "shadowGame" then
														if startperk.Value ~= "coopvsDS" then
															if startperk.Value ~= "coopvsRIS" then
																if startperk.Value ~= "turfwarA" then
																	if startperk.Value ~= "jElimA" then
																		if startperk.Value == "emperor" then
																			v1082 = false;
																		end;
																	else
																		v1082 = false;
																	end;
																else
																	v1082 = false;
																end;
															else
																v1082 = false;
															end;
														else
															v1082 = false;
														end;
													else
														v1082 = false;
													end;
												else
													v1082 = false;
												end;
											else
												v1082 = false;
											end;
										else
											v1082 = false;
										end;
									end;
								else
									v1082 = false;
								end;
							else
								v1082 = false;
							end;
						else
							v1082 = false;
						end;
					else
						v1082 = false;
					end;
				else
					v1082 = false;
				end;
			else
				v1082 = false;
			end;
		else
			v1082 = false;
		end;
	elseif p106[1] == "TeamB" then
		if startperk.Value ~= "siegeA" then
			if startperk.Value ~= "tElimA" then
				if startperk.Value ~= "hiddenA" then
					if startperk.Value ~= "shadowGame" then
						if startperk.Value ~= "coopvsDS" then
							if startperk.Value ~= "coopvsRIS" then
								if startperk.Value ~= "turfwarA" then
									if startperk.Value ~= "jElimA" then
										if startperk.Value == "emperor" then
											v1082 = false;
										end;
									else
										v1082 = false;
									end;
								else
									v1082 = false;
								end;
							else
								v1082 = false;
							end;
						else
							v1082 = false;
						end;
					else
						v1082 = false;
					end;
				else
					v1082 = false;
				end;
			else
				v1082 = false;
			end;
		else
			v1082 = false;
		end;
	end;
	local v1083 = "teamvictory";
	delay(0.1, function()
		l__workspace__1.clientmusic.Volume = 0;
		if 0 < hum.Health then
			delay(4, function()
				local v1084 = l__game__6.ReplicatedStorage.effects.endgamegui:Clone();
				v1084.Parent = ply.PlayerGui;
				u101(v1084, "siege");
			end);
		end;
	end);
	if v1082 == false then
		maingui.TeamResults.bg.ImageColor3 = Color3.new(0.8705882352941177, 0, 0);
		maingui.TeamResults.definetext.Text = "D E F E A T";
		maingui.TeamResults.lowertext.Text = "TEAM LEADER ELIMINATED";
		v1083 = "teamdefeat";
	end;
	if startperk.Value ~= "tElimB" then
		if startperk.Value == "tElimA" then
			maingui.TeamResults.lowertext.Text = "OPPOSING TEAM ELIMINATED";
			if v1082 == false then
				maingui.TeamResults.lowertext.Text = "CURRENT TEAM ELIMINATED";
			end;
		end;
	else
		maingui.TeamResults.lowertext.Text = "OPPOSING TEAM ELIMINATED";
		if v1082 == false then
			maingui.TeamResults.lowertext.Text = "CURRENT TEAM ELIMINATED";
		end;
	end;
	if startperk.Value ~= "hiddenA" then
		if startperk.Value == "hiddenB" then
			if startperk.Value == "hiddenA" then
				maingui.TeamResults.lowertext.Text = "HIDDEN ELIMINATED";
			else
				maingui.TeamResults.lowertext.Text = "ULACYLONS SOULS HAVE BEEN FREED";
			end;
			if v1082 == false then
				if startperk.Value == "hiddenA" then
					maingui.TeamResults.lowertext.Text = "ULACYLON DEFEATED";
				else
					maingui.TeamResults.lowertext.Text = "THE HIDDEN HAS PERISHED";
				end;
			end;
		end;
	else
		if startperk.Value == "hiddenA" then
			maingui.TeamResults.lowertext.Text = "HIDDEN ELIMINATED";
		else
			maingui.TeamResults.lowertext.Text = "ULACYLONS SOULS HAVE BEEN FREED";
		end;
		if v1082 == false then
			if startperk.Value == "hiddenA" then
				maingui.TeamResults.lowertext.Text = "ULACYLON DEFEATED";
			else
				maingui.TeamResults.lowertext.Text = "THE HIDDEN HAS PERISHED";
			end;
		end;
	end;
	if startperk.Value ~= "shadowForm" then
		if startperk.Value == "shadowGame" then
			if startperk.Value == "shadowGame" then
				maingui.TeamResults.lowertext.Text = "YOU HAVE SURVIVED AND EXTRACTED";
			else
				maingui.TeamResults.lowertext.Text = "ENOUGH SOULS HAVE BEEN REAPED FOR REIKGON";
			end;
			if v1082 == false then
				if startperk.Value == "shadowGame" then
					maingui.TeamResults.lowertext.Text = "YOUR SOUL IS CONDEMNED TO REIKGON";
				else
					maingui.TeamResults.lowertext.Text = "INSUFFICIENT SOULS FOR REIKGON";
				end;
			end;
		end;
	else
		if startperk.Value == "shadowGame" then
			maingui.TeamResults.lowertext.Text = "YOU HAVE SURVIVED AND EXTRACTED";
		else
			maingui.TeamResults.lowertext.Text = "ENOUGH SOULS HAVE BEEN REAPED FOR REIKGON";
		end;
		if v1082 == false then
			if startperk.Value == "shadowGame" then
				maingui.TeamResults.lowertext.Text = "YOUR SOUL IS CONDEMNED TO REIKGON";
			else
				maingui.TeamResults.lowertext.Text = "INSUFFICIENT SOULS FOR REIKGON";
			end;
		end;
	end;
	if startperk.Value ~= "turfwarA" then
		if startperk.Value == "turfwarB" then
			if startperk.Value == "turfwarA" then
				maingui.TeamResults.lowertext.Text = "RIS HAS BEEN ELIMINATED";
			else
				maingui.TeamResults.lowertext.Text = "UMG HAS BEEN FOUGHT BACK";
			end;
			if v1082 == false then
				if startperk.Value == "turfwarA" then
					maingui.TeamResults.lowertext.Text = "SQUAD ELIMINATED";
				else
					maingui.TeamResults.lowertext.Text = "MISSION FAILURE";
				end;
			end;
		end;
	else
		if startperk.Value == "turfwarA" then
			maingui.TeamResults.lowertext.Text = "RIS HAS BEEN ELIMINATED";
		else
			maingui.TeamResults.lowertext.Text = "UMG HAS BEEN FOUGHT BACK";
		end;
		if v1082 == false then
			if startperk.Value == "turfwarA" then
				maingui.TeamResults.lowertext.Text = "SQUAD ELIMINATED";
			else
				maingui.TeamResults.lowertext.Text = "MISSION FAILURE";
			end;
		end;
	end;
	if startperk.Value ~= "coopvsDS" then
		if startperk.Value == "coopvsRIS" then
			maingui.TeamResults.lowertext.Text = "MISSION SUCCESS";
			if v1082 == false then
				maingui.TeamResults.lowertext.Text = "MISSION FAILURE";
			end;
		end;
	else
		maingui.TeamResults.lowertext.Text = "MISSION SUCCESS";
		if v1082 == false then
			maingui.TeamResults.lowertext.Text = "MISSION FAILURE";
		end;
	end;
	if startperk.Value ~= "jElimA" then
		if startperk.Value == "jElimB" then
			if startperk.Value == "jElimA" then
				maingui.TeamResults.lowertext.Text = "JUGGERNAUT DEFEATED";
			else
				maingui.TeamResults.lowertext.Text = "JUGGERNAUT VICTORY";
			end;
			if v1082 == false then
				if startperk.Value == "jElimA" then
					maingui.TeamResults.lowertext.Text = "TEAM WIPED OUT";
				else
					maingui.TeamResults.lowertext.Text = "JUGGERNAUT LOSS";
				end;
			end;
		end;
	else
		if startperk.Value == "jElimA" then
			maingui.TeamResults.lowertext.Text = "JUGGERNAUT DEFEATED";
		else
			maingui.TeamResults.lowertext.Text = "JUGGERNAUT VICTORY";
		end;
		if v1082 == false then
			if startperk.Value == "jElimA" then
				maingui.TeamResults.lowertext.Text = "TEAM WIPED OUT";
			else
				maingui.TeamResults.lowertext.Text = "JUGGERNAUT LOSS";
			end;
		end;
	end;
	v104({ "gamemode" }, v1083, nil, nil, true, true);
	maingui.TeamResults.Visible = true;
	spawn(function()
		local v1085 = 1 - 1;
		while true do
			maingui.TeamResults.bg.ImageTransparency = maingui.TeamResults.bg.ImageTransparency - 0.075;
			maingui.TeamResults.bg.Size = maingui.TeamResults.bg.Size:Lerp(UDim2.new(1, 0, 1, 0), 0.1);
			RS:wait();
			if 0 <= 1 then
				if v1085 < 60 then

				else
					break;
				end;
			elseif 60 < v1085 then

			else
				break;
			end;
			v1085 = v1085 + 1;		
		end;
		delay(15, function()
			while true do
				ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency - 0.05;
				RS:wait();
				if not (ply.PlayerGui.fadetoblack.frame.BackgroundTransparency <= 0) then

				else
					break;
				end;			
			end;
		end);
	end);
end;
if playerstats.Class == "damn" or playerstats.Class == "survival" then
	maingui.PerkFrame.Visible = false;
	if playerstats.Class == "damn" then
		maingui.UpperLower.Visible = false;
		ration_system_handler.hunger = 0;
		ration_system_handler.thirst = 0;
	else
		ration_system_handler.hunger = tick();
		ration_system_handler.thirst = tick();
	end;
end;
if playerstats.Class == "hive" and character:FindFirstChild("playerSwarm") then
	character:FindFirstChild("playerSwarm").hive_loop.Volume = 0;
	character:FindFirstChild("playerSwarm").static.Enabled = false;
	character:FindFirstChild("playerSwarm").static2.Enabled = false;
end;
l__workspace__1.ServerStuff.alertPlay.OnClientEvent:Connect(alertplay);
spectating = false;
if startperk.Value == "hubbing" then
	spectating = true;
end;
spectatesystem = nil;
kickoutspec = nil;
forcespecfolder = false;
if startperk.Value == "hubbing" then
	l__workspace__1.ServerStuff.game.stage.Changed:Connect(function(p108)
		if p108 ~= "gameinprogress" and spectating == true then
			kickoutspec();
		end;
		if p108 == "gamestartingnow" then
			alertplay("MAIN GAME IS ABOUT TO BEGIN");
			return;
		end;
		if p108 == "gameinprogress" then
			alertplay("MAIN GAME IS NOW IN PROGRESS");
			return;
		end;
		if p108 == "gameending" then
			alertplay("MAIN GAME IS ENDING");
			return;
		end;
		if p108 == "intermission" then
			alertplay("MAIN GAME IS NOW IN INTERMISSION");
		end;
	end);
end;
l__workspace__1.ServerStuff.killFeed.OnClientEvent:Connect(function(p109, p110)
	if startperk.Value == "hubbing" then
		return;
	end;
	if hum.Health <= 0 then
		return;
	end;
	if p109 == "aikill" then
		if v121.killcombo >= 15 then
			v121.killcombo = 0;
			l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "TenAvoids", 1 });
		else
			v121.killcombo = v121.killcombo + 1;
		end;
		if u14.weapontype == "Bludgeon" or u14.weapontype == "Blade" or u14.weapontype == "Fists" or u14.weapontype == "Spear" or u14.weapontype == "Axe" then
			if v63.berzactive ~= nil then
				l__workspace__1.ServerStuff.dealDamage:FireServer("berzheal", nil, v5, v4);
				local v1086 = v63.berzactive + v64[3].regenonkill;
				if tick() - v1086 > 0 then
					v63.berzactive = v1086;
					return;
				else
					v63.berzactive = tick();
					return;
				end;
			elseif v63.gogglesactive ~= nil and v63.gogglehandledamage ~= nil then
				v63.gogglehandledamage("add");
			end;
		end;
	end;
end);
if v64[3].start_empty == true then
	u88 = tick();
end;
local u106 = false;
l__workspace__1.ServerStuff.givePlayerIndicator.OnClientEvent:Connect(function(p111, p112)
	if startperk.Value == "hubbing" or hum.Health <= 0 then
		return;
	end;
	if (p111 == "xpadded" or p111 == "addoden") and playerstats.Settings.HideGains == true then
		return;
	end;
	v104({ "general" }, "serverindicator", nil, nil, true, true);
	local v1087 = maingui.Centre.xpandgold.ex:Clone();
	l__Debris__32:AddItem(v1087, 5);
	v1087.Name = "notex";
	v1087.Visible = true;
	v1087.Position = UDim2.new(0.5, 0, 0, -16 + 16 * #maingui.Centre.xpandgold:GetChildren());
	if p111 == "xpadded" then
		v1087.Text = p112 .. " XP earned.";
	elseif p111 == "addoden" then
		v1087.Text = p112 .. " Odens gained.";
	elseif p111 == "levelup" then
		v1087.Text = "Levelled up to " .. p112 .. ".";
	elseif p111 == "prophetscan" then
		v1087.Text = p112 .. " scanned.";
	elseif p111 == "lazarusbuff" then
		v1087.Text = p112 .. " Lazarus buffed.";
	elseif p111 == "immolatebuff" then
		v1087.Text = p112 .. " Immolator buffed.";
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).FireBuff);
	elseif p111 == "cloakedbuff" then
		v1087.Text = p112 .. " Drifter cloaked.";
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Stealth);
	elseif p111 == "ticktriggered" then
		v1087.Text = "Tick has been triggered.";
	elseif p111 == "commendgiven" then
		v1087.Text = p112 .. " commended.";
	elseif p111 == "commended" then
		l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "Commendments", 1 });
		v1087.Text = "Commended by " .. p112 .. ".";
	elseif p111 == "dronelatched" then
		v1087.Text = "Enemy has been Mindkilled.";
	elseif p111 == "dogtag" then
		v1087.Text = p112 .. " Dogtag collected.";
		if playerstats.Class == "sword" then
			maingui.PerkFrame.numberstat.Visible = true;
			if v63.dogtags == nil then
				v63.dogtags = p112;
			else
				v63.dogtags = v63.dogtags + p112;
			end;
			maingui.PerkFrame.numberstat.Text = v63.dogtags;
			local v1088 = p112;
			if v64[3].dogtagmaxmovement < v63.dogtags then
				v1088 = v1088 - (v63.dogtags - v64[3].dogtagmaxmovement);
			end;
			if v1088 > 0 then
				u19 = u19 + 10 * (v64[3].dogtagmovementbuff * v1088) / 100;
			end;
		end;
	end;
	v1087.Parent = maingui.Centre.xpandgold;
	spawn(function()
		while true do
			v1087.gradient.ImageTransparency = v1087.gradient.ImageTransparency + 0.1;
			v1087.gradient.Size = v1087.gradient.Size + UDim2.new(0, 2, 0, 0);
			RS:wait();
			if v1087.gradient.ImageTransparency >= 1 then
				break;
			end;		
		end;
		v1087.gradient.ImageTransparency = 1;
		local v1089 = tick();
		while true do
			RS:wait();
			if tick() - v1089 >= 2 then
				break;
			end;		
		end;
		while true do
			v1087.TextTransparency = v1087.TextTransparency + 0.1;
			v1087.TextStrokeTransparency = v1087.TextTransparency;
			RS:wait();
			if v1087.TextTransparency >= 1 then
				break;
			end;		
		end;
		v1087:Destroy();
		for v1090, v1091 in ipairs(maingui.Centre.xpandgold:GetChildren()) do
			if v1091.Name ~= "ex" and v1091.Position ~= UDim2.new(0.5, 0, 0, 0) then
				v1091.Position = v1091.Position - UDim2.new(0, 0, 0, 16);
			end;
		end;
	end);
end);
local function u107(p113, p114)
	local v1092 = p113;
	local v1093 = nil;
	for v1094, v1095 in ipairs(fparms:GetDescendants()) do
		if v1095.Name == v1092.Name and v1095:IsA("BasePart") then
			v1093 = v1095;
			v1092 = v1092:GetDescendants();
			break;
		end;
	end;
	if v1093 == nil then
		return;
	end;
	for v1096 = 1, #v1092 do
		if v1092[v1096]:IsA("BasePart") then
			v1092[v1096].Transparency = 0;
			local v1097 = Instance.new("Weld");
			v1097.Part0 = p113;
			v1097.Part1 = v1092[v1096];
			local v1098 = CFrame.new(p113.Position);
			v1097.C0 = p113.CFrame:inverse() * v1098;
			v1097.C1 = v1092[v1096].CFrame:inverse() * v1098;
			v1097.Parent = v1092[v1096];
			if p114 ~= nil then
				if v1092[v1096].Parent.Name == "primary" then
					if p114[1] ~= "original" then
						v1092[v1096].Color = Color3.new(p114[1][1], p114[1][2], p114[1][3]);
					end;
				elseif v1092[v1096].Parent.Name == "secondary" and p114[2] ~= "original" then
					v1092[v1096].Color = Color3.new(p114[2][1], p114[2][2], p114[2][3]);
				end;
			end;
			v1092[v1096].Locked = true;
			v1092[v1096].Anchored = false;
			v1092[v1096].CanCollide = false;
			v1092[v1096].Parent = p113;
		end;
	end;
	local v1099 = Instance.new("Weld");
	v1099.Part0 = v1093;
	v1099.Part1 = p113;
	v1099.C0 = CFrame.new(0, 0, 0);
	v1099.Parent = fparms.SkinParts;
	if p113.Parent.Name ~= "primary" and p113.Parent.Name ~= "secondary" then
		p113.Parent = fparms.SkinParts;
		return;
	end;
	p113.Parent.Parent = fparms.SkinParts;
end;
u89 = function(p115, p116)
	for v1100, v1101 in ipairs(fparms.SkinParts:GetChildren()) do
		v1101:Destroy();
	end;
	local v1102 = l__game__6.ReplicatedStorage.skins.firstperson:WaitForChild(p115):Clone();
	for v1103, v1104 in ipairs(fparms:GetDescendants()) do
		for v1105, v1106 in ipairs(v1102:GetChildren()) do
			if v1104.Name == v1106.Name and v1104:IsA("BasePart") then
				v1104.BrickColor = v1106.BrickColor;
			end;
		end;
	end;
	for v1107, v1108 in ipairs(v1102:GetChildren()) do
		if v1108:IsA("BasePart") then
			v1108.Transparency = 1;
			u107(v1108, p116);
		end;
	end;
	if l__CurrentCamera__1:FindFirstChild("Bottom") then
		l__CurrentCamera__1:FindFirstChild("Bottom"):Destroy();
		if character:FindFirstChild("Outfit") and character:FindFirstChild("Outfit"):FindFirstChild("Bottom") then
			character:FindFirstChild("Outfit"):FindFirstChild("Bottom"):Clone().Parent = l__workspace__1.Camera;
		end;
	end;
	if playerstats.Settings.AltSkin == true then
		for v1109, v1110 in ipairs(fparms:GetDescendants()) do
			if v1110:IsA("BasePart") and v1110.BrickColor == BrickColor.new("Pastel brown") then
				v1110.BrickColor = BrickColor.new("Dark taupe");
			end;
		end;
	end;
end;
if playerstats.Class == "damn" then
	local v1111 = l__game__6.ReplicatedStorage.misc.fpcuffs:Clone();
	v1111.cuffA.CFrame = fparms.LeftArm.LUpperArm.CFrame;
	local v1112 = Instance.new("Weld");
	v1112.Part0 = v1111.cuffA;
	v1112.Part1 = fparms.LeftArm.LUpperArm;
	v1112.C0 = CFrame.new(-85.2399902, -5.52000141, -0.500001013, 1, 0, 0, 0, 0, -1, 0, 1, 0);
	v1112.C1 = CFrame.new(-85.2399902, -5.14707661, -0.500001013, 1, 0, 0, 0, 0, -1, 0, 1, 0) * CFrame.new(0, 0, 0.6);
	v1112.Parent = v1111.cuffA;
	v1111.cuffB.CFrame = fparms.RightArm.RUpperArm.CFrame;
	local v1113 = Instance.new("Weld");
	v1113.Part0 = v1111.cuffB;
	v1113.Part1 = fparms.RightArm.RUpperArm;
	v1113.C0 = CFrame.new(-82.3999939, -5.52000141, -0.500001013, 1, 0, 0, 0, 0, -1, 0, 1, 0);
	v1113.C1 = CFrame.new(-82.3999939, -5.14707661, -0.500001013, 1, 0, 0, 0, 0, -1, 0, 1, 0) * CFrame.new(0, 0, 0.6);
	v1113.Parent = v1111.cuffB;
	v1111.Parent = fparms;
	spawn(function()
		local l__cuffs__1114 = character:WaitForChild("cuffs");
		if l__cuffs__1114 then
			l__cuffs__1114.beam.Enabled = false;
		end;
	end);
end;
function kickoutspec()
	v104({ "general" }, "keyboard", nil, nil, true, true);
	local v1115 = l__game__6.ReplicatedStorage.misc.staticflash:Clone();
	v1115.static.Disabled = false;
	v1115.Parent = ply.PlayerGui;
	u8.turnable = true;
	u8.action = false;
	u8.staggering = false;
	spectating = false;
	if ply.PlayerGui:FindFirstChild("endgamegui") then
		ply.PlayerGui:FindFirstChild("endgamegui"):Destroy();
	end;
	l__CurrentCamera__1.CameraSubject = ply.Character.Humanoid;
	l__CurrentCamera__1.CameraType = "Custom";
	u10 = 10;
	forcespecfolder = false;
	character.HumanoidRootPart.Anchored = false;
	ply.CameraMode = "LockFirstPerson";
	UIS.MouseIconEnabled = false;
	maingui.Enabled = true;
end;
local v1116 = tick();
local v1117 = tick();
l__workspace__1.ServerStuff.playerMatsHandler.OnClientEvent:Connect(function(p117, p118)
	if p117 ~= "ammo" then
		if p117 == "scrap" then
			l__workspace__1.ServerStuff.playAudio:FireServer({ "world_item" }, "scrap_pickup", character.HumanoidRootPart, 0.1);
			u34(p118[2], p118[1]);
			return;
		else
			if p117 == "rations" then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "world_item" }, "ration_pickup", character.HumanoidRootPart, 0.1);
				local v1118 = 1;
				if p118[2] then
					v1118 = p118[2];
				end;
				ration_system_handler[p118[1]] = ration_system_handler[p118[1]] + v1118;
			end;
			return;
		end;
	end;
	local v1119 = v47;
	if p118[3] ~= nil then
		v1119 = 0;
	elseif v64[3].ammo_cd_pickup ~= nil and tick() - u88 < v64[3].cooldown then
		u88 = u88 - v64[3].ammo_cd_pickup;
	end;
	if u59[string.sub(p118[1], 1, -6)] then
		u59[string.sub(p118[1], 1, -6)] = u59[string.sub(p118[1], 1, -6)] + p118[2] + math.ceil(p118[2] * v1119);
	end;
	l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "ammo_pickup", character.HumanoidRootPart, 0.1);
	invmanage("updatehud");
end);
local function v1120()
	v104({ "AGENT" }, "menu", nil, nil, true, true);
	local v1121 = maingui.TabMenu.bg.bg:Clone();
	v1121.Parent = maingui.TabMenu.bg;
	spawn(function()
		while true do
			v1121.ImageTransparency = v1121.ImageTransparency + 0.05;
			RS:wait();
			if v1121.ImageTransparency >= 1 then
				break;
			end;		
		end;
		v1121:Destroy();
	end);
end;
scrap_drop_amount = 5;
scrap_tick = tick();
function handle_scrap_drop(p119)
	scrap_drop_amount = scrap_drop_amount + p119;
	scrap_drop_amount = math.clamp(scrap_drop_amount, 0, u13);
end;
for v1122, v1123 in ipairs(maingui.TabMenu.bg.scraptab:GetChildren()) do
	if v1123:IsA("TextButton") then
		local u108 = v1117;
		v1123.MouseButton1Click:connect(function()
			v1120();
			if v1123.Name == "lessbutton" then
				handle_scrap_drop(-5);
			elseif v1123.Name == "majorlessbutton" then
				handle_scrap_drop(-25);
			elseif v1123.Name == "morebutton" then
				handle_scrap_drop(5);
			elseif v1123.Name == "majormorebutton" then
				handle_scrap_drop(25);
			end;
			if v1123.Name == "dropbutton" and u13 > 0 and tick() - scrap_tick >= 0.5 and scrap_drop_amount ~= 0 then
				u108 = tick();
				scrap_tick = tick();
				l__workspace__1.ServerStuff.dropAmmo:FireServer("scrap", scrap_drop_amount);
				u34(-scrap_drop_amount, "SALVAGE DROPPED");
				handle_scrap_drop(0);
			end;
		end);
	end;
end;
for v1124, v1125 in ipairs(maingui.TabMenu.bg.ammodroptab:GetChildren()) do
	if u59[v1125.Name] then
		local u109 = v1117;
		v1125.dropbutton.MouseButton1Click:connect(function()
			if tick() - u109 >= 0.2 then
				u109 = tick();
				v1120();
				v497(v1125.Name);
			end;
		end);
	end;
end;
for v1126, v1127 in ipairs(maingui.TabMenu.bg.rationstab:GetChildren()) do
	if ration_system_handler[v1127.Name] then
		local u110 = v1117;
		v1127.eat.MouseButton1Click:connect(function()
			if tick() - u110 >= 0.2 then
				u110 = tick();
				v1120();
				if ration_system_handler[v1127.Name] > 0 then
					local v1128 = false;
					local v1129 = ration_system_handler.cooldown_eat_tick;
					if v1127.Name == "Bottle" or v1127.Name == "Soda" then
						v1128 = true;
						v1129 = ration_system_handler.cooldown_drink_tick;
					end;
					if ration_system_handler.cooldown_rations < tick() - v1129 then
						if u14.weapontype == "Fists" then
							consume_rations(v1127.Name);
							return;
						else
							maingui.Thought.thoughttext.Text = "My hands are full right now.";
							inner_dialogue = tick();
							return;
						end;
					end;
					if v1128 == true then
						maingui.Thought.thoughttext.Text = "I can't drink any more right now.";
					else
						maingui.Thought.thoughttext.Text = "I can't eat any more right now.";
					end;
					inner_dialogue = tick();
				end;
			end;
		end);
		v1127.drop.MouseButton1Click:connect(function()
			if tick() - u110 >= 0.2 then
				u110 = tick();
				v1120();
				if tick() - u70 <= 0.3 then
					return;
				end;
				u70 = tick();
				if ration_system_handler[v1127.Name] > 0 then
					ration_system_handler[v1127.Name] = ration_system_handler[v1127.Name] - 1;
					l__workspace__1.ServerStuff.dropAmmo:FireServer("rations", v1127.Name);
				end;
			end;
		end);
	end;
end;
tabmenu_options = { maingui.TabMenu.bg.ammodrop, maingui.TabMenu.bg.scrap, maingui.TabMenu.bg.weaponinfo, maingui.TabMenu.bg.rations };
for v1130, v1131 in ipairs(tabmenu_options) do
	if maingui.TabMenu.bg:FindFirstChild(v1131.Name .. "tab") then
		v1131.MouseButton1Click:connect(function()
			v1120();
			for v1132, v1133 in ipairs(tabmenu_options) do
				if maingui.TabMenu.bg:FindFirstChild(v1133.Name .. "tab") then
					maingui.TabMenu.bg:FindFirstChild(v1133.Name .. "tab").Visible = false;
					v1133.BackgroundTransparency = 0.7;
				end;
			end;
			maingui.TabMenu.bg:FindFirstChild(v1131.Name .. "tab").Visible = true;
			v1131.BackgroundTransparency = 0.3;
		end);
	end;
end;
reset_arms_timer = 0;
local u111 = v124;
local u112 = v123;
function reset_arms()
	if tick() - reset_arms_timer <= 5 then
		return;
	end;
	if u8.using_perk == true then
		return;
	end;
	if u8.throwing == true then
		return;
	end;
	if u8.eating == true then
		return;
	end;
	if u8.poking == true then
		return;
	end;
	if u8.startswap == false then
		if u8.action == false then
			if u8.channel == false then
				if u8.staggering == false then
					if u8.shoving == false then
						if u8.cancombo == false then
							return;
						end;
					end;
				end;
			end;
		end;
	end;
	if u9.Snared then
		return;
	end;
	ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = 1;
	spectating = false;
	reset_arms_timer = tick();
	u8.action = true;
	u8.sprinting = false;
	u8.channel = true;
	u8.staggering = true;
	u8.cancombo = false;
	u8.firing = true;
	u8.poking = true;
	u8.shoving = true;
	u8.startswap = true;
	u8.turnable = false;
	l__CurrentCamera__1.CameraType = "Scriptable";
	l__CurrentCamera__1.CameraSubject = nil;
	l__CurrentCamera__1.CFrame = CFrame.new(0, 0, 0);
	ply.CameraMode = "Classic";
	RS:wait();
	l__CurrentCamera__1.CameraType = "Custom";
	l__CurrentCamera__1.CameraSubject = hum;
	l__CurrentCamera__1.CFrame = CFrame.new(character.HumanoidRootPart.Position + u27) * CFrame.Angles(0, 0, 0) * CFrame.Angles(0, 0, 0) * u111;
	l__CurrentCamera__1.CameraType = "Custom";
	l__CurrentCamera__1.CameraSubject = hum;
	ply.CameraMode = "LockFirstPerson";
	cpart.CFrame = l__CurrentCamera__1.CFrame;
	camroot.CFrame = cpart.CFrame * CFrame.new(0, -1, 0.3) * CFrame.Angles(-1.5707963267948966, 0, 3.141592653589793) * u112 * u82;
	spawn(function()
		local v1134 = 1 - 1;
		while true do
			l__CurrentCamera__1.CFrame = CFrame.new(character.HumanoidRootPart.Position + u27) * CFrame.Angles(0, 0, 0) * CFrame.Angles(0, 0, 0) * u111;
			camroot.CFrame = cpart.CFrame * CFrame.new(0, -1, 0.3) * CFrame.Angles(-1.5707963267948966, 0, 3.141592653589793) * u112 * u82;
			l__CurrentCamera__1.CameraSubject = ply.Character.Humanoid;
			l__CurrentCamera__1.CameraType = "Custom";
			character.HumanoidRootPart.Anchored = false;
			ply.CameraMode = "LockFirstPerson";
			RS:wait();
			if 0 <= 1 then
				if v1134 < 10 then

				else
					break;
				end;
			elseif 10 < v1134 then

			else
				break;
			end;
			v1134 = v1134 + 1;		
		end;
	end);
	local v1135, v1136, v1137 = ipairs(maingui:GetChildren());
	while true do
		local v1138, v1139 = v1135(v1136, v1137);
		if v1138 then

		else
			break;
		end;
		v1137 = v1138;
		if v1139.Name == "snare" then
			v1139:Destroy();
		end;	
	end;
	u8.turnable = true;
	u8.startswap = false;
	u8.action = false;
	u8.sprinting = false;
	u8.channel = false;
	u8.staggering = false;
	u8.cancombo = false;
	u8.firing = false;
	u8.poking = false;
	u8.shoving = false;
	u56("Fist");
end;
function big_poke()
	l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("switchB");
	v104({ "weapons", "1HBL" }, "draw", nil, nil, true, true);
	spawn(function()
		while true do
			if RS:wait() then

			else
				break;
			end;
			local v1140, v1141, v1142 = pairs(globalanimsets);
			while true do
				local v1143, v1144 = v1140(v1141, v1142);
				if v1143 then

				else
					break;
				end;
				v1142 = v1143;
				if v1143 ~= "self_poke" then
					v1144:Stop(0);
				end;			
			end;
			local v1145, v1146, v1147 = pairs(tpglobalanimsets);
			while true do
				local v1148, v1149 = v1145(v1146, v1147);
				if v1148 then

				else
					break;
				end;
				v1147 = v1148;
				if v1148 ~= "pokey" then
					v1149:Stop(0);
				end;			
			end;		
		end;
	end);
	if u16 then
		u16:Destroy();
	end;
	local v1150 = l__game__6.ReplicatedStorage.misc.SwitchB:Clone();
	local v1151 = Instance.new("Motor6D");
	v1151.Name = "WeaponJoint";
	v1151.Part0 = fparms.RightArm.RUpperArm;
	v1151.Part1 = v1150.JointGrip;
	v1151.C0 = CFrame.new(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	v1151.C1 = l__game__6.ReplicatedStorage.animationSets["1HBL"].weldval.Value;
	v1151.Parent = fparms.Joints;
	v1150.Parent = fparms;
	globalanimsets.self_poke:Play(0.1, 1, 0.6);
	tpglobalanimsets.pokey:Play(0.1, 1, 0.6);
	delay(1.775, function()
		if hum.Health < 0 then
			return;
		end;
		l__workspace__1.ServerStuff.callEvent:FireServer("poke");
	end);
end;
function decider_reset()
	if u8.poking == true then
		return;
	end;
	if spectating == true then
		return;
	end;
	if character then
		if character:FindFirstChild("HumanoidRootPart") then
			character:FindFirstChild("HumanoidRootPart").Anchored = true;
		end;
	end;
	remove_dual_wield();
	reset_arms_timer = tick();
	l__game__6:GetService("StarterGui"):SetCore("ResetButtonCallback", false);
	u8.action = true;
	u8.sprinting = false;
	u8.channel = true;
	u8.turnable = false;
	u8.staggering = true;
	u8.cancombo = false;
	u8.canjump = false;
	u8.firing = true;
	u8.poking = true;
	u8.shoving = true;
	RS:wait();
	local v1152 = true;
	local v1153 = false;
	if u14.animset ~= "SMG" then
		if u14.animset ~= "ASMG" then
			if u14.animset ~= "RFL" then
				if u14.animset ~= "2HPST" then
					if u14.animset ~= "PST" then
						if u14.animset ~= "DBB" then
							if u14.animset == "RV" then
								local v1154 = 0;
								local v1155, v1156, v1157 = pairs(v6);
								while true do
									local v1158, v1159 = v1155(v1156, v1157);
									if v1158 then

									else
										break;
									end;
									v1157 = v1158;
									if v1159[2] == true then
										if v1159[3] ~= nil then
											v1154 = v1159[3];
										end;
									end;								
								end;
								if 0 < v1154 then
									if u14.animset ~= "DBB" then
										if u14.animset ~= "RV" then
											if u14.animset ~= "2HPST" then
												if u14.animset == "PST" then
													v1153 = true;
												end;
											else
												v1153 = true;
											end;
										else
											v1153 = true;
										end;
									else
										v1153 = true;
									end;
									v1152 = false;
								end;
							end;
						else
							v1154 = 0;
							v1155, v1156, v1157 = pairs(v6);
							while true do
								v1158, v1159 = v1155(v1156, v1157);
								if v1158 then

								else
									break;
								end;
								v1157 = v1158;
								if v1159[2] == true then
									if v1159[3] ~= nil then
										v1154 = v1159[3];
									end;
								end;							
							end;
							if 0 < v1154 then
								if u14.animset ~= "DBB" then
									if u14.animset ~= "RV" then
										if u14.animset ~= "2HPST" then
											if u14.animset == "PST" then
												v1153 = true;
											end;
										else
											v1153 = true;
										end;
									else
										v1153 = true;
									end;
								else
									v1153 = true;
								end;
								v1152 = false;
							end;
						end;
					else
						v1154 = 0;
						v1155, v1156, v1157 = pairs(v6);
						while true do
							v1158, v1159 = v1155(v1156, v1157);
							if v1158 then

							else
								break;
							end;
							v1157 = v1158;
							if v1159[2] == true then
								if v1159[3] ~= nil then
									v1154 = v1159[3];
								end;
							end;						
						end;
						if 0 < v1154 then
							if u14.animset ~= "DBB" then
								if u14.animset ~= "RV" then
									if u14.animset ~= "2HPST" then
										if u14.animset == "PST" then
											v1153 = true;
										end;
									else
										v1153 = true;
									end;
								else
									v1153 = true;
								end;
							else
								v1153 = true;
							end;
							v1152 = false;
						end;
					end;
				else
					v1154 = 0;
					v1155, v1156, v1157 = pairs(v6);
					while true do
						v1158, v1159 = v1155(v1156, v1157);
						if v1158 then

						else
							break;
						end;
						v1157 = v1158;
						if v1159[2] == true then
							if v1159[3] ~= nil then
								v1154 = v1159[3];
							end;
						end;					
					end;
					if 0 < v1154 then
						if u14.animset ~= "DBB" then
							if u14.animset ~= "RV" then
								if u14.animset ~= "2HPST" then
									if u14.animset == "PST" then
										v1153 = true;
									end;
								else
									v1153 = true;
								end;
							else
								v1153 = true;
							end;
						else
							v1153 = true;
						end;
						v1152 = false;
					end;
				end;
			else
				v1154 = 0;
				v1155, v1156, v1157 = pairs(v6);
				while true do
					v1158, v1159 = v1155(v1156, v1157);
					if v1158 then

					else
						break;
					end;
					v1157 = v1158;
					if v1159[2] == true then
						if v1159[3] ~= nil then
							v1154 = v1159[3];
						end;
					end;				
				end;
				if 0 < v1154 then
					if u14.animset ~= "DBB" then
						if u14.animset ~= "RV" then
							if u14.animset ~= "2HPST" then
								if u14.animset == "PST" then
									v1153 = true;
								end;
							else
								v1153 = true;
							end;
						else
							v1153 = true;
						end;
					else
						v1153 = true;
					end;
					v1152 = false;
				end;
			end;
		else
			v1154 = 0;
			v1155, v1156, v1157 = pairs(v6);
			while true do
				v1158, v1159 = v1155(v1156, v1157);
				if v1158 then

				else
					break;
				end;
				v1157 = v1158;
				if v1159[2] == true then
					if v1159[3] ~= nil then
						v1154 = v1159[3];
					end;
				end;			
			end;
			if 0 < v1154 then
				if u14.animset ~= "DBB" then
					if u14.animset ~= "RV" then
						if u14.animset ~= "2HPST" then
							if u14.animset == "PST" then
								v1153 = true;
							end;
						else
							v1153 = true;
						end;
					else
						v1153 = true;
					end;
				else
					v1153 = true;
				end;
				v1152 = false;
			end;
		end;
	else
		v1154 = 0;
		v1155, v1156, v1157 = pairs(v6);
		while true do
			v1158, v1159 = v1155(v1156, v1157);
			if v1158 then

			else
				break;
			end;
			v1157 = v1158;
			if v1159[2] == true then
				if v1159[3] ~= nil then
					v1154 = v1159[3];
				end;
			end;		
		end;
		if 0 < v1154 then
			if u14.animset ~= "DBB" then
				if u14.animset ~= "RV" then
					if u14.animset ~= "2HPST" then
						if u14.animset == "PST" then
							v1153 = true;
						end;
					else
						v1153 = true;
					end;
				else
					v1153 = true;
				end;
			else
				v1153 = true;
			end;
			v1152 = false;
		end;
	end;
	if v1152 == true then
		big_poke();
		return;
	end;
	v104({ "firearms" }, "ads_in", nil, nil, true, true);
	curentanimset.lower:Play(0.1, 1, 0.5);
	local u113 = nil;
	u113 = curentanimset.lower.KeyframeReached:connect(function(p120)
		if p120 == "Stop" then
			curentanimset.lower:AdjustSpeed(0);
			u113:Disconnect();
		end;
	end);
	local v1160 = tpglobalanimsets.influence_gun;
	if v1153 == true then
		v1160 = tpglobalanimsets.influence_pistol;
	end;
	v1160:Play(0.3, 1, 0.8);
	local u114 = nil;
	u114 = v1160.KeyframeReached:connect(function(p121)
		if p121 == "Stop" then
			v1160:AdjustSpeed(0);
			u114:Disconnect();
		end;
	end);
	local v1161 = tick();
	while true do
		RS:wait();
		if not (1.5 <= tick() - v1161) then

		else
			break;
		end;	
	end;
	if hum.Health < 0 then
		return;
	end;
	if curentanimset.lower then
		curentanimset.lower:Stop(0);
	end;
	v1160:Stop(0);
	local v1162, v1163, v1164 = pairs(v6);
	while true do
		local v1165, v1166 = v1162(v1163, v1164);
		if v1165 then

		else
			break;
		end;
		v1164 = v1165;
		if v1166[2] == true then
			if v1166[3] ~= nil then
				v1166[3] = v1166[3] - 1;
			end;
		end;	
	end;
	local l__Position__1167 = u16.muzzle.Position;
	l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", u14.animset }, u14.name, character.HumanoidRootPart, 0.05);
	if u14.animset ~= "LSMG" then
		if u14.name == "A.J.M. 9" then
			l__workspace__1.ServerStuff.applyGore:FireServer("firelaser", character, ply, { l__Position__1167, l__Position__1167 });
		else
			l__workspace__1.ServerStuff.applyGore:FireServer("firegun", character, ply, { l__Position__1167, l__Position__1167 });
		end;
	else
		l__workspace__1.ServerStuff.applyGore:FireServer("firelaser", character, ply, { l__Position__1167, l__Position__1167 });
	end;
	l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "bass", character.HumanoidRootPart, 0.1);
	l__workspace__1.ServerStuff.callEvent:FireServer("self_gun");
end;
influence_taps = 0;
function start_influence()
	if u8.staggering == true then
		return;
	end;
	if v64[1] == "shadow" then
		return;
	end;
	l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("switchB");
	u19 = u19 - 14;
	u8.action = true;
	u8.channel = true;
	u8.staggering = true;
	u8.turnable = false;
	u8.hanger = true;
	v104({ "shadow", "hang" }, "cast", nil, nil, true, true);
	local v1168 = "self_knife";
	local v1169 = false;
	if u14.weapontype == "Gun" then
		local v1170 = 0;
		local v1171, v1172, v1173 = pairs(v6);
		while true do
			local v1174, v1175 = v1171(v1172, v1173);
			if v1174 then

			else
				break;
			end;
			v1173 = v1174;
			if v1175[2] == true then
				if v1175[3] ~= nil then
					v1170 = v1175[3];
				end;
			end;		
		end;
		if 0 < v1170 then
			if u14.animset ~= "ASMG" then
				if u14.animset == "RFL" then
					v1168 = "self_gun";
				end;
			else
				v1168 = "self_gun";
			end;
			if u14.animset ~= "DBB" then
				if u14.animset ~= "RV" then
					if u14.animset ~= "2HPST" then
						if u14.animset == "PST" then
							v1168 = "self_gun";
							v1169 = true;
						end;
					else
						v1168 = "self_gun";
						v1169 = true;
					end;
				else
					v1168 = "self_gun";
					v1169 = true;
				end;
			else
				v1168 = "self_gun";
				v1169 = true;
			end;
			if v1168 == "self_gun" then
				curentanimset.lower:Play(0.1, 1, 0.4);
				local u115 = nil;
				u115 = curentanimset.lower.KeyframeReached:connect(function(p122)
					if p122 == "Stop" then
						curentanimset.lower:AdjustSpeed(0);
						u115:Disconnect();
					end;
				end);
			end;
		end;
	end;
	local v1176 = nil;
	if v1168 == "self_knife" then
		v1176 = l__game__6.ReplicatedStorage.misc.SwitchB:Clone();
		local v1177 = Instance.new("Motor6D");
		v1177.Name = "WeaponJoint";
		v1177.Part0 = fparms.LeftArm.LUpperArm;
		v1177.Part1 = v1176.JointGrip;
		v1177.C0 = CFrame.new(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1);
		v1177.C1 = l__game__6.ReplicatedStorage.animationSets["1HBL"].weldval.Value;
		v1177.Parent = fparms.Joints;
		v1176.Parent = fparms;
		globalanimsets.influence_knife:Play(0.1, 1, 0.4);
		local u116 = nil;
		u116 = globalanimsets.influence_knife.KeyframeReached:connect(function(p123)
			if p123 == "Stop" then
				globalanimsets.influence_knife:AdjustSpeed(0);
				u116:Disconnect();
			end;
		end);
	end;
	spawn(function()
		local v1178 = Instance.new("Frame");
		v1178.BackgroundColor3 = Color3.new(0, 0, 0);
		v1178.BackgroundTransparency = 0;
		v1178.Size = UDim2.new(1, 0, 1, 0);
		v1178.ZIndex = 10;
		v1178.Parent = maingui;
		while true do
			v1178.BackgroundTransparency = v1178.BackgroundTransparency + 0.03;
			RS:wait();
			if not (1 <= v1178.BackgroundTransparency) then

			else
				break;
			end;		
		end;
		v1178:Destroy();
	end);
	local v1179 = Instance.new("Frame");
	v1179.BackgroundColor3 = Color3.new(0, 0, 0);
	v1179.BackgroundTransparency = 0.3;
	v1179.Size = UDim2.new(1, 0, 1, 0);
	v1179.ZIndex = 10;
	v1179.Parent = maingui;
	influence_taps = 1;
	local v1180 = l__game__6.ReplicatedStorage.misc.warningtext:Clone();
	v1180.Text = "> E <\nRESIST THE INFLUENCE";
	v1180.Parent = maingui;
	local v1181 = tpglobalanimsets.influence_gun;
	if v1169 == true then
		v1181 = tpglobalanimsets.influence_pistol;
	end;
	if v1168 == "self_knife" then
		v1181 = tpglobalanimsets.influence_knife;
	end;
	v1181:Play(0.3, 1, 0.8);
	local u117 = nil;
	u117 = v1181.KeyframeReached:connect(function(p124)
		if p124 == "Stop" then
			v1181:AdjustSpeed(0);
			u117:Disconnect();
		end;
	end);
	local v1182 = tick();
	local v1183 = tick();
	local v1184 = 0;
	while true do
		if 1 <= tick() - v1184 then
			v1184 = tick();
			applygore("hangerPopup", character.Torso, nil);
		end;
		if 0.3 <= tick() - v1182 then
			v1182 = tick();
			if v1180.Text == "> E <\nRESIST THE INFLUENCE" then
				v1180.Text = "E\nRESIST THE INFLUENCE";
			else
				v1180.Text = "> E <\nRESIST THE INFLUENCE";
			end;
		end;
		v1180.Position = UDim2.new(0.5, math.random(-8, 8), 0.6, math.random(-8, 8));
		RS:wait();
		if not (3.8 <= tick() - v1183) then

		else
			break;
		end;	
	end;
	u8.hanger = false;
	if v1176 then
		globalanimsets.influence_knife:Stop(0);
		v1176:Destroy();
	end;
	if curentanimset.lower then
		curentanimset.lower:Stop(0);
	end;
	v1181:Stop(0);
	v1180:Destroy();
	v1179:Destroy();
	if influence_taps < 18 then

	else
		u19 = u19 + 14;
		local v1185 = Instance.new("Frame");
		v1185.BackgroundColor3 = Color3.new(1, 1, 1);
		v1185.BackgroundTransparency = 0;
		v1185.Size = UDim2.new(1, 0, 1, 0);
		v1185.ZIndex = 10;
		v1185.Parent = maingui;
		spawn(function()
			while true do
				v1185.BackgroundTransparency = v1185.BackgroundTransparency + 0.02;
				RS:wait();
				if not (1 <= v1185.BackgroundTransparency) then

				else
					break;
				end;			
			end;
			v1185:Destroy();
		end);
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("hide_perk");
		influence_taps = 0;
		u8.action = false;
		u8.channel = false;
		u8.staggering = false;
		u8.turnable = true;
		return;
	end;
	if v1168 == "self_gun" then
		local v1186, v1187, v1188 = pairs(v6);
		while true do
			local v1189, v1190 = v1186(v1187, v1188);
			if v1189 then

			else
				break;
			end;
			v1188 = v1189;
			if v1190[2] == true then
				if v1190[3] ~= nil then
					v1190[3] = v1190[3] - 1;
				end;
			end;		
		end;
		local l__Position__1191 = u16.muzzle.Position;
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", u14.animset }, u14.name, character.HumanoidRootPart, 0.05);
		if u14.animset ~= "LSMG" then
			if u14.name == "A.J.M. 9" then
				l__workspace__1.ServerStuff.applyGore:FireServer("firelaser", character, ply, { l__Position__1191, l__Position__1191 });
			else
				l__workspace__1.ServerStuff.applyGore:FireServer("firegun", character, ply, { l__Position__1191, l__Position__1191 });
			end;
		else
			l__workspace__1.ServerStuff.applyGore:FireServer("firelaser", character, ply, { l__Position__1191, l__Position__1191 });
		end;
		l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "bass", character.HumanoidRootPart, 0.1);
	end;
	l__workspace__1.ServerStuff.callEvent:FireServer(v1168);
end;
commendedplayer = {};
commendedcount = 2;
commendedtick = tick();
function commend_player()
	if not (tick() - commendedtick <= 1) then
		if commendedcount <= 0 then
			return;
		end;
	else
		return;
	end;
	local v1192 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, 50, { l__workspace__1.NoTarget, l__workspace__1.PlayerShootThroughs, character });
	if v1192 then
		if v1192.Parent:FindFirstChild("Humanoid") then
			local v1193 = l__game__6.Players:GetPlayerFromCharacter(v1192.Parent);
			if v1193 then
				if commendedplayer[v1193.Name] == nil then
					commendedtick = tick();
					commendedplayer[v1193.Name] = true;
					commendedcount = commendedcount - 1;
					l__workspace__1.ServerStuff.callEvent:FireServer("commend", v1193.Name);
				end;
			end;
		end;
	end;
end;
resetBindable = Instance.new("BindableEvent");
resetBindable.Event:connect(decider_reset);
l__game__6:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable);
e_pickup_lockout = tick();
local function u118()
	for v1194, v1195 in pairs(v6) do
		if v1195[2] == true and v1195[3] <= 0 then
			return;
		end;
	end;
	for v1196, v1197 in ipairs(u16.arrow:GetChildren()) do
		if v1197:IsA("BasePart") then
			v1197.Transparency = 0;
		end;
	end;
	u8.action = true;
	curentanimset.arrow:Play(0.1);
	l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", u14.animset }, "reload", character.HumanoidRootPart);
	local v1198 = tick();
	while u8.staggering ~= true and u14.weapontype == "Bow" do
		RS:wait();
		if tick() - v1198 >= 0.4 then
			break;
		end;	
	end;
	if u14.weapontype == "Bow" then
		curentanimset.equip.TimePosition = 0.5;
		curentanimset.equip:AdjustSpeed(0);
		tpcurrentanimset.equip:Play();
		tpcurrentanimset.equip.TimePosition = 0.5;
		tpcurrentanimset.equip:AdjustSpeed(0);
		check_walking_anim();
	end;
	if u8.staggering == false then
		u8.firing = false;
		u8.action = false;
	end;
end;
local function u119()
	if ping_chill_timer < tick() - ping_chill then
		ping_chill = tick();
		ping_amt = 0;
	end;
	ping_cooldown = tick();
	ping_amt = ping_amt + 1;
	local v1199, v1200 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, 200, baselayer);
	local v1201 = 1;
	local v1202 = nil;
	if v1199 and v1199.Parent:FindFirstChild("Humanoid") and v1199.Parent:FindFirstChild("Humanoid").Health > 0 and v1199.Parent:FindFirstChild("HumanoidRootPart") and v1199.Parent:IsDescendantOf(l__workspace__1.activeHostiles) then
		v1200 = v1199.Parent:FindFirstChild("HumanoidRootPart").Position;
		v1201 = 2;
	end;
	if v1199 and v1199.Name == "JointGrip" then
		if v19[v1199.Parent.Name] then
			v1202 = v19[v1199.Parent.Name].name;
		end;
		v1200 = v1199.Position;
		v1201 = 3;
	end;
	if v1199 and v1199.Name == "Interact" and (v1199.Parent:IsDescendantOf(l__workspace__1.Interactables) or v1199.Parent:IsDescendantOf(l__workspace__1.InteractablesNoDel)) then
		v1202 = v1199.Parent.Name;
		v1200 = v1199.Position;
		v1201 = 4;
	end;
	if v1199 and (v1199.Name == "HarvestWood" or v1199.Name == "HarvestStone") and v1199.Parent:IsDescendantOf(l__workspace__1.Interactables) then
		v1202 = "Wood Pile";
		if v1199.Name == "HarvestStone" then
			v1202 = "Stone Pile";
		end;
		v1200 = v1199.Position;
		v1201 = 5;
	end;
	l__workspace__1.ServerStuff.applyGore:FireServer("player_ping", character, ply, { v1200, ply.Name, v1201, v1202 });
end;
local u120 = false;
local function u121()
	if can_player_sprint == false then
		return;
	end;
	if u26.w ~= false and u8.air ~= true and u8.channel ~= true and u8.sprinting ~= true then
		if u9.Cripple and u9.Painkillers == nil and u9["Bottle Buff"] == nil and v63.berzactive == nil then
			return;
		elseif tick() - sprint_lockout <= 0.2 then
			return;
		elseif character.Torso.Velocity.magnitude <= 1 then
			return;
		else
			u8.sprinting = false;
			RS:wait();
			sprint_lockout = tick();
			u8.sprinting = true;
			u8.sneaking = false;
			slide_wait = tick() - 0.5;
			local v1203 = 0;
			local v1204 = 0;
			while true do
				if character:FindFirstChild("Head") and character.Head:FindFirstChild("Running") then
					character.Head.Running.Volume = 1;
				end;
				if u8.action == false and u8.aiming == false and u8.swapping == false then
					gun_holster_timer = 0;
				end;
				RS:wait();
				u11.stamregen = tick();
				u11.regentick = tick();
				if tick() - v1204 > 0.125 then
					v1204 = tick();
					if sprint_stam > 0 and u9["Speed Buff"] == nil and exhaustion_immunity == false then
						sprint_stam = sprint_stam - 1;
					end;
					u22("stamina");
				end;
				if sprint_stam <= 0 then
					afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Exha);
				end;
				local v1205 = raycastline(character.HumanoidRootPart.Position, -character.HumanoidRootPart.CFrame.upVector, 5.5, baselayer);
				if v1205 then
					local v1206 = math.clamp(7 / hum.WalkSpeed, 0.05, 1);
					if v1206 <= tick() - v1203 then
						v1203 = tick();
						local v1207 = "concrete";
						if v1205.Material == Enum.Material.Slate or v1205.Material == Enum.Material.Plastic or v1205.Material == Enum.Material.SmoothPlastic then
							v1207 = "dirt";
						elseif v1205.Material == Enum.Material.Sand then
							v1207 = "sand";
						elseif v1205.Material == Enum.Material.Grass then
							v1207 = "grass";
						elseif v1205.Material == Enum.Material.Wood or v1205.Material == Enum.Material.WoodPlanks then
							v1207 = "wood";
						elseif v1205.Material == Enum.Material.Metal or v1205.Material == Enum.Material.DiamondPlate or v1205.Material == Enum.Material.CorrodedMetal then
							v1207 = "metal";
						end;
						l__workspace__1.ServerStuff.playAudio:FireServer({ "movement_sounds", "newfootsteps" }, v1207 .. "_run" .. math.random(1, 3), character.HumanoidRootPart, 0.05);
						delay(v1206 * 0.75, function()
							v104({ "movement_sounds", "gearsteps" }, "gear_run" .. math.random(1, 4), nil, nil, true, true);
						end);
					end;
				end;
				if u9.Cripple and u9.Painkillers == nil and u9["Bottle Buff"] == nil and v63.berzactive == nil then
					break;
				end;
				if character.Torso.Velocity.magnitude <= 1 then
					break;
				end;
				if u8.sprinting == false then
					break;
				end;
				if u8.walking == false then
					break;
				end;
				if u26.w == false then
					break;
				end;
				if u8.air == true then
					break;
				end;
				if u8.staggering == true then
					break;
				end;
				if u8.channel == true then
					break;
				end;			
			end;
			if character:FindFirstChild("Head") and character.Head:FindFirstChild("Running") then
				character.Head.Running:Stop();
			end;
			u8.sprinting = false;
			return;
		end;
	end;
end;
local function u122()
	if (u8.action ~= true or u8.swapping ~= false) and u8.channel ~= true and u8.air ~= false then
		local v1208 = { "N", "N", "N" };
		local v1209, v1210 = raycastline(character.HumanoidRootPart.CFrame.p, character.HumanoidRootPart.CFrame.lookVector, 2, baselayer);
		if v1209 and not v1209.Parent:FindFirstChild("Humanoid") then
			v1208[1] = "Y";
		end;
		local v1211, v1212 = raycastline((character.HumanoidRootPart.CFrame + Vector3.new(0, 2.5, 0)).p, character.HumanoidRootPart.CFrame.lookVector, 2, baselayer);
		if not v1211 then
			v1208[2] = "Y";
		end;
		local v1213, v1214 = raycastline((character.HumanoidRootPart.CFrame + Vector3.new(0, 6, 0)).p, character.HumanoidRootPart.CFrame.lookVector, 2, baselayer);
		if not v1213 then
			v1208[3] = "Y";
		end;
		if table.concat(v1208) == "YYY" then
			l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "Mantles", 1 });
			u8.canjump = false;
			shakecamera("climb");
			globalanimsets.climb:Play(0.1, 1, 1);
			tpglobalanimsets.climb:Play(0.1, 1, 1);
			l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "mantle", character.HumanoidRootPart);
			u8.action = true;
			local v1215 = Instance.new("BodyPosition");
			v1215.Name = "parkourPositionThing";
			v1215.MaxForce = Vector3.new(200000, 200000, 200000);
			v1215.P = 2000;
			v1215.D = 500;
			v1215.Position = character.HumanoidRootPart.Position + Vector3.new(0, 5, 0) + character.HumanoidRootPart.CFrame.lookVector * 5;
			v1215.Parent = character.HumanoidRootPart;
			u7 = u7 + 40;
			u22("stamina");
			delay(0.4, function()
				v1215:Destroy();
				u8.canjump = true;
				u8.action = false;
				u11.jumptick = 0;
			end);
		end;
		return;
	end;
end;
local u123 = false;
local function u124()
	local l__ammo__1216 = l__game__6.ReplicatedStorage.Weapons:FindFirstChild(u16.Name):FindFirstChild("ammo");
	if l__ammo__1216 ~= nil and u8.action ~= true and u14.ammoused ~= nil and not (tick() - reload_locklout <= 2) then
		local l__Value__1217 = l__ammo__1216.Value;
		local v1218 = false;
		if u59[u14.ammoused] == nil or u59[u14.ammoused] <= 0 then
			v1218 = true;
		end;
		local v1219 = false;
		local v1220 = false;
		local v1221 = nil;
		local v1222 = 0;
		local v1223 = true;
		if akimbo_factors.active == true then
			v1219 = true;
			if v6[akimbo_factors.weapon_slot][3] then
				v1221 = v6[akimbo_factors.weapon_slot][3];
				if v1221 <= 0 then
					v1220 = true;
				end;
			end;
			v1222 = l__game__6.ReplicatedStorage.Weapons:FindFirstChild(v6[akimbo_factors.weapon_slot][1]):FindFirstChild("ammo").Value;
			if u59[akimbo_factors.alt_weapon_stats.ammoused] ~= nil then
				local v1224 = nil;
				local v1225 = nil;
				if u59[akimbo_factors.alt_weapon_stats.ammoused] <= 0 then
					if v1218 == true then
						return;
					else
						v1224 = v1221;
						v1225 = l__Value__1217;
						if v1224 == v1225 and v1218 == true then
							return;
						elseif v1218 == true and v1223 == true then
							return;
						else
							local v1226 = nil;
							for v1227, v1228 in pairs(v6) do
								if v1228[2] == true and v1228[3] ~= nil then
									v1226 = v1228[3];
									if l__Value__1217 <= v1228[3] and v1219 == false then
										return;
									end;
								end;
							end;
							if v1226 == l__Value__1217 and v1219 == false then
								return;
							elseif v1221 == v1222 and v1226 == l__Value__1217 then
								return;
							else
								local v1229 = false;
								if v1226 == 0 then
									v1229 = true;
								end;
								u8.action = true;
								reload_locklout = tick();
								local v1230 = { globalanimsets.reload, tpglobalanimsets.reloadloop };
								if u14.animset == "MRV" then
									v1230 = { curentanimset.reload, tpglobalanimsets.reloadloop };
								end;
								if akimbo_factors.active == true then
									v1230 = { akimbosets.reload, tpglobalanimsets.reloadloop };
								end;
								v1230[1]:Play(0.3);
								v1230[2]:Play(0.3);
								local u125 = nil;
								u125 = v1230[1].KeyframeReached:connect(function(p125)
									if p125 == "Stop" then
										v1230[1]:AdjustSpeed(0);
										u125:Disconnect();
									end;
								end);
								local u126 = nil;
								u126 = v1230[2].KeyframeReached:connect(function(p126)
									if p126 == "Stop" then
										v1230[2]:AdjustSpeed(0);
										u126:Disconnect();
									end;
								end);
								local v1231 = tick();
								local v1232 = 1.5 * u14.throwrating;
								local v1233 = l__Value__1217 - v1226;
								if u59[u14.ammoused] < v1233 then
									v1233 = u59[u14.ammoused];
								end;
								u59[u14.ammoused] = u59[u14.ammoused] - v1233;
								if u59[u14.ammoused] < 0 then
									u59[u14.ammoused] = 0;
								end;
								local v1234 = 500;
								if l__workspace__1.ServerStuff.game.holdout.Value == true then
									v1234 = 3000;
								end;
								if v1234 < u59[u14.ammoused] then
									l__workspace__1.ServerStuff.callEvent:FireServer("lel");
								end;
								if akimbo_factors.active == true then
									local v1235 = v1222 - v1221;
									if u59[akimbo_factors.alt_weapon_stats.ammoused] < v1235 then
										v1235 = u59[akimbo_factors.alt_weapon_stats.ammoused];
									end;
									u59[akimbo_factors.alt_weapon_stats.ammoused] = u59[akimbo_factors.alt_weapon_stats.ammoused] - 0;
									if u59[akimbo_factors.alt_weapon_stats.ammoused] < 0 then
										u59[akimbo_factors.alt_weapon_stats.ammoused] = 0;
									end;
									v1232 = 1.5 * u14.throwrating + 1.5 * akimbo_factors.alt_weapon_stats.throwrating / 1.5;
								end;
								local v1236 = 1;
								local v1237 = "pistol";
								local v1238 = "pistol";
								local v1239 = nil;
								local v1240 = false;
								if u14.animset == "RFL" or u14.animset == "ASMG" then
									v1237 = "rifle";
								end;
								if u14.animset == "SMG" then
									v1237 = "smg";
								end;
								if u14.animset == "ASMG" or u14.name == "MCX VIRTUS" or u14.name == "FAMAS F1" or u14.name == "R11 RSASS" or u14.name == "PPSh-41" or u14.name == "H&K MR308 A3" or u14.name == "ASh-12" or u14.name == "1927A1 Deluxe" then
									v1237 = "ar";
								end;
								if u14.name == "Modded Rifle" or u14.name == "PGM FR-12.7" or u14.name == "M60-E6" or u14.name == "FN M249" then
									v1237 = "sniper";
								end;
								if u14.name == "Skorpion vz. 61" or u14.name == "SIG MPX" or u14.name == "H&K MP5A3" or u14.name == "H&K MP5/10" then
									v1237 = "pistol";
								end;
								if u14.name == "Model 6 Unica" then
									v1237 = "rv";
									v1240 = true;
								end;
								if u14.name == "Karabiner 98k" or u14.name == "M1891 Avtomat" or u14.name == "Dolch 96" or u14.name == "Simonov SKS" then
									v1237 = "clip";
									v1240 = true;
								end;
								local v1241 = v1232 * u60 / v1232;
								if u14.name == "SPAS-12" or u14.name == "Caldwell Handcannon" or u14.name == "Caldwell 940" or u14.name == "Model 870" or u14.name == "Winchester 1901" or u14.name == "Benelli M4" or u14.name == "Kel-Tec KSG" or u14.name == "MVD KS-23" then
									v1241 = 0;
									v1232 = 0.5 * (u14.throwrating - u14.throwrating * u60 / u14.throwrating);
									v1237 = "shotgun";
									v1236 = v1233;
									v1239 = "shotgun";
								end;
								if u14.name == "Atchisson AA-12" then
									v1237 = "sniper";
									v1239 = "shotgun";
								end;
								if u14.name == "Caldwell Handcannon" or u14.name == "Caldwell 940" then
									v1239 = nil;
									v1240 = true;
								end;
								local v1242 = false;
								local v1243 = false;
								local v1244 = false;
								if u14.name == "Remington 700" or u14.name == "Peacemaker" or u14.name == "Peacemaker Uppercut" or u14.name == "Peacemaker Chain" or u14.name == "'The Redeemer'" or u14.name == "Winchester 940-1" then
									local v1245 = 0;
									local v1246 = 0.4;
									if akimbo_factors.active == true then
										v1246 = 0.6;
									end;
									v1232 = v1246 * (u14.throwrating - u14.throwrating * u60 / u14.throwrating);
									v1237 = "single";
									v1236 = v1233;
									v1242 = true;
									v1240 = true;
									if u14.name == "Winchester 940-1" then
										v1239 = "winny";
										v1240 = false;
									end;
								end;
								if u14.name == "Winchester 1901" then
									v1239 = "winny";
								end;
								if u14.name == "Remington 700" or u14.name == "Karabiner 98k" or u14.name == "PGM FR-12.7" or u14.name == "Modded Rifle" or u14.name == "IZhMASh SV-98M" or u14.name == "M1891 Avtomat" or u14.name == "AI-AWSM" or u14.name == "CheyTac M200" then
									v1239 = "sniper";
									v1240 = false;
								end;
								if u14.name == "Commissioned Musket" then
									v1237 = "single";
								end;
								if akimbo_factors.active == true then
									if akimbo_factors.alt_weapon_stats.name == "Model 6 Unica" then
										v1238 = "rv";
									end;
									if akimbo_factors.alt_weapon_stats.name == "Peacemaker" or akimbo_factors.alt_weapon_stats.name == "'The Redeemer'" or u14.name == "Peacemaker Uppercut" or u14.name == "Peacemaker Chain" then
										v1245 = 0;
										v1232 = 0.6 * (akimbo_factors.alt_weapon_stats.throwrating - akimbo_factors.alt_weapon_stats.throwrating * u60 / akimbo_factors.alt_weapon_stats.throwrating);
										v1238 = "single";
										v1236 = 0;
										if v1242 == true then
											v1236 = v1236 + v1233;
										else
											v1243 = true;
										end;
									end;
								end;
								local v1247 = v1232 - v1245;
								l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_start", character.HumanoidRootPart, 0.05);
								if akimbo_factors.active == true then
									delay(0.3, function()
										l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_start", character.HumanoidRootPart, 0.05);
									end);
								end;
								for v1248 = 1, v1236 do
									local v1249 = false;
									while true do
										if v1247 / 1.5 < tick() - v1231 and v1249 == false then
											if v1243 == true then
												v1237 = v1238;
												v1238 = v1238;
											end;
											l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
											if u14.name == "M1891 Avtomat" then
												delay(1, function()
													l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
													delay(1, function()
														l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
													end);
												end);
											end;
											if akimbo_factors.active == true then
												if v1243 == true or v1242 == true then
													if v1244 == false and math.floor(v1236 / 2) <= v1248 then
														v1244 = true;
														delay(0.4, function()
															l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_mid", character.HumanoidRootPart, 0.05);
														end);
													end;
												else
													delay(0.4, function()
														l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_mid", character.HumanoidRootPart, 0.05);
													end);
												end;
											end;
										end;
										if u14.weapontype ~= "Gun" then
											u8.action = false;
											v1230[1]:Stop(0.5);
											v1230[2]:Stop(0.5);
											return;
										end;
										RS:wait();
										if v1247 < tick() - v1231 then
											break;
										end;									
									end;
									v1231 = tick();
								end;
								if v1240 == true then
									v1229 = false;
								end;
								local v1250 = 0.5;
								if playerperks.reliab then
									if v1229 == true then
										l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
										if akimbo_factors.active == true then
											delay(0.2, function()
												l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
											end);
										end;
									end;
									v1229 = false;
									v1220 = false;
									v1250 = 0.2;
								end;
								if v1229 == true then
									if v1239 == nil then
										l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "empty", character.HumanoidRootPart, 0.05);
									elseif v1239 == "sniper" then
										l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "sniper_bolt", character.HumanoidRootPart);
									elseif v1239 == "winny" then
										l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "lever_action", character.HumanoidRootPart);
									elseif v1239 == "shotgun" then
										l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "rack", character.HumanoidRootPart);
									end;
									local v1251 = tick();
									while true do
										RS:wait();
										if tick() - v1251 > 0.8 then
											break;
										end;									
									end;
								else
									l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "manip", character.HumanoidRootPart, 0.05);
								end;
								if akimbo_factors.active == true then
									local v1252 = tick();
									while true do
										RS:wait();
										if v1250 < tick() - v1252 then
											break;
										end;									
									end;
									if v1220 == true then
										if playerperks.reliab then
											l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
										else
											l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "empty", character.HumanoidRootPart, 0.05);
										end;
										local v1253 = tick();
										while true do
											RS:wait();
											if tick() - v1253 > 0.8 then
												break;
											end;										
										end;
									else
										l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "manip", character.HumanoidRootPart, 0.05);
									end;
								end;
								v1230[1]:Stop(0.5);
								v1230[2]:Stop(0.5);
								for v1254, v1255 in pairs(v6) do
									if v1255[2] == true and v1255[3] ~= nil then
										v1255[3] = v1255[3] + v1233;
									end;
								end;
								if akimbo_factors.active == true then
									v6[akimbo_factors.weapon_slot][3] = v6[akimbo_factors.weapon_slot][3] + 0;
								end;
								invmanage("updatehud");
								local v1256 = tick();
								local v1257 = 0.2;
								while true do
									RS:wait();
									if v1257 < tick() - v1256 then
										break;
									end;								
								end;
								u8.action = false;
								return;
							end;
						end;
					end;
				else
					v1223 = false;
					v1224 = v1221;
					v1225 = l__Value__1217;
					if v1224 == v1225 and v1218 == true then
						return;
					elseif v1218 == true and v1223 == true then
						return;
					else
						v1226 = nil;
						for v1227, v1228 in pairs(v6) do
							if v1228[2] == true and v1228[3] ~= nil then
								v1226 = v1228[3];
								if l__Value__1217 <= v1228[3] and v1219 == false then
									return;
								end;
							end;
						end;
						if v1226 == l__Value__1217 and v1219 == false then
							return;
						elseif v1221 == v1222 and v1226 == l__Value__1217 then
							return;
						else
							v1229 = false;
							if v1226 == 0 then
								v1229 = true;
							end;
							u8.action = true;
							reload_locklout = tick();
							v1230 = { globalanimsets.reload, tpglobalanimsets.reloadloop };
							if u14.animset == "MRV" then
								v1230 = { curentanimset.reload, tpglobalanimsets.reloadloop };
							end;
							if akimbo_factors.active == true then
								v1230 = { akimbosets.reload, tpglobalanimsets.reloadloop };
							end;
							v1230[1]:Play(0.3);
							v1230[2]:Play(0.3);
							u125 = nil;
							u125 = v1230[1].KeyframeReached:connect(function(p125)
								if p125 == "Stop" then
									v1230[1]:AdjustSpeed(0);
									u125:Disconnect();
								end;
							end);
							u126 = nil;
							u126 = v1230[2].KeyframeReached:connect(function(p126)
								if p126 == "Stop" then
									v1230[2]:AdjustSpeed(0);
									u126:Disconnect();
								end;
							end);
							v1231 = tick();
							v1232 = 1.5 * u14.throwrating;
							v1233 = l__Value__1217 - v1226;
							if u59[u14.ammoused] < v1233 then
								v1233 = u59[u14.ammoused];
							end;
							u59[u14.ammoused] = u59[u14.ammoused] - v1233;
							if u59[u14.ammoused] < 0 then
								u59[u14.ammoused] = 0;
							end;
							v1234 = 500;
							if l__workspace__1.ServerStuff.game.holdout.Value == true then
								v1234 = 3000;
							end;
							if v1234 < u59[u14.ammoused] then
								l__workspace__1.ServerStuff.callEvent:FireServer("lel");
							end;
							if akimbo_factors.active == true then
								v1235 = v1222 - v1221;
								if u59[akimbo_factors.alt_weapon_stats.ammoused] < v1235 then
									v1235 = u59[akimbo_factors.alt_weapon_stats.ammoused];
								end;
								u59[akimbo_factors.alt_weapon_stats.ammoused] = u59[akimbo_factors.alt_weapon_stats.ammoused] - 0;
								if u59[akimbo_factors.alt_weapon_stats.ammoused] < 0 then
									u59[akimbo_factors.alt_weapon_stats.ammoused] = 0;
								end;
								v1232 = 1.5 * u14.throwrating + 1.5 * akimbo_factors.alt_weapon_stats.throwrating / 1.5;
							end;
							v1236 = 1;
							v1237 = "pistol";
							v1238 = "pistol";
							v1239 = nil;
							v1240 = false;
							if u14.animset == "RFL" or u14.animset == "ASMG" then
								v1237 = "rifle";
							end;
							if u14.animset == "SMG" then
								v1237 = "smg";
							end;
							if u14.animset == "ASMG" or u14.name == "MCX VIRTUS" or u14.name == "FAMAS F1" or u14.name == "R11 RSASS" or u14.name == "PPSh-41" or u14.name == "H&K MR308 A3" or u14.name == "ASh-12" or u14.name == "1927A1 Deluxe" then
								v1237 = "ar";
							end;
							if u14.name == "Modded Rifle" or u14.name == "PGM FR-12.7" or u14.name == "M60-E6" or u14.name == "FN M249" then
								v1237 = "sniper";
							end;
							if u14.name == "Skorpion vz. 61" or u14.name == "SIG MPX" or u14.name == "H&K MP5A3" or u14.name == "H&K MP5/10" then
								v1237 = "pistol";
							end;
							if u14.name == "Model 6 Unica" then
								v1237 = "rv";
								v1240 = true;
							end;
							if u14.name == "Karabiner 98k" or u14.name == "M1891 Avtomat" or u14.name == "Dolch 96" or u14.name == "Simonov SKS" then
								v1237 = "clip";
								v1240 = true;
							end;
							v1241 = v1232 * u60 / v1232;
							if u14.name == "SPAS-12" or u14.name == "Caldwell Handcannon" or u14.name == "Caldwell 940" or u14.name == "Model 870" or u14.name == "Winchester 1901" or u14.name == "Benelli M4" or u14.name == "Kel-Tec KSG" or u14.name == "MVD KS-23" then
								v1241 = 0;
								v1232 = 0.5 * (u14.throwrating - u14.throwrating * u60 / u14.throwrating);
								v1237 = "shotgun";
								v1236 = v1233;
								v1239 = "shotgun";
							end;
							if u14.name == "Atchisson AA-12" then
								v1237 = "sniper";
								v1239 = "shotgun";
							end;
							if u14.name == "Caldwell Handcannon" or u14.name == "Caldwell 940" then
								v1239 = nil;
								v1240 = true;
							end;
							v1242 = false;
							v1243 = false;
							v1244 = false;
							if u14.name == "Remington 700" or u14.name == "Peacemaker" or u14.name == "Peacemaker Uppercut" or u14.name == "Peacemaker Chain" or u14.name == "'The Redeemer'" or u14.name == "Winchester 940-1" then
								v1245 = 0;
								v1246 = 0.4;
								if akimbo_factors.active == true then
									v1246 = 0.6;
								end;
								v1232 = v1246 * (u14.throwrating - u14.throwrating * u60 / u14.throwrating);
								v1237 = "single";
								v1236 = v1233;
								v1242 = true;
								v1240 = true;
								if u14.name == "Winchester 940-1" then
									v1239 = "winny";
									v1240 = false;
								end;
							end;
							if u14.name == "Winchester 1901" then
								v1239 = "winny";
							end;
							if u14.name == "Remington 700" or u14.name == "Karabiner 98k" or u14.name == "PGM FR-12.7" or u14.name == "Modded Rifle" or u14.name == "IZhMASh SV-98M" or u14.name == "M1891 Avtomat" or u14.name == "AI-AWSM" or u14.name == "CheyTac M200" then
								v1239 = "sniper";
								v1240 = false;
							end;
							if u14.name == "Commissioned Musket" then
								v1237 = "single";
							end;
							if akimbo_factors.active == true then
								if akimbo_factors.alt_weapon_stats.name == "Model 6 Unica" then
									v1238 = "rv";
								end;
								if akimbo_factors.alt_weapon_stats.name == "Peacemaker" or akimbo_factors.alt_weapon_stats.name == "'The Redeemer'" or u14.name == "Peacemaker Uppercut" or u14.name == "Peacemaker Chain" then
									v1245 = 0;
									v1232 = 0.6 * (akimbo_factors.alt_weapon_stats.throwrating - akimbo_factors.alt_weapon_stats.throwrating * u60 / akimbo_factors.alt_weapon_stats.throwrating);
									v1238 = "single";
									v1236 = 0;
									if v1242 == true then
										v1236 = v1236 + v1233;
									else
										v1243 = true;
									end;
								end;
							end;
							v1247 = v1232 - v1245;
							l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_start", character.HumanoidRootPart, 0.05);
							if akimbo_factors.active == true then
								delay(0.3, function()
									l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_start", character.HumanoidRootPart, 0.05);
								end);
							end;
							for v1248 = 1, v1236 do
								v1249 = false;
								while true do
									if v1247 / 1.5 < tick() - v1231 and v1249 == false then
										if v1243 == true then
											v1237 = v1238;
											v1238 = v1238;
										end;
										l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
										if u14.name == "M1891 Avtomat" then
											delay(1, function()
												l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
												delay(1, function()
													l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
												end);
											end);
										end;
										if akimbo_factors.active == true then
											if v1243 == true or v1242 == true then
												if v1244 == false and math.floor(v1236 / 2) <= v1248 then
													v1244 = true;
													delay(0.4, function()
														l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_mid", character.HumanoidRootPart, 0.05);
													end);
												end;
											else
												delay(0.4, function()
													l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_mid", character.HumanoidRootPart, 0.05);
												end);
											end;
										end;
									end;
									if u14.weapontype ~= "Gun" then
										u8.action = false;
										v1230[1]:Stop(0.5);
										v1230[2]:Stop(0.5);
										return;
									end;
									RS:wait();
									if v1247 < tick() - v1231 then
										break;
									end;								
								end;
								v1231 = tick();
							end;
							if v1240 == true then
								v1229 = false;
							end;
							v1250 = 0.5;
							if playerperks.reliab then
								if v1229 == true then
									l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
									if akimbo_factors.active == true then
										delay(0.2, function()
											l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
										end);
									end;
								end;
								v1229 = false;
								v1220 = false;
								v1250 = 0.2;
							end;
							if v1229 == true then
								if v1239 == nil then
									l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "empty", character.HumanoidRootPart, 0.05);
								elseif v1239 == "sniper" then
									l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "sniper_bolt", character.HumanoidRootPart);
								elseif v1239 == "winny" then
									l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "lever_action", character.HumanoidRootPart);
								elseif v1239 == "shotgun" then
									l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "rack", character.HumanoidRootPart);
								end;
								v1251 = tick();
								while true do
									RS:wait();
									if tick() - v1251 > 0.8 then
										break;
									end;								
								end;
							else
								l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "manip", character.HumanoidRootPart, 0.05);
							end;
							if akimbo_factors.active == true then
								v1252 = tick();
								while true do
									RS:wait();
									if v1250 < tick() - v1252 then
										break;
									end;								
								end;
								if v1220 == true then
									if playerperks.reliab then
										l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
									else
										l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "empty", character.HumanoidRootPart, 0.05);
									end;
									v1253 = tick();
									while true do
										RS:wait();
										if tick() - v1253 > 0.8 then
											break;
										end;									
									end;
								else
									l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "manip", character.HumanoidRootPart, 0.05);
								end;
							end;
							v1230[1]:Stop(0.5);
							v1230[2]:Stop(0.5);
							for v1254, v1255 in pairs(v6) do
								if v1255[2] == true and v1255[3] ~= nil then
									v1255[3] = v1255[3] + v1233;
								end;
							end;
							if akimbo_factors.active == true then
								v6[akimbo_factors.weapon_slot][3] = v6[akimbo_factors.weapon_slot][3] + 0;
							end;
							invmanage("updatehud");
							v1256 = tick();
							v1257 = 0.2;
							while true do
								RS:wait();
								if v1257 < tick() - v1256 then
									break;
								end;							
							end;
							u8.action = false;
							return;
						end;
					end;
				end;
			elseif v1218 == true then
				return;
			else
				v1224 = v1221;
				v1225 = l__Value__1217;
				if v1224 == v1225 and v1218 == true then
					return;
				elseif v1218 == true and v1223 == true then
					return;
				else
					v1226 = nil;
					for v1227, v1228 in pairs(v6) do
						if v1228[2] == true and v1228[3] ~= nil then
							v1226 = v1228[3];
							if l__Value__1217 <= v1228[3] and v1219 == false then
								return;
							end;
						end;
					end;
					if v1226 == l__Value__1217 and v1219 == false then
						return;
					elseif v1221 == v1222 and v1226 == l__Value__1217 then
						return;
					else
						v1229 = false;
						if v1226 == 0 then
							v1229 = true;
						end;
						u8.action = true;
						reload_locklout = tick();
						v1230 = { globalanimsets.reload, tpglobalanimsets.reloadloop };
						if u14.animset == "MRV" then
							v1230 = { curentanimset.reload, tpglobalanimsets.reloadloop };
						end;
						if akimbo_factors.active == true then
							v1230 = { akimbosets.reload, tpglobalanimsets.reloadloop };
						end;
						v1230[1]:Play(0.3);
						v1230[2]:Play(0.3);
						u125 = nil;
						u125 = v1230[1].KeyframeReached:connect(function(p125)
							if p125 == "Stop" then
								v1230[1]:AdjustSpeed(0);
								u125:Disconnect();
							end;
						end);
						u126 = nil;
						u126 = v1230[2].KeyframeReached:connect(function(p126)
							if p126 == "Stop" then
								v1230[2]:AdjustSpeed(0);
								u126:Disconnect();
							end;
						end);
						v1231 = tick();
						v1232 = 1.5 * u14.throwrating;
						v1233 = l__Value__1217 - v1226;
						if u59[u14.ammoused] < v1233 then
							v1233 = u59[u14.ammoused];
						end;
						u59[u14.ammoused] = u59[u14.ammoused] - v1233;
						if u59[u14.ammoused] < 0 then
							u59[u14.ammoused] = 0;
						end;
						v1234 = 500;
						if l__workspace__1.ServerStuff.game.holdout.Value == true then
							v1234 = 3000;
						end;
						if v1234 < u59[u14.ammoused] then
							l__workspace__1.ServerStuff.callEvent:FireServer("lel");
						end;
						if akimbo_factors.active == true then
							v1235 = v1222 - v1221;
							if u59[akimbo_factors.alt_weapon_stats.ammoused] < v1235 then
								v1235 = u59[akimbo_factors.alt_weapon_stats.ammoused];
							end;
							u59[akimbo_factors.alt_weapon_stats.ammoused] = u59[akimbo_factors.alt_weapon_stats.ammoused] - 0;
							if u59[akimbo_factors.alt_weapon_stats.ammoused] < 0 then
								u59[akimbo_factors.alt_weapon_stats.ammoused] = 0;
							end;
							v1232 = 1.5 * u14.throwrating + 1.5 * akimbo_factors.alt_weapon_stats.throwrating / 1.5;
						end;
						v1236 = 1;
						v1237 = "pistol";
						v1238 = "pistol";
						v1239 = nil;
						v1240 = false;
						if u14.animset == "RFL" or u14.animset == "ASMG" then
							v1237 = "rifle";
						end;
						if u14.animset == "SMG" then
							v1237 = "smg";
						end;
						if u14.animset == "ASMG" or u14.name == "MCX VIRTUS" or u14.name == "FAMAS F1" or u14.name == "R11 RSASS" or u14.name == "PPSh-41" or u14.name == "H&K MR308 A3" or u14.name == "ASh-12" or u14.name == "1927A1 Deluxe" then
							v1237 = "ar";
						end;
						if u14.name == "Modded Rifle" or u14.name == "PGM FR-12.7" or u14.name == "M60-E6" or u14.name == "FN M249" then
							v1237 = "sniper";
						end;
						if u14.name == "Skorpion vz. 61" or u14.name == "SIG MPX" or u14.name == "H&K MP5A3" or u14.name == "H&K MP5/10" then
							v1237 = "pistol";
						end;
						if u14.name == "Model 6 Unica" then
							v1237 = "rv";
							v1240 = true;
						end;
						if u14.name == "Karabiner 98k" or u14.name == "M1891 Avtomat" or u14.name == "Dolch 96" or u14.name == "Simonov SKS" then
							v1237 = "clip";
							v1240 = true;
						end;
						v1241 = v1232 * u60 / v1232;
						if u14.name == "SPAS-12" or u14.name == "Caldwell Handcannon" or u14.name == "Caldwell 940" or u14.name == "Model 870" or u14.name == "Winchester 1901" or u14.name == "Benelli M4" or u14.name == "Kel-Tec KSG" or u14.name == "MVD KS-23" then
							v1241 = 0;
							v1232 = 0.5 * (u14.throwrating - u14.throwrating * u60 / u14.throwrating);
							v1237 = "shotgun";
							v1236 = v1233;
							v1239 = "shotgun";
						end;
						if u14.name == "Atchisson AA-12" then
							v1237 = "sniper";
							v1239 = "shotgun";
						end;
						if u14.name == "Caldwell Handcannon" or u14.name == "Caldwell 940" then
							v1239 = nil;
							v1240 = true;
						end;
						v1242 = false;
						v1243 = false;
						v1244 = false;
						if u14.name == "Remington 700" or u14.name == "Peacemaker" or u14.name == "Peacemaker Uppercut" or u14.name == "Peacemaker Chain" or u14.name == "'The Redeemer'" or u14.name == "Winchester 940-1" then
							v1245 = 0;
							v1246 = 0.4;
							if akimbo_factors.active == true then
								v1246 = 0.6;
							end;
							v1232 = v1246 * (u14.throwrating - u14.throwrating * u60 / u14.throwrating);
							v1237 = "single";
							v1236 = v1233;
							v1242 = true;
							v1240 = true;
							if u14.name == "Winchester 940-1" then
								v1239 = "winny";
								v1240 = false;
							end;
						end;
						if u14.name == "Winchester 1901" then
							v1239 = "winny";
						end;
						if u14.name == "Remington 700" or u14.name == "Karabiner 98k" or u14.name == "PGM FR-12.7" or u14.name == "Modded Rifle" or u14.name == "IZhMASh SV-98M" or u14.name == "M1891 Avtomat" or u14.name == "AI-AWSM" or u14.name == "CheyTac M200" then
							v1239 = "sniper";
							v1240 = false;
						end;
						if u14.name == "Commissioned Musket" then
							v1237 = "single";
						end;
						if akimbo_factors.active == true then
							if akimbo_factors.alt_weapon_stats.name == "Model 6 Unica" then
								v1238 = "rv";
							end;
							if akimbo_factors.alt_weapon_stats.name == "Peacemaker" or akimbo_factors.alt_weapon_stats.name == "'The Redeemer'" or u14.name == "Peacemaker Uppercut" or u14.name == "Peacemaker Chain" then
								v1245 = 0;
								v1232 = 0.6 * (akimbo_factors.alt_weapon_stats.throwrating - akimbo_factors.alt_weapon_stats.throwrating * u60 / akimbo_factors.alt_weapon_stats.throwrating);
								v1238 = "single";
								v1236 = 0;
								if v1242 == true then
									v1236 = v1236 + v1233;
								else
									v1243 = true;
								end;
							end;
						end;
						v1247 = v1232 - v1245;
						l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_start", character.HumanoidRootPart, 0.05);
						if akimbo_factors.active == true then
							delay(0.3, function()
								l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_start", character.HumanoidRootPart, 0.05);
							end);
						end;
						for v1248 = 1, v1236 do
							v1249 = false;
							while true do
								if v1247 / 1.5 < tick() - v1231 and v1249 == false then
									if v1243 == true then
										v1237 = v1238;
										v1238 = v1238;
									end;
									l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
									if u14.name == "M1891 Avtomat" then
										delay(1, function()
											l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
											delay(1, function()
												l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
											end);
										end);
									end;
									if akimbo_factors.active == true then
										if v1243 == true or v1242 == true then
											if v1244 == false and math.floor(v1236 / 2) <= v1248 then
												v1244 = true;
												delay(0.4, function()
													l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_mid", character.HumanoidRootPart, 0.05);
												end);
											end;
										else
											delay(0.4, function()
												l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_mid", character.HumanoidRootPart, 0.05);
											end);
										end;
									end;
								end;
								if u14.weapontype ~= "Gun" then
									u8.action = false;
									v1230[1]:Stop(0.5);
									v1230[2]:Stop(0.5);
									return;
								end;
								RS:wait();
								if v1247 < tick() - v1231 then
									break;
								end;							
							end;
							v1231 = tick();
						end;
						if v1240 == true then
							v1229 = false;
						end;
						v1250 = 0.5;
						if playerperks.reliab then
							if v1229 == true then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
								if akimbo_factors.active == true then
									delay(0.2, function()
										l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
									end);
								end;
							end;
							v1229 = false;
							v1220 = false;
							v1250 = 0.2;
						end;
						if v1229 == true then
							if v1239 == nil then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "empty", character.HumanoidRootPart, 0.05);
							elseif v1239 == "sniper" then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "sniper_bolt", character.HumanoidRootPart);
							elseif v1239 == "winny" then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "lever_action", character.HumanoidRootPart);
							elseif v1239 == "shotgun" then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "rack", character.HumanoidRootPart);
							end;
							v1251 = tick();
							while true do
								RS:wait();
								if tick() - v1251 > 0.8 then
									break;
								end;							
							end;
						else
							l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "manip", character.HumanoidRootPart, 0.05);
						end;
						if akimbo_factors.active == true then
							v1252 = tick();
							while true do
								RS:wait();
								if v1250 < tick() - v1252 then
									break;
								end;							
							end;
							if v1220 == true then
								if playerperks.reliab then
									l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
								else
									l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "empty", character.HumanoidRootPart, 0.05);
								end;
								v1253 = tick();
								while true do
									RS:wait();
									if tick() - v1253 > 0.8 then
										break;
									end;								
								end;
							else
								l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "manip", character.HumanoidRootPart, 0.05);
							end;
						end;
						v1230[1]:Stop(0.5);
						v1230[2]:Stop(0.5);
						for v1254, v1255 in pairs(v6) do
							if v1255[2] == true and v1255[3] ~= nil then
								v1255[3] = v1255[3] + v1233;
							end;
						end;
						if akimbo_factors.active == true then
							v6[akimbo_factors.weapon_slot][3] = v6[akimbo_factors.weapon_slot][3] + 0;
						end;
						invmanage("updatehud");
						v1256 = tick();
						v1257 = 0.2;
						while true do
							RS:wait();
							if v1257 < tick() - v1256 then
								break;
							end;						
						end;
						u8.action = false;
						return;
					end;
				end;
			end;
		else
			v1224 = v1221;
			v1225 = l__Value__1217;
			if v1224 == v1225 and v1218 == true then
				return;
			elseif v1218 == true and v1223 == true then
				return;
			else
				v1226 = nil;
				for v1227, v1228 in pairs(v6) do
					if v1228[2] == true and v1228[3] ~= nil then
						v1226 = v1228[3];
						if l__Value__1217 <= v1228[3] and v1219 == false then
							return;
						end;
					end;
				end;
				if v1226 == l__Value__1217 and v1219 == false then
					return;
				elseif v1221 == v1222 and v1226 == l__Value__1217 then
					return;
				else
					v1229 = false;
					if v1226 == 0 then
						v1229 = true;
					end;
					u8.action = true;
					reload_locklout = tick();
					v1230 = { globalanimsets.reload, tpglobalanimsets.reloadloop };
					if u14.animset == "MRV" then
						v1230 = { curentanimset.reload, tpglobalanimsets.reloadloop };
					end;
					if akimbo_factors.active == true then
						v1230 = { akimbosets.reload, tpglobalanimsets.reloadloop };
					end;
					v1230[1]:Play(0.3);
					v1230[2]:Play(0.3);
					u125 = nil;
					u125 = v1230[1].KeyframeReached:connect(function(p125)
						if p125 == "Stop" then
							v1230[1]:AdjustSpeed(0);
							u125:Disconnect();
						end;
					end);
					u126 = nil;
					u126 = v1230[2].KeyframeReached:connect(function(p126)
						if p126 == "Stop" then
							v1230[2]:AdjustSpeed(0);
							u126:Disconnect();
						end;
					end);
					v1231 = tick();
					v1232 = 1.5 * u14.throwrating;
					v1233 = l__Value__1217 - v1226;
					if u59[u14.ammoused] < v1233 then
						v1233 = u59[u14.ammoused];
					end;
					u59[u14.ammoused] = u59[u14.ammoused] - v1233;
					if u59[u14.ammoused] < 0 then
						u59[u14.ammoused] = 0;
					end;
					v1234 = 500;
					if l__workspace__1.ServerStuff.game.holdout.Value == true then
						v1234 = 3000;
					end;
					if v1234 < u59[u14.ammoused] then
						l__workspace__1.ServerStuff.callEvent:FireServer("lel");
					end;
					if akimbo_factors.active == true then
						v1235 = v1222 - v1221;
						if u59[akimbo_factors.alt_weapon_stats.ammoused] < v1235 then
							v1235 = u59[akimbo_factors.alt_weapon_stats.ammoused];
						end;
						u59[akimbo_factors.alt_weapon_stats.ammoused] = u59[akimbo_factors.alt_weapon_stats.ammoused] - 0;
						if u59[akimbo_factors.alt_weapon_stats.ammoused] < 0 then
							u59[akimbo_factors.alt_weapon_stats.ammoused] = 0;
						end;
						v1232 = 1.5 * u14.throwrating + 1.5 * akimbo_factors.alt_weapon_stats.throwrating / 1.5;
					end;
					v1236 = 1;
					v1237 = "pistol";
					v1238 = "pistol";
					v1239 = nil;
					v1240 = false;
					if u14.animset == "RFL" or u14.animset == "ASMG" then
						v1237 = "rifle";
					end;
					if u14.animset == "SMG" then
						v1237 = "smg";
					end;
					if u14.animset == "ASMG" or u14.name == "MCX VIRTUS" or u14.name == "FAMAS F1" or u14.name == "R11 RSASS" or u14.name == "PPSh-41" or u14.name == "H&K MR308 A3" or u14.name == "ASh-12" or u14.name == "1927A1 Deluxe" then
						v1237 = "ar";
					end;
					if u14.name == "Modded Rifle" or u14.name == "PGM FR-12.7" or u14.name == "M60-E6" or u14.name == "FN M249" then
						v1237 = "sniper";
					end;
					if u14.name == "Skorpion vz. 61" or u14.name == "SIG MPX" or u14.name == "H&K MP5A3" or u14.name == "H&K MP5/10" then
						v1237 = "pistol";
					end;
					if u14.name == "Model 6 Unica" then
						v1237 = "rv";
						v1240 = true;
					end;
					if u14.name == "Karabiner 98k" or u14.name == "M1891 Avtomat" or u14.name == "Dolch 96" or u14.name == "Simonov SKS" then
						v1237 = "clip";
						v1240 = true;
					end;
					v1241 = v1232 * u60 / v1232;
					if u14.name == "SPAS-12" or u14.name == "Caldwell Handcannon" or u14.name == "Caldwell 940" or u14.name == "Model 870" or u14.name == "Winchester 1901" or u14.name == "Benelli M4" or u14.name == "Kel-Tec KSG" or u14.name == "MVD KS-23" then
						v1241 = 0;
						v1232 = 0.5 * (u14.throwrating - u14.throwrating * u60 / u14.throwrating);
						v1237 = "shotgun";
						v1236 = v1233;
						v1239 = "shotgun";
					end;
					if u14.name == "Atchisson AA-12" then
						v1237 = "sniper";
						v1239 = "shotgun";
					end;
					if u14.name == "Caldwell Handcannon" or u14.name == "Caldwell 940" then
						v1239 = nil;
						v1240 = true;
					end;
					v1242 = false;
					v1243 = false;
					v1244 = false;
					if u14.name == "Remington 700" or u14.name == "Peacemaker" or u14.name == "Peacemaker Uppercut" or u14.name == "Peacemaker Chain" or u14.name == "'The Redeemer'" or u14.name == "Winchester 940-1" then
						v1245 = 0;
						v1246 = 0.4;
						if akimbo_factors.active == true then
							v1246 = 0.6;
						end;
						v1232 = v1246 * (u14.throwrating - u14.throwrating * u60 / u14.throwrating);
						v1237 = "single";
						v1236 = v1233;
						v1242 = true;
						v1240 = true;
						if u14.name == "Winchester 940-1" then
							v1239 = "winny";
							v1240 = false;
						end;
					end;
					if u14.name == "Winchester 1901" then
						v1239 = "winny";
					end;
					if u14.name == "Remington 700" or u14.name == "Karabiner 98k" or u14.name == "PGM FR-12.7" or u14.name == "Modded Rifle" or u14.name == "IZhMASh SV-98M" or u14.name == "M1891 Avtomat" or u14.name == "AI-AWSM" or u14.name == "CheyTac M200" then
						v1239 = "sniper";
						v1240 = false;
					end;
					if u14.name == "Commissioned Musket" then
						v1237 = "single";
					end;
					if akimbo_factors.active == true then
						if akimbo_factors.alt_weapon_stats.name == "Model 6 Unica" then
							v1238 = "rv";
						end;
						if akimbo_factors.alt_weapon_stats.name == "Peacemaker" or akimbo_factors.alt_weapon_stats.name == "'The Redeemer'" or u14.name == "Peacemaker Uppercut" or u14.name == "Peacemaker Chain" then
							v1245 = 0;
							v1232 = 0.6 * (akimbo_factors.alt_weapon_stats.throwrating - akimbo_factors.alt_weapon_stats.throwrating * u60 / akimbo_factors.alt_weapon_stats.throwrating);
							v1238 = "single";
							v1236 = 0;
							if v1242 == true then
								v1236 = v1236 + v1233;
							else
								v1243 = true;
							end;
						end;
					end;
					v1247 = v1232 - v1245;
					l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_start", character.HumanoidRootPart, 0.05);
					if akimbo_factors.active == true then
						delay(0.3, function()
							l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_start", character.HumanoidRootPart, 0.05);
						end);
					end;
					for v1248 = 1, v1236 do
						v1249 = false;
						while true do
							if v1247 / 1.5 < tick() - v1231 and v1249 == false then
								if v1243 == true then
									v1237 = v1238;
									v1238 = v1238;
								end;
								l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
								if u14.name == "M1891 Avtomat" then
									delay(1, function()
										l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
										delay(1, function()
											l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1237 .. "_mid", character.HumanoidRootPart, 0.05);
										end);
									end);
								end;
								if akimbo_factors.active == true then
									if v1243 == true or v1242 == true then
										if v1244 == false and math.floor(v1236 / 2) <= v1248 then
											v1244 = true;
											delay(0.4, function()
												l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_mid", character.HumanoidRootPart, 0.05);
											end);
										end;
									else
										delay(0.4, function()
											l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, v1238 .. "_mid", character.HumanoidRootPart, 0.05);
										end);
									end;
								end;
							end;
							if u14.weapontype ~= "Gun" then
								u8.action = false;
								v1230[1]:Stop(0.5);
								v1230[2]:Stop(0.5);
								return;
							end;
							RS:wait();
							if v1247 < tick() - v1231 then
								break;
							end;						
						end;
						v1231 = tick();
					end;
					if v1240 == true then
						v1229 = false;
					end;
					v1250 = 0.5;
					if playerperks.reliab then
						if v1229 == true then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
							if akimbo_factors.active == true then
								delay(0.2, function()
									l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
								end);
							end;
						end;
						v1229 = false;
						v1220 = false;
						v1250 = 0.2;
					end;
					if v1229 == true then
						if v1239 == nil then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "empty", character.HumanoidRootPart, 0.05);
						elseif v1239 == "sniper" then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "sniper_bolt", character.HumanoidRootPart);
						elseif v1239 == "winny" then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "lever_action", character.HumanoidRootPart);
						elseif v1239 == "shotgun" then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "rack", character.HumanoidRootPart);
						end;
						v1251 = tick();
						while true do
							RS:wait();
							if tick() - v1251 > 0.8 then
								break;
							end;						
						end;
					else
						l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "manip", character.HumanoidRootPart, 0.05);
					end;
					if akimbo_factors.active == true then
						v1252 = tick();
						while true do
							RS:wait();
							if v1250 < tick() - v1252 then
								break;
							end;						
						end;
						if v1220 == true then
							if playerperks.reliab then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "reliab_empty", character.HumanoidRootPart, 0.05);
							else
								l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "empty", character.HumanoidRootPart, 0.05);
							end;
							v1253 = tick();
							while true do
								RS:wait();
								if tick() - v1253 > 0.8 then
									break;
								end;							
							end;
						else
							l__workspace__1.ServerStuff.playAudio:FireServer({ "reloads" }, "manip", character.HumanoidRootPart, 0.05);
						end;
					end;
					v1230[1]:Stop(0.5);
					v1230[2]:Stop(0.5);
					for v1254, v1255 in pairs(v6) do
						if v1255[2] == true and v1255[3] ~= nil then
							v1255[3] = v1255[3] + v1233;
						end;
					end;
					if akimbo_factors.active == true then
						v6[akimbo_factors.weapon_slot][3] = v6[akimbo_factors.weapon_slot][3] + 0;
					end;
					invmanage("updatehud");
					v1256 = tick();
					v1257 = 0.2;
					while true do
						RS:wait();
						if v1257 < tick() - v1256 then
							break;
						end;					
					end;
					u8.action = false;
					return;
				end;
			end;
		end;
	end;
end;
local function u127()
	if u8.channel == true then
		return;
	end;
	if tick() - u49 <= 0.3 then
		return;
	end;
	u8.action = true;
	u8.blocking = true;
	u8.cancombo = false;
	tpglobalanimsets.damage:Stop();
	u12 = 1;
	l__workspace__1.ServerStuff.initiateblock:FireServer(v5, true);
	curentanimset.block:Play(0.15);
	curentanimset.block:AdjustSpeed(0);
	tpcurrentanimset.block:Play(0.1);
	tpcurrentanimset.block.TimePosition = 0.3;
	tpcurrentanimset.block:AdjustSpeed(0);
	local v1258 = { globalanimsets.stagger, tpglobalanimsets.stagger };
	v1258[1]:Stop();
	v1258[2]:Stop();
	local v1259 = { globalanimsets.stun, tpglobalanimsets.sick };
	v1259[1]:Stop();
	v1259[2]:Stop();
	l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "blockraise", character.HumanoidRootPart);
	u50 = tick();
	while true do
		RS:wait();
		if u8.staggering == true then
			break;
		end;
		if tick() - u50 > 0.3 then
			break;
		end;
		if u8.blockrecoil == true then
			u51();
			return;
		end;	
	end;
	u49 = tick();
	if curentanimset.block then
		curentanimset.block:Stop(0.15);
		tpcurrentanimset.block:Stop(0.1);
	end;
	u12 = 0.0175;
	if u8.staggering == false then
		curentanimset.equip.TimePosition = 0.5;
		curentanimset.equip:AdjustSpeed(0);
		tpcurrentanimset.equip:Play();
		tpcurrentanimset.equip.TimePosition = 0.5;
		tpcurrentanimset.equip:AdjustSpeed(0);
		check_walking_anim();
		u8.action = false;
		u8.blocking = false;
		l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
		local v1260 = tick();
		while true do
			RS:wait();
			if tick() - v1260 > 0.23 then
				break;
			end;
			if u8.staggering == true then
				break;
			end;		
		end;
		if u8.cancombo == false and u8.action == false then
			u8.cancombo = true;
			return;
		end;
	else
		u8.cancombo = false;
		l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
	end;
end;
local function u128()
	if u9.Fracture and u9.Painkillers == nil and u9["Bottle Buff"] == nil then
		return;
	end;
	if u14.animset == "LSMG" then
		return;
	end;
	if u8.shoving == true or u8.blockrecoil == true then
		return;
	end;
	if u7 < 20 then
		return;
	end;
	if u8.action == true and v63.aegisshieldup == nil then
		return;
	end;
	u8.action = true;
	u8.cancombo = false;
	u8.shoving = true;
	if v63.aegisshieldup == nil then
		l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
	end;
	if u7 > 0 then
		u7 = u7 - 20;
	end;
	u22("stamina");
	u11.stamregen = tick();
	u11.regentick = tick();
	local v1261 = globalanimsets.shove;
	local v1262 = tpglobalanimsets.shove;
	if l__game__6.ReplicatedStorage.animationSets:FindFirstChild(current_anim_set_use):FindFirstChild("shove") then
		v1261 = curentanimset.shove;
	end;
	v1261:Stop(0);
	local v1263 = "shove";
	if aux_name == "ballistic" and aux_usage > 0 and v64[1] ~= "damn" and v63.aegisshieldup == nil then
		v1263 = "shovebleed";
		v1261 = globalanimsets.ballistic_shove;
		v1262 = tpglobalanimsets.ballistic_shove;
		if v64[1] ~= "dagger" then
			local v1264 = l__game__6.ReplicatedStorage.auxItems:FindFirstChild("ballistic"):Clone();
			l__Debris__32:AddItem(v1264, 1);
			v1264.Parent = l__CurrentCamera__1;
			local v1265 = Instance.new("Motor6D");
			v1265.Part0 = fparms.LeftArm.LUpperArm;
			v1265.Part1 = v1264;
			v1265.Parent = v1264;
			v1265.Parent = l__CurrentCamera__1;
			l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "ballistic_swing", character.HumanoidRootPart, 0.1);
			l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("ballistic_knife");
		end;
	end;
	if v64[1] == "dagger" then
		v1261 = globalanimsets.perk_sov_shove;
		v1262 = tpglobalanimsets.ballistic_shove;
		local v1266 = l__game__6.ReplicatedStorage.perkAbilities:FindFirstChild("dagger_stab"):Clone();
		v1266.ropepart.rope.Enabled = true;
		l__Debris__32:AddItem(v1266, 1);
		v1266.Parent = l__CurrentCamera__1;
		local v1267 = Instance.new("Motor6D");
		v1267.Part0 = fparms.LeftArm.LUpperArm;
		v1267.Part1 = v1266;
		v1267.Parent = v1266;
		v1267.Parent = l__CurrentCamera__1;
		l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "sov_shove", character.HumanoidRootPart, 0.1);
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("sov_dagger");
	end;
	if v63.aegisshieldup then
		v1263 = "shove";
		v1261 = globalanimsets.perk_aegis_shove;
		v1262 = tpglobalanimsets.perk_shield_shove;
	end;
	v1261:Play(0.1, 1, 1.75);
	v1262:Play(0.1, 1, 1.75);
	shakecamera("shove");
	local v1268 = false;
	if v1263 == "shove" then
		l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "shove", character.HumanoidRootPart, 0.15);
	end;
	local v1269 = nil;
	local v1270 = 0;
	local v1271 = tick();
	while true do
		RS:wait();
		if v1269 == nil and v1270 < 10 and tick() - v1271 >= 0.1 then
			v1269 = u44(v1263);
			if v1269 then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "shove_landed", character.HumanoidRootPart, 0.15);
				if v64[1] == "dagger" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "sov_stab", character.HumanoidRootPart, 0.15);
					u39(v1269.Head.Position, v64[3].dagger_damage);
				end;
				if v1263 == "shovebleed" then
					if v1269:FindFirstChild("Head") then
						u39(v1269.Head.Position, current_aux.activestats.impact_damage);
					end;
					if v64[1] ~= "dagger" then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "aux" }, "ballistic_knifed", character.HumanoidRootPart, 0.15);
					end;
				end;
			end;
			v1270 = v1270 + 1;
		end;
		u11.stamregen = tick();
		u11.regentick = tick();
		if v1261.TimePosition >= 0.2 and v1268 == false then
			v1268 = true;
			local v1272 = 0.3 + 0.3 * u53;
			v1261:AdjustSpeed(v1272);
			v1262:AdjustSpeed(v1272);
		end;
		if v1261.IsPlaying == false then
			break;
		end;	
	end;
	u11.stamregen = tick();
	u11.regentick = tick();
	if v63.aegisshieldup ~= nil then
		u8.cancombo = true;
		u8.shoving = false;
		return;
	end;
	u8.cancombo = true;
	u8.shoving = false;
	curentanimset.equip.TimePosition = 0.5;
	curentanimset.equip:AdjustSpeed(0);
	tpcurrentanimset.equip:Play();
	tpcurrentanimset.equip.TimePosition = 0.5;
	tpcurrentanimset.equip:AdjustSpeed(0);
	check_walking_anim();
	u8.action = false;
end;
local u129 = nil;
local u130 = v1117;
local u131 = false;
local function u132(p127)
	if u8.action == false and u8.aiming == false and u8.channel == false and u8.firing == false then
		emotelist = false;
		maingui.Centre.emotes.Visible = false;
		if (p127 == "flourish" or p127 == "salute") and (u14.weapontype ~= "Bludgeon" and u14.weapontype ~= "Spear" and u14.weapontype ~= "Blade" and u14.weapontype ~= "Axe" or u14.animset == "Fists") then
			return;
		elseif p127 == "raise weapon" and u14.animset == "Fists" then
			return;
		else
			local v1273 = 0.1;
			local v1274 = 1;
			if p127 == "salute" or p127 == "cut throat" then
				v1274 = 0.65;
			end;
			if p127 == "flourish" then
				v1274 = 0.8;
			end;
			if u99[p127] ~= nil then
				v1273 = u99[p127];
			end;
			tauntanimset[p127]:Play(v1273, 1, v1274);
			tptauntanimset[p127]:Play(v1273, 1, v1274);
			if u99[p127] ~= nil then
				u100 = true;
				u8.action = true;
				u8.channel = true;
				while true do
					if tauntanimset[p127]:GetTimeOfKeyframe("Stop") <= tauntanimset[p127].TimePosition then
						tauntanimset[p127]:AdjustSpeed(0);
						tptauntanimset[p127]:AdjustSpeed(0);
					end;
					RS:wait();
					if u8.staggering == true then
						break;
					end;
					if u100 == false then
						break;
					end;				
				end;
				if u8.staggering == false then
					u8.action = false;
					u8.channel = false;
				end;
				u100 = false;
				tauntanimset[p127]:Stop(0.5);
				tptauntanimset[p127]:Stop(0.5);
			end;
			return;
		end;
	end;
end;
local function u133(p128)
	v63.buffer_f_key = true;
	local v1275 = 0;
	if v64[3].cooldown then
		v1275 = v64[3].cooldown;
	end;
	if v64[3].multicooldown then
		v1275 = v64[3].multicooldown;
	end;
	if v64[3].perk_mincd then
		v1275 = v64[3].perk_mincd;
	end;
	if v64[3].useanyduration == true then
		v1275 = 0;
	end;
	if p128 == "goggles" then
		v1275 = -1000;
		if v63.gogglebroken then
			v1275 = v64[3].goggle_broken_cd;
		end;
	end;
	if tick() - u88 < v1275 then
		return;
	end;
	if u8.action == true or u8.using_perk == true then
		return;
	end;
	u8.using_perk = true;
	u8.action = true;
	local l__stun__1276 = globalanimsets.stun;
	local v1277 = l__stun__1276.KeyframeReached:connect(function(p129)
		if p129 == "Stop" then
			l__stun__1276:AdjustSpeed(0);
		end;
	end);
	l__stun__1276:Play(0.1, 1, 1);
	local v1278 = tick();
	while true do
		RS:wait();
		if tick() - v1278 >= 0.2 then
			break;
		end;	
	end;
	l__stun__1276:Stop();
	if hum.Health <= 0 then
		return;
	end;
	local v1279 = tick();
	v1277:Disconnect();
	local v1280 = globalanimsets.perk_calamity;
	local v1281 = tpglobalanimsets.perk_calamity;
	local v1282 = nil;
	if p128 == "berz" then
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.calamserum:Clone();
		if v1282:FindFirstChild("Cap") then
			v1282:FindFirstChild("Cap").Transparency = 0;
			delay(0.12, function()
				l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "calamity_stim", character.HumanoidRootPart);
				delay(0.1, function()
					v1282:FindFirstChild("CapWeld"):Destroy();
					RS:wait();
					v1282:FindFirstChild("Cap").Velocity = v1282:FindFirstChild("Cap").CFrame.upVector * 20;
				end);
			end);
		end;
		v104({ "weapons", "2HB" }, "draw", nil, nil, true, true);
		v1281:Play(0.1);
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("calamserum");
	elseif p128 == "tarot" then
		u8.channel = true;
		local v1283 = math.random(0, 22);
		for v1284, v1285 in pairs({
			chariot = "9620080383", 
			devil = "9620079975", 
			emperor = "9620079803", 
			death = "9620080140", 
			empress = "9620079587", 
			fool = "9620079407", 
			hanged = "9620079228", 
			hermit = "9620079058", 
			priestess = "9620078773", 
			judgement = "9620078677", 
			justice = "9620078574", 
			magician = "9620078378", 
			moon = "9620078134", 
			star = "9620077943", 
			strength = "9620077647", 
			sun = "9620077346", 
			temperance = "9620077108", 
			tower = "9620076910", 
			wheel = "9620076635", 
			world = "9620076467", 
			hierophant = "9620081448", 
			lovers = "9620081300"
		}) do
			if v1283 <= 0 then
				break;
			end;
			v1283 = v1283 - 1;
		end;
	elseif p128 == "drift" then
		u8.channel = true;
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.drifter:Clone();
		v1282.main.blade.Transparency = 1;
		v1282.main.connector1.Transparency = 1;
		v1282.main.connector2.Transparency = 1;
		v1282.main.connector3.Transparency = 1;
		v1282.main.light.Transparency = 1;
		for v1286, v1287 in ipairs(v1282.off:GetChildren()) do
			v1287.Transparency = 0;
		end;
		v1282.smoke1.Transparency = 0;
		v1282.smoke2.Transparency = 0;
		v1282.smoke3.Transparency = 0;
		v1282.smoke4.Transparency = 0.5;
		v1280 = globalanimsets.perk_drift;
		v104({ "perks", "two" }, "drift_equip", nil, nil, true, true);
		delay(0.35, function()
			for v1288, v1289 in ipairs(v1282.off:GetChildren()) do
				v1289.Transparency = 1;
			end;
			v1282.main.connector1.Transparency = 0;
			v1282.main.connector2.Transparency = 0;
			v1282.main.connector3.Transparency = 0;
			v1282.main.light.Transparency = 0;
			v104({ "perks", "two" }, "drift_mech", nil, nil, true, true);
			v1282.fx1.spark1:Emit(math.random(15, 30));
			v1282.fx1.spark2:Emit(math.random(2, 4));
			v1282.screen1.BrickColor = BrickColor.new("Maroon");
			v1282.screen1.Material = "Neon";
			v1282.screen2.BrickColor = BrickColor.new("Maroon");
			v1282.screen2.Material = "Neon";
			v104({ "perks", "two" }, "drift_wrist", nil, nil, true, true);
		end);
		delay(0.55, function()
			v1282.main.blade.Transparency = 0;
			v104({ "perks", "two" }, "drift_blade", nil, nil, true, true);
			v1282.fx2.spark1:Emit(math.random(15, 30));
			v1282.fx2.spark2:Emit(math.random(2, 4));
		end);
		local u134 = v1281;
		delay(0.6, function()
			l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("drifter");
			u134 = tpglobalanimsets.perk_drift;
			u134:Play(0.05);
			v104({ "perks", "two" }, "drift_throw", nil, nil, true, true);
			delay(0.5, function()
				if hum.Health > 0 then
					u134.TimePosition = 0.6;
					u134:AdjustSpeed(0);
				end;
			end);
		end);
	elseif p128 == "sword" then
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.kirablade:Clone();
		v104({ "perks" }, "bladeequip", nil, nil, true, true);
		v1281 = tpglobalanimsets.perk_kira;
		v1281:Play(0.1);
		delay(0.25, function()
			l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("kirablade");
		end);
		v1280 = globalanimsets.perk_kira;
		delay(0.1, function()
			if v1282:FindFirstChild("trail") then
				v1282:FindFirstChild("trail").Enabled = true;
			end;
		end);
		if v63.dogtags ~= nil and v63.dogtags > 0 then
			v1282.blade.sprayA.Transparency = 0;
			v1282.blade.sprayB.Transparency = 0;
			v1282.blade.sprayB.Transparency = 0;
			v1282.blade.sprayB.Transparency = 0;
			v1282.blade.Color = Color3.fromRGB(223, 200, 219);
		end;
	elseif p128 == "goggles" then
		local v1290 = false;
		v104({ "perks" }, "goggles_grab", nil, nil, true, true);
		local v1291 = globalanimsets.perk_goggles_on;
		local v1292 = tpglobalanimsets.perk_goggles;
		if v63.gogglesactive == true then
			v1290 = true;
			v1291 = globalanimsets.perk_goggles_off;
			v1292 = tpglobalanimsets.perk_goggles_off;
		end;
		v1281:Play(0.1);
		local v1293 = 0.325;
		if v1290 == true then
			v1293 = 0.45;
		end;
		delay(v1293, function()
			local v1294 = l__game__6.ReplicatedStorage.perkAbilities.goggles:Clone();
			v1294.mid.CFrame = l__CurrentCamera__1.CFrame;
			v1294.Parent = l__CurrentCamera__1;
			local v1295 = Instance.new("Motor6D");
			v1295.Part0 = v1294.mid;
			v1295.Part1 = cpart;
			local v1296 = 1.6;
			local v1297 = 0.3;
			if v1290 == true then
				v1296 = 0.3;
				v1297 = 1.6;
			end;
			v1295.C1 = CFrame.new(0, v1296, -0.9) * CFrame.Angles(0, 3.141592653589793, 0);
			v1295.Parent = v1294;
			local v1298 = tick();
			while true do
				v1295.C1 = v1295.C1:Lerp(CFrame.new(0, v1297, -0.9) * CFrame.Angles(0, 3.141592653589793, 0), 0.4);
				RS:wait();
				if tick() - v1298 >= 0.1 then
					break;
				end;			
			end;
			v1294:Destroy();
		end);
	elseif p128 == "scan" then
		v104({ "weapons", "drones" }, "droneactivate", nil, nil, true, true);
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.scanner:Clone();
		v1280 = globalanimsets.perk_scanner;
		v1281 = tpglobalanimsets.perk_scanner;
		v1281:Play(0.1);
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("scanner");
	elseif p128 == "lazarus" then
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("lazarus");
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.crossbow:Clone();
		l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "laz_equip", character.HumanoidRootPart);
		v1280 = globalanimsets.perk_laz;
		v1281 = tpglobalanimsets.perk_laz;
		v1281:Play(0.1);
	elseif p128 == "dagger" then
		v104({ "weapons", "1HBL" }, "draw", nil, nil, true, true);
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.dagger:Clone();
		v1280 = globalanimsets.perk_sov_throw;
		if tick() - u88 < v64[3].cooldown then
			v1280 = globalanimsets.perk_sov_throwcut;
			delay(0.6, function()
				l__workspace__1.ServerStuff.dealDamage:FireServer("sov_buff", {}, v5, v4);
				v104({ "perks" }, "sov_dagger_buff", nil, nil, true, true);
				v104({ "perks" }, "sov_dagger", nil, nil, true, true);
				v104({ "perks" }, "sov_buff", nil, nil, true, true);
				v1282.glow.Transparency = 0.5;
				v1282.glow.effect.Enabled = true;
			end);
		else
			delay(0.45, function()
				v104({ "perks" }, "sov_dagger_buff", nil, nil, true, true);
				v104({ "perks" }, "sov_dagger", nil, nil, true, true);
				v1282.glow.Transparency = 0.5;
				v1282.glow.effect.Enabled = true;
			end);
		end;
		if v64[3].cooldown <= tick() - u88 then
			u88 = tick();
		end;
	elseif p128 == "fire" then
		l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "flamer_activate", character.HumanoidRootPart);
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.fire_arm:Clone();
		v1280 = globalanimsets.perk_fire;
	elseif p128 == "shotgun" then
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("shotshell");
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.shotshell:Clone();
		l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "shotshell_windup", character.HumanoidRootPart);
		v1280 = globalanimsets.perk_shotgun;
		v1281 = tpglobalanimsets.perk_shotshell;
		v1281:Play(0.1);
	elseif p128 == "gunner" then
		l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "mini_ready", character.HumanoidRootPart);
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("minigun");
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.minigun:Clone();
		v1280 = globalanimsets.perk_minigun;
		v1281 = tpglobalanimsets.perk_minigun;
		v1281:Play(0.1);
	elseif p128 == "hive" then
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("hive");
		v104({ "perks" }, "hive_draw", nil, nil, true, true);
		v104({ "perks" }, "hive_equip", nil, nil, true, true);
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.hive:Clone();
		v63.hive_loop_sound = v104({ "perks" }, "hive_decay", nil, nil, nil, true);
		v1280 = globalanimsets.perk_hive;
		v1281 = tpglobalanimsets.perk_hive;
		v1281:Play(0.1);
	elseif p128 == "wire" then
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("wire");
		v104({ "perks", "two" }, "wire_pull_out", nil, nil, true, true);
		v104({ "perks", "two" }, "wire_pull_ready", nil, nil, true, true);
		v104({ "perks", "two" }, "wire_pull_reel", nil, nil, true, true);
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.wire:Clone();
		v1280 = globalanimsets.perk_wire;
		v1281 = tpglobalanimsets.perk_wire_equip;
		v1281:Play(0.1);
		local v1299 = math.floor((tick() - u88) / v64[3].multicooldown);
		for v1300, v1301 in ipairs(v1282:GetChildren()) do
			if v1301:IsA("BasePart") and v1299 < tonumber(v1301.Name) then
				v1301.Transparency = 1;
				v1301.covers.Transparency = 1;
				v1301.wrap.Transparency = 1;
			end;
		end;
	elseif p128 == "revolver" then
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("revolver");
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.revolver:Clone();
		v1282.spin_fx.Transparency = 0.5;
		v1280 = globalanimsets.perk_revolver_arm;
		v1281 = tpglobalanimsets.perk_revolver;
		v1281:Play(0.1);
		for v1302, v1303 in ipairs(maingui.Centre.crosshair:GetChildren()) do
			v1303.Visible = false;
		end;
		l__game__6.ReplicatedStorage.misc.revolver_crosshair:Clone().Parent = maingui;
		v104({ "perks" }, "revolver_spin", nil, nil, true, true);
		spawn(function()
			while v1282 and v1282:FindFirstChild("spinner") do
				v1282.spinner.spin.C0 = v1282.spinner.spin.C0 * CFrame.Angles(0, 0, 0.5235987755982988);
				RS:wait();
				if v1282.spin_fx.Transparency >= 1 then
					v1282.spinner.spin.C0 = CFrame.new(-0.00385594368, -0.158682585, -0.0735162497, 0, 0, -1, 0, 1, 0, 1, 0, 0);
					return;
				end;			
			end;
		end);
	elseif p128 == "ranger" then
		v1280 = globalanimsets.perk_izbucni;
		v1281 = tpglobalanimsets.perk_throwing;
		v104({ "perks" }, "pinpull", nil, nil, true, true);
	elseif p128 == "shadow" then
		l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "summon_begin", character.HumanoidRootPart);
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("shadow");
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.shadowarm:Clone();
		v1280 = globalanimsets.perk_shadow;
		v1281 = tpglobalanimsets.perk_shadow_slam;
		v1281:Play(0.1);
		delay(0.1, function()
			for v1304 = 1, 5 do
				local v1305 = tick();
				v1282:FindFirstChild("stake" .. v1304).Transparency = 0;
				v1282:FindFirstChild("stake" .. v1304).bleed:Emit(math.random(20, 30));
				v104({ "perks", "two" }, "summon_stake", nil, nil, true, true);
				while true do
					RS:wait();
					if tick() - v1305 >= 0.1 then
						break;
					end;				
				end;
			end;
		end);
		delay(0.8, function()
			v104({ "perks", "two" }, "summon_swing", nil, nil, true, true);
		end);
	elseif p128 == "shield" then
		v1281 = tpglobalanimsets.perk_shield;
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.aegisprotect:Clone();
		v104({ "weapons", "LSMG" }, "move", nil, nil, true, true);
		v1280 = globalanimsets.perk_aegis;
		v1281:Play(0.1);
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("aegisprotect");
	elseif p128 == "trapper" then
		v1280 = globalanimsets.perk_ticks;
		v104({ "weapons", "ALM" }, "draw", nil, nil, true, true);
		v1281 = tpglobalanimsets.perk_throwing;
	elseif p128 == "mind" then
		v1282 = l__game__6.ReplicatedStorage.perkAbilities.mind:Clone();
		v104({ "perks" }, "mind_equip", nil, nil, true, true);
		v1280 = globalanimsets.perk_mind;
		v1281 = tpglobalanimsets.perk_mind;
		v1281:Play(0.1);
	end;
	if v1282 ~= nil then
		local v1306 = Instance.new("Motor6D");
		v1306.Part0 = fparms.LeftArm.LUpperArm;
		v1306.Part1 = v1282;
		v1306.Parent = v1282;
		v1282.Parent = l__CurrentCamera__1;
	end;
	local u135 = false;
	local u136 = v1279;
	local u137 = {};
	local function u138()
		if u135 == true then
			return;
		end;
		if u135 == false then
			u135 = true;
		end;
		if hum.Health <= 0 then
			return;
		end;
		if p128 ~= "scan" and p128 ~= "wire" and p128 ~= "revolver" and p128 ~= "mind" and p128 ~= "goggles" and p128 ~= "fire" and p128 ~= "shadow" then
			shakecamera("abilityshake");
		end;
		if p128 == "berz" then
			if u9.Exhausted then
				u9.Exhausted.effects.currentduration = 0;
			end;
			u18 = u18 + v64[3].atkboost / 100;
			u19 = u19 + 10 * v64[3].speedboost / 100;
			local v1307 = v104({ "gamemode" }, "shadowidle", nil, nil, nil, true);
			v1307.Looped = true;
			local v1308 = l__game__6.ReplicatedStorage.effects.hiddenlight:Clone();
			v1308.Parent = character.Head;
			local v1309 = l__game__6.ReplicatedStorage.effects.serumFX:Clone();
			v1309.CFrame = l__CurrentCamera__1.CFrame;
			v1309.Parent = l__CurrentCamera__1;
			local v1310 = Instance.new("Motor6D");
			v1310.Part0 = v1309;
			v1310.Part1 = cpart;
			v1310.C1 = CFrame.new(0, 0, -0.4) * CFrame.Angles(0, 0, 0);
			v1310.Parent = v1309;
			v104({ "gamemode" }, "shadowchosen", nil, nil, true, true);
			spawn(function()
				local v1311 = Instance.new("Frame");
				v1311.BorderSizePixel = 0;
				v1311.BackgroundColor3 = Color3.new(1, 0.3, 0);
				v1311.Size = UDim2.new(1, 0, 1, 0);
				v1311.ZIndex = 1000;
				v1311.Parent = maingui;
				while true do
					v1311.BackgroundTransparency = v1311.BackgroundTransparency + 0.025;
					RS:wait();
					if v1311.BackgroundTransparency >= 1 then
						break;
					end;				
				end;
				v1311:Destroy();
			end);
			l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "stimuse", character.HumanoidRootPart);
			spawn(function()
				maingui.PerkFrame.durationbar.Visible = true;
				maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1, 0, 1, 0);
				v63.berzactive = tick();
				while true do
					RS:wait();
					u88 = tick();
					maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1 - math.clamp((tick() - v63.berzactive) / v64[3].duration, 0, 1), 0, 1, 0);
					if v64[3].duration <= tick() - v63.berzactive then
						break;
					end;				
				end;
				maingui.PerkFrame.durationbar.Visible = false;
				v104({ "gamemode" }, "shadowrespawn", nil, nil, true, true);
				spawn(function()
					local v1312 = Instance.new("Frame");
					v1312.BorderSizePixel = 0;
					v1312.BackgroundColor3 = Color3.new(1, 0.3, 0);
					v1312.Size = UDim2.new(1, 0, 1, 0);
					v1312.ZIndex = 1000;
					v1312.Parent = maingui;
					while true do
						v1312.BackgroundTransparency = v1312.BackgroundTransparency + 0.05;
						RS:wait();
						if v1312.BackgroundTransparency >= 1 then
							break;
						end;					
					end;
					v1312:Destroy();
				end);
				v1310:Destroy();
				v1309:Destroy();
				v1307:Destroy();
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Prc);
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
				v63.berzactive = nil;
				v1308:Destroy();
				u18 = u18 - v64[3].atkboost / 100;
				u19 = u19 - 10 * v64[3].speedboost / 100;
			end);
			return;
		end;
		if p128 == "drift" then
			v1282.smoke1.Transparency = 1;
			v1282.smoke2.Transparency = 1;
			v1282.smoke3.Transparency = 1;
			v1282.smoke4.Transparency = 1;
			u19 = u19 + 10 * v64[3].speed_boost / 100;
			local v1313 = { u106, character.Torso.CFrame };
			if u106 == true then
				local v1314, v1315 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, v64[3].drift_project_range, baselayer);
				v1313[3] = character.HumanoidRootPart.CFrame;
				spawn(function()
					local v1316 = Instance.new("Frame");
					v1316.BorderSizePixel = 0;
					v1316.BackgroundColor3 = Color3.new(0, 0, 0);
					v1316.Size = UDim2.new(1, 0, 1, 0);
					v1316.ZIndex = 1000;
					v1316.Parent = maingui;
					while true do
						v1316.BackgroundTransparency = v1316.BackgroundTransparency + 0.02;
						RS:wait();
						if v1316.BackgroundTransparency >= 1 then
							break;
						end;					
					end;
					v1316:Destroy();
				end);
				RS:wait();
				character.HumanoidRootPart.CFrame = CFrame.new(v1315) * CFrame.new(0, 1, 0);
				l__workspace__1.ServerStuff.applyGore:FireServer("drifter_puff", character, nil, character.Torso.CFrame);
				v1313[2] = character.Torso.CFrame;
			end;
			l__workspace__1.ServerStuff.dealDamage:FireServer("drifterbomb", v1313, v5, v4);
			afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Stealth);
			maingui.PerkFrame.durationbar.Visible = true;
			maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1, 0, 1, 0);
			v63.driftactive = tick();
			delay(0.1, function()
				globalanimsets.perk_drift_arm:Play(0.2, 1, 1);
			end);
			delay(0.5, function()
				v104({ "perks", "two" }, "drift_bladeready", nil, nil, true, true);
				v1282.fx1.spark1:Emit(math.random(15, 30));
				v1282.fx1.spark2:Emit(math.random(2, 4));
				v1282.fx2.spark1:Emit(math.random(15, 30));
				v1282.fx2.spark2:Emit(math.random(2, 4));
				u8.channel = false;
			end);
			local u139 = false;
			delay(1, function()
				if u139 == false then
					globalanimsets.perk_drift_arm:AdjustSpeed(0);
					globalanimsets.perk_drift_arm.TimePosition = 1;
				end;
			end);
			local v1317 = tick();
			local v1318 = tick();
			while not (hum.Health <= 0) do
				if u9.Cloaked then
					u9.Cloaked.effects.currentduration = tick();
				end;
				u136 = tick();
				RS:wait();
				u88 = tick();
				if u54 == true and tick() - v1318 >= 0.85 and tick() - v63.driftactive < v64[3].drift_duration then
					local v1319 = tick();
					v63.driftactive = v63.driftactive - v64[3].swing_duration_take;
					local v1320 = "perk_drift_swing" .. math.random(1, 3);
					globalanimsets[v1320]:Play(0.05, 1, 1);
					v104({ "perks", "two" }, "drift_equip", nil, nil, true, true);
					local v1321 = v104({ "perks", "two" }, "drift_ready", nil, nil, nil, true);
					shakecamera("weapon", { "1HS", "charge" });
					tpglobalanimsets.perk_drift_swing:Play(0.05, 1, 0.8);
					v1282.main.blade.trail.Enabled = true;
					local v1322 = 1;
					local l__CFrame__1323 = character.HumanoidRootPart.CFrame;
					local v1324 = l__game__6.ReplicatedStorage.misc.chargebp:Clone();
					v1324.P = 5000;
					v1324.D = 100;
					v1324.Position = l__CFrame__1323.p;
					v1324.Parent = character.HumanoidRootPart;
					local v1325 = tick();
					local v1326 = 0;
					local v1327 = false;
					while true do
						if tick() - v1325 >= 0.1 and v1327 == false then
							v1327 = true;
							globalanimsets[v1320]:AdjustSpeed(0);
							tpglobalanimsets.perk_drift_swing:AdjustSpeed(0);
						end;
						local v1328, v1329 = raycastline(character.HumanoidRootPart.Position, character.HumanoidRootPart.CFrame.LookVector, 4, baselayer);
						if v1328 then
							break;
						end;
						if tick() - v1326 >= 0.03 then
							v1326 = tick();
							v1322 = v1322 + v64[3].swing_lunge;
							v1324.Position = (l__CFrame__1323 + character.HumanoidRootPart.CFrame.lookVector * v1322).p;
						end;
						RS:wait();
						if tick() - v1325 >= 0.5 then
							break;
						end;
						if u54 == false and tick() - v1325 >= 0.1 then
							break;
						end;					
					end;
					if v1321 then
						v1321:Destroy();
					end;
					v1324:Destroy();
					globalanimsets[v1320]:AdjustSpeed(1);
					tpglobalanimsets.perk_drift_swing:AdjustSpeed(1);
					v1318 = tick();
					delay(0.5, function()
						v1282.main.blade.trail.Enabled = false;
					end);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "drift_swing", character.HumanoidRootPart);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "drift_swing2", character.HumanoidRootPart);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "drift_swing3", character.HumanoidRootPart);
					local v1330 = l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * v64[3].swing_range;
					local v1331 = v64[3].swing_range;
					local v1332 = nil;
					for v1333, v1334 in ipairs(l__workspace__1.activeHostiles:GetChildren()) do
						if v1334:FindFirstChild("Humanoid") and v1334.Humanoid.Health > 0 and v1334:FindFirstChild("Head") and (v1334.Head.Position - v1330.Position).magnitude <= v1331 then
							v1331 = (v1334.Head.Position - v1330.Position).magnitude;
							v1332 = v1334;
						end;
					end;
					if v1332 then
						u39(v1332.Head.Position, v64[3].swing_damage);
						v156();
						l__workspace__1.ServerStuff.dealDamage:FireServer("drifterblade", { v1332, false }, v5, v4);
						l__workspace__1.ServerStuff.applyGore:FireServer("bloodhit", v1332, nil, { 40, v1332.Head.Position });
					end;
				end;
				if u69 == true and tick() - v1318 >= 0.85 and tick() - v63.driftactive < v64[3].drift_duration then
					local v1335 = tick() + 0.4;
					globalanimsets.perk_drift_charge:Play(0.05, 1, 1);
					v104({ "perks", "two" }, "drift_equip", nil, nil, true, true);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "drift_charge", character.HumanoidRootPart);
					local v1336 = 1;
					local l__CFrame__1337 = character.HumanoidRootPart.CFrame;
					local v1338 = l__game__6.ReplicatedStorage.misc.chargebp:Clone();
					v1338.P = 5000;
					v1338.D = 100;
					v1338.Position = l__CFrame__1337.p;
					v1338.Parent = character.HumanoidRootPart;
					local v1339 = 0;
					local v1340 = tick();
					v1282.main.blade.trail.Enabled = true;
					local v1341 = false;
					while true do
						local v1342, v1343 = raycastline(character.HumanoidRootPart.Position, character.HumanoidRootPart.CFrame.LookVector, 4, baselayer);
						if v1342 then
							v1341 = true;
						end;
						if tick() - v1339 >= 0.03 and v1341 == false then
							v1339 = tick();
							v1336 = v1336 + v64[3].alt_swing_charge;
							v1338.Position = (l__CFrame__1337 + character.HumanoidRootPart.CFrame.lookVector * v1336).p;
						end;
						if tick() - v1340 >= 0.1 then
							globalanimsets.perk_drift_charge:AdjustSpeed(0);
							globalanimsets.perk_drift_charge.TimePosition = 0.1;
						end;
						RS:wait();
						if tick() - v1340 >= 0.35 then
							break;
						end;					
					end;
					tpglobalanimsets.perk_drift_swing:Play(0.05, 1, 0.9);
					globalanimsets.perk_drift_charge:AdjustSpeed(1);
					v1338:Destroy();
					v63.driftactive = 0;
					shakecamera("weapon", { "1HS", "charge" });
					delay(0.5, function()
						v1282.main.blade.trail.Enabled = false;
					end);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "drift_swing", character.HumanoidRootPart);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "drift_swing2", character.HumanoidRootPart);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "drift_swing3", character.HumanoidRootPart);
					local v1344 = l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * v64[3].swing_range;
					local v1345 = v64[3].swing_range;
					local v1346 = nil;
					for v1347, v1348 in ipairs(l__workspace__1.activeHostiles:GetChildren()) do
						if v1348:FindFirstChild("Humanoid") and v1348.Humanoid.Health > 0 and v1348:FindFirstChild("Head") and (v1348.Head.Position - v1344.Position).magnitude <= v1345 then
							v1345 = (v1348.Head.Position - v1344.Position).magnitude;
							v1346 = v1348;
						end;
					end;
					if v1346 then
						u39(v1346.Head.Position, v64[3].alt_swing_damage);
						v156();
						l__workspace__1.ServerStuff.dealDamage:FireServer("drifterblade", { v1346, true }, v5, v4);
						l__workspace__1.ServerStuff.applyGore:FireServer("bloodhit", v1346, nil, { 100, v1346.Head.Position });
					end;
				end;
				maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1 - math.clamp((tick() - v63.driftactive) / v64[3].drift_duration, 0, 1), 0, 1, 0);
				if (v64[3].drift_duration <= tick() - v63.driftactive or u106 == true and tick() - v1317 >= 0.8) and tick() - v1318 >= 0.8 then
					break;
				end;			
			end;
			v1281:Stop(0.3);
			l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("hide_perk");
			u19 = u19 - 10 * v64[3].speed_boost / 100;
			maingui.PerkFrame.durationbar.Visible = false;
			v63.driftactive = nil;
			u139 = true;
			if hum.Health <= 0 then
				return;
			else
				delay(0.3, function()
					v104({ "perks", "two" }, "drift_unequip", nil, nil, true, true);
					v104({ "perks", "two" }, "drift_wrist", nil, nil, true, true);
					v1282.fx2.spark1:Emit(math.random(15, 30));
					v1282.fx2.spark2:Emit(math.random(2, 4));
					v1282.main.blade.Transparency = 1;
					v1282.main.light.BrickColor = BrickColor.new("Black");
					v1282.main.light.Material = "SmoothPlastic";
					v1282.screen1.BrickColor = BrickColor.new("Black");
					v1282.screen1.Material = "SmoothPlastic";
					v1282.screen2.BrickColor = BrickColor.new("Black");
					v1282.screen2.Material = "SmoothPlastic";
				end);
				delay(0.5, function()
					v104({ "perks", "two" }, "drift_unequip", nil, nil, true, true);
					v1282.fx1.spark1:Emit(math.random(15, 30));
					v1282.fx1.spark2:Emit(math.random(2, 4));
					v1282.main.blade.Transparency = 1;
					v1282.main.connector1.Transparency = 1;
					v1282.main.connector2.Transparency = 1;
					v1282.main.connector3.Transparency = 1;
					v1282.main.light.Transparency = 1;
					for v1349, v1350 in ipairs(v1282.off:GetChildren()) do
						v1350.Transparency = 0;
					end;
				end);
				globalanimsets.perk_drift_arm.TimePosition = 1;
				globalanimsets.perk_drift_arm:AdjustSpeed(1);
				if u106 == true and l__workspace__1.NoTarget:FindFirstChild(ply.Name .. "_driftcore") then
					l__workspace__1.ServerStuff.applyGore:FireServer("drifter_puff", character, nil, character.Torso.CFrame);
					local v1351 = Instance.new("Frame");
					v1351.BorderSizePixel = 0;
					v1351.BackgroundColor3 = Color3.new(0, 0, 0);
					v1351.Size = UDim2.new(1, 0, 1, 0);
					v1351.ZIndex = 1000;
					v1351.Parent = maingui;
					spawn(function()
						while true do
							v1351.BackgroundTransparency = v1351.BackgroundTransparency + 0.02;
							RS:wait();
							if v1351.BackgroundTransparency >= 1 then
								break;
							end;						
						end;
						v1351:Destroy();
					end);
					RS:wait();
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "drift_return", character.HumanoidRootPart);
					character.HumanoidRootPart.CFrame = l__workspace__1.NoTarget:FindFirstChild(ply.Name .. "_driftcore").base.CFrame;
					l__workspace__1.ServerStuff.applyGore:FireServer("drifter_puff", character, nil, character.Torso.CFrame);
					l__workspace__1.NoTarget:FindFirstChild(ply.Name .. "_driftcore"):Destroy();
					l__workspace__1.ServerStuff.dealDamage:FireServer("driftbomb_endprojection", u106, v5, v4);
				end;
				return;
			end;
		end;
		if p128 == "goggles" then
			if v63.gogglesactive == true then
				v63.gogglesactive = nil;
				return;
			else
				l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("put_goggles");
				l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "goggles_on", character.HumanoidRootPart);
				if v63.gogglebroken then
					v63.gogglebroken = nil;
				end;
				v63.gogglesactive = true;
				local v1352 = l__game__6.ReplicatedStorage.effects.goggleslight:Clone();
				v1352.Parent = character.Head;
				local v1353 = Instance.new("Frame");
				v1353.BorderSizePixel = 0;
				v1353.BackgroundColor3 = Color3.new(0.8, 0, 0);
				v1353.Size = UDim2.new(1, 0, 1, 0);
				v1353.ZIndex = 1000;
				v1353.Parent = maingui;
				spawn(function()
					while true do
						v1353.BackgroundTransparency = v1353.BackgroundTransparency + 0.025;
						RS:wait();
						if v1353.BackgroundTransparency >= 1 then
							break;
						end;					
					end;
					v1353:Destroy();
				end);
				if v63.gogglegui == nil then
					local v1354 = l__game__6.ReplicatedStorage.misc.goggles:Clone();
					v63.gogglegui = v1354;
				else
					v1354 = v63.gogglegui;
					if v64[3].cooldown <= tick() - u88 then
						for v1355, v1356 in ipairs(v1354:GetChildren()) do
							if v1356.Name == "cracked" then
								v1356:Destroy();
							end;
						end;
					end;
				end;
				v1354.Parent = ply.PlayerGui;
				spawn(function()
					local v1357 = l__game__6.ReplicatedStorage.effects.gogglesfx:Clone();
					for v1358, v1359 in ipairs(v1357:GetChildren()) do
						v1359.Parent = l__CurrentCamera__1;
					end;
					v1357:Destroy();
					if v64[3].cooldown <= tick() - u88 then
						local v1360 = tick() - v64[3].cooldown;
					else
						v1360 = u88;
					end;
					local u140 = v1360;
					function v63.goggletakedamage(p130)
						u140 = u140 + p130 * v64[3].damage_taken_multi;
						local v1361 = math.random(1, 6);
						if p130 >= 20 then
							v1361 = 1;
						elseif p130 >= 10 then
							v1361 = math.random(1, 3);
						end;
						if v1361 == 1 and v1354 then
							v104({ "perks" }, "goggles_glass", nil, nil, true, true);
							local v1362 = v1354.crackfx:Clone();
							v1362.Name = "cracked";
							v1362.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0);
							v1362.Rotation = math.random(1, 360);
							v1362.Visible = true;
							v1362.Parent = v1354;
						end;
						if tick() - u88 <= 0 then
							v63.goggletakedamage = nil;
							if v1354 then
								v1354.destroyed.Visible = true;
								v1354.destroyedsub.Visible = true;
								v1354.destroyedtext.Visible = true;
							end;
						end;
					end;
					if v63.gogglebounties == nil then
						v63.gogglebounties = 0;
						function v63.gogglehandledamage(p131)
							if p131 == "del" or p131 == "removedamage" then
								u18 = u18 - v64[3].boostonkill * v63.gogglebounties / 100;
								if p131 == "del" then
									v63.gogglebounties = 0;
								end;
								maingui.PerkFrame.numberstat.Visible = false;
								return;
							end;
							if p131 ~= "add" then
								if p131 == "addatstart" then
									u18 = u18 + v64[3].boostonkill * v63.gogglebounties / 100;
								end;
								return;
							end;
							v63.gogglebounties = v63.gogglebounties + 1;
							u18 = u18 + v64[3].boostonkill / 100;
							maingui.PerkFrame.numberstat.Text = v63.gogglebounties;
						end;
					end;
					maingui.PerkFrame.numberstat.Visible = true;
					maingui.PerkFrame.numberstat.Text = v63.gogglebounties;
					v63.gogglehandledamage("addatstart");
					local v1363 = tick();
					local v1364 = { "4452726587", "4452726886", "4452727160", "4452727454" };
					local v1365 = 1;
					local v1366 = 0;
					while true do
						RS:wait();
						if v1354 and tick() - v1366 >= 0.1 then
							v1366 = tick();
							v1354.static.Image = "rbxassetid://" .. v1364[v1365];
							v1365 = v1365 + 1;
							if v1365 >= 5 then
								v1365 = 1;
							end;
						end;
						for v1367, v1368 in ipairs(l__workspace__1.activeHostiles:GetChildren()) do
							if v1368:FindFirstChild("Humanoid") and v1368:FindFirstChild("Torso") and v1368:FindFirstChild("Humanoid").Health > 0 and v1368:FindFirstChild("ai_type") then
								if v1368:FindFirstChild("gogglefx") then
									if tick() - u88 <= 0 then
										v1368:FindFirstChild("gogglefx").Enabled = false;
									else
										v1368:FindFirstChild("gogglefx").Enabled = true;
										v1368.gogglefx.integrityamount.Text = tostring(math.floor(v1368.Humanoid.Health / v1368.Humanoid.MaxHealth * 100)) .. "%";
									end;
								elseif tick() - u88 > 0 then
									local v1369 = l__game__6.ReplicatedStorage.misc.gogglefx:Clone();
									local v1370 = { "Assault", "Negligent Discharge", "Murder", "Theft", "Grand Theft", "Petty Theft", "Tresspassing", "Vandalism", "Pickpocketing", "Rioting", "Insubordination", "Indecent Exposure", "Resisting Arrest", "Manslaughter", "Sabotage", "Narcotics Use", "Narcotics Distribution" };
									local v1371 = 1;
									if math.random(1, 3) == 1 then
										v1371 = 2;
										if math.random(1, 3) == 1 then
											v1371 = 3;
										end;
									end;
									local v1372 = {};
									for v1373 = 1, v1371 do
										local v1374 = math.random(1, #v1370);
										table.remove(v1370, v1374);
										v1372[v1373] = v1370[v1374];
									end;
									if v1368:FindFirstChild("ai_type").Value == "BossScavGuard" then
										v1372[1] = "Dereliction of Agency";
										v1372[2] = "Murder";
									elseif v1368:FindFirstChild("ai_type").Value == "BossScav" then
										v1372[1] = "Betrayal of Agency";
										v1372[2] = "Dereliction of Agency";
										v1372[3] = "Murder";
									elseif v1368:FindFirstChild("ai_type").Value == "BossFunRuiner" then
										v1372[1] = "Murder";
										v1372[2] = "Wanted by Agency";
										v1372[3] = "Blasting Music";
									end;
									for v1375, v1376 in pairs(v1372) do
										v1369["wanted" .. v1375].Visible = true;
										v1369["wanted" .. v1375].Text = v1376;
									end;
									v1369.integrityamount.Text = tostring(math.floor(v1368.Humanoid.Health / v1368.Humanoid.MaxHealth)) .. "%";
									v1369.Parent = v1368;
									v1369.Adornee = v1368.Torso;
									v1368.Humanoid.Died:connect(function()
										if v1369 then
											v1369:Destroy();
										end;
									end);
								end;
							elseif v1368:FindFirstChild("gogglefx") then
								v1368:FindFirstChild("gogglefx"):Destroy();
							end;
						end;
						for v1377, v1378 in ipairs(l__workspace__1.activeFriendlies:GetChildren()) do
							if v1378:FindFirstChild("gogglefx") then
								v1378:FindFirstChild("gogglefx"):Destroy();
							end;
						end;
						u88 = u140 + tick() - v1363;
						if hum.Health <= 0 then
							break;
						end;
						if v63.gogglesactive == nil then
							break;
						end;					
					end;
					l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("hide_perk");
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "goggles_off", character.HumanoidRootPart);
					if tick() - u88 <= 0 then
						u88 = tick();
						v63.gogglebroken = true;
						v63.gogglegui:Destroy();
						v63.gogglegui = nil;
					else
						v63.gogglegui.Parent = nil;
					end;
					if v63.gogglebounties > 0 then
						u34(math.ceil(v64[3].scrap_per_bounty * v63.gogglebounties), "CLAIMED BOUNTY");
					end;
					v63.gogglehandledamage("del");
					local v1379 = Instance.new("Frame");
					v1379.BorderSizePixel = 0;
					v1379.BackgroundColor3 = Color3.new(0, 0, 0);
					v1379.Size = UDim2.new(1, 0, 1, 0);
					v1379.ZIndex = 1000;
					v1379.Parent = maingui;
					spawn(function()
						while true do
							v1379.BackgroundTransparency = v1379.BackgroundTransparency + 0.025;
							RS:wait();
							if v1379.BackgroundTransparency >= 1 then
								break;
							end;						
						end;
						v1379:Destroy();
					end);
					for v1380, v1381 in ipairs(l__CurrentCamera__1:GetChildren()) do
						if v1381.Name == "gogglesFX" then
							v1381:Destroy();
						end;
					end;
					for v1382, v1383 in ipairs(l__workspace__1.activeHostiles:GetChildren()) do
						if v1383:FindFirstChild("gogglefx") then
							v1383:FindFirstChild("gogglefx").Enabled = false;
						end;
					end;
					v63.gogglesactive = nil;
					v63.goggletakedamage = nil;
					v1352:Destroy();
				end);
				return;
			end;
		end;
		if p128 == "scan" then
			local v1384 = nil;
			local v1385 = nil;
			local v1386 = nil;
			local v1387 = nil;
			local v1388 = nil;
			local v1389 = nil;
			local v1390 = nil;
			local v1391 = nil;
			local v1392 = nil;
			local v1393 = nil;
			local v1394 = nil;
			local v1395 = nil;
			local v1396 = nil;
			local v1397 = nil;
			local v1398 = nil;
			local v1399 = nil;
			local v1400 = nil;
			local v1401 = nil;
			local v1402 = nil;
			local v1403 = nil;
			local v1404 = nil;
			local v1405 = nil;
			local v1406 = nil;
			local v1407 = nil;
			local v1408 = nil;
			if v1282:FindFirstChild("neonfx") then
				v1282:FindFirstChild("neonfx").Material = Enum.Material.Neon;
				v1282:FindFirstChild("neonfx").BrickColor = BrickColor.new("Bright orange");
			end;
			local v1409 = false;
			local v1410 = 0;
			v1280:AdjustSpeed(0);
			v1281:AdjustSpeed(0);
			while true do
				u136 = tick();
				if v64[3].scan_around_timer <= tick() - v1410 then
					v1410 = tick();
					v104({ "perks" }, "scannerpulse", nil, nil, true, true);
					applygore("selfscan");
				end;
				if u54 == true and v64[3].cooldown <= tick() - u88 then
					v1409 = true;
				end;
				RS:wait();
				if u106 == false then
					break;
				end;
				if v1409 == true then
					break;
				end;			
			end;
			v1280:AdjustSpeed(1);
			v1281:AdjustSpeed(1);
			if v1409 == true then
				if v64[3].cooldown <= tick() - u88 then
					u88 = tick();
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "scannerstart", character.HumanoidRootPart);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "scannerscan", character.HumanoidRootPart);
					if v1282:FindFirstChild("neonfx") then
						v1282:FindFirstChild("neonfx").Material = Enum.Material.Neon;
						v1282:FindFirstChild("neonfx").BrickColor = BrickColor.new("Bright blue");
					end;
					l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("scan_fx");
					local v1411 = l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * v64[3].front;
					l__workspace__1.ServerStuff.dealDamage:FireServer("prophetscan", v1411, v5, v4);
					l__workspace__1.ServerStuff.applyGore:FireServer("scanarea", character, ply, { v1411 });
					return;
				end;
				v1389 = v104;
				v1385 = {};
				v1384 = "general";
				v1388 = v1384;
				v1387 = 1;
				v1386 = v1385;
				v1386[v1387] = v1388;
				local v1412 = "keyboard";
				v1390 = nil;
				v1391 = nil;
				v1392 = true;
				v1393 = true;
				v1394 = v1389;
				v1395 = v1385;
				v1396 = v1412;
				v1397 = v1390;
				v1398 = v1391;
				v1399 = v1392;
				v1400 = v1393;
				v1394(v1395, v1396, v1397, v1398, v1399, v1400);
				local v1413 = v1282;
				local v1414 = "neonfx";
				v1402 = "FindFirstChild";
				v1401 = v1413;
				local v1415 = v1401;
				v1403 = v1413;
				v1404 = v1402;
				local v1416 = v1403[v1404];
				v1405 = v1416;
				v1406 = v1415;
				v1407 = v1414;
				local v1417 = v1405(v1406, v1407);
				v1408 = v1417;
				if v1408 then
					v1282:FindFirstChild("neonfx").Material = Enum.Material.SmoothPlastic;
					v1282:FindFirstChild("neonfx").BrickColor = BrickColor.new("Black");
					return;
				end;
			else
				v1389 = v104;
				v1385 = {};
				v1384 = "general";
				v1388 = v1384;
				v1387 = 1;
				v1386 = v1385;
				v1386[v1387] = v1388;
				v1412 = "keyboard";
				v1390 = nil;
				v1391 = nil;
				v1392 = true;
				v1393 = true;
				v1394 = v1389;
				v1395 = v1385;
				v1396 = v1412;
				v1397 = v1390;
				v1398 = v1391;
				v1399 = v1392;
				v1400 = v1393;
				v1394(v1395, v1396, v1397, v1398, v1399, v1400);
				v1413 = v1282;
				v1414 = "neonfx";
				v1402 = "FindFirstChild";
				v1401 = v1413;
				v1415 = v1401;
				v1403 = v1413;
				v1404 = v1402;
				v1416 = v1403[v1404];
				v1405 = v1416;
				v1406 = v1415;
				v1407 = v1414;
				v1417 = v1405(v1406, v1407);
				v1408 = v1417;
				if v1408 then
					v1282:FindFirstChild("neonfx").Material = Enum.Material.SmoothPlastic;
					v1282:FindFirstChild("neonfx").BrickColor = BrickColor.new("Black");
					return;
				end;
			end;
		else
			if p128 == "lazarus" then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "laz_dart", character.HumanoidRootPart);
				if v64[3].cooldown <= tick() - u88 then
					u88 = tick() - (v64[3].cooldown - v64[3].multicooldown);
				else
					u88 = u88 + v64[3].multicooldown;
				end;
				local v1418, v1419 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, v64[3].lazarus_shoot_range, baselayer);
				l__workspace__1.ServerStuff.dealDamage:FireServer("lazarus_device", v1419, v5, v4);
				l__workspace__1.ServerStuff.applyGore:FireServer("lazarus_fire", character, ply, { v1419 });
				l__workspace__1.ServerStuff.applyGore:FireServer("lazarus_laser", character, ply, { v1282.bolt.Position, v1419 });
				return;
			end;
			if p128 == "fire" then
				v1282.neonpart1.Material = Enum.Material.Neon;
				v1282.neonpart1.BrickColor = BrickColor.new("Neon orange");
				v1282.neonpart2.BrickColor = BrickColor.new("Neon orange");
				v1282.neonpart3.BrickColor = BrickColor.new("Neon orange");
				v1282.neonpart1.FlameSpurt.Enabled = true;
				v1282.neonpart1.FlameSpurt:Emit(math.random(10, 20));
				v104({ "perks" }, "flamer_equip", nil, nil, true, true);
				u136 = tick();
				delay(0.3, function()
					u136 = tick();
					if u106 ~= true then
						globalanimsets.perk_fire_immolate:Play(0.3);
						tpglobalanimsets.perk_fire_immolate:Play(0.3);
						delay(0.3, function()
							u136 = tick();
							u19 = u19 - 50;
							globalanimsets.perk_fire_immolate:AdjustSpeed(0);
							tpglobalanimsets.perk_fire_immolate:AdjustSpeed(0);
							while true do
								u136 = tick();
								RS:wait();
								if u8.air == false then
									break;
								end;
								if hum.Health <= 0 then
									break;
								end;
								if u8.staggering == true then
									break;
								end;							
							end;
							u136 = tick() - 0.4;
							globalanimsets.perk_fire_immolate:AdjustSpeed(1.4);
							tpglobalanimsets.perk_fire_immolate:AdjustSpeed(1.2);
							u19 = u19 + 50;
							if hum.Health > 0 and u8.staggering == false then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "flamer_punch", character.HumanoidRootPart);
								delay(0.2, function()
									shakecamera("abilityshake");
									l__workspace__1.ServerStuff.dealDamage:FireServer("immolate", character, v5, v4);
									v63.apply_overheat(v64[3].immolate_overheat, false);
									afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).FireBuff);
									l__workspace__1.ServerStuff.applyGore:FireServer("immolate_ability", character, ply, { character.Torso.CFrame - character.Torso.CFrame.upVector * 3 });
								end);
							end;
						end);
						return;
					end;
					v104({ "perks" }, "flamer_prep", nil, nil, true, true);
					globalanimsets.perk_fire_thrower:Play(0.3);
					tpglobalanimsets.perk_fire_flamer:Play(0.3);
					delay(0.35, function()
						u136 = tick();
						for v1420, v1421 in ipairs(v1282.neonpart1:GetChildren()) do
							if v1421:IsA("ParticleEmitter") and v1421.Name ~= "Steam" then
								v1421.Enabled = true;
							end;
						end;
						v1282.neonpart1.EmberSpark:Emit(math.random(10, 20));
						v1282.neonpart1.FlameSpark:Emit(math.random(10, 20));
						u19 = u19 - v64[3].flamer_slowdown;
						globalanimsets.perk_fire_thrower:AdjustSpeed(0);
						tpglobalanimsets.perk_fire_flamer:AdjustSpeed(0);
						local v1422 = 0;
						local v1423 = tick();
						if v64[3].cooldown <= tick() - u88 then
							local v1424 = tick() - v64[3].cooldown;
						else
							v1424 = u88;
						end;
						l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "flamer_fire", character.HumanoidRootPart);
						l__workspace__1.ServerStuff.dealDamage:FireServer("flamer_effect", nil, v5, v4);
						while true do
							u82 = CFrame.new(math.random(-10, 10) / 500, math.random(-10, 10) / 500, math.random(-10, 10) / 500);
							if v64[3].flamer_burn_tick <= tick() - v1422 then
								v1422 = tick();
								v1424 = v63.apply_overheat(v64[3].flamer_overheat, false);
								local v1425 = false;
								local v1426 = l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * (v64[3].flamer_range - 1);
								local v1427 = {};
								for v1428, v1429 in ipairs(l__workspace__1.activeHostiles:GetChildren()) do
									if v1429:FindFirstChild("Torso") and v1429:FindFirstChild("Head") and v1429:FindFirstChild("Humanoid") and v1429.Humanoid.Health > 0 and (v1429.Torso.Position - v1426.p).magnitude <= v64[3].flamer_range then
										table.insert(v1427, v1429);
										u39(v1429.Head.Position, v64[3].flamer_burn_damage);
										if v1425 == false then
											v1425 = true;
											v156();
										end;
									end;
								end;
								if #v1427 > 0 then
									l__workspace__1.ServerStuff.dealDamage:FireServer("flamer_ignite", v1427, v5, v4);
								end;
							end;
							if character:FindFirstChild("arm_flame") and (character:FindFirstChild("arm_flame"):FindFirstChild("Flame") and character:FindFirstChild("arm_flame").Flame.Enabled == true) then
								for v1430, v1431 in ipairs(character:FindFirstChild("arm_flame"):GetDescendants()) do
									if v1431:IsA("ParticleEmitter") then
										v1431:Clear();
										v1431.Enabled = false;
									end;
								end;
							end;
							u88 = v1424 + tick() - v1423;
							u136 = tick();
							RS:wait();
							if hum.Health <= 0 then
								break;
							end;
							if u8.staggering == true then
								break;
							end;
							if u106 == false and tick() - v1423 >= 0.5 then
								break;
							end;						
						end;
						l__workspace__1.ServerStuff.dealDamage:FireServer("flamer_off", nil, v5, v4);
						l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "flamer_disable", character.HumanoidRootPart);
						tpglobalanimsets.perk_fire_flamer:AdjustSpeed(1);
						if hum.Health > 0 then
							v1282.neonpart1.FlameSpurt:Emit(math.random(10, 20));
							for v1432, v1433 in ipairs(v1282.neonpart1:GetChildren()) do
								if v1433:IsA("ParticleEmitter") then
									v1433.Enabled = false;
								end;
							end;
							v1282.neonpart1.Steam.Enabled = true;
							u82 = CFrame.new(0, 0, 0);
							u136 = tick() - 0.4;
							globalanimsets.perk_fire_thrower:AdjustSpeed(1);
							u19 = u19 + v64[3].flamer_slowdown;
						end;
					end);
				end);
				return;
			end;
			if p128 == "gunner" then
				if v64[3].cooldown <= tick() - u88 then
					local v1434 = tick() - v64[3].cooldown;
				else
					v1434 = u88;
				end;
				l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("minigun_spin");
				local v1435 = tick();
				local v1436 = tick();
				local v1437 = 0;
				local v1438 = tick();
				v1281:AdjustSpeed(0);
				v1280:AdjustSpeed(0);
				local v1439 = v104({ "perks" }, "mini_firing_loop", nil, nil, nil, true);
				u8.channel = true;
				u19 = u19 - v64[3].vulka_slowdown;
				local v1440 = 0;
				local v1441 = true;
				for v1442, v1443 in ipairs(maingui.Centre.crosshair:GetChildren()) do
					v1443.Visible = false;
				end;
				local v1444 = l__game__6.ReplicatedStorage.misc.minigun_crosshair:Clone();
				v1444.Parent = maingui;
				while not (hum.Health <= 0) do
					local v1445 = CFrame.new(v1282.minigun_base.Position);
					v1282.minigun_base.spin.C0 = CFrame.new(-2.90581346, -0.340348721, 0.0228784084, 0.999992788, -3.7252903E-08, -1.11758709E-07, 1.04308128E-07, 0.707102299, -0.707102299, -9.17007483E-08, 0.707107484, 0.707107484) * CFrame.Angles(v1440 + 1, 0, 0);
					u136 = tick();
					if u54 == true and v64[3].vulka_overheat_duration <= tick() - v1437 then
						v1439.Volume = 1.5;
						if 60 / v64[3].vulka_rpm <= tick() - v1436 then
							local v1446 = "light";
							if u67 == true then
								v1446 = "indoors";
							end;
							if v1441 == true then
								local v1447 = v104({ "perks" }, "mini_shoot", nil, nil, nil, true);
								v1447.Volume = 1.5;
								if u67 == true then
									v1447.Volume = 2;
								end;
								v1441 = false;
							end;
							v1282.ejection.casings:Emit(1);
							v104({ "firearms" }, "ballistic_" .. v1446, nil, nil, true, true);
							v104({ "firearms" }, "bass", nil, nil, true, true);
							l__workspace__1.ServerStuff.dealDamage:FireServer("gunsareloud", nil, v5, v4);
							delay(math.random(40, 80) / 100, function()
								l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "casing_heavy", character.HumanoidRootPart, 0.15);
							end);
							l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "mini_shoot", character.HumanoidRootPart, 0.05);
							globalanimsets.perk_minigun_fire:Play(0);
							shakecamera("gunrecoil", { 2 });
							shakecamera("guntilt", { 2 });
							v1434 = v1434 + v64[3].vulka_ammo_usage;
							v1436 = tick();
							local v1448 = (v64[3].vulka_accuracy - (v64[3].vulka_accuracy - 1.5) * math.clamp((tick() - v1438) / v64[3].vulka_accuracy_timer, 0, 1)) * 10;
							local v1449 = Vector3.new(0, 0, 0);
							local u141 = l__CurrentCamera__1.CFrame.p;
							local u142 = Vector3.new(math.rad(math.random(-v1448, v1448)), math.rad(math.random(-v1448, v1448)), math.rad(math.random(-v1448, v1448))) / 10;
							local u143 = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, teamfolder, l__workspace__1.PlayerShootThroughs, l__workspace__1.activeFriendlies };
							local u144 = v1449;
							local u145 = false;
							local u146 = nil;
							spawn(function()
								for v1450 = 1, 5 do
									local v1451, v1452 = raycastline(u141, l__CurrentCamera__1.CFrame.LookVector + u142, v64[3].vulka_range, u143);
									local v1453 = v64[3].vulka_damage;
									trigger_map_item_func(v1451, "gundamage", v1453);
									u144 = v1452;
									l__workspace__1.ServerStuff.applyGore:FireServer("firegun", character, ply, { v1282.muzzle.Position, v1452, u145, nil, u146 });
									if v1451 and v1451.Name == "ricochet" then
										l__workspace__1.ServerStuff.applyGore:FireServer("gunricochet", character, ply, { v1452 });
									end;
									if not v1451 then
										break;
									end;
									if not v1451.Parent:FindFirstChild("Humanoid") then
										break;
									end;
									if not (v1451.Parent:FindFirstChild("Humanoid").Health > 0) then
										break;
									end;
									if not v1451.Parent:FindFirstChild("Head") then
										break;
									end;
									if not v1451.Parent:IsDescendantOf(l__workspace__1.activeHostiles) then
										break;
									end;
									if v1451.Parent:FindFirstChild("perks") and v1451.Parent:FindFirstChild("perks"):FindFirstChild("thick") then
										v1453 = v1453 - v1453 * v8.thick.efx[1] / 100;
									end;
									u39(v1451.Parent.Head.Position, v1453);
									v156();
									l__workspace__1.ServerStuff.dealDamage:FireServer("vulka_minigun", { v1451.Parent, v1453 }, v5, v4);
									l__workspace__1.ServerStuff.applyGore:FireServer("bloodhit", v1451.Parent, nil, { v1453, v1452 });
									u141 = v1452;
									table.insert(u143, v1451.Parent);
									u146 = true;
									u145 = true;
									RS:wait();
								end;
								if u9["Immolator Buff"] then
									l__workspace__1.ServerStuff.applyGore:FireServer("incendiary_trail", character, ply, { v1282.muzzle.Position, u144 });
								end;
							end);
							if tick() - u88 <= 30 then
								v104({ "firearms" }, "mech", nil, nil, true, true);
							end;
						end;
					else
						if v1441 == false then
							v1282.muzzle.vfx.Enabled = true;
							delay(1, function()
								v1282.muzzle.vfx.Enabled = false;
							end);
							globalanimsets.perk_minigun_overheat:Play(0.1);
							maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1, 0, 1, 0);
							v1441 = true;
							v1437 = tick();
							l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "mini_overheat", character.HumanoidRootPart, 0.05);
						end;
						v1438 = tick();
						v1439.Volume = 0;
					end;
					if tick() - v1438 > 0 then
						local v1454 = 40 * math.clamp((tick() - v1438) / v64[3].vulka_accuracy_timer, 0, 1);
						v1444.CH.circle.Size = UDim2.new(0, 50 - v1454, 0, 50 - v1454);
					else
						v1444.CH.circle.Size = UDim2.new(0, 50, 0, 50);
					end;
					if tick() - v1437 <= v64[3].vulka_overheat_duration then
						maingui.PerkFrame.durationbar.Visible = true;
						maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1 - math.clamp((tick() - v1437) / v64[3].vulka_overheat_duration, 0, 1), 0, 1, 0);
					else
						maingui.PerkFrame.durationbar.Visible = false;
					end;
					u88 = v1434 + tick() - v1435;
					RS:wait();
					if u106 == true and tick() - v1435 >= 0.5 then
						break;
					end;
					if tick() - u88 <= 0 then
						break;
					end;
					if u8.staggering == true then
						break;
					end;				
				end;
				l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("minigun_spin");
				maingui.PerkFrame.durationbar.Visible = false;
				v1444:Destroy();
				v1439:Destroy();
				if hum.Health > 0 then
					for v1455, v1456 in ipairs(maingui.Centre.crosshair:GetChildren()) do
						v1456.Visible = true;
					end;
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "mini_end", character.HumanoidRootPart);
					if tick() - u88 <= 0 then
						v104({ "firearms" }, "empty", nil, nil, true, true);
						u88 = tick();
					end;
					globalanimsets.perk_minigun_overheat:Stop(0);
					globalanimsets.perk_minigun_fire:Stop(0);
					u19 = u19 + v64[3].vulka_slowdown;
					if u8.staggering == false then
						u8.channel = false;
						v1281:AdjustSpeed(1);
						v1280:AdjustSpeed(1);
						return;
					end;
				end;
			elseif p128 == "hive" then
				local v1457 = tick();
				local v1458 = 0;
				v1281:AdjustSpeed(0);
				v1280:AdjustSpeed(0);
				u8.channel = true;
				for v1459, v1460 in ipairs(maingui.Centre.crosshair:GetChildren()) do
					v1460.Visible = false;
				end;
				v104({ "perks" }, "hive_cancel", nil, nil, true, true);
				v1282.text.spark:Emit(math.random(10, 20));
				v1282.text.flash:Emit(1);
				v1282.spinner.Transparency = 0.3;
				v1282.text.billboard.Enabled = true;
				if v63.hive_mode == nil then
					v63.hive_mode = "Disperse";
					maingui.PerkFrame.numberstat.Visible = true;
					maingui.PerkFrame.numberstat.Text = string.upper(v63.hive_mode);
				end;
				v1282.text.billboard.directive.Text = string.upper(v63.hive_mode);
				local v1461 = false;
				while not (hum.Health <= 0) do
					v1282.spin.C0 = v1282.spin.C0 * CFrame.Angles(0.05235987755982989, 0, 0);
					u136 = tick();
					if u54 == true and v64[3].cooldown <= tick() - u88 then
						v1461 = true;
						if globalanimsets["perk_hive_" .. v63.hive_mode] then
							globalanimsets["perk_hive_" .. v63.hive_mode]:Play(0.1);
						end;
						tpglobalanimsets.perk_hive_cast:Play();
						l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "hive_cast", character.HumanoidRootPart);
						u136 = tick();
						u88 = tick();
						l__workspace__1.ServerStuff.dealDamage:FireServer("send_hive", v63.hive_mode, v5, v4);
						break;
					end;
					if u69 == true and tick() - v1458 >= 0.3 then
						v104({ "perks" }, "hive_snap", nil, nil, true, true);
						globalanimsets.perk_hive_snap:Play(0.1);
						v1458 = tick();
						if v63.hive_mode == "Disperse" then
							v63.hive_mode = "Divide";
						elseif v63.hive_mode == "Divide" then
							v63.hive_mode = "Direct";
						elseif v63.hive_mode == "Direct" then
							v63.hive_mode = "Disperse";
						end;
						maingui.PerkFrame.numberstat.Text = string.upper(v63.hive_mode);
						v1282.text.billboard.directive.Text = string.upper(v63.hive_mode);
					end;
					RS:wait();
					if u106 == true and tick() - v1457 >= 0.5 then
						break;
					end;
					if tick() - u88 <= 0 then
						break;
					end;
					if u8.staggering == true then
						break;
					end;				
				end;
				v1282.text.spark:Emit(math.random(10, 20));
				v1282.text.flash:Emit(1);
				v1282.spinner.Transparency = 1;
				v1282.text.billboard.Enabled = false;
				if v1461 == false then
					v104({ "perks" }, "hive_cancel", nil, nil, true, true);
				end;
				if v63.hive_loop_sound then
					v63.hive_loop_sound:Destroy();
				end;
				if hum.Health > 0 then
					for v1462, v1463 in ipairs(maingui.Centre.crosshair:GetChildren()) do
						v1463.Visible = true;
					end;
					if u8.staggering == false then
						u8.channel = false;
						v1281:AdjustSpeed(1);
						v1280:AdjustSpeed(1);
						return;
					end;
				end;
			else
				if p128 == "wire" then
					local v1464 = tick();
					local v1465 = 0;
					v1281:AdjustSpeed(0);
					v1280:AdjustSpeed(0);
					if v64[3].cooldown <= tick() - u88 then
						local v1466 = tick() - v64[3].cooldown;
					else
						v1466 = u88;
					end;
					local v1467 = false;
					local v1468 = {};
					while not (hum.Health <= 0) do
						u136 = tick();
						if u54 == true and v64[3].multicooldown <= tick() - u88 and tick() - v1465 >= 0.4 then
							v1465 = tick();
							tpglobalanimsets.aux_knifethrow:Play(0.1, 1, 1.5);
							globalanimsets["perk_wire_throw" .. math.random(1, 3)]:Play(0.05, 1, 1);
							v104({ "perks" }, "wire_tossready", nil, nil, true, true);
							local u147 = v1466;
							local u148 = false;
							delay(0.1, function()
								l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "wire_toss", character.HumanoidRootPart);
								v104({ "perks" }, "wire_tossreel", nil, nil, true, true);
								v104({ "perks" }, "wire_tossreel2", nil, nil, true, true);
								u147 = u147 + v64[3].multicooldown;
								local v1469 = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, l__workspace__1.PlayerShootThroughs, l__workspace__1.activeFriendlies, l__workspace__1.activeHostiles, l__workspace__1.PlayerTraps, l__workspace__1.Interactables, l__workspace__1.activePlayers };
								local v1470, v1471 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, 80, v1469);
								l__workspace__1.ServerStuff.applyGore:FireServer("bowarrow_ignore", character, ply, { l__CurrentCamera__1.CFrame, Vector3.new(0, 0, 0) });
								if v1470 == nil then
									local v1472 = v1471;
									for v1473 = 1, 200 do
										local v1474 = nil;
										local v1475 = nil;
										v1475, v1474 = raycastline(v1472, l__CurrentCamera__1.CFrame.LookVector + Vector3.new(0, -0.05, 0), 3, v1469);
										if v1475 then
											v1471 = v1474;
											v1470 = v1475;
											break;
										end;
										v1472 = v1474;
										RS:wait();
									end;
								end;
								if v1470 and v1471 then
									l__workspace__1.ServerStuff.dealDamage:FireServer("wire_dagger", { v1471 }, v5, v4);
								end;
								local v1476 = math.floor((tick() - u147) / v64[3].multicooldown);
								for v1477, v1478 in ipairs(v1282:GetChildren()) do
									if v1478:IsA("BasePart") and v1476 < tonumber(v1478.Name) then
										v1478.Transparency = 1;
										v1478.covers.Transparency = 1;
										v1478.wrap.Transparency = 1;
									end;
								end;
								delay(0.4, function()
									if tick() - u88 < v64[3].multicooldown and u69 ~= true then
										u148 = true;
									end;
								end);
							end);
						end;
						if u69 == true and tick() - v1465 >= 0.3 and v1467 == false and l__workspace__1.ServerStuff.game.disableInteraction.Value == false then
							globalanimsets.perk_wire_pull:Play(0.05, 1, 1);
							tpglobalanimsets.perk_wire_pull:Play(0.1);
							l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "wire_ready1", character.HumanoidRootPart);
							l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "wire_ready2", character.HumanoidRootPart);
							l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "wire_ready3", character.HumanoidRootPart);
							local v1479 = l__CurrentCamera__1.CFrame.p + l__CurrentCamera__1.CFrame.lookVector * (v64[3].max_dagger_return_range - 5);
							local v1480 = 0;
							for v1481, v1482 in ipairs(l__workspace__1.PlayerShootThroughs:GetChildren()) do
								if v1482.Name == ply.Name .. "_wiredagger" and (v1482.Position - v1479).magnitude <= v64[3].max_dagger_return_range then
									l__workspace__1.ServerStuff.applyGore:FireServer("wire_pull", character, ply, { v1482 });
									v1480 = v1480 + 1;
									table.insert(v1468, v1482);
								end;
							end;
							delay(0.5, function()
								u88 = u88 - v64[3].returncooldowns * v1480;
								shakecamera("abilityshake");
								l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "wire_reel", character.HumanoidRootPart);
								l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "wire_spool1", character.HumanoidRootPart);
								l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "wire_spool2", character.HumanoidRootPart);
								l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "wire_spool3", character.HumanoidRootPart);
								l__workspace__1.ServerStuff.dealDamage:FireServer("return_daggers", v1468, v5, v4);
							end);
							break;
						end;
						u88 = v1466 + tick() - v1464;
						RS:wait();
						if u106 == true and tick() - v1464 >= 0.5 and tick() - v1465 >= 0.3 then
							break;
						end;
						if tick() - u88 <= 0 then
							break;
						end;
						if u8.staggering == true then
							break;
						end;
						if false == true then
							break;
						end;					
					end;
					v104({ "perks", "two" }, "wire_ready", nil, nil, true, true);
					if hum.Health > 0 and u8.staggering == false then
						v1281:AdjustSpeed(1);
						v1280:AdjustSpeed(1);
					end;
					return;
				end;
				if p128 == "revolver" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "revolver_armed", character.HumanoidRootPart, 0.05);
					v1282.spin_fx.Transparency = 1;
					local v1483 = tick();
					local v1484 = false;
					while true do
						if u69 == true then
							if v1484 == false then
								v104({ "firearms" }, "ads_in", nil, nil, true, true);
								v1484 = true;
							end;
							u74 = playerstats.Settings.AimSens;
							l__CurrentCamera__1.FieldOfView = lerp(l__CurrentCamera__1.FieldOfView, 40, 0.05);
						end;
						RS:wait();
						if tick() - v1483 >= 0.6 then
							break;
						end;					
					end;
					u74 = 1;
					l__CurrentCamera__1.FieldOfView = 90;
					delay(0.3, function()
						l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("hide_perk");
						for v1485, v1486 in ipairs(maingui.Centre.crosshair:GetChildren()) do
							v1486.Visible = true;
						end;
						if maingui:FindFirstChild("revolver_crosshair") then
							maingui:FindFirstChild("revolver_crosshair"):Destroy();
						end;
					end);
					local v1487 = "medium";
					if u67 == true then
						v1487 = "indoors";
					end;
					v104({ "firearms" }, "ballistic_" .. v1487, nil, nil, true, true);
					v104({ "firearms" }, "bass", nil, nil, true, true);
					l__workspace__1.ServerStuff.dealDamage:FireServer("gunsareloud", nil, v5, v4);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "revolver_shoot", character.HumanoidRootPart, 0.05);
					local v1488, v1489 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, v64[3].revolver_range, baselayer);
					local v1490 = nil;
					local v1491 = false;
					if v1488 and v1488.Name == "ricochet" then
						l__workspace__1.ServerStuff.applyGore:FireServer("gunricochet", character, ply, { v1489 });
					end;
					if v1488 and v1488.Parent:FindFirstChild("Humanoid") and v1488.Parent:FindFirstChild("Humanoid").Health > 0 and v1488.Parent:FindFirstChild("Head") and v1488.Parent:IsDescendantOf(l__workspace__1.activeHostiles) then
						local v1492 = v64[3].revolver_damage;
						trigger_map_item_func(v1488, "gundamage", v1492);
						if v1488.Name == "Head" then
							v1492 = v64[3].revolver_damage * v64[3].revolver_headshot_multi;
							if v1488.Parent:FindFirstChild("Humanoid").Health - v1492 <= 0 then
								v1491 = true;
							end;
						end;
						u39(v1488.Parent.Head.Position, v1492);
						v156();
						v1490 = true;
						l__workspace__1.ServerStuff.dealDamage:FireServer("revolver_shot", { v1488.Parent, v1492 }, v5, v4);
						l__workspace__1.ServerStuff.applyGore:FireServer("bloodhit", v1488.Parent, nil, { v1492, v1489, character.Torso.Position });
					end;
					shakecamera("gunrecoil", { 7 });
					shakecamera("guntilt", { 7 });
					l__workspace__1.ServerStuff.applyGore:FireServer("firegun", character, ply, { v1282.muzzle.Position, v1489, false, v1490, nil, 100 });
					local v1493 = 0;
					if v1491 == true then
						v104({ "perks" }, "revolver_buff", nil, nil, true, true);
						afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).ArtiB);
						v1493 = v64[3].revolver_cooldown_reduce_on_kill;
						spawn(function()
							local v1494 = l__game__6.ReplicatedStorage.misc.StimFlash:Clone();
							v1494.ImageColor3 = Color3.new(0.5, 0, 0.7);
							v1494.Parent = maingui;
							while true do
								v1494.ImageTransparency = v1494.ImageTransparency + 0.05;
								v1494.Size = v1494.Size + UDim2.new(0, 1, 0, 1);
								RS:wait();
								if v1494.ImageTransparency >= 1 then
									break;
								end;							
							end;
							v1494:Destroy();
						end);
					end;
					u88 = tick() - v1493;
					return;
				end;
				if p128 == "shotgun" then
					u88 = tick();
					u136 = tick();
					u106 = false;
					local l__buffer_f_key__1495 = v63.buffer_f_key;
					local v1496 = false;
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "shotshell_fire", character.HumanoidRootPart);
					while true do
						if u106 == true and l__buffer_f_key__1495 == true then
							v1496 = true;
							break;
						end;
						RS:wait();
						if v64[3].blast_punch_window <= tick() - u136 then
							break;
						end;					
					end;
					local v1497 = (l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * (v64[3].blast_forward + 1)).p;
					local v1498 = nil;
					if v1496 == true then
						local v1499 = l__game__6.ReplicatedStorage.misc.shotshell_white_flash:Clone();
						v1499.Parent = maingui;
						l__Debris__32:AddItem(v1499, 5);
						v104({ "perks" }, "shotshell_punch_ding", nil, nil, true, true);
						globalanimsets.perk_shotgun_punch:Play(0);
						v1282.muzzle.flash.Enabled = true;
						local v1500 = tick();
						while true do
							u136 = tick();
							RS:wait();
							if tick() - v1500 >= 0.3 then
								break;
							end;						
						end;
						v1282.muzzle.flash.Enabled = false;
						spawn(function()
							while v1499 ~= nil do
								v1499.BackgroundTransparency = v1499.BackgroundTransparency + 0.1;
								RS:wait();
								if v1499 == nil then
									break;
								end;
								if v1499.BackgroundTransparency >= 1 then
									break;
								end;							
							end;
							v1499:Destroy();
						end);
						l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "shotshell_punch_hit", character.HumanoidRootPart);
						local v1501, v1502 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, v64[3].blast_punch_range, baselayer);
						v1497 = v1502;
						if (character.HumanoidRootPart.Position - v1502).magnitude <= v64[3].blast_range * v64[3].blast_punch_multiplier * 0.8 then
							character.HumanoidRootPart.Velocity = character.HumanoidRootPart.Velocity - l__CurrentCamera__1.CFrame.LookVector * v64[3].blast_knockback;
						end;
						v1498 = v1282.muzzle.Position;
					end;
					character.HumanoidRootPart.Velocity = character.HumanoidRootPart.Velocity - l__CurrentCamera__1.CFrame.LookVector * v64[3].blast_knockback;
					l__workspace__1.ServerStuff.applyGore:FireServer("firegun", character, ply, { v1282.muzzle.Position, v1497, nil, nil, nil, 100 });
					l__workspace__1.ServerStuff.dealDamage:FireServer("shotshell", { v1497, v1498 }, v5, v4);
					l__workspace__1.ServerStuff.applyGore:FireServer("shotshell_blast", character, ply, { v1497, v1498 });
					delay(0.6, function()
						v1282.shell_ejection.shell:Emit(1);
						v104({ "perks" }, "shotshell_pump", nil, nil, true, true);
					end);
					return;
				end;
				if p128 == "ranger" then
					if tick() - u88 < v64[3].multicooldown or u106 == true then
						tpglobalanimsets.perk_izbucni_det:Play(0.1, 1, 1);
						l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "giftdet", character.HumanoidRootPart);
						globalanimsets.perk_izbucni_det:Play(0.1, 1, 1);
						delay(0.1, function()
							l__workspace__1.ServerStuff.dealDamage:FireServer("izbucni_detonate", nil, v5, v4);
						end);
						return;
					else
						if v64[3].cooldown <= tick() - u88 then
							u88 = tick() - (v64[3].cooldown - v64[3].multicooldown);
						else
							u88 = u88 + v64[3].multicooldown;
						end;
						local v1503 = 0;
						if u137.fuse ~= nil then
							v1503 = u137.fuse;
						end;
						v1281:Play(0.1);
						l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "giftthrow", character.HumanoidRootPart);
						l__workspace__1.ServerStuff.dealDamage:FireServer("izbucni", { l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * 1, v1503 }, v5, v4);
						return;
					end;
				end;
				if p128 == "shadow" then
					if tick() - u88 < v64[3].cooldown or u106 == true then
						v1281:Stop(0.1);
						tpglobalanimsets.perk_shadow_stake:Play(0.1, 1, 1);
						globalanimsets.perk_shadow_shoot:Play(0.1, 1, 1.25);
						delay(0.2, function()
							l__workspace__1.ServerStuff.dealDamage:FireServer("shadow_useability", "tag", v5, v4);
							delay(0.1, function()
								v1282.stake1.Transparency = 1;
								v1282.stake1.bleed:Emit(math.random(50, 60));
								v1282.stake2.Transparency = 1;
								v1282.stake2.bleed:Emit(math.random(50, 50));
								v1282.stake3.Transparency = 1;
								v1282.stake3.bleed:Emit(math.random(50, 50));
								v1282.stake4.Transparency = 1;
								v1282.stake4.bleed:Emit(math.random(50, 50));
								v1282.stake5.Transparency = 1;
								v1282.stake5.bleed:Emit(math.random(50, 50));
							end);
							l__workspace__1.ServerStuff.playAudio:FireServer({ "perks", "two" }, "summon_shoot", character.HumanoidRootPart);
							local v1504, v1505 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, 500, baselayer);
							l__workspace__1.ServerStuff.applyGore:FireServer("shadow_stake", character, ply, { l__CurrentCamera__1.CFrame.p, v1505 });
							local v1506 = nil;
							if v1504 and v1504.Parent:FindFirstChild("Humanoid") and v1504.Parent:FindFirstChild("Humanoid").Health > 0 and v1504.Parent:FindFirstChild("Head") and v1504.Parent:IsDescendantOf(l__workspace__1.activeHostiles) then
								v156();
								v1506 = v1504;
								local v1507 = l__game__6.ReplicatedStorage.misc.shadow_tag:Clone();
								l__Debris__32:AddItem(v1507, 5);
								v1507.Parent = v1504.Parent.Head;
								v1507.Adornee = v1504.Parent.Head;
								delay(2, function()
									while v1507 do
										v1507.img.ImageTransparency = v1507.img.ImageTransparency + 0.05;
										RS:wait();
										if v1507 == nil then
											break;
										end;
										if v1507.img.ImageTransparency >= 1 then
											break;
										end;									
									end;
									if v1507 then
										v1507:Destroy();
									end;
								end);
							end;
							if v1504 and v1505 then
								l__workspace__1.ServerStuff.dealDamage:FireServer("shadow_tag", { v1506, v1505 }, v5, v4);
							end;
							shakecamera("abilityshake");
						end);
						return;
					else
						delay(0.5, function()
							shakecamera("abilityshake");
							local v1508 = false;
							local v1509, v1510 = raycastline((character.HumanoidRootPart.CFrame + character.HumanoidRootPart.CFrame.lookVector * 2).p, -character.HumanoidRootPart.CFrame.upVector, 5, baselayer);
							if v1509 and u8.air == false then
								v1508 = true;
								if raycastline((character.HumanoidRootPart.CFrame - character.HumanoidRootPart.CFrame.upVector * 2).p, character.HumanoidRootPart.CFrame.lookVector, 5, baselayer) then
									v1508 = false;
								end;
							end;
							if v1508 == true then
								u88 = tick();
								l__workspace__1.ServerStuff.dealDamage:FireServer("shadow_useability", {}, v5, v4);
								l__workspace__1.ServerStuff.dealDamage:FireServer("shadowhunter", nil, v5, v4);
								spawn(function()
									u88 = tick();
									local v1511 = tick();
									v63.shadow_active = u88;
									while true do
										u88 = v63.shadow_active + tick() - v1511;
										RS:wait();
										if tick() - v1511 >= 5 and l__workspace__1.activeFriendlies:FindFirstChild(ply.Name .. "_hunter") == nil then
											break;
										end;
										if v64[3].cooldown <= tick() - u88 then
											break;
										end;									
									end;
									v63.shadow_active = nil;
								end);
							end;
						end);
						return;
					end;
				end;
				if p128 == "sword" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "bladeswing", character.HumanoidRootPart);
					delay(0.3, function()
						if v1282:FindFirstChild("trail") then
							v1282:FindFirstChild("trail").Enabled = false;
						end;
					end);
					delay(0.7, function()
						l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("hide_perk");
						l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "bladesheath", character.HumanoidRootPart);
					end);
					local v1512 = math.ceil(v64[3].kiramindamage + (v64[3].kiramaxdamage - v64[3].kiramindamage) * (math.clamp(tick() - u88, 1, v64[3].cooldown) / v64[3].cooldown));
					local v1513 = l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * (v64[3].frontradius - 1);
					local v1514 = false;
					local v1515 = true;
					local v1516 = {};
					for v1517, v1518 in ipairs(l__workspace__1.activeHostiles:GetChildren()) do
						if v1518:FindFirstChild("Torso") and v1518:FindFirstChild("Head") and v1518:FindFirstChild("Humanoid") and v1518.Humanoid.Health > 0 and (v1518.Torso.Position - v1513.p).magnitude <= v64[3].frontradius then
							local v1519 = v1515;
							v1515 = false;
							if v1518:FindFirstChild("Humanoid").Health - v1512 <= 0 then
								v1519 = true;
								v1515 = true;
							end;
							if v1519 == true then
								table.insert(v1516, v1518);
								u39(v1518.Head.Position, v1512);
								if v1514 == false then
									v1514 = true;
									v156();
								end;
							end;
						end;
					end;
					if #v1516 > 0 then
						l__workspace__1.ServerStuff.dealDamage:FireServer("kirablade", { v1516, v1512 }, v5, v4);
					end;
					if u106 == true and v63.dogtags and v63.dogtags > 0 and hum.Health < hum.MaxHealth then
						delay(0.1, function()
							delay(0.1, function()
								v104({ "perks" }, "bladeclean", nil, nil, true, true);
							end);
							v63.losetags(v64[3].dogtagsheavydamage, true);
							delay(0.15, function()
								v1282.blade.dust:Emit(math.random(10, 20));
							end);
							if v63.dogtags <= 0 then
								v1282.blade.sprayA.Transparency = 1;
								v1282.blade.sprayB.Transparency = 1;
								v1282.blade.sprayB.Transparency = 1;
								v1282.blade.sprayB.Transparency = 1;
							end;
							globalanimsets.perk_kira_clean:Play(0.1, 1, 0.9);
						end);
					end;
					spawn(function()
						local v1520 = tick();
						while true do
							u88 = tick();
							RS:wait();
							if tick() - v1520 >= 0.2 then
								break;
							end;						
						end;
						local v1521 = 0;
						if v63.dogtags ~= nil and v63.dogtags > 0 then
							v1282.blade.sprayA.Transparency = 0;
							v1282.blade.sprayB.Transparency = 0;
							v1282.blade.sprayB.Transparency = 0;
							v1282.blade.sprayB.Transparency = 0;
							v1282.blade.Color = Color3.fromRGB(223, 200, 219);
							v1521 = math.clamp(v64[3].dogtagreduction * v63.dogtags, v64[3].dogtagreduction, v64[3].cooldown - v64[3].mincooldown);
						end;
						u88 = tick() - v1521;
					end);
					return;
				end;
				if p128 == "shield" then
					if u106 == true then
						v1281:AdjustSpeed(0);
						v1280:AdjustSpeed(0);
						local u149 = tick();
						function v63.aegisshieldup(p132, p133)
							if v1282 == nil then
								return;
							end;
							v104({ "perks" }, "aegisstruck", nil, nil, true, true);
							v1282.barrier2.impactfx.Enabled = true;
							v1282.barrier2.impactfx:Emit(1);
							v1282.barrier2.impactfx.Enabled = false;
							globalanimsets.perk_aegisstruck:Play(0, 1, 1);
							local v1522 = p132;
							if p133 and p133 == "BossFunRuiner" then
								v1522 = 10000;
							end;
							u149 = u149 - v1522;
						end;
						l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("enable_aegis_shield");
						l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "1PB" }, "flash", character.HumanoidRootPart);
						v1282.barrier2.flash.Enabled = true;
						v1282.barrier2.flash:Emit(20);
						v1282.barrier2.flash.Enabled = false;
						v1282.barrier1.flash.Enabled = true;
						v1282.barrier1.flash:Emit(20);
						v1282.barrier1.flash.Enabled = false;
						v1282.barrier1.electric.Enabled = true;
						v1282.barrier2.electric.Enabled = true;
						v1282.barrier1.Transparency = 0;
						v1282.barrier2.Transparency = 0;
						u17 = u17 + v64[3].aegisdefenseboost;
						l__workspace__1.ServerStuff.initiateblock:FireServer(v5, true);
						maingui.PerkFrame.durationbar.Visible = true;
						maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1, 0, 1, 0);
						while true do
							u88 = tick();
							u136 = tick();
							maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1 - math.clamp((tick() - u149) / v64[3].aegisduration, 0, 1), 0, 1, 0);
							RS:wait();
							if u106 == false then
								break;
							end;
							if v64[3].aegisduration <= tick() - u149 then
								break;
							end;						
						end;
						l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("disable_aegis_shield");
						maingui.PerkFrame.durationbar.Visible = false;
						v1282.barrier1.electric:Clear();
						v1282.barrier2.electric:Clear();
						v1282.barrier1.electric.Enabled = false;
						v1282.barrier2.electric.Enabled = false;
						v1281:AdjustSpeed(1);
						v1280:AdjustSpeed(1);
						l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
						u17 = u17 - v64[3].aegisdefenseboost;
						globalanimsets.perk_aegisstruck:Stop(0);
						l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "aegisbreak", character.HumanoidRootPart);
						v63.aegisshieldup = nil;
						v1282.barrier1.Transparency = 1;
						v1282.barrier2.Transparency = 1;
						v1282.barrier2.breakeffect.Enabled = true;
						v1282.barrier2.breakeffect:Emit(math.random(20, 30));
						v1282.barrier2.breakeffect.Enabled = false;
						v1282.barrier1.breakeffect.Enabled = true;
						v1282.barrier1.breakeffect:Emit(math.random(20, 30));
						v1282.barrier1.breakeffect.Enabled = false;
						return;
					else
						local v1523 = false;
						local v1524, v1525 = raycastline((character.HumanoidRootPart.CFrame + character.HumanoidRootPart.CFrame.lookVector * 3).p, -character.HumanoidRootPart.CFrame.upVector, 4, baselayer);
						if v1524 and u8.air == false then
							v1523 = true;
							if raycastline((character.HumanoidRootPart.CFrame - character.HumanoidRootPart.CFrame.upVector * 3).p, character.HumanoidRootPart.CFrame.lookVector, 4, baselayer) then
								v1523 = false;
							end;
						end;
						if v1523 == true then
							l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("hide_perk");
							l__workspace__1.ServerStuff.dealDamage:FireServer("placeaegisturret", nil, v5, v4);
							spawn(function()
								local v1526 = tick();
								maingui.PerkFrame.durationbar.Visible = true;
								maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1, 0, 1, 0);
								local v1527 = tick();
								while true do
									u88 = tick();
									maingui.PerkFrame.durationbar.fill.Size = UDim2.new(1 - math.clamp((tick() - v1526) / v64[3].turretduration, 0, 1), 0, 1, 0);
									if tick() - v1527 >= 0.5 and u106 == true then
										break;
									end;
									RS:wait();
									if v64[3].turretduration <= tick() - v1526 then
										break;
									end;								
								end;
								maingui.PerkFrame.durationbar.Visible = false;
								l__workspace__1.ServerStuff.dealDamage:FireServer("removeaegisturret", nil, v5, v4);
							end);
							return;
						end;
					end;
				elseif p128 == "trapper" then
					local v1528 = 0;
					for v1529, v1530 in ipairs(l__workspace__1.Interactables:GetChildren()) do
						if v1530.Name == "TICKS" .. ply.Name then
							v1528 = v1528 + 1;
						end;
					end;
					if v1528 < v64[3].maxticks then
						v1281:Play(0.1);
						if v64[3].cooldown <= tick() - u88 then
							u88 = tick() - (v64[3].cooldown - v64[3].multicooldown);
						else
							u88 = u88 + v64[3].multicooldown;
						end;
						l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "tickthrow", character.HumanoidRootPart);
						l__workspace__1.ServerStuff.dealDamage:FireServer("throwticks", { l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * 1, u106 }, v5, v4);
						return;
					end;
				elseif p128 == "mind" then
					local v1531 = false;
					if u106 == true then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "mind_toss", character.HumanoidRootPart);
						v1531 = true;
						globalanimsets.perk_izbucni:Play(0.1, 1, 1.5);
					end;
					v1282:Destroy();
					v1281:Play(0.1);
					if v64[3].cooldown <= tick() - u88 then
						u88 = tick() - (v64[3].cooldown - v64[3].reducecooldown);
					else
						u88 = u88 + v64[3].reducecooldown;
					end;
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "mind_hop", character.HumanoidRootPart);
					l__workspace__1.ServerStuff.dealDamage:FireServer("dropmkiller", { l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * 1, v1531 }, v5, v4);
					return;
				elseif p128 == "dagger" then
					v1282:Destroy();
					tpglobalanimsets.aux_knifethrow:Play(0.1, 1, 1.5);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "sov_target", character.HumanoidRootPart);
					spawn(function()
						local v1532, v1533 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, 80, baselayer);
						l__workspace__1.ServerStuff.applyGore:FireServer("bowarrow", character, ply, { l__CurrentCamera__1.CFrame, Vector3.new(0, 0, 0) });
						if v1532 == nil then
							local v1534 = v1533;
							for v1535 = 1, 200 do
								local v1536 = nil;
								local v1537 = nil;
								v1537, v1536 = raycastline(v1534, l__CurrentCamera__1.CFrame.LookVector + Vector3.new(0, -0.05, 0), 3, baselayer);
								if v1537 then
									v1533 = v1536;
									v1532 = v1537;
									break;
								end;
								v1534 = v1536;
								RS:wait();
							end;
						end;
						local v1538 = nil;
						if v1532 and v1532.Parent:FindFirstChild("Humanoid") and v1532.Parent:FindFirstChild("Humanoid").Health > 0 and v1532.Parent:FindFirstChild("Head") and v1532.Parent:IsDescendantOf(l__workspace__1.activeHostiles) then
							v156();
							v1538 = v1532;
						end;
						if v1532 and v1533 then
							l__workspace__1.ServerStuff.dealDamage:FireServer("sov_dagger", { v1538, v1533 }, v5, v4);
						end;
					end);
				end;
			end;
		end;
	end;
	local u150 = nil;
	u150 = v1280.KeyframeReached:connect(function(p134)
		if p134 == "activate_Perk" then
			u138();
			u150:Disconnect();
		end;
	end);
	v1280:Play(0.03, 1, 1);
	while true do
		RS:wait();
		if v64[3].activeend <= tick() - u136 then
			break;
		end;	
	end;
	u8.using_perk = false;
	u150:Disconnect();
	v1280:Stop(0.3);
	if v1282 then
		l__workspace__1.ServerStuff.handlePerkVisibility:FireServer("hide_perk");
		v1282:Destroy();
	end;
	u8.action = false;
end;
local v1539 = UIS.InputBegan:connect(function(p135, p136)
	if p136 == true or spectating == true then
		return;
	end;
	local l__KeyCode__1540 = p135.KeyCode;
	if hum.Health <= 0 then
		return;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.R and u14.weapontype == "Bow" and u8.action == false and u16.arrow.arrow1.Transparency == 1 then
		u118();
	end;
	if l__KeyCode__1540 == Enum.KeyCode.L and l__game__6:GetService("RunService"):IsStudio() then
		u34(1000, "lel");
	end;
	if l__KeyCode__1540 == Enum.KeyCode.Z and hum.Health > 0 then
		if tick() - ping_cooldown <= 0.2 then
			return;
		end;
		if tick() - ping_chill <= ping_chill_timer and ping_chll_limit <= ping_amt then
			ping_chill = tick();
			return;
		end;
		u119();
	end;
	if l__KeyCode__1540 == Enum.KeyCode.LeftShift and u8.sprinting == false then
		u120 = true;
		while RS:wait() do
			if u8.sprinting == false and u8.walking == true and u8.staggering == false and u8.channel == false and juggernaut == false and u8.sliding == false then
				u121();
			end;
			if u120 == false then
				break;
			end;		
		end;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.W and u26.w == false then
		u26.w = true;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.Space then
		u122();
	end;
	if l__KeyCode__1540 == Enum.KeyCode.Zero then
		decider_reset();
		while true do
			RS:wait();		
		end;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.H then
		reset_arms();
	end;
	if l__KeyCode__1540 == Enum.KeyCode.V and akimbo_factors.active == false and u8.action == false then
		start_dual_wield();
	end;
	if l__KeyCode__1540 == Enum.KeyCode.B then
		commend_player();
	end;
	if l__KeyCode__1540 == Enum.KeyCode.T and hum.Health > 0 then
		if u123 == false then
			u123 = true;
		end;
		UIS.MouseIconEnabled = true;
		maingui.TabMenu.Visible = true;
		maingui.TabMenu.Size = UDim2.new(1, 0, 0, 0);
		local v1541 = nil;
		local v1542 = nil;
		if u8.action == false and u8.aiming == false then
			v1542 = l__game__6.ReplicatedStorage.misc.agentdevice:Clone();
			local v1543 = Instance.new("Motor6D");
			v1543.Part0 = fparms.LeftArm.LUpperArm;
			v1543.Part1 = v1542;
			if l__workspace__1.ServerStuff.game.holdout.Value == true then
				v1542.glow.crack.Transparency = 0;
			end;
			v1543.Parent = v1542;
			v1542.Parent = l__CurrentCamera__1;
			v104({ "weapons", "Item" }, "trackeractive", nil, nil, true, true);
			v1541 = globalanimsets.tabmenu;
			v1541:Play(0.1);
			local u151 = nil;
			u151 = v1541.KeyframeReached:connect(function(p137)
				if p137 == "Stop" then
					v1541:AdjustSpeed(0);
					u151:Disconnect();
				end;
			end);
		end;
		spawn(function()
			local v1544 = false;
			while true do
				if (u8.action == true or u8.aiming == true) and v1544 == false and v1541 ~= nil then
					v1544 = true;
					v1541:Stop(0);
					v1542:Destroy();
				end;
				maingui.TabMenu.Size = maingui.TabMenu.Size:Lerp(UDim2.new(1, 0, 1, 0), 0.1);
				maingui.TabMenu.bg.night_label.Text = "// NIGHT " .. l__workspace__1.ServerStuff.game.currentNight.Value .. " //";
				if l__workspace__1.ServerStuff.game.holdout.Value == true then
					maingui.TabMenu.bg.night_label.Text = "// WAVE " .. l__workspace__1.ServerStuff.game.currentNight.Value .. " //";
				end;
				if l__workspace__1.ServerStuff.game.nightTimer.Value ~= 0 then
					local v1545 = math.clamp(l__workspace__1.ServerStuff.game.nightTimer.Value, 0, 1000);
					maingui.TabMenu.bg.time_label.Text = "STORM.WATCH = " .. string.format("%02i:%02i", v1545 / 60 % 60, v1545 % 60);
				else
					maingui.TabMenu.bg.time_label.Text = "STORM.WATCH = ERROR";
				end;
				if character and character:FindFirstChild("Torso") and character:FindFirstChild("HumanoidRootPart") then
					local v1546 = (l__workspace__1.minimapcentre.Position - character.Torso.Position) / 1.5;
					maingui.TabMenu.bg.map.player_icon.spinicon.Rotation = -character.HumanoidRootPart.Orientation.y;
					maingui.TabMenu.bg.map.player_icon.Position = UDim2.new(0.5, v1546.x, 0.5, v1546.z);
				end;
				if maingui.TabMenu.bg.ammodroptab.Visible == true then
					for v1547, v1548 in ipairs(maingui.TabMenu.bg.ammodroptab:GetChildren()) do
						if u59[v1548.Name] then
							v1548.count.Text = u59[v1548.Name];
						end;
					end;
				end;
				if maingui.TabMenu.bg.rationstab.Visible == true then
					for v1549, v1550 in ipairs(maingui.TabMenu.bg.rationstab:GetChildren()) do
						if ration_system_handler[v1550.Name] then
							v1550.contents.Text = ">IN CONTAINER: " .. ration_system_handler[v1550.Name];
						end;
					end;
				end;
				if maingui.TabMenu.bg.scraptab.Visible == true then
					local v1551 = scrap_drop_amount;
					if scrap_drop_amount <= 0 then
						v1551 = "NONE";
					elseif u13 <= scrap_drop_amount then
						v1551 = "ALL";
					end;
					maingui.TabMenu.bg.scraptab.dropamt.Text = ">DROPPING: " .. v1551;
				end;
				if maingui.TabMenu.bg.weaponinfotab.Visible == true then
					local l__weaponinfotab__1552 = maingui.TabMenu.bg.weaponinfotab;
					l__weaponinfotab__1552.error_found.Visible = false;
					l__weaponinfotab__1552.founditem.Visible = true;
					local v1553 = { "ABUNDANT", "COMMON", "UNCOMMON", "RARE", "LIMITED" };
					if u14.weapontype == "Bludgeon" or u14.weapontype == "Blade" or u14.weapontype == "Axe" or u14.weapontype == "Spear" then
						l__weaponinfotab__1552.founditem.line1.Text = ">SPECIFICATION: " .. string.upper(u14.weapontype);
						l__weaponinfotab__1552.founditem.line2.Text = ">LETHALITY: " .. string.upper(u14.damagerating[1]) .. "%";
						l__weaponinfotab__1552.founditem.line3.Text = ">STRIKE_LETHALITY: " .. string.upper(u14.damagerating[2]) .. "%";
						l__weaponinfotab__1552.founditem.line4.Text = ">WEIGHT_LIGHT_SWING: " .. tostring(25 * u14.speedrating) .. "%";
						l__weaponinfotab__1552.founditem.line5.Text = ">WEIGHT_HEAVY_SWING: " .. tostring(25 * u14.chargerating) .. "%";
						l__weaponinfotab__1552.founditem.line6.Text = ">EFFECTIVE_RANGE: " .. tostring(25 * u14.sizerating + 100) .. "%";
						l__weaponinfotab__1552.founditem.line7.Text = ">WOUNDING_LEVEL: " .. tostring(25 * u14.woundrating + 100) .. "%";
						if u14.rarity ~= nil and v1553[u14.rarity] ~= nil then
							l__weaponinfotab__1552.founditem.line8.Text = ">WEAPON_RARITY: " .. v1553[u14.rarity];
						else
							l__weaponinfotab__1552.founditem.line8.Text = "";
						end;
					elseif u14.weapontype == "Gun" then
						l__weaponinfotab__1552.founditem.line1.Text = ">SPECIFICATION: FIREARM";
						l__weaponinfotab__1552.founditem.line2.Text = ">LIMB_LETHALITY: " .. string.upper(u14.damagerating[3]) .. "%";
						l__weaponinfotab__1552.founditem.line3.Text = ">HEADSHOT_LETHALITY: " .. string.upper(u14.damagerating[4]) .. "%";
						l__weaponinfotab__1552.founditem.line4.Text = ">ROUNDS_PER_MINUTE: " .. tostring(math.ceil(60 / u14.speedrating));
						l__weaponinfotab__1552.founditem.line5.Text = ">EFFECTIVE_RECOIL: " .. tostring(u14.woundrating * 5) .. "%";
						l__weaponinfotab__1552.founditem.line6.Text = ">FIREARM_INACCURACY: " .. tostring(100 - u14.sizerating * 5) .. "%";
						if u14.auto ~= nil then
							l__weaponinfotab__1552.founditem.line7.Text = ">SEMI_AUTOMATIC: " .. string.upper(tostring(not u14.auto));
						else
							l__weaponinfotab__1552.founditem.line7.Text = ">SEMI_AUTOMATIC: ERROR";
						end;
						if u14.chargerating then
							l__weaponinfotab__1552.founditem.line8.Text = ">FIREARM_RARITY: " .. v1553[u14.chargerating];
						else
							l__weaponinfotab__1552.founditem.line8.Text = "";
						end;
					else
						l__weaponinfotab__1552.error_found.Visible = true;
						l__weaponinfotab__1552.founditem.Visible = false;
					end;
				end;
				RS:wait();
				if u123 == false then
					break;
				end;
				if hum.Health <= 0 then
					break;
				end;			
			end;
			UIS.MouseIconEnabled = false;
			if v1544 == false and v1541 ~= nil then
				v1541:Stop(0.1);
				v1542:Destroy();
			end;
			maingui.TabMenu.Size = UDim2.new(1, 0, 0, 0);
			maingui.TabMenu.Visible = false;
		end);
	end;
	if l__KeyCode__1540 == Enum.KeyCode.P then
		if maingui.Enabled == false then
			maingui.Enabled = true;
		else
			maingui.Enabled = false;
		end;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.R and u8.action == false and u14.weapontype == "Gun" then
		u124();
	end;
	if l__KeyCode__1540 == Enum.KeyCode.G and u8.action == false and u14.weapontype == "Gun" then
		unloadgun();
	end;
	if l__KeyCode__1540 == Enum.KeyCode.C then
		if playerstats.Class == "damn" or akimbo_factors.active == true then
			return;
		end;
		aux_held = true;
		if aux_usage > 0 then
			use_aux();
		end;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.LeftControl and u8.staggering == false then
		crouch_held = true;
		if u8.sprinting == true and tick() - slide_wait >= 1 then
			u8.sprinting = false;
			u8.sneaking = false;
			drop_slide();
		elseif u8.sneaking == false then
			u28();
		end;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.R and u8.action == false and u8.blocking == false and (u14.weapontype == "Bludgeon" or u14.weapontype == "Blade" or u14.weapontype == "Axe" or u14.weapontype == "Spear" or u14.weapontype == "Fists") then
		if u14.weapontype == "Fists" and playerperks.honor == nil then
			return;
		end;
		u127();
	end;
	if l__KeyCode__1540 == Enum.KeyCode.Q then
		if u8.action ~= false then
			if (u8.action == true and u8.cancombo == true or u8.blockrecoil == true) and u8.blocking == false then
				u128();
			elseif v63.aegisshieldup ~= nil then
				u128();
			end;
		elseif u8.blocking == false then
			u128();
		elseif v63.aegisshieldup ~= nil then
			u128();
		end;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.A and u26.a == false then
		u26.a = true;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.S and u26.s == false then
		u26.s = true;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.E and influence_taps ~= 0 then
		influence_taps = influence_taps + 1;
		v104({ "shadow", "hang" }, "resist", nil, nil, true, true);
	end;
	if l__KeyCode__1540 == Enum.KeyCode.E and u8.action == false and u8.channel == false and u8.throwing == false and u98 and u9.Silencer == nil and juggernaut ~= true and l__workspace__1.ServerStuff.game.disableInteraction.Value == false then
		if typeof(u98) ~= "table" then
			if u98 == u129 then
				return;
			end;
			if tick() - e_pickup_lockout <= 0.65 then
				return;
			end;
			e_pickup_lockout = tick();
			u129 = u98;
			local v1554 = v19[u98.Name];
			local v1555 = "Item";
			if v1554.weapontype == "Bludgeon" or v1554.weapontype == "Axe" or v1554.weapontype == "Spear" or v1554.weapontype == "Blade" then
				v1555 = "Primary";
			end;
			drawlockout = tick();
			local v1556 = l__workspace__1.ServerStuff.claimItem:InvokeServer(u98);
			while true do
				RS:wait();
				if v1556 == true then
					break;
				end;
				if v1556 == false then
					break;
				end;			
			end;
			if v1556 == false then
				return;
			end;
			if u14.name == v1554.name and u16:FindFirstChild("ammo") and u16.ammo:FindFirstChild("maxammo") then
				local v1557 = 0;
				for v1558, v1559 in pairs(v6) do
					if v1559[2] == true then
						v1557 = v1559[3];
					end;
				end;
				local l__Value__1560 = u98.ammo.Value;
				l__workspace__1.ServerStuff.refillAmmo:FireServer(u16.ammo.maxammo.Value - v1557, u98);
				if l__Value__1560 - (u16.ammo.maxammo.Value - v1557) <= 0 then
					u98:Destroy();
				end;
				for v1561 = 1, #v6 do
					if v6[v1561][2] == true then
						v6[v1561][3] = math.clamp(v6[v1561][3] + l__Value__1560, 0, u16.ammo.maxammo.Value);
					end;
				end;
				u16.ammo.Value = math.clamp(u16.ammo.Value + l__Value__1560, 0, u16.ammo.maxammo.Value);
				u56(u16.Name);
				invmanage("updatehud");
				return;
			end;
			local v1562 = nil;
			if v1555 == "Primary" then
				if v6[1][1] == "Fist" then
					v6[1][1] = u98.name;
					v1562 = 1;
				end;
			else
				for v1563, v1564 in pairs(v6) do
					if v1564[1] == "Fist" and v1563 ~= 1 then
						v1564[1] = u98.name;
						if u98:FindFirstChild("ammo") then
							v1564[3] = u98.ammo.Value;
						end;
						v1562 = v1563;
						break;
					end;
				end;
			end;
			invmanage("swap", { v1562, false });
			u56(u98.Name, u98);
		else
			if u13 < u97 then
				maingui.Thought.thoughttext.Text = "I need " .. u97 .. " salvage for that.";
				inner_dialogue = tick();
				return;
			end;
			if u98 == nil or u98[1] == nil then
				return;
			end;
			if tick() - u130 <= 0.2 then
				return;
			end;
			if u98[1] ~= "craft" then
				if u98[1].stats.interactable.Value == false then
					return;
				end;
				if u98[1].stats.instant.Value == true then
					local v1565 = nil;
					local v1566 = nil;
					local v1567 = nil;
					local v1568 = nil;
					local v1569 = nil;
					local v1570 = nil;
					local v1571 = nil;
					local v1572 = nil;
					local v1573 = nil;
					local v1574 = nil;
					local v1575 = nil;
					if u98[1].Name == "Locker" or u98[1].Name == "Double Locker" then
						l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "Lockers", 1 });
					end;
					l__game__6.ReplicatedStorage.Interactables.interaction:FireServer(u98[1], u98[1].stats.execname.Value, v5);
					if string.match(u98[1].Name, "Ammo") or u98[1].Name == "Salvage Pack" then
						u130 = tick();
						if u98[1] then
							u98[1]:Destroy();
						end;
					end;
					if u98[1].Name == "Spectate" then
						if l__workspace__1.ServerStuff.game.stage.Value ~= "gameinprogress" then
							return;
						else
							v104({ "general" }, "keyboard", nil, nil, true, true);
							local v1576 = l__game__6.ReplicatedStorage.misc.staticflash:Clone();
							v1576.static.Disabled = false;
							v1576.Parent = ply.PlayerGui;
							u8.action = true;
							u8.staggering = true;
							u8.turnable = false;
							u10 = 0.001;
							local v1577 = l__game__6.ReplicatedStorage.effects.endgamegui:Clone();
							v1577.status.Position = UDim2.new(0.5, 0, 1, 0);
							v1577.status.menu.Visible = true;
							v1577.status.spectate.Visible = false;
							v1577.Parent = ply.PlayerGui;
							v1577.Enabled = true;
							character.HumanoidRootPart.Anchored = true;
							ply.CameraMode = "Classic";
							UIS.MouseIconEnabled = true;
							maingui.Enabled = false;
							if l__workspace__1.ServerStuff.game.currentGamemode.Value ~= "survival" then
								forcespecfolder = true;
							end;
							spectatesystem(v1577);
							v1577.status.spectate.MouseButton1Click:connect(function()
								if v1577.status.spectate.Text == "RETURN TO HUB" then
									kickoutspec();
								end;
							end);
							v1577.status.menu.MouseButton1Click:connect(function()
								if u131 == true then
									return;
								end;
								u131 = true;
								while true do
									ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency - 0.03;
									RS:wait();
									if ply.PlayerGui.fadetoblack.frame.BackgroundTransparency <= 0 then
										break;
									end;								
								end;
								l__workspace__1.ServerStuff.spawnPlayer:FireServer("respawncharacter");
							end);
							v1577.status.spectate.Text = "RETURN TO HUB";
							v1565 = u98;
							v1566 = 1;
							v1567 = v1565;
							v1568 = v1566;
							v1569 = v1567[v1568];
							local v1578 = "Name";
							v1570 = v1569;
							v1571 = v1578;
							v1572 = v1570[v1571];
							local v1579 = "Sign Up";
							v1573 = v1572;
							v1574 = v1579;
							if v1573 == v1574 then
								l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "writing", character.HumanoidRootPart);
							end;
							local v1580 = nil;
							v1575 = v1580;
							u98 = v1575;
							return;
						end;
					else
						v1565 = u98;
						v1566 = 1;
						v1567 = v1565;
						v1568 = v1566;
						v1569 = v1567[v1568];
						v1578 = "Name";
						v1570 = v1569;
						v1571 = v1578;
						v1572 = v1570[v1571];
						v1579 = "Sign Up";
						v1573 = v1572;
						v1574 = v1579;
						if v1573 == v1574 then
							l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "writing", character.HumanoidRootPart);
						end;
						v1580 = nil;
						v1575 = v1580;
						u98 = v1575;
						return;
					end;
				end;
			elseif u98[1] == "craft" and (startperk.Value == "hubbing" or u13 < v48) then
				return;
			end;
			local v1581 = u98[1];
			local v1582 = u98[2];
			if v1581 == "craft" then
				local v1583 = 3.5;
				if playerperks.scrafter then
					v1583 = v1583 - v1583 * v8.scrafter.efx[1] / 100;
				end;
			else
				v1583 = v1581.stats.instant.timer.Value;
				if v1581.Name == "Scrapper" and (u14.weapontype == "Fists" or v64[1] == "goggles" or u15 == "THand") then
					return;
				end;
			end;
			u54 = false;
			u69 = false;
			u8.action = true;
			u8.channel = true;
			u8.blocking = false;
			l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
			u11.stamregen = tick();
			u11.regentick = tick();
			u12 = 0.0175;
			local v1584 = { globalanimsets.interact, tpglobalanimsets.interact };
			if v1581 == "craft" then
				v1584 = { globalanimsets.craft, tpglobalanimsets.craft };
			end;
			v1584[1]:Play(0.3);
			v1584[2]:Play(0.3);
			local v1585 = v1584[1].KeyframeReached:connect(function(p138)
				if p138 == "Stop" then
					v1584[1]:AdjustSpeed(0);
				end;
			end);
			local v1586 = v1584[2].KeyframeReached:connect(function(p139)
				if p139 == "Stop" then
					v1584[2]:AdjustSpeed(0);
				end;
			end);
			if v1581 ~= "craft" then
				u71(v1581.Name);
				if v1581.Name == "Medstation" then
					local v1587 = v104({ "general" }, "starthealing", nil, nil, true, true);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "starthealing", v1581.Interact, nil, true);
				elseif v1581.Name == "Arsenal Locker" or v1581:FindFirstChild("hire") then
					v1587 = v104({ "general" }, "arsenallocker", nil, nil, true, true);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "arsenallocker", v1581.Interact, nil, true);
				elseif v1581.Name == "S.A.N.C Barrel" then
					v1587 = v104({ "machinery" }, "sancuse", nil, nil, true, true);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "machinery" }, "sancuse", v1581.Interact, nil, true);
				elseif not (not v1581.stats:FindFirstChild("itemdisplayed")) or v1581.Name == "Workbench" or not (not v1581:FindFirstChild("craft")) or v1581.Name == "Supply Container" or v1581.Name == "Ammo Fabricator" or v1581.Name == "Vending Machine" then
					v1587 = v104({ "machinery" }, "fabricator", nil, nil, true, true);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "machinery" }, "fabricator", v1581.Interact, nil, true);
				elseif v1581.Name == "Scrapper" then
					v1587 = v104({ "machinery" }, "recycling", nil, nil, true, true);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "machinery" }, "recycling", v1581.Interact, nil, true);
				elseif v1581.Name == "Skip Night" or v1581.Name == "Signal" then
					v1587 = v104({ "machinery" }, "airdroppad", nil, nil, true, true);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "machinery" }, "airdroppad", v1581.Interact, nil, true);
				else
					v1587 = v104({ "general" }, "interaction", nil, nil, true, true);
					l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "interaction", v1581.Interact, nil, true);
				end;
			else
				u71(u98[3], "CRAFTING");
				v1587 = v104({ "general" }, "craft", nil, nil, true, true);
				v1587.Looped = true;
				if playerperks.stealth == nil then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "craft", character.Head, nil, true);
				end;
			end;
			local v1588 = tick();
			local v1589 = false;
			if v1581 == "craft" then
				maingui.Centre.Craft.Visible = true;
			end;
			if v1581 ~= "craft" then
				local v1590 = v1581:FindFirstChild("Interact").Position;
			else
				v1590 = (l__CurrentCamera__1.CFrame + l__CurrentCamera__1.CFrame.lookVector * 3).p;
			end;
			while true do
				maingui.Centre.Craft.Rotation = maingui.Centre.Craft.Rotation + 1;
				if v1581 ~= "craft" then
					if v1581.Parent == nil then
						v1589 = true;
						break;
					end;
					if v1581:FindFirstChild("Interact") == nil then
						v1589 = true;
						break;
					end;
				elseif v1582.Parent == nil then
					v1589 = true;
					break;
				end;
				if not v1590 then
					v1589 = true;
					break;
				end;
				if (v1590 - character.HumanoidRootPart.Position).magnitude > 6.5 then
					break;
				end;
				maingui.ChargeOverlay.ChargeOverlay.Size = UDim2.new((tick() - v1588) / v1583, 0, 1, 0);
				RS:wait();
				if u54 == true then
					break;
				end;
				if v1583 <= tick() - v1588 then
					break;
				end;			
			end;
			maingui.Centre.Craft.Visible = false;
			v1587:Destroy();
			if v1589 == false and v1583 <= tick() - v1588 then
				if v1581 == "craft" then
					u16:Destroy();
					for v1591, v1592 in pairs(v6) do
						if v1592[2] == true then
							v1592[1] = "Fist";
							v1592[3] = nil;
						end;
					end;
					invmanage("updatehud");
					if playerperks.stealth == nil then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "craftdone", character.Head);
					end;
					u34(-v48, "CRAFTING");
					l__workspace__1.ServerStuff.craftItem:FireServer(u14.name, v1582, v6[1][2], v5);
					v1585:Disconnect();
					v1586:Disconnect();
					maingui.ChargeOverlay.Visible = false;
					u98 = nil;
					v1584[1]:Stop(0.3);
					v1584[2]:Stop(0.3);
					u8.channel = false;
					u56("Fist");
					return;
				end;
				local v1593 = v1581.stats.execname.Value;
				if v1581.Name == "Workbench" and u14.chargerating == "blueprint" then
					v1593 = v1593 .. "blueprint" .. u14.damagerating[3];
					if v1581:FindFirstChild("fakeItem") then
						v1593 = "workbench";
					end;
				end;
				l__game__6.ReplicatedStorage.Interactables.interaction:FireServer(v1581, v1593, v5);
				if u97 > 0 then
					u34(-u97, "SALVAGE USED");
				end;
				if v1581.Name == "S.A.N.C Barrel" then
					u34(15, "SALVAGE");
				elseif v1581.Name == "KillSwitch Panel" then
					u34(30, "THE CHOKENING");
				end;
				if v1581.Name == "Scrapper" then
					if u14.weapontype == "Fist" then
						return;
					else
						local v1594 = 5;
						if u14.weapontype == "Spear" or u14.weapontype == "Bludgeon" or u14.weapontype == "Blade" or u14.weapontype == "Axe" then
							local v1595 = 3;
							if u14.rarity ~= nil then
								v1595 = 3 * u14.rarity;
							end;
							v1594 = 5 + v1595;
							if string.sub(u14.name, 1, 7) == "Crafted" then
								v1594 = 2;
							end;
						end;
						local v1596 = u14.woundrating;
						if u14.weapontype == "Bow" or u14.weapontype == "Gun" then
							v1596 = u14.chargerating;
						end;
						if u14.weapontype == "Item" or u14.weapontype == "Bow" or u14.weapontype == "Gun" then
							if u16:FindFirstChild("ammo") == nil or u16:FindFirstChild("ammo") and u16:FindFirstChild("ammo"):FindFirstChild("maxammo") == nil then
								local v1597 = -5 + 5 * v1596;
								if v1597 <= 0 then
									v1594 = 5;
									if v1596 == 0 then
										v1594 = 2;
									end;
								else
									v1594 = v1597 + 8;
								end;
							else
								local v1598 = 1;
								for v1599, v1600 in pairs(v6) do
									if v1600[2] == true then
										v1598 = v1600[3];
									end;
								end;
								local v1601 = 4 * v1596;
								if v1601 <= 0 then
									v1601 = 1;
								end;
								v1594 = math.floor(v1601 * v1598);
							end;
						end;
						u16:Destroy();
						for v1602, v1603 in pairs(v6) do
							if v1603[2] == true then
								v1603[1] = "Fist";
								v1603[3] = nil;
							end;
						end;
						invmanage("updatehud");
						if l__workspace__1.ServerStuff.game.holdout.Value == true then
							v1594 = math.floor(v1594 * 1.5);
						end;
						u34(v1594, "RECYCLED INTO SALVAGE");
						l__workspace__1.ServerStuff.craftItem:FireServer(nil, nil, v6[1][2], v5, true);
						v1585:Disconnect();
						v1586:Disconnect();
						maingui.ChargeOverlay.Visible = false;
						u98 = nil;
						v1584[1]:Stop(0.3);
						v1584[2]:Stop(0.3);
						u8.channel = false;
						u56("Fist");
						return;
					end;
				end;
			end;
			v1585:Disconnect();
			v1586:Disconnect();
			maingui.ChargeOverlay.Visible = false;
			u98 = nil;
			v1584[1]:Stop(0.3);
			v1584[2]:Stop(0.3);
			curentanimset.equip.TimePosition = 0.5;
			curentanimset.equip:AdjustSpeed(0);
			tpcurrentanimset.equip:Play();
			tpcurrentanimset.equip.TimePosition = 0.5;
			tpcurrentanimset.equip:AdjustSpeed(0);
			check_walking_anim();
			u8.action = false;
			u8.channel = false;
		end;
	end;
	if emotelist == false then
		if juggernaut == true then
			return;
		end;
		if l__KeyCode__1540 == Enum.KeyCode.One or l__KeyCode__1540 == Enum.KeyCode.Two or l__KeyCode__1540 == Enum.KeyCode.Three or l__KeyCode__1540 == Enum.KeyCode.Four or l__KeyCode__1540 == Enum.KeyCode.Five or l__KeyCode__1540 == Enum.KeyCode.Six then
			if l__KeyCode__1540 == Enum.KeyCode.Five and v6[5] == nil or l__KeyCode__1540 == Enum.KeyCode.Six and v6[6] == nil then
				return;
			end;
			if l__workspace__1.ServerStuff.game.disableInteraction.Value == true then
				return;
			end;
			if tick() - drawlockout >= 0.3 and tick() - u55 >= 0.3 then
				invmanage("swap", { l__KeyCode__1540, true });
			end;
		end;
	elseif tauntchose[l__KeyCode__1540.Value - 48] ~= nil then
		u132(tauntchose[l__KeyCode__1540.Value - 48]);
	end;
	if l__KeyCode__1540 == Enum.KeyCode.N then
		if u100 == false then
			if emotelist == true then
				emotelist = false;
				maingui.Centre.emotes.Visible = false;
			else
				emotelist = true;
				maingui.Centre.emotes.Visible = true;
			end;
		else
			u100 = false;
		end;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.D and u26.d == false then
		u26.d = true;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.F then
		if u106 == false then
			u106 = true;
		end;
		if v63.buffer_f_key and v63.buffer_f_key == true then
			v63.buffer_f_key = false;
		end;
		if u8.action == false and u8.swapping == false and akimbo_factors.active == false and v64 and v64[1] ~= "survival" and v64[1] ~= "damn" then
			u133(v64[1]);
		end;
	end;
	if l__KeyCode__1540 == Enum.KeyCode.X then
		u55 = tick();
		if u15 ~= "Fist" and u8.channel == false and startperk.Value ~= "hiddenB" and u8.throwing == false and u8.action == false and u8.swapping == false and u8.sprinting == false then
			if l__workspace__1.ServerStuff.game.disableInteraction.Value == true then
				return;
			end;
			u90();
		end;
	end;
end);
local v1604 = UIS.InputEnded:connect(function(p140, p141)
	if p141 == true or spectating == true then
		return;
	end;
	p140 = p140.KeyCode;
	if p140 == Enum.KeyCode.LeftShift then
		u120 = false;
		u8.sprinting = false;
	end;
	if p140 == Enum.KeyCode.W and u26.w == true then
		u26.w = false;
	end;
	if p140 == Enum.KeyCode.A and u26.a == true then
		u26.a = false;
	end;
	if p140 == Enum.KeyCode.S and u26.s == true then
		u26.s = false;
	end;
	if p140 == Enum.KeyCode.D and u26.d == true then
		u26.d = false;
	end;
	if p140 == Enum.KeyCode.F then
		u106 = false;
	end;
	if p140 == Enum.KeyCode.T then
		u123 = false;
	end;
	if p140 == Enum.KeyCode.LeftControl then
		crouch_held = false;
		if u8.sneaking == true then
			u8.sneaking = false;
		end;
	end;
	if p140 == Enum.KeyCode.C and aux_held == true then
		aux_held = false;
	end;
end);
local l__BaseSens__152 = playerstats.Settings.BaseSens;
local u153 = Vector2.new(0, 0);
UIS.InputChanged:connect(function(p142, p143)
	if p143 == true then
		return;
	end;
	if p142.UserInputType == Enum.UserInputType.MouseMovement and u8.turnable == true then
		local l__Delta__1605 = p142.Delta;
		u153 = u153 - Vector2.new(math.rad(l__Delta__1605.X), math.rad(l__Delta__1605.Y)) * l__BaseSens__152 * 0.25 * u74;
		if u153.Y < -1.3962634015954636 or u153.Y > 1.3962634015954636 then
			u153 = u153 + Vector2.new(0, math.rad(l__Delta__1605.Y) * l__BaseSens__152 * 0.25 * u74);
		end;
	end;
end);
local function u154()
	if u8.action == true then
		return;
	end;
	if tick() - u41 < 0.3 then
		return;
	end;
	if curentanimset["swingvar" .. tostring(u42)] == nil or tpcurrentanimset.swing == nil then
		return;
	end;
	u8.action = true;
	u8.swinging = true;
	u8.cancombo = false;
	if u7 > 0 then
		u7 = u7 - 5;
	end;
	u11.stamregen = tick();
	u11.regentick = tick();
	u22("stamina");
	local v1606 = curentanimset["swingvar" .. tostring(u42)];
	local v1607 = 0.65 * u43;
	local v1608 = 0.075 * u14.speedrating;
	if u7 == 0 or u9.Fracture then
		v1608 = 0;
	end;
	if u42 == 3 then
		v1607 = v1607 - 0.1;
	end;
	v1606:Play(0.2, 1, v1607 + v1608);
	local v1609 = tpcurrentanimset.swing;
	if tpcurrentanimset.swing2 and math.random(1, 2) == 1 then
		v1609 = tpcurrentanimset.swing2;
	end;
	if v1609 == nil then
		u8.action = false;
		u8.swinging = false;
		u8.cancombo = false;
		return;
	end;
	v1609:Play(0.1);
	local v1610 = false;
	shakecamera("weapon", { current_anim_set_use, v1606.Name });
	l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", current_anim_set_use }, v1606.Name, character.HumanoidRootPart, v1608 / 10);
	if u14.animset == "1PB" then
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", current_anim_set_use }, "swinglaser", character.HumanoidRootPart, v1608 / 10);
	end;
	if u9["Immolator Buff"] then
		l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "flamer_swing", character.HumanoidRootPart, 0.05);
	end;
	while true do
		u11.stamregen = tick();
		u11.regentick = tick();
		if v1606:GetTimeOfKeyframe("Hit") <= v1606.TimePosition and v1610 == false then
			v1610 = true;
			local v1611 = u14.damagerating[1];
			if u42 == 3 then
				v1611 = u14.damagerating[1] * 2;
			end;
			local v1612 = u44(v1611);
			local u155 = false;
			delay(0.1, function()
				if u8.staggering == false then
					u155 = true;
				end;
			end);
		end;
		RS:wait();
		if v1606.isPlaying == false then
			break;
		end;
		if u8.staggering == true then
			break;
		end;
		if false == true then
			break;
		end;	
	end;
	u8.swinging = false;
	u8.cancombo = true;
	if tpcurrentanimset.swing then
		tpcurrentanimset.swing:Stop(0.45);
	end;
	if v1606 ~= nil then
		v1606:Stop(0.45);
	end;
	if u8.staggering == false then
		curentanimset.equip.TimePosition = 0.5;
		curentanimset.equip:AdjustSpeed(0);
		tpcurrentanimset.equip:Play();
		tpcurrentanimset.equip.TimePosition = 0.5;
		tpcurrentanimset.equip:AdjustSpeed(0);
		check_walking_anim();
		u8.action = false;
	end;
end;
local function u156()
	local v1613 = 0;
	for v1614, v1615 in pairs(v6) do
		if v1615[2] == true then
			v1613 = v1615[3];
		end;
	end;
	if akimbo_factors.active == true and akimbo_factors.alternate == true then
		v1613 = v6[akimbo_factors.weapon_slot][3];
	end;
	if v1613 <= 0 then
		if akimbo_factors.active == true then
			akimbo_factors.alternate = not akimbo_factors.alternate;
		end;
		v104({ "firearms" }, "click", nil, nil, true, true);
		return;
	end;
	local v1616 = false;
	u8.action = true;
	u8.firing = true;
	local v1617 = u14;
	if akimbo_factors.active == true and akimbo_factors.alternate == true then
		v1616 = true;
		v1617 = akimbo_factors.alt_weapon_stats;
	end;
	local v1618 = v1617.auto;
	local v1619 = false;
	local v1620 = 0;
	local v1621 = 1;
	local v1622 = 1;
	local v1623 = nil;
	u33 = false;
	local v1624 = "light";
	local v1625 = v1617.speedrating;
	local v1626 = false;
	if v1617.animset == "LSMG" then
		v1626 = true;
	end;
	local v1627 = true;
	if v1617.ammoused == "Long" then
		v1624 = "sniper";
	elseif v1617.animset == "ASMG" or v1617.name == "MCX VIRTUS" then
		v1624 = "medium";
	elseif v1617.name == "Modded AKM" or v1617.name == "M60-E6" or v1617.name == "M14 EBR" or v1617.name == "FN SCAR-H" or v1617.name == "ASh-12" or v1617.name == "R11 RSASS" or v1617.name == "H&K MR308 A3" then
		v1624 = "heavy";
	elseif v1617.name == "Caldwell 940" or v1617.animset == "RV" or v1617.animset == "DBB" then
		v1624 = nil;
	end;
	if v1617.name == "SPAS-12" or v1617.name == "Atchisson AA-12" or v1617.name == "Kel-Tec KSG" or v1617.name == "Benelli M4" or v1617.name == "Caldwell 940" or v1617.name == "Caldwell Handcannon" or v1617.name == "Model 870" or v1617.name == "MVD KS-23" or u14.name == "Winchester 1901" then
		v1622 = 10;
		v1623 = "shotgun";
		v1624 = "shotgun";
		u33 = true;
		if v1617.name == "MVD KS-23" then
			v1622 = 1;
			u33 = false;
			v1623 = nil;
		end;
	end;
	if v1626 == true then
		v1618 = true;
		local v1628 = tick();
		v1622 = 4;
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v1617.animset }, "wind", character.HumanoidRootPart);
		curentanimset.wind:Play(0.2);
		tpcurrentanimset.wind:Play(0.2);
		u19 = u19 - 6;
		while true do
			RS:wait();
			if tick() - v1628 >= 0.6 then
				break;
			end;		
		end;
	end;
	local v1629 = 0.5;
	if u8.aiming == true then
		v1629 = 0.2;
		if v1624 == "sniper" or v1624 == "shotgun" then
			v1629 = 0.45;
		elseif v1624 == "heavy" or v1617.animset == "PST" or v1617.animset == "2HPST" then
			v1629 = 0.3;
		end;
	end;
	if v1617.name == "TYPE-22 LSR-MG" then
		v1629 = 1;
	end;
	if v1618 == false then
		v1627 = false;
	end;
	local v1630 = "med";
	if v1617.animset == "PST" then
		v1630 = "light";
	end;
	if v1617.name == "Dolch 96" then
		v1630 = "med";
	end;
	if v1617.name == "KRISS Vector" or v1617.name == "CBJ-MS PDW" or v1617.name == "H&K MP5A3" or v1617.name == "PPSh-41" or v1617.name == "Skorpion vz. 61" or v1617.name == "FN P90 TR" or v1617.name == "H&K MP5/10" or v1617.name == "1927A1 Deluxe" then
		v1630 = "light";
	end;
	if v1617.name == "AS Val" or v1617.name == "H&K MR308 A3" or v1617.name == "H&K UMP45" or v1617.name == "IZhMASh SV-98M" or v1617.name == "Modded Pistol" or v1617.name == "Modded AKM" or v1617.name == "Kel-Tec KSG" or v1617.name == "SIG MPX" or v1617.name == "Benelli M4" or v1617.name == "FN SCAR-L" then
		v1630 = "suppressed";
		v1623 = "suppressed";
	end;
	if v1617.name == "A.J.M. 9" then
		v1630 = "light";
		v1621 = 3;
	end;
	if v1617.name == "FAMAS F1" then
		v1621 = 3;
	end;
	local v1631 = "rack";
	if playerperks.recoil and u8.aiming == true then
		v1631 = "lever";
	end;
	if v1617.name == "Model 870" or v1617.name == "Kel-Tec KSG" or v1617.name == "MVD KS-23" then
		local v1632 = 0.4;
		if v1617.name == "MVD KS-23" then
			v1632 = 0.6;
		end;
		local u157 = v1631;
		delay(v1632, function()
			if curentanimset[u157] then
				curentanimset[u157]:Play(0.1);
				delay(0.2, function()
					l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "rack", character.HumanoidRootPart);
				end);
			end;
		end);
	elseif v1617.ammoused == "Long" or v1617.name == "Commissioned Musket" then
		if v1630 ~= "suppressed" then
			v1630 = "heavy";
		end;
		if v1617.name == "Remington 700" or v1617.name == "Karabiner 98k" or v1617.name == "PGM FR-12.7" or v1617.name == "Modded Rifle" or v1617.name == "IZhMASh SV-98M" or v1617.name == "AI-AWSM" or v1617.name == "CheyTac M200" then
			delay(0.4, function()
				curentanimset[v1631]:Play(0.1);
				delay(0.2, function()
					if u8.aiming == true then
						sniperscopefunction("tilt");
					end;
					l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "sniper_bolt", character.HumanoidRootPart);
				end);
			end);
		end;
	end;
	local v1633 = false;
	local v1634 = "fire";
	if v1617.name == "Winchester 940-1" or u14.name == "Winchester 1901" then
		local v1635 = 0.4;
		if fanning_levering == true and u8.aiming == false then
			v1633 = true;
			u157 = "lever";
			v1625 = levering_firerate;
			v1635 = 0.05;
			v1634 = "fan";
		end;
		delay(v1635, function()
			curentanimset[u157]:Play(0.1);
			delay(0.1, function()
				if v1617.name == "Winchester 940-1" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "lever_action", character.HumanoidRootPart);
					return;
				end;
				l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "rack", character.HumanoidRootPart);
			end);
		end);
	end;
	local v1636 = "fire";
	if fanning_levering == true and u8.aiming == false and akimbo_factors.active == false and (v1617.name == "'The Redeemer'" or v1617.name == "Peacemaker" or u14.name == "Peacemaker Uppercut" or u14.name == "Peacemaker Chain") then
		v1633 = true;
		v1636 = "fanning";
		v1625 = fanning_firerate;
		v1634 = "fan";
		v1629 = 1;
	end;
	local v1637 = true;
	if akimbo_factors.active == true and akimbo_factors.alternate == true then
		v1637 = false;
	end;
	if akimbo_factors.active == true then
		akimbo_factors.alternate = not akimbo_factors.alternate;
	end;
	if playerperks.paranoia and v1617.auto == false and v1621 == 1 and v1633 == false then
		v1625 = v1625 * v8.paranoia.efx[2] / 100;
	end;
	if u8.aiming == true then
		sniperscopefunction("shake");
	end;
	while true do
		local v1638 = u65;
		if v1616 == true then
			v1638 = akimbo_factors.alt_tick;
		end;
		if v1625 < tick() - v1638 and v1619 == false then
			local u158 = nil;
			local u159 = nil;
			if v1616 == true then
				akimbo_factors.alt_tick = tick();
			else
				u65 = tick();
			end;
			local v1639 = u16.muzzle.Position;
			if v1616 == true then
				v1639 = akimbo_factors.alt_weapon.muzzle.Position;
			end;
			local v1640 = false;
			if v1623 == "suppressor" then
				v1640 = true;
			end;
			local v1641 = u14.damagerating[4];
			if u14.ammoused and u14.ammoused == "Shells" then
				v1641 = 100;
			end;
			delay(0.05, function()
				l__workspace__1.ServerStuff.applyGore:FireServer("muzzle_flash", character, ply, { v1639, v1640, v1641 });
			end);
			for v1642 = 1, v1622 do
				u159 = v1623;
				u158 = v1616;
				spawn(function()
					u66(u159, u158);
				end);
			end;
			local u160 = v1630;
			local u161 = v1627;
			spawn(function()
				if u158 == true then
					v6[akimbo_factors.weapon_slot][3] = v6[akimbo_factors.weapon_slot][3] - 1;
					if v6[akimbo_factors.weapon_slot][3] < 0 then
						v6[akimbo_factors.weapon_slot][3] = 0;
					end;
				else
					for v1643, v1644 in pairs(v6) do
						if v1644[2] == true and juggernaut == false then
							v1644[3] = v1644[3] - 1;
							if v1644[3] < 0 then
								v1644[3] = 0;
							end;
						end;
					end;
				end;
				local v1645 = v1617.woundrating;
				if u8.aiming == true then
					v1645 = v1645 / 1.25;
				end;
				if v1633 == true then
					v1645 = v1645 / 1.25;
				end;
				u52 = CFrame.new(0, 0.1 + v1617.woundrating / 100, 0);
				delay(0.1, function()
					u52 = CFrame.new(0, 0, 0);
				end);
				if u67 == true and u159 ~= "suppressed" then
					u160 = "indoors";
				end;
				if u67 == true and u159 == "suppressed" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "ballistic_supindoors", character.HumanoidRootPart, 0.1);
				end;
				local v1646 = math.clamp(v1645 - v1645 * u68, 0, 38);
				shakecamera("gunrecoil", { v1646 });
				shakecamera("guntilt", { v1646 });
				l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "bass", character.HumanoidRootPart, 0.1);
				if u160 ~= nil then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "ballistic_" .. u160, character.HumanoidRootPart, 0.1);
					if u160 ~= "suppressed" then
						l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "close_" .. u160, character.HumanoidRootPart, 0.1);
					end;
				end;
				if u159 ~= "suppressed" then
					l__workspace__1.ServerStuff.dealDamage:FireServer("gunsareloud", nil, v5, v4);
				end;
				if v1624 ~= nil then
					delay(math.random(40, 80) / 100, function()
						l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "casing_" .. v1624, character.HumanoidRootPart, 0.15);
					end);
				end;
				if l__game__6.ReplicatedStorage.soundLibrary.weapons[v1617.animset]:FindFirstChild(v1617.name) then
					local v1647 = v104({ "weapons", v1617.animset }, v1617.name, nil, nil, true, true, u160);
					if u161 == true then
						v1647.Volume = v1647.Volume + 0.5;
						u161 = false;
					end;
					if u67 == true then
						v1647.Volume = v1647.Volume + 0.6;
					end;
					local v1648 = v104({ "firearms" }, "mech", nil, nil, true, true);
					for v1649, v1650 in pairs(v6) do
						if v1650[2] == true and v1650[3] <= 5 then
							v1648.Volume = v1648.Volume + 1 + (5 - v1650[3]) / 6;
							v1648.Pitch = v1648.Pitch + (5 - v1650[3]) / 10;
						end;
					end;
					l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v1617.animset }, v1617.name, character.HumanoidRootPart, 0.05, true);
				end;
				invmanage("updatehud");
				if akimbo_factors.active ~= true then
					curentanimset[v1636]:Play(0, v1629);
					tpcurrentanimset[v1634]:Play(0);
					return;
				end;
				if v1637 == true then
					akimbosets.fire_r:Play(0, v1629);
					tpakimbosets.fire_r:Play(0);
					return;
				end;
				akimbosets.fire_l:Play(0, v1629);
				tpakimbosets.fire_l:Play(0);
			end);
			v1620 = v1620 + 1;
			if v1621 == 1 and v1618 == false then
				v1619 = true;
			end;
		end;
		if v1621 <= v1620 and u54 == false then
			v1619 = true;
		end;
		if v1621 > 1 and v1621 <= v1620 then
			v1619 = true;
		end;
		local v1651 = 0;
		for v1652, v1653 in pairs(v6) do
			if v1653[2] == true then
				v1651 = v1653[3];
			end;
		end;
		if v1616 == true then
			v1651 = v6[akimbo_factors.weapon_slot][3];
		end;
		if v1651 <= 0 then
			break;
		end;
		RS:wait();
		if v1619 == true then
			break;
		end;
		if v1617.weapontype ~= "Gun" then
			break;
		end;
		if u8.staggering == true then
			break;
		end;
		if u8.sprinting == true then
			break;
		end;	
	end;
	local v1654 = 0;
	for v1655, v1656 in pairs(v6) do
		if v1656[2] == true then
			v1654 = v1656[3];
		end;
	end;
	if v1618 == false then
		v1654 = v1654 - 1;
	end;
	if v1616 == true then
		v1654 = v6[akimbo_factors.weapon_slot][3];
	end;
	if v1654 <= 0 then
		l__workspace__1.ServerStuff.playAudio:FireServer({ "firearms" }, "empty", character.HumanoidRootPart, 0.05);
	end;
	local v1657 = u16;
	if v1616 == true then
		v1657 = akimbo_factors.alt_weapon;
	end;
	if v1657:FindFirstChild("muzzle") then
		if v1657:FindFirstChild("muzzle"):FindFirstChild("smokebarrel") then
			v1657:FindFirstChild("muzzle"):FindFirstChild("smokebarrel"):Destroy();
		end;
		local v1658 = l__game__6.ReplicatedStorage.effects.smokebarrel:Clone();
		l__Debris__32:AddItem(v1658, 4);
		v1658.Parent = v1657:FindFirstChild("muzzle");
		v1658:Emit(math.random(2, 4));
	end;
	if v1617.weapontype == "Gun" then
		if v1626 == true then
			u19 = u19 + 6;
		end;
		if v1626 == true and u8.staggering == false then
			l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", v1617.animset }, "down", character.HumanoidRootPart);
			local v1659 = tick();
			while true do
				RS:wait();
				if tick() - v1659 >= 0.5 then
					break;
				end;			
			end;
		end;
		if akimbo_factors.active == true then
			curentanimset.equip.TimePosition = 0.5;
			curentanimset.equip:AdjustSpeed(0);
			tpcurrentanimset.equip:Play();
			tpcurrentanimset.equip.TimePosition = 0.5;
			tpcurrentanimset.equip:AdjustSpeed(0);
			check_walking_anim();
		end;
	end;
	if u8.staggering == false then
		u8.firing = false;
		u8.action = false;
	end;
end;
local function u162()
	for v1660, v1661 in pairs(v6) do
		if v1661[2] == true and v1661[3] <= 0 then
			return;
		end;
	end;
	u8.action = true;
	u8.firing = true;
	local v1662 = false;
	local v1663 = tick();
	local v1664 = u14.speedrating;
	if playerperks.hunts then
		v1664 = math.clamp(v1664 - v1664 * v8.hunts.efx[1] / 100, 0.05, 100);
	end;
	local l__arrowdraw__1665 = curentanimset.arrowdraw;
	local l__arrowdraw__1666 = tpcurrentanimset.arrowdraw;
	l__arrowdraw__1665:Play(0.1);
	local u163 = nil;
	u163 = l__arrowdraw__1665.KeyframeReached:connect(function(p144)
		if p144 == "Stop" then
			if u54 == true then
				l__arrowdraw__1665:AdjustSpeed(0);
			else
				l__arrowdraw__1665:AdjustSpeed(1);
			end;
			u163:Disconnect();
		end;
	end);
	l__arrowdraw__1666:Play(0.1);
	local u164 = nil;
	u164 = l__arrowdraw__1666.KeyframeReached:connect(function(p145)
		if p145 == "Stop" then
			if u54 == true then
				l__arrowdraw__1666:AdjustSpeed(0);
			else
				l__arrowdraw__1666:AdjustSpeed(1);
			end;
			u164:Disconnect();
		end;
	end);
	local v1667 = l__game__6.ReplicatedStorage.soundLibrary.weapons["2HBOW"].arrowpull:Clone();
	v1667.Parent = character.HumanoidRootPart;
	v1667:Play();
	local v1668 = false;
	while true do
		if u54 == false and tick() - v1663 >= 0.3 then
			v1662 = false;
			break;
		end;
		if (tick() - v1663) / v1664 >= 1 and v1668 == false then
			v1668 = true;
			v104({ "weapons", "2HBOW" }, "notch", nil, nil, true, true);
		end;
		RS:wait();
		if v1662 == true then
			break;
		end;
		if u14.weapontype ~= "Bow" then
			break;
		end;
		if u8.staggering == true then
			break;
		end;	
	end;
	if u14.weapontype ~= "Bow" then
		v1662 = true;
	end;
	v1667:Destroy();
	maingui.ChargeOverlay.Visible = false;
	if v1662 == true then
		l__arrowdraw__1665:Stop(0.1);
		l__arrowdraw__1666:Stop(0.1);
	else
		shakecamera("gunrecoil", { 3 });
		local v1669 = u14.damagerating[1];
		if u14.speedrating <= tick() - v1663 then
			v1669 = u14.damagerating[3];
		end;
		spawn(function()
			u44(v1669);
		end);
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", u14.animset }, "fire", character.HumanoidRootPart, 0.1);
		l__arrowdraw__1665:Stop(0.4);
		l__arrowdraw__1666:Stop(0.4);
		if u14.weapontype == "Bow" then
			for v1670, v1671 in ipairs(u16.arrow:GetChildren()) do
				if v1671:IsA("BasePart") then
					v1671.Transparency = 1;
				end;
			end;
		end;
		u69 = false;
		u8.aiming = false;
		for v1672, v1673 in pairs(v6) do
			if v1673[2] == true then
				v1673[3] = v1673[3] - 1;
			end;
		end;
		invmanage("updatehud");
		for v1674 = 1, 30 do
			RS:wait();
			if u8.staggering == true then
				break;
			end;
			if u14.weapontype ~= "Bow" then
				break;
			end;
		end;
	end;
	if u14.weapontype == "Bow" then
		curentanimset.equip.TimePosition = 0.5;
		curentanimset.equip:AdjustSpeed(0);
		tpcurrentanimset.equip:Play();
		tpcurrentanimset.equip.TimePosition = 0.5;
		tpcurrentanimset.equip:AdjustSpeed(0);
		check_walking_anim();
	end;
	if u8.staggering == false then
		u8.firing = false;
		u8.action = false;
	end;
end;
local function u165()
	if u8.swapping == true then
		return;
	end;
	if u9.Snared then
		return;
	end;
	if u14.name == "Crafted Backpack" and v6[5] ~= nil then
		return;
	end;
	if u14.name == "Backpack" and v6[6] ~= nil then
		maingui.Thought.thoughttext.Text = "Surprisingly, I am already wearing one.";
		inner_dialogue = tick();
		return;
	end;
	if (u14.name == "Advanced IFAK" or u14.name == "Cocktail \"Perithesene\"") and u9.Toxins then
		maingui.Thought.thoughttext.Text = "I can't use this right now...";
		inner_dialogue = tick();
		return;
	end;
	drawlockout = tick();
	for v1675, v1676 in pairs(v6) do
		if v1676[2] == true then
			if v1676[3] == nil then
				return;
			end;
			if v1676[3] == 0 then
				return;
			end;
		end;
	end;
	u8.action = true;
	u8.channel = true;
	u10 = 0.1;
	u8.turnable = false;
	local v1677 = curentanimset.new_stim;
	local v1678 = tpcurrentanimset.inject;
	if u14.name == "Hemostatic Zanustin" then
		v1677 = curentanimset.inject;
		v1678 = tpcurrentanimset.inject;
	end;
	if u14.name == "Backpack" or u14.name == "Crafted Backpack" or u14.name == "Tactical Armour" then
		v1677 = curentanimset.backpack;
		v1678 = tpcurrentanimset.equippack;
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "backpack", character.HumanoidRootPart);
	elseif u14.name == "Advanced IFAK" or u14.name == "Crude Bandage" or u14.name == "Aseptic Bandage" or u14.name == "Crafted Splint" then
		v1677 = curentanimset.firstaid;
		v1678 = tpcurrentanimset.firstaid;
		if u14.name == "Crude Bandage" or u14.name == "Aseptic Bandage" or u14.name == "Crafted Splint" then
			v1677 = curentanimset.bandage;
			v1678 = tpcurrentanimset.bandage;
			if u14.name == "Crafted Splint" then
				v1678 = tpcurrentanimset.splint;
			end;
		end;
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "firstaid", character.HumanoidRootPart);
	elseif u14.name == "Esmarch Tourniquet" then
		v1677 = curentanimset.tourniquet;
		v1678 = tpcurrentanimset.bandage;
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "esmarch", character.HumanoidRootPart);
	elseif u14.name == "Smoke Launcher" then
		v1677 = curentanimset.fire;
		v1678 = tpcurrentanimset.fire;
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "smokedraw", character.HumanoidRootPart);
	elseif u14.name == "First Aid Kit" then
		v1677 = curentanimset.medikit;
		v1678 = tpcurrentanimset.medikit;
	elseif u14.name == "Juggernaut Kit" then
		v1677 = curentanimset.use;
		v1678 = tpcurrentanimset.use;
	elseif u14.animset == "AGENTC" then
		v1677 = curentanimset.use;
		v1678 = tpcurrentanimset.use;
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "opencontainer", character.HumanoidRootPart);
	elseif u14.name == "Immobilising Splint" then
		v1677 = curentanimset.splint;
		v1678 = tpcurrentanimset.splint;
	elseif u14.name == "Amoxicillin Tablets" then
		v1677 = curentanimset.painkillers;
		v1678 = tpcurrentanimset.takepill;
	elseif u14.name == "Augmentin Antibiotics" then
		v1677 = curentanimset.bottlepills;
		v1678 = tpcurrentanimset.takepill;
	end;
	v1677:Play(0.1);
	if v1677 == curentanimset.new_stim then
		delay(0.1, function()
			l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "new_stim", character.HumanoidRootPart);
			if u16:FindFirstChild("Model") and u16:FindFirstChild("Model"):FindFirstChild("CAP") then
				u16:FindFirstChild("Model"):FindFirstChild("CAP").Transparency = 1;
			end;
		end);
	end;
	local v1679 = v1677.KeyframeReached:connect(function(p146)
		if p146 == "Stop" then
			v1677:AdjustSpeed(0);
			if v1677 == curentanimset.inject then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "stimuse", character.HumanoidRootPart);
				return;
			else
				return;
			end;
		else
			if p146 == "Load" then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "smokeload", character.HumanoidRootPart);
				return;
			end;
			if p146 == "OpenSplint" then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "splint", character.HumanoidRootPart);
				return;
			end;
			if p146 == "PillOut" then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "bottlepill", character.HumanoidRootPart);
				return;
			end;
			if p146 == "PushPill" then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "painkillerspill", character.HumanoidRootPart);
				return;
			end;
			if p146 ~= "Lid" then
				if p146 == "Spit" then
					v104({ "weapons", "Item" }, "medikitspit", nil, nil, true, true);
					return;
				elseif p146 == "Clip" then
					v104({ "weapons", "Item" }, "clipopen", nil, nil, true, true);
					return;
				elseif p146 == "Inject" then
					v104({ "weapons", "Item" }, "medikitinject", nil, nil, true, true);
					return;
				else
					if p146 == "Flick" then
						v104({ "weapons", "Item" }, "medikitflick", nil, nil, true, true);
					end;
					return;
				end;
			end;
		end;
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "medikitcap", character.HumanoidRootPart);
	end);
	v1678:Play(0.1);
	local u166 = nil;
	u166 = v1678.KeyframeReached:connect(function(p147)
		if p147 == "Stop" then
			if u54 == true then
				v1678:AdjustSpeed(0);
			else
				v1678:AdjustSpeed(1);
			end;
			u166:Disconnect();
		end;
	end);
	u71(u14.name);
	if u14.name == "Backpack" or u14.name == "Crafted Backpack" or u14.name == "Tactical Armour" then
		shakecamera("backpack");
	elseif u14.name ~= "Advanced IFAK" and u14.name ~= "Crude Bandage" and u14.name ~= "Aseptic Bandage" and u14.name ~= "Medikit" then
		shakecamera("usestim");
	end;
	local v1680 = tick();
	local v1681 = tick();
	local v1682 = true;
	while true do
		drawlockout = tick();
		maingui.ChargeOverlay.ChargeOverlay.Size = UDim2.new(math.clamp((tick() - v1681) / u14.speedrating, 0, 1), 0, 1, 0);
		if tick() - v1680 > 6 then
			v1682 = false;
			maingui.ChargeOverlay.Visible = false;
			break;
		end;
		if u54 == false then
			v1682 = false;
			break;
		end;
		RS:wait();
		if u14.speedrating <= tick() - v1681 then
			break;
		end;
		if u8.staggering == true then
			break;
		end;	
	end;
	drawlockout = tick();
	v1677:Stop();
	v1678:Stop();
	if v1682 == true and u8.staggering == false then
		maingui.ChargeOverlay.Visible = false;
		invmanage("updatehud");
		if u14.name == "Cocktail \"Perithesene\"" then
			if v64[2].sickstimmod == true then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Psn);
			else
				l__workspace__1.ServerStuff.dealDamage:FireServer("stimheal", nil, v5, v4);
				if u9.Bleed then
					u9.Bleed.effects.currentduration = 0;
				end;
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
			end;
		elseif u14.name == "Hemostatic Zanustin" then
			if v64[2].sickstimmod == true then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Psn);
			else
				l__workspace__1.ServerStuff.dealDamage:FireServer("regenheal", nil, v5, v4);
				v104({ "weapons", "Item" }, "adrenal", nil, nil, true, true);
				afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Pnk);
				if u9.Cripple then
					u9.Cripple.effects.currentduration = 0;
				end;
			end;
		elseif u14.name == "Compound Z" then
			afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS)["Speedy Thrusts"]);
			afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS)["Muscle Milk"]);
			afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS)["Lung Butter"]);
			afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS)["Iron 4 Skin"]);
			createfxoutline("compoundParticle", 60);
		elseif u14.name == "Backpack" then
			v6[6] = { "Fist", false, nil };
			maingui.InventoryFrame.slot6.Visible = true;
			if v6[5] == nil then
				v6[5] = { "Fist", false, nil };
				maingui.InventoryFrame.slot5.Visible = true;
			end;
		elseif u14.name == "Crafted Backpack" then
			v6[5] = { "Fist", false, nil };
			maingui.InventoryFrame.slot5.Visible = true;
		elseif u14.name == "Tactical Armour" then
			l__workspace__1.ServerStuff.dealDamage:FireServer("putarmour", nil, v5, v4);
			afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Arm);
		elseif u14.name == "Advanced IFAK" then
			l__workspace__1.ServerStuff.dealDamage:FireServer("faidheal", nil, v5, v4);
			if u9.Bleed then
				u9.Bleed.effects.currentduration = 0;
			end;
		elseif u14.name == "Crude Bandage" then
			local v1683 = true;
			if u9.Bleed and u9["Arterial Bleed"] == nil then
				v1683 = false;
				u9.Bleed.effects.currentduration = 0;
			end;
			if v1683 == true then
				l__workspace__1.ServerStuff.dealDamage:FireServer("regenheal", nil, v5, v4);
			end;
		elseif u14.name == "Aseptic Bandage" then
			if u9.Bleed then
				u9.Bleed.effects.currentduration = 0;
			end;
			afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).BldPrv);
		elseif u14.name == "Immobilising Splint" then
			local v1684 = 0;
			if u9.Cripple then
				v1684 = v1684 + 1;
				u9.Cripple.effects.currentduration = 0;
			end;
			if u9.Fracture then
				v1684 = v1684 + 1;
				u9.Fracture.effects.currentduration = 0;
			end;
			if v1684 < 4 then
				afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).CrpPrv);
			end;
		elseif u14.name == "Esmarch Tourniquet" then
			if u9["Arterial Bleed"] then
				u9["Arterial Bleed"].effects.currentduration = 0;
			end;
			RS:wait();
			if u9.Bleed then
				u9.Bleed.effects.currentduration = 0;
			end;
		elseif u14.name == "First Aid Kit" then
			l__workspace__1.ServerStuff.dealDamage:FireServer("ai2heal", nil, v5, v4);
		elseif u14.name == "Crafted Splint" then
			local v1685 = true;
			if u9.Fracture then
				v1685 = false;
				u9.Fracture.effects.currentduration = 0;
			end;
			if u9.Cripple and v1685 == true then
				u9.Cripple.effects.currentduration = 0;
			end;
		elseif u14.name == "Amoxicillin Tablets" then
			local v1686 = u9["Virus Stage 1"];
			if v1686 == nil then
				v1686 = u9["Virus Stage 2"];
			end;
			if v1686 == nil then
				v1686 = u9["Virus Stage 3"];
			end;
			if v1686 == nil then
				v1686 = u9["Virus Stage 4"];
			end;
			if v1686 ~= nil then
				v1686.effects.currentduration = tick();
			end;
		elseif u14.name == "Augmentin Antibiotics" then
			u75 = u75 + 1;
			u76 = tick();
			local v1687 = u9["Virus Stage 1"];
			if v1687 == nil then
				v1687 = u9["Virus Stage 2"];
			end;
			if v1687 == nil then
				v1687 = u9["Virus Stage 3"];
			end;
			if v1687 == nil then
				v1687 = u9["Virus Stage 4"];
			end;
			if v1687 ~= nil and u77 == false then
				spawn(function()
					u77 = true;
					local v1688 = 30 * u75;
					local v1689 = math.clamp(330 - v1688, 30, 180);
					while true do
						local v1690 = math.clamp(330 - v1688, 30, 180);
						v1687.effects.currentduration = tick();
						RS:wait();
						if v1690 <= tick() - u76 then
							break;
						end;					
					end;
					u77 = false;
				end);
			end;
		elseif u14.name == "Berserk Injector" then
			afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Brz);
			afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Bls);
			afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Rgn);
		elseif u14.name == "Smoke Launcher" then
			l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "smokefire", character.HumanoidRootPart);
			l__workspace__1.ServerStuff.dealDamage:FireServer("fireSmoke", l__CurrentCamera__1.CFrame, v5, v4);
		elseif u14.animset == "AGENTC" then
			for v1691, v1692 in pairs(v6) do
				if v1692[2] == true and v1692[4] ~= nil then
					l__workspace__1.ServerStuff.dropAmmo:FireServer("redeemcontainer", v1692[4]);
					v1692[4] = nil;
					break;
				end;
			end;
		else
			if u14.name == "Juggernaut Kit" then
				u78 = false;
				u8.channel = false;
				u8.turnable = true;
				u8.action = false;
				u10 = 10;
				return;
			end;
			if u16:FindFirstChild("trapped") then
				if playerperks.chemist then
					afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Rgn);
				else
					afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Scs);
					local l__Prc__1693 = require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Prc;
					l__Prc__1693.intensity = 4;
					local l__Crp__1694 = require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Crp;
					l__Crp__1694.intensity = 4;
					afflictstatus(l__Prc__1693);
					afflictstatus(l__Crp__1694);
				end;
			elseif v64[2].sickstimmod == true then
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Tnt);
				afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Psn);
			else
				afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS)[u14.name]);
				local v1695 = Color3.fromRGB(107, 50, 124);
				if u14.name == "3-(cbSTM)" then
					u7 = v66;
					u22("stamina");
					if u9.Fracture then
						u9.Fracture.effects.currentduration = 0;
					end;
				elseif u14.name == "BL1 (Neloprephine)" then
					v1695 = Color3.fromRGB(213, 115, 61);
					if u9["Death Morale 1"] then
						u9["Death Morale 1"].effects.currentduration = 0;
					end;
				elseif u14.name == "I4S-DS" then
					v1695 = Color3.fromRGB(80, 109, 84);
					afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Rgn);
				elseif u14.name == "S44-UL1" then
					v1695 = Color3.fromRGB(110, 153, 202);
				end;
				spawn(function()
					local v1696 = l__game__6.ReplicatedStorage.misc.StimFlash:Clone();
					v1696.ImageColor3 = v1695;
					v1696.Parent = maingui;
					while true do
						v1696.ImageTransparency = v1696.ImageTransparency + 0.05;
						v1696.Size = v1696.Size + UDim2.new(0, 1, 0, 1);
						RS:wait();
						if v1696.ImageTransparency >= 1 then
							break;
						end;					
					end;
					v1696:Destroy();
				end);
			end;
		end;
	end;
	maingui.ChargeOverlay.Visible = false;
	u78 = false;
	u8.channel = false;
	if u8.turnable == false then
		u8.turnable = true;
		u10 = 10;
	end;
	v1678:Stop();
	v1677:Stop();
	v1679:Disconnect();
	if u8.staggering == false then
		curentanimset.equip.TimePosition = 0.5;
		curentanimset.equip:AdjustSpeed(0);
		tpcurrentanimset.equip:Play();
		tpcurrentanimset.equip.TimePosition = 0.5;
		tpcurrentanimset.equip:AdjustSpeed(0);
		check_walking_anim();
	end;
	if v1682 == true then
		for v1697, v1698 in pairs(v6) do
			if v1698[2] == true and v1698[3] then
				v1698[3] = v1698[3] - 1;
			end;
		end;
	end;
	local v1699 = false;
	for v1700, v1701 in pairs(v6) do
		if v1701[2] == true and v1701[3] <= 0 then
			v1699 = true;
		end;
	end;
	if v1699 == false or v1682 == false then
		if u8.staggering == false then
			u8.action = false;
		end;
	else
		u16:Destroy();
		for v1702, v1703 in pairs(v6) do
			if v1703[2] == true then
				v1703[1] = "Fist";
				v1703[3] = nil;
			end;
		end;
		l__workspace__1.ServerStuff.useupItem:FireServer();
		u56("Fist");
	end;
	invmanage("updatehud");
end;
local function u167(p148)
	if u14.animset == "LSMG" then
		return;
	end;
	if tick() - drawlockout < 0.3 then
		return;
	end;
	u8.throwing = true;
	u8.action = true;
	if u7 > 0 then
		u7 = u7 - 5;
	end;
	u11.stamregen = tick();
	u11.regentick = tick();
	u12 = 1;
	u22("stamina");
	cancel_throw = false;
	if curentanimset.throw then
		local v1704 = curentanimset.throw;
	else
		v1704 = globalanimsets.throw;
	end;
	if u14.animset == "2HSPR" then
		local v1705 = tpcurrentanimset.throw;
	else
		v1705 = tpglobalanimsets.throw;
	end;
	v1704:Play(0.2);
	v1704:AdjustSpeed(0.65);
	v1705:Play(0.5);
	v1705:AdjustSpeed(0.75);
	local u168 = false;
	local v1706 = v1704.KeyframeReached:connect(function(p149)
		if p149 == "Stop" then
			v1704:AdjustSpeed(0);
			u168 = true;
		end;
	end);
	local v1707 = v1705.KeyframeReached:connect(function(p150)
		if p150 == "Stop" then
			v1705:AdjustSpeed(0);
		end;
	end);
	l__workspace__1.ServerStuff.playAudio:FireServer({ "general_ui" }, "equip_throw", character.HumanoidRootPart);
	if u14.animset == "THRW" then
		delay(0.4, function()
			if u14.name ~= "Crafted Explosive" and u14.name ~= "Dynamite" and u14.name ~= "Fire Bomb" then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", "Item" }, "pinpull", character.HumanoidRootPart);
				return;
			end;
			l__workspace__1.ServerStuff.playAudio:FireServer({ "echo_specific" }, "lighter", character.HumanoidRootPart);
			delay(0.3, function()
				l__workspace__1.ServerStuff.playAudio:FireServer({ "echo_specific" }, "lighter", character.HumanoidRootPart);
			end);
		end);
	end;
	local v1708 = tick();
	maingui.Centre.crosshair.A1.Visible = false;
	maingui.Centre.crosshair.A2.Visible = false;
	maingui.Centre.crosshair.dot.Visible = false;
	maingui.Centre.crosshair.B1.Size = UDim2.new(0, 20, 0, 2);
	maingui.Centre.crosshair.B2.Size = UDim2.new(0, 20, 0, 2);
	while true do
		RS:wait();
		if u14.name == "Dynamite" or u14.name == "Crafted Explosive" or u14.name == "M67 Grenade" or u14.name == "Fire Bomb" then
			if u14.throwrating <= tick() - v1708 and u8.throwing == true then
				u54 = false;
			end;
		elseif cancel_throw == true then
			u168 = false;
			u8.throwing = false;
			break;
		end;
		if u54 == false and u168 == true then
			break;
		end;
		if u8.throwing == false then
			break;
		end;	
	end;
	if u14.throwrating == nil or u8.swapping == true then
		u8.throwing = false;
	end;
	if u8.throwing == false then
		maingui.Centre.crosshair.A1.Visible = true;
		maingui.Centre.crosshair.A2.Visible = true;
		maingui.Centre.crosshair.dot.Visible = true;
		maingui.Centre.crosshair.B1.Size = UDim2.new(0, 10, 0, 2);
		maingui.Centre.crosshair.B2.Size = UDim2.new(0, 10, 0, 2);
		u8.action = false;
		curentanimset.equip.TimePosition = 0.5;
		curentanimset.equip:AdjustSpeed(0);
		tpcurrentanimset.equip:Play();
		tpcurrentanimset.equip.TimePosition = 0.5;
		tpcurrentanimset.equip:AdjustSpeed(0);
		check_walking_anim();
	end;
	local v1709 = (tick() - v1708) / u14.throwrating;
	v1706:Disconnect();
	v1707:Disconnect();
	u55 = tick();
	if u8.throwing == true then
		local v1710 = u16:FindFirstChild("ammo");
		local v1711 = true;
		for v1712, v1713 in pairs(v6) do
			if v1713[2] == true and v1713[3] ~= nil then
				if v1710 and p148 == "mouse" then
					v1711 = false;
					v1713[3] = v1713[3] - 1;
				end;
				v1710 = v1713[3];
			end;
		end;
		if v1710 and p148 == "mouse" and v1711 == false and v1710 > 0 then
			v1710 = 1;
		else
			u16:Destroy();
			for v1714, v1715 in pairs(v6) do
				if v1715[2] == true then
					v1715[1] = "Fist";
					v1715[3] = nil;
				end;
			end;
		end;
		if u16:FindFirstChild("trapped") then
			v1710 = "trapped";
		end;
		local v1716 = nil;
		local v1717 = globalanimsets.toss;
		if u14.name == "M67 Grenade" or u14.name == "Dynamite" or u14.name == "Crafted Explosive" or u14.name == "Fire Bomb" then
			v1717 = globalanimsets.underhand;
			v1716 = "underhand";
		end;
		v1704:Stop(0.3);
		v1717:Play(0.2, 1, 1.2);
		v1705.TimePosition = 0.3;
		v1705:AdjustSpeed(1);
		u20 = u14.name;
		if v1716 == "underhand" then
			l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "toss", character.HumanoidRootPart);
		else
			l__workspace__1.ServerStuff.playAudio:FireServer({ "general_ui" }, "throw_fast", character.HumanoidRootPart);
		end;
		l__workspace__1.ServerStuff.throwWeapon:FireServer(u15, u14.damagerating[2], l__CurrentCamera__1.CFrame, v1709, u14, v1710, v6[1][2], v5, v1716, v4);
		while true do
			RS:wait();
			if v1717.IsPlaying == false then
				break;
			end;		
		end;
		maingui.Centre.crosshair.A1.Visible = true;
		maingui.Centre.crosshair.A2.Visible = true;
		maingui.Centre.crosshair.dot.Visible = true;
		maingui.Centre.crosshair.B1.Size = UDim2.new(0, 10, 0, 2);
		maingui.Centre.crosshair.B2.Size = UDim2.new(0, 10, 0, 2);
		u8.throwing = false;
		if v1710 and p148 == "mouse" and v1711 == false and v1710 > 0 then
			u8.action = false;
			curentanimset.equip.TimePosition = 0.5;
			curentanimset.equip:AdjustSpeed(0);
			tpcurrentanimset.equip:Play();
			tpcurrentanimset.equip.TimePosition = 0.5;
			tpcurrentanimset.equip:AdjustSpeed(0);
			check_walking_anim();
		else
			v1717:Stop(0.3);
			v1705:Stop(0.3);
			u56("Fist");
		end;
		invmanage("updatehud");
		u11.stamregen = tick();
		u11.regentick = tick();
		u12 = 0.0175;
	end;
end;
local function u169()
	for v1718, v1719 in pairs(v6) do
		if v1719[2] == true and v1719[3] <= 0 then
			return;
		end;
	end;
	local v1720, v1721 = raycastline((character.HumanoidRootPart.CFrame + character.HumanoidRootPart.CFrame.lookVector * 3).p, -character.HumanoidRootPart.CFrame.upVector, 4, baselayer);
	if v1720 and u8.air == false then
		local v1722 = nil;
		local v1723 = nil;
		local v1724 = nil;
		local v1725 = nil;
		local v1726 = nil;
		local v1727 = nil;
		local v1728 = nil;
		local v1729 = nil;
		local v1730 = nil;
		local v1731 = nil;
		if raycastline((character.HumanoidRootPart.CFrame - character.HumanoidRootPart.CFrame.upVector * 3).p, character.HumanoidRootPart.CFrame.lookVector, 4, baselayer) then
			return;
		end;
		if u14.name == "Steel Punjis" or u14.name == "Crafted Punjis" then
			local v1732 = math.huge;
			for v1733, v1734 in ipairs(l__workspace__1.PlayerTraps:GetChildren()) do
				if v1734.Name == "Punjis" and (v1721 - v1734.base.Position).magnitude < v1732 then
					v1732 = (v1721 - v1734.base.Position).magnitude;
				end;
			end;
			if v1732 <= 4 then
				return;
			end;
		end;
		if u14.name == "Crafted Pavise" then
			local v1735 = math.huge;
			for v1736, v1737 in ipairs(l__workspace__1.PlayerTraps:GetChildren()) do
				if v1737.Name == "Pavise" and (v1721 - v1737.base.Position).magnitude < v1735 then
					v1735 = (v1721 - v1737.base.Position).magnitude;
				end;
			end;
			if v1735 <= 3 then
				return;
			end;
		end;
		u8.action = true;
		u8.turnable = false;
		u8.walking = false;
		local v1738 = 1;
		u8.channel = true;
		u8.blocking = false;
		l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
		u11.stamregen = tick();
		u11.regentick = tick();
		u12 = 0.0175;
		local v1739 = { globalanimsets.interact, tpglobalanimsets.interact };
		v1739[1]:Play(0.1);
		v1739[2]:Play(0.1);
		local v1740 = v1739[1].KeyframeReached:connect(function(p151)
			if p151 == "Stop" then
				v1739[1]:AdjustSpeed(0);
			end;
		end);
		local v1741 = v1739[2].KeyframeReached:connect(function(p152)
			if p152 == "Stop" then
				v1739[2]:AdjustSpeed(0);
			end;
		end);
		u71(u14.name);
		local v1742 = tick();
		local v1743 = false;
		local v1744 = nil;
		if u14.name == "Proximity Mine" then
			v1744 = l__game__6.ReplicatedStorage.misc.ProxMine:Clone();
		elseif u14.name == "Crafted Pavise" then
			v1744 = l__game__6.ReplicatedStorage.misc.Pavise:Clone();
		elseif u14.name == "Steel Punjis" or u14.name == "Crafted Punjis" then
			v1744 = l__game__6.ReplicatedStorage.misc.Punjis:Clone();
			v1744:FindFirstChild(u14.name):Destroy();
		elseif u14.name == "Remote Explosive" then
			v1744 = l__game__6.ReplicatedStorage.misc.RemoteEx:Clone();
			v1738 = 1.5;
		elseif u14.name == "Steel Snares" then
			v1738 = 2;
			v1744 = l__game__6.ReplicatedStorage.misc.Snare:Clone();
		end;
		v1744.Parent = l__CurrentCamera__1;
		v1744:SetPrimaryPartCFrame((ply.Character.HumanoidRootPart.CFrame + ply.Character.HumanoidRootPart.CFrame.lookVector * 3) * CFrame.new(0, -2.75, 0));
		if u14.name == "Steel Punjis" or u14.name == "Crafted Punjis" then
			v1744:SetPrimaryPartCFrame((ply.Character.HumanoidRootPart.CFrame + ply.Character.HumanoidRootPart.CFrame.lookVector * 3) * CFrame.new(0, -2.5, 0));
		elseif u14.name == "Steel Snares" then
			v1744:SetPrimaryPartCFrame((ply.Character.HumanoidRootPart.CFrame + ply.Character.HumanoidRootPart.CFrame.lookVector * 3) * CFrame.new(0, -2.25, 0));
		elseif u14.name == "Crafted Pavise" then
			v1744:SetPrimaryPartCFrame((ply.Character.HumanoidRootPart.CFrame + ply.Character.HumanoidRootPart.CFrame.lookVector * 3) * CFrame.new(0, -2, 0));
		end;
		for v1745, v1746 in ipairs(v1744:GetDescendants()) do
			if v1746:IsA("BasePart") and v1746.Transparency == 0 then
				v1746.BrickColor = BrickColor.new("Bright green");
				v1746.Material = "Neon";
				v1746.Transparency = 0.5;
				v1746.Anchored = true;
				v1746.CanCollide = false;
				v1746.Locked = true;
			elseif not v1746:IsA("Folder") then
				v1746:Destroy();
			end;
		end;
		if playerperks.trapper then
			v1738 = v1738 - v1738 * v8.trapper.efx[1] / 100;
		end;
		local v1747 = v1738 - v1738 * v52;
		while true do
			if u54 == false then
				v1743 = true;
				break;
			end;
			if u8.walking == true then
				v1743 = true;
				break;
			end;
			maingui.ChargeOverlay.ChargeOverlay.Size = UDim2.new((tick() - v1742) / v1747, 0, 1, 0);
			RS:wait();
			if v1747 <= tick() - v1742 then
				break;
			end;
			if u8.staggering == true then
				break;
			end;		
		end;
		v1744:Destroy();
		v1739[1]:Stop();
		v1739[2]:Stop();
		v1740:Disconnect();
		v1741:Disconnect();
		maingui.ChargeOverlay.Visible = false;
		u8.channel = false;
		u8.turnable = true;
		if v1743 == false then
			if u8.staggering == false then
				for v1748, v1749 in pairs(v6) do
					if v1749[2] == true then
						v1749[3] = v1749[3] - 1;
					end;
				end;
				l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "DeployablesSet", 1 });
				invmanage("updatehud");
				if u14.name == "Proximity Mine" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "mineset", character.HumanoidRootPart);
				elseif u14.name == "Steel Punjis" or u14.name == "Crafted Punjis" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "punjiset", character.HumanoidRootPart);
				elseif u14.name == "Crafted Pavise" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "craftdone", character.HumanoidRootPart);
				elseif u14.name == "Remote Explosive" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "explosiveset", character.HumanoidRootPart);
				elseif u14.name == "Steel Snares" then
					l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "snareset", character.HumanoidRootPart);
					spawn(function()
						local v1750 = l__game__6.ReplicatedStorage.misc.snareindicators:Clone();
						l__Debris__32:AddItem(v1750, 10);
						v1750.CFrame = (character.HumanoidRootPart.CFrame + character.HumanoidRootPart.CFrame.lookVector * 3) * CFrame.new(0, -2.25, 0);
						v1750.Parent = l__workspace__1.NoTarget;
						delay(2, function()
							for v1751 = 1, 20 do
								v1750.Transparency = v1751 / 20;
								RS:wait();
							end;
							v1750:Destroy();
						end);
					end);
				end;
				l__workspace__1.ServerStuff.deployTrap:FireServer(u14.name, v5, v4);
				local l__throw__1752 = tpglobalanimsets.throw;
				globalanimsets.toss:Play(0.2);
				l__throw__1752.TimePosition = 0.3;
				l__throw__1752:AdjustSpeed(1);
				while true do
					RS:wait();
					if globalanimsets.toss.IsPlaying == false then
						break;
					end;				
				end;
				globalanimsets.toss:Stop(0.3);
				l__throw__1752:Stop(0.3);
				curentanimset.equip.TimePosition = 0.5;
				curentanimset.equip:AdjustSpeed(0);
				tpcurrentanimset.equip:Play();
				tpcurrentanimset.equip.TimePosition = 0.5;
				tpcurrentanimset.equip:AdjustSpeed(0);
				check_walking_anim();
				local v1753 = false;
				for v1754, v1755 in pairs(v6) do
					if v1755[2] == true and v1755[3] <= 0 then
						v1753 = true;
					end;
				end;
				if u14.name == "Remote Explosive" then
					v1753 = false;
				end;
				if v1753 == false then
					u8.action = false;
					return;
				else
					u16:Destroy();
					for v1756, v1757 in pairs(v6) do
						if v1757[2] == true then
							v1757[1] = "Fist";
							v1757[3] = nil;
						end;
					end;
					invmanage("updatehud");
					l__workspace__1.ServerStuff.useupItem:FireServer();
					u56("Fist");
					return;
				end;
			end;
			v1722 = u8;
			v1724 = false;
			v1723 = "action";
			v1725 = v1722;
			v1726 = v1723;
			v1727 = v1724;
			v1725[v1726] = v1727;
			local v1758 = u8;
			local v1759 = "staggering";
			v1728 = v1758;
			v1729 = v1759;
			local v1760 = v1728[v1729];
			local v1761 = false;
			v1730 = v1760;
			v1731 = v1761;
			if v1730 == v1731 then
				curentanimset.equip.TimePosition = 0.5;
				curentanimset.equip:AdjustSpeed(0);
				tpcurrentanimset.equip:Play();
				tpcurrentanimset.equip.TimePosition = 0.5;
				tpcurrentanimset.equip:AdjustSpeed(0);
				check_walking_anim();
			end;
		else
			v1722 = u8;
			v1724 = false;
			v1723 = "action";
			v1725 = v1722;
			v1726 = v1723;
			v1727 = v1724;
			v1725[v1726] = v1727;
			v1758 = u8;
			v1759 = "staggering";
			v1728 = v1758;
			v1729 = v1759;
			v1760 = v1728[v1729];
			v1761 = false;
			v1730 = v1760;
			v1731 = v1761;
			if v1730 == v1731 then
				curentanimset.equip.TimePosition = 0.5;
				curentanimset.equip:AdjustSpeed(0);
				tpcurrentanimset.equip:Play();
				tpcurrentanimset.equip.TimePosition = 0.5;
				tpcurrentanimset.equip:AdjustSpeed(0);
				check_walking_anim();
			end;
		end;
	end;
end;
u103 = function()
	if u54 == false then
		u54 = true;
	end;
	if u14.weapontype ~= "Bludgeon" and u14.weapontype ~= "Blade" and u14.weapontype ~= "Fists" and u14.weapontype ~= "Spear" and u14.weapontype ~= "Axe" then
		if u14.weapontype == "Gun" and u8.sprinting == false then
			if u8.action == false then
				local v1762 = u65;
				local v1763 = u14.speedrating;
				if akimbo_factors.active == true and akimbo_factors.alternate == true then
					v1762 = akimbo_factors.alt_tick;
					v1763 = akimbo_factors.alt_weapon_stats.speedrating;
				end;
				local v1764 = false;
				if fanning_levering == true and u8.aiming == false then
					v1764 = true;
					if u14.name == "Winchester 940-1" or u14.name == "Winchester 1901" then
						v1763 = levering_firerate;
					end;
					if u14.name == "'The Redeemer'" or u14.name == "Peacemaker" or u14.name == "Peacemaker Uppercut" or u14.name == "Peacemaker Chain" then
						v1763 = fanning_firerate;
					end;
				end;
				if playerperks.paranoia and u14.auto == false and v1764 == false then
					v1763 = v1763 * v8.paranoia.efx[2] / 100;
				end;
				if v1763 < tick() - v1762 then
					u156();
					return;
				else
					return;
				end;
			else
				return;
			end;
		elseif u14.weapontype == "Bow" then
			if u8.action == false then
				if u16.arrow.arrow1.Transparency == 1 then
					u118();
					return;
				else
					u162();
					return;
				end;
			else
				return;
			end;
		elseif u14.weapontype == "Item" then
			if u8.action == true then
				return;
			elseif u14.animset == "STM" or u14.animset == "BOX" or u14.animset == "AGENTC" then
				drawlockout = tick();
				u165();
				return;
			elseif u14.animset == "THRW" or u14.name == "Hunting Axe" or u14.name == "Crafted Javelin" or u14.name == "Bomb Spear" or u14.name == "Poisoned Knife" or u14.name == "Throwing Knife" or u14.name == "Crafted Caltrops" or u14.name == "Steel Caltrops" then
				u167("mouse");
				return;
			else
				if u14.name == "Proximity Mine" or u14.name == "Crafted Pavise" or u14.name == "Crafted Punjis" or u14.name == "Steel Punjis" or u14.name == "Remote Explosive" or u14.name == "Steel Snares" then
					u169();
				else
					return;
				end;
				return;
			end;
		else
			return;
		end;
	end;
	if tick() - u41 <= 0.3 then
		return;
	end;
	if u42 > 3 then
		u42 = 1;
	end;
	while true do
		u154();
		u42 = u42 + 1;
		if u42 > 3 then
			break;
		end;
		if u54 == false then
			break;
		end;
		if u8.staggering == true then
			break;
		end;	
	end;
	u41 = tick();
	u42 = 1;
end;
local function u170()
	if u8.action == true then
		return;
	end;
	if u8.swinging == true then
		return;
	end;
	if u8.cancombo == false then
		return;
	end;
	if u8.staggering == true then
		return;
	end;
	if tick() - u46 < 0.5 then
		return;
	end;
	if curentanimset.charge == nil then
		return;
	end;
	u8.action = true;
	u8.swinging = true;
	u8.cancombo = false;
	l__workspace__1.ServerStuff.initiateblock:FireServer(v5, false);
	u22("stamina");
	local v1765 = u47;
	local v1766 = ({ 0.6, 0.7, 0.75, 0.8 })[u14.chargerating];
	if u9.Fracture or u7 <= 0 then
		v1766 = 0.6;
	end;
	if u14.name == "Executioner Sword" then
		v1766 = 0.4;
		v1765 = 1;
	end;
	local v1767 = v1766 * v1765;
	curentanimset.charge:Play(0);
	curentanimset.charge:AdjustSpeed(v1767);
	tpcurrentanimset.charge:Play(0);
	tpcurrentanimset.charge:AdjustSpeed(math.clamp(v1767 * 1.25, 0.5, 1));
	local v1768 = tick();
	local u171 = false;
	local v1769 = tpcurrentanimset.charge.KeyframeReached:connect(function(p153)
		if p153 == "Stop" then
			tpcurrentanimset.charge:AdjustSpeed(0);
		end;
	end);
	while true do
		RS:wait();
		u11.stamregen = tick();
		u11.regentick = tick();
		if u171 == true then
			break;
		end;
		if u8.staggering == true then
			break;
		end;	
	end;
	curentanimset.charge.KeyframeReached:connect(function(p154)
		if p154 == "Stop" then
			curentanimset.charge:AdjustSpeed(0);
			u171 = true;
			u7 = u7 - 20;
			u22("stamina");
		end;
	end):Disconnect();
	v1769:Disconnect();
	if u8.stagger == true then
		u8.swinging = false;
		u8.cancombo = true;
		curentanimset.charge:Stop(0.3);
		tpcurrentanimset.charge:Stop(0.3);
	end;
	if u8.staggering == false and u171 == true then
		if u14.animset == "1PB" then
			if u8.sprinting == true then
				l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", u14.animset }, "heavychargeswing", character.HumanoidRootPart, 0.05);
				local v1770 = tick();
				local v1771 = Instance.new("BodyVelocity");
				v1771.Name = "parkourPositionThing";
				v1771.P = 3000;
				v1771.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
				v1771.Velocity = character.HumanoidRootPart.Velocity + character.HumanoidRootPart.CFrame.lookVector * 40;
				v1771.Parent = character.HumanoidRootPart;
				u35 = true;
				while true do
					RS:wait();
					if tick() - v1770 >= 0.2 then
						break;
					end;				
				end;
				delay(0.1, function()
					v1771:Destroy();
				end);
			end;
			l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", current_anim_set_use }, "swingheavy", character.HumanoidRootPart, 0.05);
			local l__plasmaEffect__1772 = u16:WaitForChild("plasmaEffect");
			l__plasmaEffect__1772:WaitForChild("t1").Enabled = true;
			l__plasmaEffect__1772:WaitForChild("t2").Enabled = true;
			delay(0.3, function()
				l__plasmaEffect__1772.t1.Enabled = false;
				l__plasmaEffect__1772.t2.Enabled = false;
			end);
		end;
		shakecamera("weapon", { current_anim_set_use, "charge" });
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", current_anim_set_use }, "chargeswing", character.HumanoidRootPart);
		if u9["Immolator Buff"] then
			l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "flamer_swing", character.HumanoidRootPart, 0.01);
		end;
		if startperk.Value == "hiddenB" then
			l__workspace__1.ServerStuff.dealDamage:FireServer("hiddeneyes", nil, v5, v4);
			l__workspace__1.ServerStuff.playAudio:FireServer({ "events", "hiddenB" }, "attack", character.HumanoidRootPart);
		end;
		local v1773 = 0.55;
		if u7 <= 0 then
			v1773 = 0.45;
		end;
		curentanimset.charge.TimePosition = 0.4;
		curentanimset.charge:AdjustSpeed(v1773);
		tpcurrentanimset.charge.TimePosition = 0.4;
		tpcurrentanimset.charge:AdjustSpeed(v1773);
		local v1774 = false;
		local v1775 = u14.damagerating[2];
		u46 = tick();
		local v1776 = false;
		while true do
			if curentanimset.charge:GetTimeOfKeyframe("Hit") <= curentanimset.charge.TimePosition and v1774 == false then
				v1774 = true;
				if u44(v1775, "heavy") ~= nil then
					if v63.berzactive ~= nil then
						l__workspace__1.ServerStuff.dealDamage:FireServer("berzheal", nil, v5, v4);
					end;
					if v1776 == false and u14.name == "'The Decimator'" then
						v1776 = true;
						u48();
					end;
					if u14.name ~= "Executioner Sword" then
						curentanimset.charge:AdjustSpeed(curentanimset.charge.Speed + 0.4);
						tpcurrentanimset.charge:AdjustSpeed(tpcurrentanimset.charge.Speed + 0.4);
					end;
				end;
			end;
			RS:wait();
			if curentanimset.charge.IsPlaying == false then
				break;
			end;
			if u8.staggering == true then
				break;
			end;		
		end;
		u35 = false;
		u8.swinging = false;
		u8.cancombo = true;
		curentanimset.charge:Stop(0.3);
		tpcurrentanimset.charge:Stop(0.3);
		if u8.staggering == false then
			curentanimset.equip.TimePosition = 0.5;
			curentanimset.equip:AdjustSpeed(0);
			tpcurrentanimset.equip:Play(0.3);
			tpcurrentanimset.equip.TimePosition = 0.5;
			tpcurrentanimset.equip:AdjustSpeed(0);
			u8.action = false;
		end;
	end;
end;
local function u172()
	if tick() - u41 < 0.3 then
		return;
	end;
	u41 = tick();
	u8.action = true;
	u8.swinging = true;
	u8.cancombo = false;
	if u7 > 0 then
		u7 = u7 - 10;
	end;
	u11.stamregen = tick();
	u11.regentick = tick();
	u22("stamina");
	v104({ "weapons", u14.animset }, "swingwindup", nil, nil, true, true);
	delay(0.4, function()
		l__workspace__1.ServerStuff.playAudio:FireServer({ "weapons", u14.animset }, "swing", character.HumanoidRootPart);
	end);
	curentanimset.swing:Play(0.2, 1, 1.2);
	tpcurrentanimset.swing:Play(0.2, 1, 1.2);
	local v1777 = false;
	shakecamera("weapon", { "LSMG", "swing" });
	local v1778 = nil;
	while true do
		u11.stamregen = tick();
		u11.regentick = tick();
		if curentanimset.swing:GetTimeOfKeyframe("Strike") <= curentanimset.swing.TimePosition and v1777 == false then
			v1777 = true;
			v1778 = u44("minigunbash");
			if v1778 then
				u8.cancombo = true;
			end;
		end;
		RS:wait();
		if curentanimset.swing.isPlaying == false then
			break;
		end;
		if u8.staggering == true then
			break;
		end;
		if u8.cancombo == false and v1778 ~= nil then
			break;
		end;	
	end;
	u8.swinging = false;
	u8.cancombo = true;
	curentanimset.swing:Stop(0.45);
	if u8.staggering == false then
		curentanimset.equip.TimePosition = 0.5;
		curentanimset.equip:AdjustSpeed(0);
		tpcurrentanimset.equip:Play();
		tpcurrentanimset.equip.TimePosition = 0.5;
		tpcurrentanimset.equip:AdjustSpeed(0);
		check_walking_anim();
		u8.action = false;
	end;
end;
local function u173()
	if v64[2].noaimmod == true then
		return;
	end;
	if u9.Fracture and u9.Painkillers == nil and u9["Bottle Buff"] == nil then
		return;
	end;
	if u8.action == true and u8.firing == false then
		return;
	end;
	if v63.gogglesactive == true then
		return;
	end;
	if tick() - baseadstick <= 0.5 then
		return;
	end;
	v104({ "firearms" }, "ads_in", nil, nil, true, true);
	baseadstick = tick();
	u8.aiming = true;
	local v1779 = 60;
	u73 = 0.2;
	if playerperks.recoil then
		u73 = 0.05;
	end;
	if u14.weapontype == "Bow" then
		v1779 = 40;
	end;
	local v1780 = false;
	local v1781 = tick();
	local v1782 = nil;
	if u14.name == "Modded Rifle" or u14.name == "Remington 700" or u14.name == "R11 RSASS" or u14.name == "Dragunov SVD-63" or u14.name == "IZhMASh SV-98M" or u14.name == "AI-AWSM" or u14.name == "CheyTac M200" then
		v1780 = true;
		v1779 = 50;
	end;
	if v1780 == true then
		v1782 = l__game__6.ReplicatedStorage.effects.sniperScope:Clone();
		v1782.Enabled = false;
		v1782.Parent = ply.PlayerGui;
		sniperscope = v1782;
	end;
	if playerperks.zoom then
		v1779 = v1779 - v1779 * v8.zoom.efx[1] / 100;
	end;
	if u14.weapontype == "Gun" then
		maingui.Centre.crosshair.Visible = playerstats.Settings.ADSCrosshair;
	end;
	local v1783 = 1;
	if v1780 == true then
		v1783 = 0.5;
	end;
	u74 = playerstats.Settings.AimSens * v1783;
	while true do
		RS:wait();
		if v1780 == true then
			if tick() - v1781 < 0.5 then
				l__CurrentCamera__1.FieldOfView = lerp(l__CurrentCamera__1.FieldOfView, v1779, 0.05);
			elseif v1782.Enabled == false then
				v1782.Enabled = true;
				fparms.Parent = nil;
				l__CurrentCamera__1.FieldOfView = 10;
				maingui.Enabled = false;
			end;
		else
			l__CurrentCamera__1.FieldOfView = lerp(l__CurrentCamera__1.FieldOfView, v1779, 0.05);
		end;
		if u8.action == true and u8.firing == false then
			break;
		end;
		if u9.Fracture and u9.Painkillers == nil then
			break;
		end;
		if u8.aiming == false then
			break;
		end;
		if u8.staggering == true then
			break;
		end;
		if u8.sprinting == true then
			break;
		end;
		if u14.weapontype ~= "Gun" and u14.weapontype ~= "Bow" then
			break;
		end;	
	end;
	baseadstick = tick();
	v104({ "firearms" }, "ads_out", nil, nil, true, true);
	if v1780 == true then
		fparms.Parent = l__CurrentCamera__1;
		maingui.Enabled = true;
		if v1782 ~= nil then
			v1782:Destroy();
			sniperscope = nil;
		end;
		l__CurrentCamera__1.FieldOfView = v1779;
	end;
	maingui.Centre.crosshair.Visible = playerstats.Settings.Crosshair;
	u73 = 1;
	u74 = 1;
	u8.aiming = false;
	spawn(function()
		while true do
			l__CurrentCamera__1.FieldOfView = lerp(l__CurrentCamera__1.FieldOfView, 90, 0.05);
			if u8.aiming == true then
				break;
			end;
			RS:wait();
			if l__CurrentCamera__1.FieldOfView >= 90 then
				break;
			end;		
		end;
	end);
end;
u105 = function()
	if u69 == false then
		u69 = true;
	end;
	if u14.weapontype == "Bludgeon" or u14.weapontype == "Fists" or u14.weapontype == "Blade" or u14.weapontype == "Spear" or u14.weapontype == "Axe" then
		u170();
	elseif u14.weapontype == "Gun" or u14.weapontype == "Bow" then
		if u14.animset == "LSMG" then
			if u8.action == false and u8.shoving == false and u8.blockrecoil == false and u8.staggering == false then
				u172();
			end;
		elseif u8.sprinting == false and akimbo_factors.active == false then
			u173();
		end;
	end;
	if u8.throwing == true then
		cancel_throw = true;
	end;
	if (u14.name == "Remote Explosive" or u14.name == "Rigged Detonator") and u8.action == false and u8.staggering == false then
		l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "activateexplosive", character.HumanoidRootPart);
		delay(0.5, function()
			local v1784 = "detexplosives";
			if u14.name == "Rigged Detonator" then
				v1784 = "detrigged";
			end;
			l__workspace__1.ServerStuff.deployTrap:FireServer(v1784, v5, v4);
		end);
	end;
end;
u102 = mouse.Button1Down:connect(u103);
mouse.Button1Up:connect(function()
	if u54 == true then
		u54 = false;
	end;
end);
u104 = mouse.Button2Down:connect(u105);
mouse.Button2Up:connect(function()
	if u69 == true then
		u69 = false;
	end;
	if u8.aiming == true then
		u8.aiming = false;
	end;
end);
if startperk.Value == "hubbing" then
	maingui.SponsorFrame.Visible = false;
	maingui.Enabled = false;
	fparms.Parent = nil;
	u102:Disconnect();
	u104:Disconnect();
end;
if spectating == true then
	fparms.Parent = nil;
end;
l__workspace__1.ServerStuff.adjustArms.OnClientEvent:Connect(function(p155, p156)
	if p155 == nil then
		return;
	end;
	if p155:FindFirstChild("Left Shoulder") == nil then
		return;
	end;
	if p155:FindFirstChild("Right Shoulder") == nil then
		return;
	end;
	if p155:FindFirstChild("Neck") == nil then
		return;
	end;
	p155["Left Shoulder"].C0 = p155["Left Shoulder"].C0:lerp(CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0) * CFrame.Angles(0, 0, -p156), 0.7);
	p155["Right Shoulder"].C0 = p155["Right Shoulder"].C0:lerp(CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0) * CFrame.Angles(0, 0, p156), 0.7);
	p155.Neck.C0 = p155.Neck.C0:lerp(CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0) * CFrame.Angles(-p156 - 0.05235987755982989, 0, 0), 0.9);
end);
local u174 = nil;
local u175 = tick();
local v1785 = mouse.Move:connect(function()
	if character:FindFirstChild("Torso") == nil then
		return;
	end;
	u174();
	local v1786 = math.asin((mouse.Hit.p - mouse.Origin.p).unit.y);
	if u8.staggering == true then
		v1786 = 0;
	end;
	if tick() - u175 >= 0.1 then
		u175 = tick();
		l__workspace__1.ServerStuff.adjustArms:FireServer(character.Torso, v1786);
	end;
end);
local u176 = nil;
local u177 = nil;
local function u178()
	local v1787 = getPstats(u176);
	if maingui:FindFirstChild("EnemyFrame") == nil then
		return;
	end;
	maingui.EnemyFrame.Visible = true;
	maingui.EnemyFrame.EnemyName.Text = v1787[7];
	maingui.EnemyFrame.HealthBar.Bar.Size = UDim2.new(v1787[1] / v1787[6], 0, 1, 0);
	maingui.EnemyFrame.StaminaBar.Bar.Size = UDim2.new(v1787[2] / v1787[10], 0, 1, 0);
	for v1788, v1789 in pairs(v1787[3]) do
		local v1790 = require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS)[v1788];
		if v1790 ~= nil then
			if not maingui.EnemyFrame.EnemyDebuffs:FindFirstChild(v1788) and not maingui.EnemyFrame.EnemyBuffs:FindFirstChild(v1788) then
				local v1791 = false;
				local v1792 = maingui.EnemyFrame.EnemyDebuffs;
				if v1790.colour ~= nil then
					v1791 = true;
					v1792 = maingui.EnemyFrame.EnemyBuffs;
				end;
				local v1793 = v1792.Example:Clone();
				v1793.Visible = true;
				v1793.Name = v1788;
				v1793.Icon.Image = "rbxassetid://" .. v1790.icon;
				v1793.Bar.Size = UDim2.new(1, 0, v1789[2], 0);
				if v1791 == true then
					v1793.Bar.BackgroundColor3 = v1790.colour;
				end;
				v1793.Parent = v1792;
				for v1794, v1795 in ipairs(v1792:GetChildren()) do
					if v1795.Name ~= "Example" then
						v1795.Position = UDim2.new(-0.2 + 0.1 * v1794, 0, 0.5, 0);
					end;
				end;
			else
				local v1796 = maingui.EnemyFrame.EnemyDebuffs:FindFirstChild(v1788);
				if v1796 == nil then
					v1796 = maingui.EnemyFrame.EnemyBuffs:FindFirstChild(v1788);
				end;
				if v1796 ~= nil then
					v1796.Bar.Size = UDim2.new(1, 0, v1789[2], 0);
				end;
			end;
		end;
	end;
	for v1797, v1798 in ipairs({ maingui.EnemyFrame.EnemyDebuffs, maingui.EnemyFrame.EnemyBuffs }) do
		local v1799, v1800, v1801 = ipairs(v1798:GetChildren());
		while true do
			local v1802, v1803 = v1799(v1800, v1801);
			if not v1802 then
				break;
			end;
			local v1804 = true;
			for v1805, v1806 in pairs(v1787[3]) do
				if v1803.Name == v1805 then
					v1804 = false;
				end;
			end;
			if v1804 == true and v1803.Name ~= "Example" then
				v1803:Destroy();
				for v1807, v1808 in ipairs(v1798:GetChildren()) do
					if v1808.Name ~= "Example" then
						v1808.Position = UDim2.new(-0.2 + 0.1 * v1807, 0, 0.5, 0);
					end;
				end;
			end;		
		end;
	end;
end;
local function u179()
	maingui.EnemyFrame.Visible = false;
	if u177 == true then
		pcall(function()
			l__game__6:GetService("RunService"):UnbindFromRenderStep("targlockstep");
		end);
		u177 = nil;
		u176 = nil;
		for v1809, v1810 in ipairs(maingui.EnemyFrame.EnemyDebuffs:GetChildren()) do
			if v1810.Name ~= "Example" then
				v1810:Destroy();
			end;
		end;
		for v1811, v1812 in ipairs(maingui.EnemyFrame.EnemyBuffs:GetChildren()) do
			if v1812.Name ~= "Example" then
				v1812:Destroy();
			end;
		end;
	end;
end;
u174 = function()
	local v1813 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, 50, baselayer);
	if v1813 then
		if v1813.Parent:FindFirstChild("Humanoid") and l__game__6.Players:GetPlayerFromCharacter(v1813.Parent) and v1813.Parent:FindFirstChild("Humanoid").Health > 0 and v1813.Parent:FindFirstChild("Torso") and v1813.Parent:FindFirstChild("Torso").Transparency ~= 1 then
			if u176 == nil then
				u176 = l__game__6.Players:GetPlayerFromCharacter(v1813.Parent);
				l__game__6:GetService("RunService"):BindToRenderStep("targlockstep", 150, u178);
				u177 = true;
				return;
			elseif l__game__6.Players:GetPlayerFromCharacter(v1813.Parent) ~= u176 then
				u179();
				return;
			else
				return;
			end;
		end;
	else
		u179();
		return;
	end;
	u179();
end;
updateteamhealth = tick();
groundedtimer = tick();
idletimepassed = tick();
breathetimer = tick();
walkingtick = tick();
fall_sfx_tick = tick();
local u180 = 0;
if v64[3].multicooldown then
	maingui.PerkFrame.status.TextSize = 30;
	maingui.PerkFrame.status.TextYAlignment = "Top";
	maingui.PerkFrame.multiple.Visible = true;
end;
move_delta = CFrame.Angles(0, 0, 0);
cd_ping = false;
if l__workspace__1.ServerStuff.game.holdout.Value == true then
	local v1814 = l__game__6.ReplicatedStorage.effects.holdoutoverlay:Clone();
	v1814.CFrame = l__CurrentCamera__1.CFrame;
	v1814.Parent = l__CurrentCamera__1;
	local v1815 = Instance.new("Motor6D");
	v1815.Part0 = v1814;
	v1815.Part1 = cpart;
	v1815.C1 = CFrame.new(0, 0, -0.4) * CFrame.Angles(0, 0, 0);
	v1815.Parent = v1814;
	l__game__6.ReplicatedStorage.effects.holdoutcc:Clone().Parent = l__CurrentCamera__1;
end;
healthflasher = tick();
stamflasher = tick();
wall_pushback = CFrame.new(0, 0, 0);
local u181 = 0;
local u182 = 8;
local u183 = 0;
local u184 = 0;
local u185 = true;
local function u186()
	local v1816 = maingui.teammatesframe:GetChildren();
	for v1817, v1818 in pairs(v1816) do
		if v1818.Name ~= "ex" then
			v1818.Parent = nil;
		end;
	end;
	for v1819, v1820 in pairs(v1816) do
		if v1820.Name ~= "ex" then
			v1820.Position = UDim2.new(0, 0, 1, 70 - 70 * #maingui.teammatesframe:GetChildren());
			v1820.Parent = maingui.teammatesframe;
		end;
	end;
end;
local function u187(p157)
	if tick() - u180 <= 1 then
		return;
	end;
	if p157 <= -43 then
		if v56 ~= false then
			u180 = tick();
			l__workspace__1.ServerStuff.dealDamage:FireServer("fall_damage", nil, v5, v4);
			l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "falldamage1", character.Head);
			l__workspace__1.ServerStuff.playAudio:FireServer({ "general" }, "falldamage2", character.Head);
			local l__Crp__1821 = require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Crp;
			l__Crp__1821.intensity = 4;
			afflictstatus(l__Crp__1821);
			afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).Tnt);
			shakecamera("damage", { 10 });
			return;
		end;
	else
		return;
	end;
	l__workspace__1.ServerStuff.playAudio:FireServer({ "perks" }, "fallnullified", character.Head);
	l__workspace__1.ServerStuff.applyGore:FireServer("fall_nullified", character, ply, nil);
end;
local function u188()
	local v1822 = nil;
	local v1823, v1824 = raycastline(l__CurrentCamera__1.CFrame.p, l__CurrentCamera__1.CFrame.LookVector, 5, baselayer);
	u97 = 0;
	local v1825 = nil;
	if v1823 then
		if v1823.Name == "JointGrip" then
			v1825 = "Item";
		elseif v1823.Name == "Interact" then
			v1825 = "Interaction";
		end;
		v1822 = v1823.Parent;
	end;
	local v1826 = 4;
	if v1822 == nil and v1825 == nil then
		for v1827, v1828 in pairs(l__workspace__1.WeaponDrops:GetChildren()) do
			if v1828:FindFirstChild("JointGrip") and (v1828.JointGrip.CFrame.p - v1824).magnitude < v1826 and v1828:FindFirstChild("JointGrip").Locked == false then
				v1826 = (v1828.JointGrip.CFrame.p - v1824).magnitude;
				v1822 = v1828;
				if v1828:FindFirstChild("JointGrip") then
					v1825 = "Item";
				elseif v1828:FindFirstChild("Interact") then
					v1825 = "Interactable";
				end;
			end;
		end;
	end;
	if v1822 and craftlist[u14.name] then
		if craftlist[u14.name][v1822.Name] then
			v1825 = { craftlist[u14.name][v1822.Name], v19[craftlist[u14.name][v1822.Name]].name };
		elseif v1822.Name == "Model" and craftlist[u14.name][v1822.Parent.Name] then
			v1825 = { craftlist[u14.name][v1822.Parent.Name], v19[craftlist[u14.name][v1822.Parent.Name]].name };
		end;
	end;
	maingui.Centre.craftingmarker.Visible = false;
	maingui.Centre.interactmarker.Visible = false;
	maingui.Centre.pickupmarker.Visible = false;
	local v1829 = false;
	if v1822 and u8.action == false and v1825 then
		maingui.Centre.crosshair.Visible = false;
		if v1825 == "Item" then
			local v1830 = v19[v1822.Name];
			local v1831 = "Item";
			if v1830.weapontype == "Bludgeon" or v1830.weapontype == "Axe" or v1830.weapontype == "Spear" or v1830.weapontype == "Blade" then
				v1831 = "Primary";
			end;
			if v1831 == "Primary" then
				if v6[1][1] == "Fist" then
					v1829 = true;
				end;
			else
				for v1832, v1833 in pairs(v6) do
					if v1833[1] == "Fist" and v1832 ~= 1 then
						v1829 = true;
						break;
					end;
				end;
				if v1830.name == u14.name and u16:FindFirstChild("ammo") and u16.ammo:FindFirstChild("maxammo") then
					local v1834 = nil;
					for v1835, v1836 in pairs(v6) do
						if v1836[2] == true then
							v1834 = v1836[3];
						end;
					end;
					v1829 = v1834 < u16.ammo.maxammo.Value;
				end;
			end;
			maingui.Centre.pickupmarker.Visible = true;
			if v1829 == true then
				maingui.InteractFrame.dispText.Text = "TAKE";
				if v1830.name == u14.name and u16:FindFirstChild("ammo") and u16.ammo:FindFirstChild("maxammo") then
					maingui.InteractFrame.dispText.Text = "REFILL";
				end;
				maingui.InteractFrame.intText.Text = v1830.name;
				if v1822 and v1822:FindFirstChild("skinned") and v21[v1822:FindFirstChild("skinned").Value] then
					maingui.InteractFrame.intText.Text = v21[v1822:FindFirstChild("skinned").Value].name;
				end;
				maingui.InteractFrame.Visible = true;
				u98 = v1822;
				return;
			else
				maingui.InteractFrame.dispText.Text = "FULL";
				if v1830.name == u14.name and u16:FindFirstChild("ammo") and u16.ammo:FindFirstChild("maxammo") then
					maingui.InteractFrame.dispText.Text = "FULL";
				end;
				maingui.InteractFrame.intText.Text = v1830.name;
				maingui.InteractFrame.Visible = true;
				u98 = nil;
				return;
			end;
		elseif v1825 == "Interaction" then
			maingui.Centre.interactmarker.Visible = true;
			maingui.InteractFrame.dispText.Text = "INTERACT";
			maingui.InteractFrame.intText.Text = v1822.Name;
			maingui.InteractFrame.Visible = true;
			if v1822:FindFirstChild("stats") and v1822:FindFirstChild("stats"):FindFirstChild("cost") then
				u97 = v1822:FindFirstChild("stats"):FindFirstChild("cost").Value;
			end;
			u98 = { v1822 };
			return;
		elseif typeof(v1825) == "table" then
			maingui.Centre.craftingmarker.Visible = true;
			maingui.InteractFrame.dispText.Text = "CRAFT";
			maingui.InteractFrame.intText.Text = v1825[2];
			maingui.InteractFrame.Visible = true;
			u98 = { "craft", v1822, v1825[2] };
			return;
		end;
	else
		if u8.aiming == false and maingui.Centre.crosshair.Visible == false then
			maingui.Centre.crosshair.Visible = true;
		end;
		maingui.InteractFrame.Visible = false;
		u98 = nil;
	end;
end;
spectatenum = 1;
function beginspectate(p158)
	local v1837 = l__workspace__1.activePlayers:GetChildren();
	if teamfolder ~= nil then
		v1837 = teamfolder:GetChildren();
	end;
	if forcespecfolder == true then
		local v1838 = {};
		local v1839, v1840, v1841 = ipairs(l__workspace__1.GamemodeStuff:FindFirstChild("TeamA"):GetChildren());
		while true do
			local v1842, v1843 = v1839(v1840, v1841);
			if v1842 then

			else
				break;
			end;
			v1841 = v1842;
			table.insert(v1837, v1843);		
		end;
		local v1844, v1845, v1846 = ipairs(l__workspace__1.GamemodeStuff:FindFirstChild("TeamB"):GetChildren());
		while true do
			local v1847, v1848 = v1844(v1845, v1846);
			if v1847 then

			else
				break;
			end;
			v1846 = v1847;
			table.insert(v1837, v1848);		
		end;
	end;
	local v1849 = v1837[spectatenum];
	if spectatenum < 1 then
		v1849 = v1837[#v1837];
	end;
	if v1849 ~= nil then
		if v1849:FindFirstChild("HumanoidRootPart") then

		else
			spectatenum = 1;
			if 0 < #v1837 then
				beginspectate(p158);
			end;
			return;
		end;
	else
		spectatenum = 1;
		if 0 < #v1837 then
			beginspectate(p158);
		end;
		return;
	end;
	l__CurrentCamera__1.CameraType = "Follow";
	l__CurrentCamera__1.CameraSubject = v1849:FindFirstChild("HumanoidRootPart");
	p158.spectate.current.Text = v1849.Name;
end;
function spectatesystem(p159)
	spectating = true;
	l__CurrentCamera__1.CameraType = "Follow";
	l__CurrentCamera__1.CameraSubject = l__workspace__1.mapCentre;
	beginspectate(p159);
	p159.status.spectate.Visible = false;
	p159.status.spectate.Text = "VIEW AUTOPSY";
	p159.redScreen:Destroy();
	p159.hunted.Visible = false;
	p159.status.textabove.Position = UDim2.new(0.5, 0, 0.4, -165);
	p159.status.reports.Position = UDim2.new(0.5, 0, 0.4, 0);
	p159.status.textabove.Visible = false;
	p159.status.reports.Visible = false;
	p159.status.confirm.Visible = false;
	p159.status.menu.Text = "MAIN MENU";
	p159.spectate.Visible = true;
	local v1850 = tick();
	while true do
		p159.status.Position = p159.status.Position:Lerp(UDim2.new(0.5, 0, 1, 0), 0.05);
		p159.blackbar1.Position = p159.blackbar1.Position:Lerp(UDim2.new(0, 0, 0, -180), 0.1);
		p159.blackbar2.Position = p159.blackbar2.Position:Lerp(UDim2.new(0, 0, 1, 180), 0.1);
		RS:wait();
		if not (2 <= tick() - v1850) then

		else
			break;
		end;	
	end;
	p159.spectate.next.MouseButton1Click:connect(function()
		spectatenum = spectatenum + 1;
		beginspectate(p159);
	end);
	p159.spectate.prev.MouseButton1Click:connect(function()
		spectatenum = spectatenum - 1;
		beginspectate(p159);
	end);
end;
l__game__6:GetService("RunService"):BindToRenderStep("rsloop", 250, function()
	if u8.sprinting == true and u8.action == false and u8.air == false then
		u181 = lerp(u181, -0.4, 0.035);
	else
		u181 = lerp(u181, 0, 0.05);
	end;
	if u8.sprinting == true then
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Sprint);
	elseif u9.Sprinting then
		u9.Sprinting.effects.currentduration = 0;
	end;
	if u8.action == false and u8.swapping == false and u8.channel == false and u8.startswap == false and u8.staggering == false then
		if tick() - idletimepassed >= 1 then
			idletimepassed = tick();
			if tpcurrentanimset.block then
				tpcurrentanimset.block:Stop();
			end;
		end;
	else
		if u8.blocking == true then
			if tick() - idletimepassed >= 1 then
				idletimepassed = tick();
				if tpcurrentanimset.block then
					tpcurrentanimset.block:Play();
					tpcurrentanimset.block.TimePosition = 0.3;
					tpcurrentanimset.block:AdjustSpeed(0);
				end;
			end;
		elseif tpcurrentanimset.block then
			tpcurrentanimset.block:Stop();
		end;
		idletimepassed = tick();
	end;
	if character:FindFirstChild("Head") and (character.Head:FindFirstChild("breathingFX") and tick() - breathetimer >= 8) then
		breathetimer = tick() + math.random(1, 4);
		l__workspace__1.ServerStuff.BREATHE:FireServer();
	end;
	if playerperks.desp then
		if hum.Health < v8.desp.efx[1] then
			if perksactive.desp == nil then
				perksactive.desp = true;
				u18 = u18 + v8.desp.efx[2] / 100;
			end;
		elseif perksactive.desp == true then
			perksactive.desp = nil;
			u18 = u18 - v8.desp.efx[2] / 100;
		end;
	end;
	if playerperks.octopus and hum.Health < v8.octopus.efx[1] and perksactive.octopus == nil then
		perksactive.octopus = true;
		l__workspace__1.ServerStuff.dealDamage:FireServer("dropsmoke", nil, v5, v4);
	end;
	if playerperks.second and hum.Health < v8.second.efx[1] then
		if u9.Exhaustion then
			u9.Exhaustion.effects.currentduration = 0;
		end;
		sprint_stam = 100;
		u7 = v66;
	end;
	if v64[2].nothirstmod == true then
		ration_system_handler.thirst = tick();
	end;
	local v1851 = CFrame.new();
	if (u14.animset == "RV" or u14.animset == "PST" or u14.animset == "2HPST") and u8.aiming == false and playerstats.Class == "revolver" and u8.using_perk == false and akimbo_factors.active == false then
		v1851 = CFrame.new(0.5, 0, -1) * CFrame.Angles(0, 0.5235987755982988, -0.06981317007977318);
	end;
	if u14.animset == "RV" or u14.animset == "PST" or u14.animset == "RFL" or u14.animset == "SMG" or u14.animset == "ASMG" or u14.animset == "2HPST" then
		if tick() - gun_holster_timer > 3 then
			local v1852 = globalanimsets.holster_rifle;
			if u14.animset == "RV" or u14.animset == "PST" or u14.animset == "2HPST" then
				v1852 = globalanimsets.holster_pistol;
				if playerstats.Class == "revolver" then
					v1852 = nil;
				end;
			elseif u14.animset == "SMG" then
				v1852 = globalanimsets.holster_smg;
			end;
			if akimbo_factors.active == true then
				v1852 = globalanimsets.holster_akimbo;
			end;
			if v1852 ~= nil and v1852.IsPlaying == false then
				v1852:Play(0.5, 1, 1);
			end;
		else
			globalanimsets.holster_pistol:Stop(0.1);
			globalanimsets.holster_rifle:Stop(0.1);
			globalanimsets.holster_smg:Stop(0.1);
			globalanimsets.holster_akimbo:Stop(0.1);
		end;
		if u8.action == true or u8.firing == true or u8.swapping == true or u8.staggering == true or u8.aiming == true or u8.shoving == true then
			gun_holster_timer = tick();
		end;
	else
		globalanimsets.holster_pistol:Stop(0);
		globalanimsets.holster_rifle:Stop(0);
		globalanimsets.holster_smg:Stop(0);
	end;
	local v1853 = u73;
	if not (not u9["Stamina Buff"]) or not (not u9["Artillerist Buff"]) or u9["Koldera Buff"] then
		v1853 = 0.02;
	end;
	local v1854 = UIS:GetMouseDelta();
	move_delta = move_delta:Lerp(CFrame.Angles(math.clamp(math.rad(v1854.y) / 6, -0.35, 0.35), math.clamp(math.rad(v1854.x) / 8, -0.35, 0.35), math.clamp(math.rad(v1854.x) / 6, -0.35, 0.35)), 0.2);
	if u8.walking == true and u10 > 0.1 then
		tpglobalanimsets.run:AdjustWeight(hum.WalkSpeed / 18);
		tpglobalanimsets.run:AdjustSpeed(0.6 + hum.WalkSpeed / 40);
		u182 = 8 * hum.WalkSpeed / 18;
		local v1855 = move_delta;
		if u8.aiming == true then
			v1855 = CFrame.Angles(0, 0, 0);
		end;
		u112 = u112:Lerp(CFrame.new(math.cos(time() * 6 * u182 / 8) * 0.2 / 2 * v1853, 0, math.sin(time() * 14 * u182 / 8) * 0.075 / 2 * v1853) * u52 * v1851 * v1855, 0.3);
		local v1856 = 0;
		if u9.Cripple and u9.Painkillers == nil and u9["Bottle Buff"] == nil then
			v1856 = math.clamp(math.cos(time() * 6) * 0.05, -10000, 0);
		end;
		u111 = u111:Lerp(CFrame.Angles(math.sin(time() * 8 * u182 / 8) * 0.075 / 6 * v1853, math.cos(time() * 4 * u182 / 8) * 0.2 / 6 * v1853, v1856), 0.3);
	else
		if u8.aiming == false then
			u112 = u112:Lerp(CFrame.new(0, 0, math.cos(time() * 1.5) * 0.05) * u52 * v1851 * move_delta, 0.3);
		else
			u112 = u112:Lerp(CFrame.new(0, 0, 0) * u52, 0.3);
		end;
		u111 = u111:Lerp(CFrame.Angles(0, 0, 0), 0.2);
	end;
	if chattertime <= tick() - lastchatter then
		if startperk.Value == "hiddenB" then
			if startperk.Value == "emperor" or startperk.Value == "commander" or startperk.Value == "hiddenB" then
				lastchatter = tick();
				l__workspace__1.ServerStuff.voiceline:FireServer(startperk, "taunt");
			end;
		elseif startperk.Value == "emperor" or startperk.Value == "commander" or startperk.Value == "hiddenB" then
			lastchatter = tick();
			l__workspace__1.ServerStuff.voiceline:FireServer(startperk, "chatter");
		end;
	end;
	if u8.air == false then
		groundedtimer = tick();
	end;
	if playerperks.regen and hum.Health < hum.MaxHealth and v8.regen.efx[1] < tick() - u183 then
		u183 = tick();
		l__workspace__1.ServerStuff.dealDamage:FireServer("regenperk", nil, v5, v4);
	end;
	local v1857 = 300;
	local v1858 = true;
	local v1859 = true;
	if l__workspace__1.GamemodeStuff:FindFirstChild("outerGas") and startperk.Value ~= "hubbing" then
		local v1860 = math.clamp(l__workspace__1.GamemodeStuff:FindFirstChild("outerGas").Size.X / 2.1 - (character.HumanoidRootPart.Position - l__workspace__1.mapCentre.Position).magnitude, -300, 300);
		if l__workspace__1.ServerStuff.game.holdout.Value == false and (character.HumanoidRootPart.Position - l__workspace__1.mapCentre.Position).magnitude <= 150 and (character.HumanoidRootPart.Position - l__workspace__1.mapCentre.Position).magnitude <= 130 and (character.HumanoidRootPart.Position - l__workspace__1.mapCentre.Position).magnitude >= 70 then
			v1858 = false;
			u184 = lerp(u184, 30, 0.05);
		end;
		if v1857 <= 20 and u9.Toxins == nil then
			v1859 = false;
			v62.Volume = 1.2 - v1857 / 20;
		end;
		if l__workspace__1.GamemodeStuff:FindFirstChild("outerGas").Size.X / 2.1 <= (character.HumanoidRootPart.Position - l__workspace__1.mapCentre.Position).magnitude then
			afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Psn);
		elseif u91 == false and u9.Toxins then
			u9.Toxins.effects.currentduration = 0;
		end;
	end;
	if v1859 == true then
		if u9.Toxins == nil then
			if u67 == true then
				v62.Volume = 0.1;
			else
				v62.Volume = l__game__6.ReplicatedStorage.soundLibrary.general_ui.storm_ambience.Volume;
				if l__workspace__1.ServerStuff.game.holdout.Value == true then
					v62.Volume = 0.2;
				end;
			end;
		else
			v62.Volume = 1.3;
		end;
	end;
	if v1858 == true then
		u184 = lerp(u184, 0, 0.1);
	end;
	if u18 >= 30 then
		ply:Kick(filth[math.random(1, #filth)]);
	end;
	if u17 >= 30 then
		ply:Kick(filth[math.random(1, #filth)]);
	end;
	if v1857 < 0 then
		v1857 = -v1857;
	end;
	local v1861 = 2000;
	if u9.Toxins and u9["Gas Mask"] then
		v1861 = 75;
	end;
	l__game__6.Lighting.FogEnd = math.clamp(v1857 + u184, 0, v1861);
	if startperk.Value ~= "hubbing" then
		local v1862 = 310;
		if l__workspace__1.ServerStuff.game.holdout.Value == true then
			v1862 = 200;
		end;
		if v1862 / 2.1 <= (character.HumanoidRootPart.Position - l__workspace__1.mapCentre.Position).magnitude then
			if u185 == true and l__workspace__1.ServerStuff.game.holdout.Value == false then
				agent_speak("safeexit");
			end;
			u185 = false;
		else
			if u185 == false and l__workspace__1.ServerStuff.game.holdout.Value == false then
				agent_speak("safeenter");
			end;
			u185 = true;
		end;
	end;
	if u8.walking == true and u8.sprinting == false and u8.air == false and 7 / hum.WalkSpeed <= tick() - walkingtick then
		walkingtick = tick();
		v104({ "movement_sounds" }, "step" .. math.random(1, 4), nil, nil, true, true);
		delay(7 / hum.WalkSpeed * 0.5, function()
			v104({ "movement_sounds", "gearsteps" }, "gear_walk" .. math.random(1, 4), nil, nil, true, true);
		end);
	end;
	if maingui.Centre.crosshair.Visible == true then
		maingui.Centre.crosshair.A1.Position = UDim2.new(0.5, 0, 0.5, -5);
		maingui.Centre.crosshair.A2.Position = UDim2.new(0.5, 0, 0.5, 5);
		maingui.Centre.crosshair.B1.Position = UDim2.new(0.5, -5, 0.5, 0);
		maingui.Centre.crosshair.B2.Position = UDim2.new(0.5, 5, 0.5, 0);
		if (u14.weapontype == "Bow" or u14.weapontype == "Gun") and (u14.weapontype == "Gun" and u8.aiming == false or u14.weapontype == "Bow" and u8.walking == true) then
			local v1863 = u14.sizerating * 3.5;
			local v1864 = math.clamp(v1863 - v1863 * v45, 1.5, 30);
			maingui.Centre.crosshair.A1.Position = UDim2.new(0.5, 0, 0.5, -5 - v1864);
			maingui.Centre.crosshair.A2.Position = UDim2.new(0.5, 0, 0.5, 5 + v1864);
			maingui.Centre.crosshair.B1.Position = UDim2.new(0.5, -5 - v1864, 0.5, 0);
			maingui.Centre.crosshair.B2.Position = UDim2.new(0.5, 5 + v1864, 0.5, 0);
		end;
		if u8.throwing == true then
			maingui.Centre.crosshair.B1.Position = UDim2.new(0.5, -10, 0.5, 0);
			maingui.Centre.crosshair.B2.Position = UDim2.new(0.5, 10, 0.5, 0);
		end;
	end;
	if teamfolder ~= nil and tick() - updateteamhealth >= 0.3 then
		updateteamhealth = tick();
		for v1865, v1866 in pairs(teamfolder:GetChildren()) do
			if maingui.teammatesframe:FindFirstChild(v1866.Name) and v1866:FindFirstChild("Humanoid") then
				maingui.teammatesframe:FindFirstChild(v1866.Name).empty.bar.Size = UDim2.new(v1866:FindFirstChild("Humanoid").Health / v1866:FindFirstChild("Humanoid").MaxHealth, 0, 1, 0);
				maingui.teammatesframe:FindFirstChild(v1866.Name).exact_health.Text = math.ceil(v1866:FindFirstChild("Humanoid").Health);
				if v1866:FindFirstChild("current_scrap") then
					maingui.teammatesframe:FindFirstChild(v1866.Name).scraptext.Text = "[" .. v1866.current_scrap.Value .. "]";
				end;
			elseif maingui.teammatesframe:FindFirstChild(v1866.Name) == nil and v1866:FindFirstChild("Humanoid") and v1866.Name ~= ply.Name then
				local v1867 = maingui.teammatesframe.ex:Clone();
				v1867.Name = v1866.Name;
				v1867.exact_health.Text = math.ceil(v1866:FindFirstChild("Humanoid").Health);
				v1867.empty.bar.Size = UDim2.new(v1866:FindFirstChild("Humanoid").Health / v1866:FindFirstChild("Humanoid").MaxHealth, 0, 1, 0);
				v1867.playername.Text = v1866.Name;
				v1867.Visible = true;
				if v1866:FindFirstChild("current_perk") and v20[v1866.current_perk.Value] then
					v1867.perkicon.Image = "rbxassetid://" .. v20[v1866.current_perk.Value].icon;
				end;
				v1867.Position = UDim2.new(0, 0, 1, 70 - 70 * #maingui.teammatesframe:GetChildren());
				v1867.Parent = maingui.teammatesframe;
			end;
		end;
		for v1868, v1869 in pairs(maingui.teammatesframe:GetChildren()) do
			if teamfolder:FindFirstChild(v1869.Name) == nil and v1869.Name ~= "ex" then
				v1869:Destroy();
				u186();
			end;
		end;
	end;
	if startperk.Value == "emperor" or startperk.Value == "commander" or startperk.Value == "jElimB" or startperk.Value == "hiddenB" then
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Rge);
	end;
	if startperk.Value == "hiddenB" or shadowForm == true then
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Slc);
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS).Rge);
		u7 = 100;
	end;
	if juggernaut == true then
		u7 = 100;
	end;
	if startperk.Value == "jElimB" then
		afflictstatus(require(l__workspace__1.ServerStuff.Statistics.S_STATISTICS)["Muscle Milk"]);
	end;
	if v57 == true then
		if u9.Bleed then
			u9.Bleed.effects.currentduration = 0;
		end;
		if u9["Arterial Bleed"] then
			u9["Arterial Bleed"].effects.currentduration = 0;
		end;
	end;
	if v59 == true and u9.Fracture then
		u9.Fracture.effects.currentduration = 0;
	end;
	if v58 == true and u9.Cripple then
		u9.Cripple.effects.currentduration = 0;
	end;
	if tick() - inner_dialogue <= 5 then
		maingui.Thought.thoughttext.TextTransparency = lerp(maingui.Thought.thoughttext.TextTransparency, 0.2, 0.05);
		maingui.Thought.thoughttext.TextStrokeTransparency = lerp(maingui.Thought.thoughttext.TextStrokeTransparency, 0, 0.05);
	else
		maingui.Thought.thoughttext.TextTransparency = lerp(maingui.Thought.thoughttext.TextTransparency, 1, 0.05);
		maingui.Thought.thoughttext.TextStrokeTransparency = lerp(maingui.Thought.thoughttext.TextStrokeTransparency, 1, 0.05);
	end;
	maingui.HurtOverlay.ImageTransparency = hum.Health / hum.MaxHealth * 1.7 + math.cos(time() * math.clamp(hum.MaxHealth / hum.Health, 0, 8)) * 0.075;
	maingui.HurtOverlayA.ImageTransparency = maingui.HurtOverlay.ImageTransparency + 0.1;
	maingui.HurtOverlayB.ImageTransparency = maingui.HurtOverlay.ImageTransparency + 0.1;
	if startperk.Value ~= "hubbing" and v64 and v64[3] and v64[3].cooldown then
		local v1870 = (tick() - u88) / v64[3].cooldown;
		maingui.PerkFrame.status.Text = math.round(math.clamp(v1870, 0, 1) * 100) .. "%";
		if v64[3].multicooldown then
			maingui.PerkFrame.multiple.Text = "x" .. math.floor(math.clamp(tick() - u88, 0, v64[3].cooldown) / v64[3].multicooldown);
		end;
		if v64[3].inverse_cd then
			maingui.PerkFrame.status.Text = 100 - math.round(math.clamp(v1870, 0, 1) * 100) .. "%";
		end;
		if v1870 >= 1 then
			if cd_ping == false then
				v104({ "perks" }, "perk_ping", nil, nil, true, true);
				local v1871 = maingui.PerkFrame.iconimage:Clone();
				l__Debris__32:AddItem(v1871, 4);
				v1871.Name = "fakeflash";
				v1871.Parent = maingui.PerkFrame;
				spawn(function()
					for v1872 = 1, 60 do
						v1871.ImageTransparency = v1871.ImageTransparency + 0.015;
						v1871.Size = v1871.Size + UDim2.new(0, 1, 0, 1);
						RS:wait();
					end;
					if v1871 then
						v1871:Destroy();
					end;
				end);
				cd_ping = true;
			end;
		else
			cd_ping = false;
		end;
	end;
	if u7 <= 15 and tick() - stamflasher >= 2 then
		stamflasher = tick();
		local v1873 = maingui.StaminaFrame.Image:Clone();
		l__Debris__32:AddItem(v1873, 4);
		v1873.Name = "fakeflash";
		v1873.Parent = maingui.StaminaFrame;
		spawn(function()
			for v1874 = 1, 60 do
				v1873.ImageTransparency = v1873.ImageTransparency + 0.015;
				v1873.Size = v1873.Size + UDim2.new(0, 1, 0, 1);
				RS:wait();
			end;
			if v1873 then
				v1873:Destroy();
			end;
		end);
	end;
	if hum.Health <= 15 and hum.Health > 0 and tick() - healthflasher >= 2 then
		healthflasher = tick();
		local v1875 = maingui.HealthFrame.Image:Clone();
		l__Debris__32:AddItem(v1875, 4);
		v1875.Name = "fakeflash";
		v1875.Parent = maingui.HealthFrame;
		spawn(function()
			for v1876 = 1, 60 do
				v1875.ImageTransparency = v1875.ImageTransparency + 0.015;
				v1875.Size = v1875.Size + UDim2.new(0, 1, 0, 1);
				RS:wait();
			end;
			if v1875 then
				v1875:Destroy();
			end;
		end);
	end;
	if u7 < v66 and tick() - u11.stamregen > 1 then
		local v1877 = u12;
		if u8.walking == true then
			v1877 = v1877 + 0.025;
		end;
		if v1877 < tick() - u11.regentick then
			u11.regentick = tick();
			u7 = u7 + 1;
			u22("stamina");
		end;
	end;
	if sprint_stam < 100 and u8.sprinting == false then
		if u9.Exhaustion == nil then
			sprint_stam = sprint_stam + 0.3 + buff_sprint_stam;
		end;
	elseif sprint_stam > 100 or exhaustion_immunity == true then
		sprint_stam = 100;
	end;
	u22("sprint_stam");
	if raycastline(character.HumanoidRootPart.Position, -character.HumanoidRootPart.CFrame.upVector, 4, baselayer) then
		u8.air = false;
	else
		if u8.air == false and tick() - fall_sfx_tick >= 0.6 then
			fall_sfx_tick = tick();
		end;
		u8.air = true;
		if raycastline(character.HumanoidRootPart.Position, -character.HumanoidRootPart.CFrame.upVector, 5.5, baselayer) then
			if tick() - fall_sfx_tick >= 0.6 then
				fall_sfx_tick = tick();
				l__workspace__1.ServerStuff.playAudio:FireServer({ "movement_sounds" }, "fall", character.Torso);
				shakecamera("jumpland");
			end;
			if tick() - groundedtimer >= 1 then
				u187(character.HumanoidRootPart.Velocity.y);
			end;
		end;
	end;
	if raycastline(character.HumanoidRootPart.Position + character.HumanoidRootPart.CFrame.lookVector * 7, character.HumanoidRootPart.CFrame.upVector, 60, baselayer) and raycastline(character.HumanoidRootPart.Position - character.HumanoidRootPart.CFrame.lookVector * 7, character.HumanoidRootPart.CFrame.upVector, 60, baselayer) and raycastline(character.HumanoidRootPart.Position + character.HumanoidRootPart.CFrame.rightVector * 7, character.HumanoidRootPart.CFrame.upVector, 60, baselayer) and raycastline(character.HumanoidRootPart.Position - character.HumanoidRootPart.CFrame.lookVector * 7, character.HumanoidRootPart.CFrame.upVector, 60, baselayer) then
		if l__game__6:GetService("SoundService").AmbientReverb ~= Enum.ReverbType.ParkingLot then
			u67 = true;
			l__game__6:GetService("SoundService").AmbientReverb = Enum.ReverbType.ParkingLot;
		end;
	elseif l__game__6:GetService("SoundService").AmbientReverb ~= Enum.ReverbType.Mountains then
		u67 = false;
		l__game__6:GetService("SoundService").AmbientReverb = Enum.ReverbType.Mountains;
	end;
	hum.WalkSpeed = math.clamp((u10 + u19) * u81, 1, 100);
	character.HumanoidRootPart.CFrame = CFrame.new(character.HumanoidRootPart.Position) * CFrame.Angles(0, -math.atan2(l__CurrentCamera__1.CFrame.lookVector.Z, l__CurrentCamera__1.CFrame.lookVector.X) + -1.5707963267948966, 0);
	local v1878 = CFrame.Angles(0, 0, 0);
	for v1879, v1880 in pairs(u23) do
		v1878 = v1878 * v1880;
	end;
	if spectating == false then
		adjustcamto = adjustcamto:Lerp(u27, 0.075);
		l__CurrentCamera__1.CFrame = CFrame.new(character.HumanoidRootPart.Position + adjustcamto) * CFrame.Angles(0, u153.X, 0) * CFrame.Angles(u153.Y, 0, 0) * u111 * v1878;
		l__CurrentCamera__1.CameraType = "Custom";
		l__CurrentCamera__1.CameraSubject = hum;
		ply.CameraMode = "LockFirstPerson";
		if u8.aiming == false then
			ajustarmposto = ajustarmposto:Lerp(ajustarmpos, 0.1);
		else
			ajustarmposto = ajustarmposto:Lerp(CFrame.new(0, 0, 0), 0.1);
		end;
		cpart.CFrame = l__CurrentCamera__1.CFrame;
		local v1881 = 3;
		if u16 ~= nil and u16:FindFirstChild("muzzle") and u16:FindFirstChild("muzzle") then
			v1881 = math.clamp((l__CurrentCamera__1.CFrame.Position - u16.muzzle.Position).magnitude, 3, 4);
		end;
		local v1882, v1883 = raycastline(l__CurrentCamera__1.CFrame.Position, l__CurrentCamera__1.CFrame.lookVector, v1881, { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, l__workspace__1.PlayerShootThroughs, l__workspace__1.WeaponDrops, l__workspace__1.PlayerTraps, l__workspace__1.Interactables, l__workspace__1.InteractablesNoDel, l__workspace__1.activeFriendlies });
		if v1882 and u8.using_perk == false then
			wall_pushback = wall_pushback:Lerp(CFrame.new(0, v1881 - (l__CurrentCamera__1.CFrame.Position - v1883).magnitude, 0), 0.2);
		else
			wall_pushback = wall_pushback:Lerp(CFrame.new(0, 0, 0), 0.1);
		end;
		if raycastline(character.HumanoidRootPart.Position, -character.HumanoidRootPart.CFrame.upVector, 4, baselayer) then
			u8.air = false;
		end;
		camroot.CFrame = cpart.CFrame * CFrame.new(0, -1 + u181, 0.3) * ajustarmposto * CFrame.Angles(math.rad(-90 + u181 * 20), 0, math.rad(180 - u181 * 20)) * u112 * u82 * wall_pushback;
		local v1884 = 1 + baseadsmod;
		if u14.animset == "PST" or u14.animset == "2HPST" or u14.animset == "RV" then
			v1884 = v1884 + 1;
		end;
		if u9["Speed Buff"] then
			v1884 = v1884 + 2;
		end;
		if u9["Artillerist Buff"] then
			v1884 = v1884 + 1;
		end;
		local v1885 = baseadstime / v1884;
		local v1886 = math.clamp(tick() - baseadstick, 0, v1885) / v1885;
		if u8.aiming == true and u14.weapontype == "Gun" then
			camroot.camRootWeld.C0 = camroot.camRootWeld.C0:Lerp(fparms.ROOT.CFrame:toObjectSpace(u16.ADS.CFrame * CFrame.new(0, -1, -1.75) * CFrame.Angles(-1.5707963267948966, 0, 0)):inverse(), v1886);
		else
			camroot.camRootWeld.C0 = camroot.camRootWeld.C0:Lerp(CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 0.05);
		end;
	end;
	u188();
	if maingui:FindFirstChild("devbox") and maingui:FindFirstChild("devbox").Visible == true then
		maingui.devbox.devlabel1.Text = "ATK : " .. u18 + u36;
		maingui.devbox.devlabel2.Text = "DEF : " .. u17;
		maingui.devbox.devlabel3.Text = "ADDED MVMT : " .. u19;
	end;
end);
hum.Died:connect(function()
	l__game__6:GetService("StarterGui"):SetCore("ResetButtonCallback", false);
	if resetBindable then
		resetBindable:Destroy();
	end;
	if deathactivated ~= false then
		return;
	end;
	deathactivated = true;
	if v121.damagetaken >= 200 then
		l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "Tanked200", 1 });
	end;
	if v121.damage <= 50 then
		l__workspace__1.ServerStuff.adjustStats:FireServer("tracker", { "LowDamageMoment", 1 });
	end;
	u8.staggering = true;
	u8.aiming = false;
	l__game__6:GetService("SoundService").AmbientReverb = Enum.ReverbType.Mountains;
	l__game__6:GetService("SoundService").regular.Volume = 1;
	maingui.Enabled = false;
	if maingui:FindFirstChild("visor") then
		maingui:FindFirstChild("visor"):Destroy();
	end;
	if cc then
		cc.Parent = nil;
	end;
	if playerstats.Class == "damn" then
		spawn(function()
			local l__cuffs__1887 = character:WaitForChild("cuffs");
			if l__cuffs__1887 then
				l__cuffs__1887.beam.Enabled = true;
			end;
		end);
	end;
	v121.placed = #l__workspace__1.activePlayers:GetChildren();
	l__workspace__1.ServerStuff.adjustStats:FireServer("stats", { "MainStats", 1, nil, "Deaths" });
	character.HumanoidRootPart.Anchored = true;
	ply.CameraMode = "Classic";
	l__game__6:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
	UIS.MouseIconEnabled = true;
	u103 = function()

	end;
	u105 = function()

	end;
	u102:Disconnect();
	u104:Disconnect();
	v1604:Disconnect();
	v122:Disconnect();
	pcall(function()
		l__game__6:GetService("RunService"):UnbindFromRenderStep("rsloop");
	end);
	v1785:Disconnect();
	for v1888, v1889 in ipairs(l__workspace__1.NoTarget:GetChildren()) do
		if v1889.Name == "colBox" then
			v1889:Destroy();
		end;
	end;
	for v1890, v1891 in ipairs(l__CurrentCamera__1:GetChildren()) do
		v1891:Destroy();
	end;
	RS:wait();
	l__CurrentCamera__1.CameraType = Enum.CameraType.Scriptable;
	local l__Torso__1892 = character:FindFirstChild("Torso");
	if l__Torso__1892 ~= nil then
		l__CurrentCamera__1.FieldOfView = 40;
		l__CurrentCamera__1.CameraSubject = l__Torso__1892;
		local u189 = false;
		spawn(function()
			local v1893 = 6.3;
			local v1894, v1895 = raycastline(l__CurrentCamera__1.CFrame.p, -l__CurrentCamera__1.CFrame.lookVector, 6.3, baselayer);
			if v1894 then
				v1893 = (l__CurrentCamera__1.CFrame.p - v1895).magnitude;
			end;
			l__CurrentCamera__1.CFrame = l__Torso__1892.CFrame * CFrame.new(v1893, 1, -5) * CFrame.Angles(-0.17453292519943295, 1.9198621771937625, 0);
			while true do
				fparms.Parent = nil;
				local v1896, v1897 = raycastline(l__CurrentCamera__1.CFrame.p, -l__CurrentCamera__1.CFrame.lookVector, 6.3, baselayer);
				if v1896 and (l__CurrentCamera__1.CFrame.p - v1897).magnitude <= v1893 then
					v1893 = (l__CurrentCamera__1.CFrame.p - v1897).magnitude;
				end;
				l__CurrentCamera__1.CFrame = CFrame.new(l__Torso__1892.CFrame.p) * CFrame.new(v1893, 1, -3) * CFrame.Angles(-0.17453292519943295, 1.9198621771937625, 0);
				RS:wait();
				if u189 == true then
					break;
				end;			
			end;
		end);
	end;
	l__workspace__1.ServerStuff.deathPlay:FireServer();
	local u190 = false;
	delay(1.5, function()
		v104({ "deaths" }, "suspense", nil, nil, true, true);
		delay(1.05, function()
			l__game__6:GetService("SoundService").regular.Volume = 0;
			ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = 0;
			u190 = true;
			delay(1, function()
				l__game__6:GetService("SoundService").regular.Volume = 1;
				l__game__6.Lighting.FogStart = 0;
				l__game__6.Lighting.FogEnd = 100;
				local v1898 = l__game__6.ReplicatedStorage.effects.endgamegui:Clone();
				v1898.status.Position = UDim2.new(0.5, 0, 1, 0);
				v1898.status.menu.Visible = true;
				v1898.status.spectate.Visible = false;
				v1898.Parent = ply.PlayerGui;
				v1898.Enabled = true;
				ply.CameraMode = "Classic";
				UIS.MouseIconEnabled = true;
				maingui.Enabled = false;
				spectatesystem(v1898);
				v1898.status.spectate.Visible = false;
				v1898.status.menu.MouseButton1Click:connect(function()
					if u131 == true then
						return;
					end;
					u131 = true;
					while true do
						ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency - 0.03;
						RS:wait();
						if ply.PlayerGui.fadetoblack.frame.BackgroundTransparency <= 0 then
							break;
						end;					
					end;
					l__workspace__1.ServerStuff.spawnPlayer:FireServer("respawncharacter");
				end);
				spawn(function()
					while true do
						ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency + 0.1;
						RS:wait();
						if ply.PlayerGui.fadetoblack.frame.BackgroundTransparency >= 1 then
							break;
						end;					
					end;
					ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = 1;
				end);
			end);
		end);
	end);
end);
u56("Fist");
l__game__6.Lighting.FogEnd = 300;
l__game__6.Lighting.FogStart = 0;
ply:WaitForChild("PlayerGui"):SetTopbarTransparency(0);
if startperk.Value == "turfwarA" or startperk.Value == "turfwarB" then
	alertplay("DAY 82: THE RECKONING");
end;
if startperk.Value == "emperor" then
	alertplay("YOU ARE THE EMPEROR");
	u89("EmperorA");
elseif startperk.Value == "commander" then
	alertplay("YOU ARE THE COMMANDER");
	u89("CMBody");
elseif startperk.Value == "hiddenB" then
	u89("HiddenArms");
elseif startperk.Value == "turfwarA" then
	delay(5, function()
		alertplay("LAW 0: ELIMINATE YOUR ENEMY AT ALL COSTS");
	end);
	u89("DSquadShirt");
elseif startperk.Value == "turfwarB" then
	delay(5, function()
		alertplay("GEAR UP, WE'RE BRINGING THE FIGHT TO THEM");
	end);
	u89("RISBody");
else
	u89(playerstats.EquippedCosmetics.Shirt, playerstats.CustomColours.Tops);
end;
if startperk.Value == "siegeA" then
	alertplay("FOLLOW THE EMPEROR");
elseif startperk.Value == "siegeB" then
	alertplay("PROTECT THE COMMANDER");
end;
delay(5, function()
	if startperk.Value == "siegeA" then
		alertplay("ELIMINATE THE COMMANDER");
		return;
	end;
	if startperk.Value == "siegeB" then
		alertplay("HOLD OFF THE EMPEROR");
	end;
end);
u22("health");
l__CurrentCamera__1.FieldOfView = 90;
u22("stamina");
if playerstats.Settings.Crosshair == false then
	maingui.Centre.crosshair.Visible = false;
end;
if startperk.Value == "normal" then
	ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = 0;
	spawn(function()
		while true do
			ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency + 0.1;
			RS:wait();
			if ply.PlayerGui.fadetoblack.frame.BackgroundTransparency >= 1 then
				break;
			end;		
		end;
		ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = 1;
	end);
	v121.timealive = tick();
	maingui.Enabled = true;
	teamfolder = character.Parent;
	maingui.teammatesframe.Visible = true;
	baselayer = { character, l__workspace__1.NoTarget, l__workspace__1.GoreEffects, l__CurrentCamera__1, teamfolder, l__workspace__1.PlayerShootThroughs, l__workspace__1.activeFriendlies };
elseif startperk.Value == "hubbing" then
	ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = 0;
	u8.action = true;
	u8.staggering = true;
	u8.turnable = false;
	u10 = 0.001;
	local v1899 = l__game__6.ReplicatedStorage.effects.endgamegui:Clone();
	v1899.status.Position = UDim2.new(0.5, 0, 1, 0);
	v1899.status.menu.Visible = true;
	v1899.status.spectate.Visible = false;
	v1899.Parent = ply.PlayerGui;
	v1899.Enabled = true;
	character.HumanoidRootPart.Anchored = true;
	ply.CameraMode = "Classic";
	UIS.MouseIconEnabled = true;
	maingui.Enabled = false;
	spectatesystem(v1899);
	v1899.status.spectate.Visible = false;
	v1899.status.menu.MouseButton1Click:connect(function()
		if u131 == true then
			return;
		end;
		u131 = true;
		while true do
			ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency - 0.03;
			RS:wait();
			if ply.PlayerGui.fadetoblack.frame.BackgroundTransparency <= 0 then
				break;
			end;		
		end;
		l__workspace__1.ServerStuff.spawnPlayer:FireServer("respawncharacter");
	end);
	spawn(function()
		while true do
			ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = ply.PlayerGui.fadetoblack.frame.BackgroundTransparency + 0.1;
			RS:wait();
			if ply.PlayerGui.fadetoblack.frame.BackgroundTransparency >= 1 then
				break;
			end;		
		end;
		ply.PlayerGui.fadetoblack.frame.BackgroundTransparency = 1;
	end);
end;
if startperk.Value ~= "hubbing" then
	l__CurrentCamera__1.CameraSubject = ply.Character.Humanoid;
	l__CurrentCamera__1.CameraType = "Custom";
end;
RS:wait();
if spectating == false and l__workspace__1.ServerStuff.game.holdout.Value == false then
	afflictstatus(require(l__game__6.Workspace.ServerStuff.Statistics.S_STATISTICS).VirusA);
end;
if spectating == false and l__workspace__1.ServerStuff.game.holdout.Value == true then
	maingui.TabMenu.bg.map.Image = "rbxassetid://9314268300";
	maingui.TabMenu.bg.crack.Visible = true;
end;
for v1900 = 1, 10 do
	if startperk.Value ~= "hubbing" then
		l__CurrentCamera__1.CFrame = CFrame.new(character.HumanoidRootPart.Position + u27) * CFrame.Angles(0, u153.X, 0) * CFrame.Angles(u153.Y, 0, 0);
		l__CurrentCamera__1.CameraSubject = ply.Character.Humanoid;
		l__CurrentCamera__1.CameraType = "Custom";
		character.HumanoidRootPart.Anchored = false;
		ply.CameraMode = "LockFirstPerson";
	end;
	l__CurrentCamera__1.FieldOfView = 90;
	RS:wait();
end;
delay(1, function()
	if startperk.Value ~= "hubbing" then
		spectating = false;
	end;
end);
u34(10, "HOME SUPPLIES");
if character:FindFirstChild("Outfit") and character:FindFirstChild("Outfit"):FindFirstChild("Bottom") then
	character:FindFirstChild("Outfit"):FindFirstChild("Bottom"):Clone().Parent = l__workspace__1.Camera;
end;

