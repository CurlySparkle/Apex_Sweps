CreateConVar("arccw_apex_bal", -1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Tweaks the balancing for the Apex Legends Weapons.", -1, 2)
CreateConVar("arccw_apex_ammo", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Use HL2 ammo types instead of custom ammo types.", 0, 1)
CreateConVar("arccw_apex_freecharge", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Make charging up the Sentinel and Rampage not cost anything.", 0, 1)

CreateConVar("arccw_apex_ttt_ammo", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Replace ArcCW TTT ammo replacements with Apex ammo types.", 0, 1)
--CreateConVar("arccw_apex_ttt_exclusive", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Only allow Apex weapons to spawn in TTT (and not other ArcCW weapons).", 0, 1)

ArcCW.Apex = {}

ArcCW.Apex.GrenadeBlacklist = {
    ["arccw_apex_thr_arcstar"] = true,
    ["arccw_apex_thermite"] = true,
    ["arccw_apex_thr_thermite"] = true,
    ["predicted_viewmodel"] = true,
    ["entityflame"] = true,
    ["worldspawn"] = true,
}

ArcCW.Apex.BlendSights = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    local delta = wep:GetSightDelta()
    local coolilove = math.cos(delta * (math.pi / 2))
    vm:SetPoseParameter( "sights", Lerp(coolilove, 0, 1) ) -- thanks fesiug
end

game.AddAmmoType({name = "apex_light"})
game.AddAmmoType({name = "apex_heavy"})
game.AddAmmoType({name = "apex_shotgun"})
game.AddAmmoType({name = "apex_energy"})
game.AddAmmoType({name = "apex_sniper"})
game.AddAmmoType({name = "apex_arrow"})

ArcCW.Apex.AmmoConvert = {
    apex_light = "pistol",
    apex_heavy = "smg1",
    apex_energy = "ar2",
    apex_shotgun = "buckshot",
    apex_sniper = "SniperPenetratedRound",
    apex_arrow = "XBowBolt",
}

ArcCW.Apex.BalanceMode = nil

function ArcCW.Apex.GetBalanceMode()
    local val = ArcCW.Apex.BalanceMode or GetConVar("arccw_apex_bal"):GetInt()
    if val == -1 then
        if engine.ActiveGamemode() == "terrortown" then
            ArcCW.Apex.BalanceMode = 2
        elseif DarkRP then
            ArcCW.Apex.BalanceMode = 1
        else
            ArcCW.Apex.BalanceMode = 0
        end
        val = ArcCW.Apex.BalanceMode
    end
    return val
end

function ArcCW.Apex.Setup(self, balance)
    local val = ArcCW.Apex.GetBalanceMode()
    for i, v in pairs(balance[val] or {}) do
        self[i] = v
    end
end

function ArcCW.Apex.TryConsumeGrenade(ply, grenade)
    if GetConVar("arccw_apex_freecharge"):GetBool() then return true end
    local wpntbl = weapons.Get(grenade)
    local ammo = wpntbl.Primary.Ammo

    if ply:GetAmmoCount(ammo) > 0 then
        ply:RemoveAmmo(1, ammo)
        return true
    elseif ply:HasWeapon(grenade) and ply:GetWeapon(grenade):Clip1() > 0 then
        if not ply:GetWeapon(grenade):HasInfiniteAmmo() then ply:StripWeapon(grenade) end
        return true
    end

    return false
end

hook.Add("InitPostEntity", "ArcCW_Apex", function()

    ArcCW.TTTAmmoToClipMax["apex_light"] = 20 * 3
    ArcCW.TTTAmmoToClipMax["apex_heavy"] = 20 * 3
    ArcCW.TTTAmmoToClipMax["apex_energy"] = 20 * 3
    ArcCW.TTTAmmoToClipMax["apex_shotgun"] = 16 * 2
    ArcCW.TTTAmmoToClipMax["apex_arrow"] = 16 * 2
    ArcCW.TTTAmmoToClipMax["apex_sniper"] = 12 * 2

    if GetConVar("arccw_apex_ttt_ammo"):GetBool() and not GetConVar("arccw_apex_ammo"):GetBool() then
        ArcCW.AmmoEntToArcCW["item_ammo_pistol_ttt"] = "arccw_ammo_apex_light"
        ArcCW.AmmoEntToArcCW["item_ammo_smg1_ttt"] = "arccw_ammo_apex_heavy"
        ArcCW.AmmoEntToArcCW["item_ammo_revolver_ttt"] = "arccw_ammo_apex_sniper"
        ArcCW.AmmoEntToArcCW["item_box_buckshot_ttt"] = "arccw_ammo_apex_shotgun"
        ArcCW.AmmoEntToArcCW["item_ammo_357_ttt"] = "arccw_ammo_apex_energy"
    end

    for i, k in pairs(weapons.GetList()) do
        if not weapons.IsBasedOn(k.ClassName, "arccw_base") then continue end
        local stored = weapons.GetStored(k.ClassName) -- necessary?

        --[[]
        if GetConVar("arccw_apex_ttt_exclusive"):GetBool() and not weapons.IsBasedOn(k.ClassName, "arccw_apex_base") then
            stored.TTTWeight = 0
            stored.NPCWeight = 0
        end
        ]]

        if GetConVar("arccw_apex_ammo"):GetBool() and weapons.IsBasedOn(k.ClassName, "arccw_apex_base") then
            stored.Primary.Ammo = ArcCW.Apex.AmmoConvert[stored.Primary.Ammo] or stored.Primary.Ammo
            stored.AmmoEnt = ArcCW.TTTAmmoToEntity[stored.Primary.Ammo]
        elseif weapons.IsBasedOn(k.ClassName, "arccw_apex_base") then
            stored.AmmoEnt = "arccw_ammo_" .. stored.Primary.Ammo
        end
    end
    ArcCW.RandomWeaponCache = {}
end)

hook.Add("StartCommand", "ArcCW_Apex_ArcStarSlow", function(ply, ucmd)
    if (ply.ArcStarSlowEnd or 0) > CurTime() then
        ucmd:SetButtons(bit.band(ucmd:GetButtons(), bit.bnot(IN_SPEED)))
    end
end)
hook.Add("SetupMove", "ArcCW_Apex_ArcStarSlow", function(ply, mv, ucmd)
    if (ply.ArcStarSlowEnd or 0) > CurTime() then
        mv:SetMaxSpeed(mv:GetMaxSpeed() * 0.7)
        mv:SetMaxClientSpeed(mv:GetMaxClientSpeed() * 0.7)
    end
end)

if SERVER then
    util.AddNetworkString("arccw_apex_autoreload")
    util.AddNetworkString("arccw_apex_hit")
    util.AddNetworkString("arccw_apex_arcslow")
    util.AddNetworkString("arccw_apex_loader")

    -- Since all move hooks are run client and server, we need to network it
    function ArcCW.Apex.ArcStarSlow(ply, dur)
        net.Start("arccw_apex_arcslow")
            net.WriteFloat(dur + CurTime())
        net.Send(ply)
        ply.ArcStarSlowEnd = dur + CurTime()
    end

    local function hitsound(ply, hg, dmg)
        local attacker = dmg:GetAttacker()
        local inflictor = (attacker == dmg:GetInflictor() and attacker:IsPlayer()) and attacker:GetActiveWeapon() or dmg:GetInflictor()
        if not attacker:IsPlayer() or not weapons.IsBasedOn(inflictor:GetClass(), "arccw_apex_base") or (attacker.ApexLastHit or 0) == CurTime() then return end
        attacker.ApexLastHit = CurTime()

        net.Start("arccw_apex_hit")
            net.WriteBool(hg == HITGROUP_HEAD)
        net.Send(attacker)
    end

    hook.Add("ScalePlayerDamage", "ArcCW_Apex", hitsound)
    hook.Add("ScaleNPCDamage", "ArcCW_Apex", hitsound)
else
    CreateConVar("arccw_apex_hitsound", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Use hit sounds on Apex Legends weapons.", 0, 1)
    CreateConVar("arccw_apex_hitsound_headshot", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Use headshot hit sounds on Apex Legends weapons.", 0, 1)

    sound.Add({
        name = "Apex_Hit_Sound",
        channel = CHAN_AUTO,
        level = 100,
        volume = 1,
        pitch = {90, 110},
        sound = "player/flesh_bulletimpact_1p_vs_3p.wav"
    })
    sound.Add({
        name = "Apex_Hit_Headshot",
        channel = CHAN_AUTO,
        level = 100,
        volume = 1,
        pitch = {80, 110},
        sound = "player/player_hitbeep_headshotrapid_human_1p_vs_3p.wav"
    })

    net.Receive("arccw_apex_loader", function()
        LocalPlayer():EmitSound("hud/UI_InGame_BoostedLoader_Reload_Bleeps_St_v2_0" .. math.random(1, 4) .. ".wav")

        if IsValid(Apex_BoostedReloadPanel) then Apex_BoostedReloadPanel:Remove() end
        Apex_BoostedReloadPanel = vgui.Create("DImage")
        Apex_BoostedReloadPanel:SetSize(256, 64)
        Apex_BoostedReloadPanel:SetPos(ScrW() * 0.5 - 128, ScrH() * 0.575 - 32)
        Apex_BoostedReloadPanel:SetImage("hud/boosted_loader_reload.png")

        Apex_BoostedReloadPanel.CreateTime = CurTime()
        Apex_BoostedReloadPanel.Alpha = 0

        Apex_BoostedReloadPanel.Think = function()
            if Apex_BoostedReloadPanel.CreateTime + 1.5 < CurTime() then
                Apex_BoostedReloadPanel.Alpha = math.Approach(Apex_BoostedReloadPanel.Alpha, 0, FrameTime() * 5)
                if Apex_BoostedReloadPanel.Alpha <= 0 then
                    Apex_BoostedReloadPanel:Remove()
                end
            elseif Apex_BoostedReloadPanel.Alpha < 0.75 then
                Apex_BoostedReloadPanel.Alpha = math.Approach(Apex_BoostedReloadPanel.Alpha, 0.75, FrameTime() * 10)
            end
            Apex_BoostedReloadPanel:SetAlpha(Apex_BoostedReloadPanel.Alpha * 255)
        end
    end)

    local lasthitsound = 0
    net.Receive("arccw_apex_hit", function()
        if lasthitsound == CurTime() then return end
        lasthitsound = CurTime()
        local hs = net.ReadBool()
        if hs and GetConVar("arccw_apex_hitsound_headshot"):GetBool() then
            LocalPlayer():EmitSound("Apex_Hit_Headshot")
        elseif GetConVar("arccw_apex_hitsound"):GetBool() then
            LocalPlayer():EmitSound("Apex_Hit_Sound")
        end
    end)

    net.Receive("arccw_apex_autoreload", function()
        local wep = net.ReadEntity()

        LocalPlayer():EmitSound("items/UI_InGame_GoldMag_Reload_v3_0" .. math.random(1, 3) .. ".wav")

        if IsValid(Apex_AutoReloadPanel) then Apex_AutoReloadPanel:Remove() end
        Apex_AutoReloadPanel = vgui.Create("DImage")
        Apex_AutoReloadPanel:SetSize(512, 64)
        Apex_AutoReloadPanel:SetPos(ScrW() - 512 + 64, ScrH() * 0.7)
        Apex_AutoReloadPanel:SetImage(wep:GetBuff_Override("AutoReloadMaterial") or "entities/ammo_heavy_reloaded.png")

        Apex_AutoReloadPanel.Gun = vgui.Create("DImage", Apex_AutoReloadPanel)
        Apex_AutoReloadPanel.Gun:SetSize(killicon.GetSize(wep:GetClass()))
        Apex_AutoReloadPanel.Gun:SetPos(256 - 24 - Apex_AutoReloadPanel.Gun:GetWide() * 0.5, (64 - Apex_AutoReloadPanel.Gun:GetTall()) * 0.5)
        Apex_AutoReloadPanel.Gun:SetMaterial("VGUI/" .. string.Replace(wep:GetClass(), "arccw_apex_", "apex_killicon_"))

        Apex_AutoReloadPanel.CreateTime = CurTime()
        Apex_AutoReloadPanel.Alpha = 0

        Apex_AutoReloadPanel.Think = function()
            if Apex_AutoReloadPanel.CreateTime + 3.5 < CurTime() then
                Apex_AutoReloadPanel.Alpha = math.Approach(Apex_AutoReloadPanel.Alpha, 0, FrameTime() * 2)
                if Apex_AutoReloadPanel.Alpha <= 0 then
                    Apex_AutoReloadPanel:Remove()
                end
            elseif Apex_AutoReloadPanel.Alpha < 1 then
                Apex_AutoReloadPanel.Alpha = math.Approach(Apex_AutoReloadPanel.Alpha, 1, FrameTime() * 5)
            end
            Apex_AutoReloadPanel:SetAlpha(Apex_AutoReloadPanel.Alpha * 255)
        end
    end)

    net.Receive("arccw_apex_arcslow", function()
        LocalPlayer().ArcStarSlowEnd = net.ReadFloat()
    end)
end