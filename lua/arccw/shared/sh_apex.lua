CreateConVar("arccw_apex_bal", -1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Tweaks the balancing for the Apex Legends Weapons.", -1, 2)
CreateConVar("arccw_apex_ammo", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Use HL2 ammo types instead of custom ammo types.", 0, 1)
CreateConVar("arccw_apex_freecharge", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Make charging up the Sentinel and Rampage not cost anything.", 0, 1)

CreateConVar("arccw_apex_ttt_ammo", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Replace ArcCW TTT ammo replacements with Apex ammo types.", 0, 1)
--CreateConVar("arccw_apex_ttt_exclusive", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Only allow Apex weapons to spawn in TTT (and not other ArcCW weapons).", 0, 1)
CreateConVar("arccw_apex_ttt_gas_halo", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "When TTT balance mode is on, being in Nox gas gives all other players threat vision of you.", 0, 1)

ArcCW.Apex = {}

ArcCW.Apex.GrenadeBlacklist = {
    ["arccw_apex_thr_arcstar"] = true,
    ["arccw_apex_thermite"] = true,
    ["arccw_apex_thr_thermite"] = true,
    ["arccw_apex_thr_frag_fire"] = true,
    ["arccw_apex_thr_star_fire"] = true,

    ["viewmodel"] = true,
    ["predicted_viewmodel"] = true,
    ["entityflame"] = true,
    ["worldspawn"] = true,
}

-- HL2 zombies are hard-coded to not take any DMG_BURN damage, but instead slowly burn out
-- as cool as it looks in ravenholm, it feels awful against our case so we change dmgtype against them
ArcCW.Apex.FireDirectDamage = {
    ["npc_zombie"] = true,
    ["npc_zombie_torso"] = true,
    ["npc_fastzombie"] = true,
    ["npc_fastzombie_torso"] = true,
    ["npc_poisonzombie"] = true,
    ["npc_zombine"] = true,
    ["npc_headcrab"] = true,
    ["npc_headcrab_fast"] = true,
    ["npc_headcrab_black"] = true,
    ["npc_headcrab_poison"] = true,
}

ArcCW.Apex.StickyStuff = {
    ["arccw_apex_arrowpickup"] = true,
    ["arccw_apex_thr_star_blade"] = true,
    ["arccw_apex_thr_star_fire"] = true,
    ["arccw_apex_thr_star_arc"] = true,
    ["arccw_apex_thr_star_frag"] = true,
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

ArcCW.Apex.NoxBalance = {
    [0] = {5, 0.5},
    [1] = {5, 1},
    [2] = {2, 0.5},
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
        if SERVER then ply:RemoveAmmo(1, ammo) end
        return true
    elseif ply:HasWeapon(grenade) and ply:GetWeapon(grenade):Clip1() > 0 then
        if SERVER and not ply:GetWeapon(grenade):HasInfiniteAmmo() then ply:StripWeapon(grenade) end
        return true
    end

    return false
end

-- Generate a Vector that points to a random point in a circle from origin UNIFORMLY
function ArcCW.Apex.CircleRandVector(radius)
    local r = radius * math.sqrt(math.random())
    local theta = math.random() * 2 * math.pi
    return Vector(r * math.cos(theta), r * math.sin(theta), 0)
end

-- I hate entityflame so much
function ArcCW.Apex.ValidNadeTarget(ent)
    return IsValid(ent) and not ArcCW.Apex.GrenadeBlacklist[ent:GetClass()]
            and not IsValid(ent:GetParent())
            and not (ent:IsWeapon() and IsValid(ent:GetOwner()))
            and not (ent:IsPlayer() and (not ent:Alive() or ent:GetObserverMode() ~= OBS_MODE_NONE))
end

hook.Add("ArcCW_InitBulletProfiles", "Apex", function()
    ArcCW:AddBulletProfile("apex_bocek", {
        color = Color(192, 192, 255),
        sprite_head = nil,
        sprite_tail = Material("effects/apexlaser"),
        model = "models/ammo/w_arrow_projectile.mdl",
        size = 1,
        size_min = 0.15,
        tail_length = 0.15,
    })

    -- shatter caps
    ArcCW:AddBulletProfile("apex_bocek2", {
        color = Color(192, 192, 255),
        sprite_head = nil,
        sprite_tail = Material("effects/apexlaser"),
        size = 0.6,
        size_min = 0.12,
        tail_length = 0.125,
    })

    ArcCW:AddBulletProfile("apex_lstar", {
        color = Color(255, 111, 111),
        sprite_head = false,
        sprite_tail = false,
        model = "models/weapons/w_bullet.mdl",
        model_nodraw = true,
        size = 0.6,
        size_min = 0.3,
        tail_length = 0.050,
        particle = "tfa_apex_lstar_projectile_lite"
    })

    ArcCW:AddBulletProfile("apex_bullet_smg", { -- My version of trying this out - Twilight
        color = Color(255, 180, 128),
        sprite_head = Material("effects/cmbglow_nocolor"),
        sprite_tail = Material("effects/spark"),
        model = "models/weapons/w_bullet.mdl",
        model_nodraw = true,
        size = 1,
        size_min = 0.1,
        tail_length = 0.1,
        --particle = "tfa_apex_bullet_trail"
    })

    ArcCW:AddBulletProfile("apex_bullet", {
        color = Color(255, 180, 128),
        sprite_head = Material("effects/cmbglow_nocolor"),
        sprite_tail = Material("effects/apexlaser"),
        model = "models/weapons/w_bullet.mdl",
        model_nodraw = true,
        size = 1.4,
        size_min = 0.4,
        tail_length = 0.4,
        --particle = "tfa_apex_bullet_trail"
    })

    ArcCW:AddBulletProfile("apex_bullet_energy", {
        color = Color(80, 150, 255),
        sprite_head = Material("effects/cmbglow_nocolor"),
        sprite_tail = Material("effects/apexlaser"),
        model = "models/weapons/w_bullet.mdl",
        model_nodraw = true,
        size = 1.4,
        size_min = 0.4,
        tail_length = 0.4,
        --particle = "tfa_apex_bullet_energy_trail"
    })

    ArcCW:AddBulletProfile("apex_bullet_sentinel", {
        color = Color(164, 170, 255),
        sprite_head = Material("effects/cmbglow_nocolor"),
        sprite_tail = Material("effects/apexlaser"),
        model = "models/weapons/w_bullet.mdl",
        model_nodraw = true,
        size = 1.8,
        size_min = 0.6,
        tail_length = 0.8,
        --particle = "tfa_apex_bullet_sent_trail"
    })
end)

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

hook.Add("StartCommand", "ArcCW_Apex_ArcSlow", function(ply, ucmd)
    if (ply.ArcSlowEnd or 0) > CurTime() then
        ucmd:SetButtons(bit.band(ucmd:GetButtons(), bit.bnot(IN_SPEED)))
    end
end)

hook.Add("SetupMove", "ArcCW_Apex_ArcSlow", function(ply, mv, ucmd)
    if (ply.ArcSlowEnd or 0) > CurTime() then
        mv:SetMaxSpeed(mv:GetMaxSpeed() * 0.5)
        mv:SetMaxClientSpeed(mv:GetMaxClientSpeed() * 0.5)
    end
end)

ArcCW.Apex.NoxSources = {}

if SERVER then
    util.AddNetworkString("arccw_apex_autoreload")
    util.AddNetworkString("arccw_apex_hit")
    util.AddNetworkString("arccw_apex_arcslow")
    util.AddNetworkString("arccw_apex_loader")

    -- Since all move hooks are run client and server, we need to network it
    function ArcCW.Apex.ArcSlow(ply, dur)
        net.Start("arccw_apex_arcslow")
            net.WriteFloat(dur + CurTime())
        net.Send(ply)
        ply.ArcSlowEnd = dur + CurTime()
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

    hook.Add("EntityRemoved", "ArcCW_Apex", function(ent)
        if CLIENT then return end
        for k, v in pairs(ent:GetChildren()) do
            if ArcCW.Apex.StickyStuff[v:GetClass()] then
                v:SetParent(NULL)
                v:InitPhys()
                if v.CanPickup == false then
                    v.CanPickup = true
                    v:SetTrigger(true)
                    v:UseTriggerBounds(true, 16)
                end
            end
        end
    end)

    hook.Add("PostPlayerDeath", "ArcCW_Apex", function(ent)
        for k, v in pairs(ent:GetChildren()) do
            if ArcCW.Apex.StickyStuff[v:GetClass()] then
                v:SetParent(NULL)
                v:InitPhys()
                if v.CanPickup == false then
                    v.CanPickup = true
                    v:SetTrigger(true)
                    v:UseTriggerBounds(true, 16)
                end
            end
        end
    end)

    ArcCW.Apex.NoxDamaged = {}
    local nextnox = 0
    hook.Add("Think", "ArcCW_Apex_Nox", function()
        if #ArcCW.Apex.NoxSources == 0 or nextnox > CurTime() then return end
        nextnox = CurTime() + 1
        local damaged = {}
        local toclear = table.Copy(ArcCW.Apex.NoxDamaged)
        for id, ent in ipairs(ArcCW.Apex.NoxSources) do
            if not IsValid(ent) then table.remove(ArcCW.Apex.NoxSources, id) continue end
            if ent.GetArmed and not ent:GetArmed() then continue end
            local z = ent:GetPos().z
            for k, v in pairs(ents.FindInSphere(ent:GetPos(), ent.GasRadius and ent.GasRadius[ArcCW.Apex.GetBalanceMode()] or 512)) do
                if math.abs(z - v:GetPos().z) <= 192 and not damaged[v] and (v:IsNPC() or v:IsPlayer() or v:IsNextBot()) then
                    damaged[v] = ent
                    if toclear[v:EntIndex()] then toclear[v:EntIndex()] = nil end
                end
            end
        end

        local start, add = unpack(ArcCW.Apex.NoxBalance[ArcCW.Apex.GetBalanceMode()])

        local hit = {}
        for v, ent  in pairs(damaged) do
            ArcCW.Apex.NoxDamaged[v:EntIndex()] = (ArcCW.Apex.NoxDamaged[v:EntIndex()] or 0) + add
            local o = ent:GetOwner()
            local dmg = DamageInfo()
            dmg:SetDamageType(DMG_NERVEGAS)
            dmg:SetDamage(math.floor(start - add + ArcCW.Apex.NoxDamaged[v:EntIndex()]))
            dmg:SetInflictor(IsValid(ent) and ent or o)
            dmg:SetAttacker(o)
            dmg:SetDamageForce(Vector(0, 0, 0))
            v:TakeDamageInfo(dmg)
            if not hit[o] and (v:IsNPC() or (v:IsPlayer() and v:Alive()) or v:IsNextBot()) and IsValid(o) and v ~= o and v:Health() > 0 then
                hit[o] = true
                net.Start("arccw_apex_hit")
                    net.WriteBool(false)
                net.Send(ent:GetOwner())
            end
        end

        for e, _ in pairs(toclear) do
            ArcCW.Apex.NoxDamaged[e] = nil
        end
    end)
else
    CreateConVar("arccw_apex_hitsound", 1, FCVAR_ARCHIVE, "Use hit sounds on Apex Legends weapons.", 0, 1)
    CreateConVar("arccw_apex_hitsound_headshot", 1, FCVAR_ARCHIVE, "Use headshot hit sounds on Apex Legends weapons.", 0, 1)
    CreateConVar("arccw_apex_hitmarker", 1, FCVAR_ARCHIVE, "Use hit markers on Apex Legends weapons.", 0, 1)
    CreateConVar("arccw_apex_hitmarker_headshot", 1, FCVAR_ARCHIVE, "Hitmarker turns red on a headshot.", 0, 1)
    CreateConVar("arccw_apex_hitmarker_size", 24, FCVAR_ARCHIVE, "Set the hitmarker size (scaled to your resolution).", 16, 64)

    ArcCW.Apex.DrawCrosshairHint = function(text, a)
        a = a or 0
        text = ArcCW.TryTranslation(text)
        if a > 0 then
            surface.SetFont("ArcCWC2_12")
            local tw, th = surface.GetTextSize(text)
            local x, y = ScrW() * 0.5 - tw * 0.5, ScrH() * 0.575 - th * 0.5
            surface.SetTextPos(x + 2, y + 2)
            surface.SetTextColor(0, 0, 0, 150 * a)
            surface.DrawText(text)
            surface.SetTextPos(x, y)
            surface.SetTextColor(255, 255, 255, 255 * a)
            surface.DrawText(text)
        end
    end

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

    local Apex_BoostedReloadPanel
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

    local Apex_Hitmarker
    local lasthitsound = 0
    local hit_normal = Color(255, 255, 255)
    local hit_head = Color(255, 0, 0)
    local hitmarkermat = Material("hud/hitmarker.png", "smooth mips")
    net.Receive("arccw_apex_hit", function()
        if lasthitsound == CurTime() then return end
        lasthitsound = CurTime()
        local hs = net.ReadBool()
        if hs and GetConVar("arccw_apex_hitsound_headshot"):GetBool() then
            LocalPlayer():EmitSound("Apex_Hit_Headshot")
        elseif GetConVar("arccw_apex_hitsound"):GetBool() then
            LocalPlayer():EmitSound("Apex_Hit_Sound")
        end

        if GetConVar("arccw_apex_hitmarker"):GetBool() then
            if not IsValid(Apex_Hitmarker) then
                Apex_Hitmarker = vgui.Create("DImage")
                local s = ScreenScale(GetConVar("arccw_apex_hitmarker_size"):GetInt())
                Apex_Hitmarker:SetSize(s, s)
                Apex_Hitmarker:Center()
                Apex_Hitmarker:SetMaterial(hitmarkermat)
                Apex_Hitmarker.Think = function()
                    if Apex_Hitmarker.Alpha > 0 and Apex_Hitmarker.LastHit + 0.1 < CurTime() then
                        Apex_Hitmarker.Alpha = math.max(Apex_Hitmarker.Alpha - FrameTime() * 10, 0)
                    end
                    if Apex_Hitmarker.Alpha <= 0 then
                        Apex_Hitmarker:Remove()
                    else
                        Apex_Hitmarker:SetAlpha(Apex_Hitmarker.Alpha * 255)
                    end
                end
            end

            if GetConVar("arccw_apex_hitmarker_headshot"):GetBool() and hs then
                Apex_Hitmarker:SetImageColor(hit_head)
            else
                Apex_Hitmarker:SetImageColor(hit_normal)
            end

            Apex_Hitmarker.LastHit = CurTime()
            Apex_Hitmarker.Alpha = 1

        end
    end)

    local Apex_AutoReloadPanel
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
        LocalPlayer().ArcSlowEnd = net.ReadFloat()
    end)

    hook.Add("RenderScreenspaceEffects", "ArcCW_Apex_ArcSlow", function()
        if (LocalPlayer().ArcSlowEnd or 0) > CurTime() then
            local delta = math.Clamp((LocalPlayer().ArcSlowEnd - CurTime()) / 2, 0, 1) ^ 0.75

            DrawMaterialOverlay("effects/water_warp01", delta * 0.5)
            DrawMotionBlur(0.5 * delta, 0.75, 0.01)
            DrawColorModify({
                [ "$pp_colour_addr" ] = 0,
                [ "$pp_colour_addg" ] = 0,
                [ "$pp_colour_addb" ] = 0,
                [ "$pp_colour_brightness" ] = 0.35 * delta,
                [ "$pp_colour_contrast" ] = 1 - delta * 0.5,
                [ "$pp_colour_colour" ] = 1 - delta,
                [ "$pp_colour_mulr" ] = 0,
                [ "$pp_colour_mulg" ] = 0,
                [ "$pp_colour_mulb" ] = 0,
            })
        end
    end )

    hook.Add("HUDShouldDraw", "ArcCW_Apex_ArcSlow", function(ele)
        if (LocalPlayer().ArcSlowEnd or 0) > CurTime() and ele ~= "CHudWeaponSelection" then
            return false
        end
    end)

    local playerlast = {}
    hook.Add("PreDrawHalos", "ArcCW_Apex_NoxGlow", function()
        if ArcCW.Apex.GetBalanceMode() ~= 2 or not GetConVar("arccw_apex_ttt_gas_halo"):GetBool() or table.Count(ArcCW.Apex.NoxSources) == 0 then return end
        local players = {}
        for k, v in pairs(player.GetAll()) do
            for i, ent in pairs(ArcCW.Apex.NoxSources) do
                if not IsValid(ent) then
                    table.remove(ArcCW.Apex.NoxSources, i)
                elseif ent:GetArmed() and ent:GetPos():Distance(v:GetPos()) <= (ent.GasRadius and ent.GasRadius[ArcCW.Apex.GetBalanceMode()] or 512) then
                    table.insert(players, v)
                    playerlast[v] = CurTime()
                    continue
                end
            end
        end
        halo.Add(players, Color(255, 125, 0, 200), 1, 1, 2, false, true)

        for k, v in pairs(playerlast) do
            if v == CurTime() then continue end
            if IsValid(k) and v + 1 > CurTime() then
                halo.Add({k}, Color(255, 125, 0, 200 * (v + 1 - CurTime())), 1, 1, 2, false, true)
            else
                playerlast[k] = nil
            end
        end

    end)
end