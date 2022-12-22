if CLIENT then
    killicon.Add( "arccw_apex_sentinel", "VGUI/apex_killicon_sentinel", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_sentinel")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Sentinel"
SWEP.Trivia_Class = "Sniper Rifle"
SWEP.Trivia_Desc = "A veritably powerful bolt action sniper rifle.\n\nPress the firemode key to charge up the weapon with 50 suit armor, increasing its damage."
SWEP.Trivia_Manufacturer = "Paradinha Arsenal"

SWEP.Slot = 4

SWEP.Sway = 0.1

SWEP.CrouchPos = Vector(-8, -2, 1.5)
SWEP.CrouchAng = Angle(0, 0, -53)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.NPCWeaponType = "weapon_crossbow"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_sentinel.mdl"
SWEP.WorldModel = "models/weapons/w_apex_sentinel.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(13, 1, 2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 70
SWEP.DamageMin = 70
SWEP.Range = 200
SWEP.Penetration = 30
SWEP.PhysBulletMuzzleVelocity = 31000 * ArcCW.HUToM

SWEP.ChargeDamageMult = 1.25

SWEP.Apex_Balance = {
    [1] = {
        Damage = 85,
        DamageMin = 40,
    },
    [2] = {
        Damage = 60, -- roughly equivalent to TTT scout
        DamageMin = 60,
        ChargeDamageMult = 1.6, -- 96 per shot
        Trivia_Desc = "A veritably powerful bolt action sniper rifle.\n\nPress the firemode key to charge up the weapon with an Arc Star, increasing its damage.",
    },
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
}

SWEP.Tracer = "arccw_apex_tracer_sniper" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 4
SWEP.MaxRecoilBlowback = 1

SWEP.PhysBulletMuzzleVelocity = 750

SWEP.Recoil = 3.300
SWEP.RecoilSide = 0.550
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1
SWEP.VisualRecoilMult = 0.2

SWEP.ManualAction = true
SWEP.NoLastCycle = true -- do not cycle on last shot

SWEP.Delay = 60 / 90
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.bolt"
    }}

SWEP.AccuracyMOA = 0.2
SWEP.HipDispersion = 800
SWEP.MoveDispersion = 75
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.35

SWEP.Primary.Ammo = "apex_sniper"

SWEP.ShootVol = 180 -- volume of shoot sound

SWEP.ShootSound = { "weapons/sentinel/fire_1.ogg", "weapons/sentinel/fire_2.ogg", "weapons/sentinel/fire_3.ogg" }
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_4"
SWEP.ShootSoundSilenced = { "weapons/sentinel/fire_charged_1.ogg", "weapons/sentinel/fire_charged_2.ogg", "weapons/sentinel/fire_charged_3.ogg" }
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "tfa_apex_muzzle_dmr"
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellPitch = 75
SWEP.ShellScale = 1.6
SWEP.ShellTime = 1
-- SWEP.ShellRotateAngle = Angle(0, 0, 0)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.BarrelLength = 24

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.SightedSpeedMult = 0.2
SWEP.IronSightStruct = {
    Pos = Vector(0, -3, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.25,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "shotgun"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER

SWEP.AttachmentElements = {
    ["ref_sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["ref_dot"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
    ["charged"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
    ["skin"] = {
        VMSkin = 2,
        WMSkin = 2,
    },
    ["skin_charged"] = {
        VMSkin = 3,
        WMSkin = 3,
    },
}

SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"apex_sights", "apex_scope_snipers", "apex_optic"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(6, 1.0, -7.05),
            wang = Angle(-9, 0, 180)
        },
        InstalledEles = {"ref_sight","ref_dot"},
        CorrectivePos = Vector(2.69,0,-0.47),
        CorrectiveAng = Angle(-0.001, 0.005, 4.997),
        RandomChance = 5,
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_sniper", "apex_stock_combat"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_sniper1"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_skull3"}
    },
    {
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
    },
    {
        PrintName = "Charm",
        Slot = "charm",
        FreeSlot = true,
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1.1, 1.43, -1.1), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(4, 2.1, -5.2),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(0.3, 0.3, 0.3),
		WMScale = Vector(0.3, 0.3, 0.3),
    },
    {
        PrintName = "Stats",
        Slot = {"killcounter2","killcounter"},
        FreeSlot = true,
        Bone = "def_c_base", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1.15, -6.2, 13), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(14, 2, -7.5),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(1, 1, 1),
		WMScale = Vector(1, 1, 1),
    },
}

SWEP.Hook_Think = ArcCW.Apex.BlendSights

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.8},
    ["enter_sprint"] = {
        Source = "sprint_in",
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_FirstDraw_2ch_v1_01.ogg", t = 1 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1,
        MinProgress = 0.5,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Draw_2ch_v2_01.ogg", t = 0 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        Mult = 1,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Holster_2ch_v1_01.ogg", t = 0 / 30},
        },
    },
    ["idle_iron"] = {
        Source = "iron_idle",
    },
    ["fire"] = {
        Source = "fire",
        -- Time = 9 / 10,
        MinProgress = 0.4,
    },
    ["cycle"] = {
        Source = "rechamber",
        ShellEjectAt = 0.3,
        Time = 63 / 40,
        MinProgress = 0.875,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Bolt_2ch_v1_01.ogg", t = 5 / 40},
        },
    },
    ["enter_sight"] = {
        Source = "iron_in",
        MinProgress = 0.1,
    },
    ["fire_sight"] = {
        Source = "fire",
        -- Time = 9 / 10,
        MinProgress = 0.4,
    },
    ["cycle_sight"] = {
        Source = "rechamber",
        ShellEjectAt = 0.3,
        Time = 63 / 40,
        MinProgress = 0.875,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Bolt_2ch_v1_02.ogg", t = 5 / 40},
        },
    },
    ["exit_sight"] = {
        Source = "iron_out",
        MinProgress = 0.1,
    },
    ["bash"] = {
        Source = {"melee"},
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
        SoundTable = {
            {s = "ArcCW_APEX.Melee.Swing.Punch", t = 0 / 30},
    },
    },
    ["enter_inspect"] = {
        Source = "inspect_in",
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
    },
    ["idle_inspect"] = {
        Source = "inspect",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_Start_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_Mid_V1_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_Mid_V1_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_End_V1_2ch_01.wav", t = 316 / 30}
    },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunUp_Fr022_2ch_v1_01.ogg", t = 8 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagOut_Fr041_2ch_v1_01.ogg", t = 25 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagGrab_Fr061_2ch_v1_01.ogg", t = 46 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagSlot_Fr067_2ch_v1_01.ogg", t = 67 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagInsert_Fr086_2ch_v1_01.ogg", t = 69 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunDown_Fr100_2ch_v1_01.ogg", t = 89 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        ShellEjectAt = 0.2,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BoltBack_2ch_v2_01.ogg", t = 5 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunUp_Fr022_2ch_v1_01.ogg", t = 22 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagOut_Fr041_2ch_v1_01.ogg", t = 38 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagGrab_Fr061_2ch_v1_01.ogg", t = 61 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagSlot_Fr067_2ch_v1_01.ogg", t = 67 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagInsert_Fr086_2ch_v1_01.ogg", t = 86 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunDown_Fr100_2ch_v1_01.ogg", t = 100 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_ReChamber_Fr109_2ch_v2_01.ogg", t = 109 / 30}
        },
    },
    ["charge"] = {
        Source = "charge",
        -- Time = 5,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BatteryCharge_GunUp_fr006_2ch_v1_01.ogg", t = 6 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BatteryCharge_BatteryEject_fr023_2ch_v1_01.ogg", t = 24 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BatteryCharge_BatteryGrab_fr033_2ch_v1_01.ogg", t = 33 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BatteryCharge_BatteryPlace_fr049_2ch_v1_01.ogg", t = 49 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BatteryCharge_BatterySlamIn_fr062_2ch_v1_01.ogg", t = 62 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BatteryCharge_ChargeUp_fr070_2ch_v2_01.ogg", t = 70 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BatteryCharge_SpinningBarrel_fr070_2ch_v1_01.ogg", t = 70 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BatteryCharge_CableYank_PowerSurge_fr155_2ch_v1_01.ogg", t = 155 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BatteryCharge_CableYank_Snap_fr155_2ch_v1_01.ogg", t = 155 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BatteryCharge_GunDown_fr182_2ch_v1_01.ogg", t = 182 / 30},
        },
    },
}

SWEP.TTTWeaponType = "weapon_zm_rifle"
SWEP.TTTWeight = 100

SWEP.Jamming = true
SWEP.HeatGain = -15
SWEP.HeatCapacity = 120 + 5 -- plus duration of charge animation
SWEP.HeatDissipation = 1
SWEP.HeatLockout = false
SWEP.HeatDelayTime = 0

SWEP.Hook_GetShootSound = function(wep, fsound)
    if wep:GetHeat() > 0 then
        return "weapons/sentinel/fire_charged_" .. math.random(1, 3) .. ".ogg"
    end
end

SWEP.M_Hook_Mult_Damage = function(wep, data)
    if wep:GetHeat() > 0 then
        data.mult = data.mult * wep.ChargeDamageMult
    end
end

SWEP.M_Hook_Mult_DamageMin = function(wep, data)
    if wep:GetHeat() > 0 then
        data.mult = data.mult * wep.ChargeDamageMult
    end
end

SWEP.Hook_ChangeFiremode = function(wep)
    if wep:GetPriorityAnim() then return true end

    local ok = false
    if ArcCW.Apex:GetBalanceMode() == 2 and not GetConVar("arccw_apex_freecharge"):GetBool() then
        ok = ArcCW.Apex.TryConsumeGrenade(wep:GetOwner(), "arccw_apex_nade_arcstar")
    elseif wep:GetOwner():Armor() >= 50 and ArcCW.Apex:GetBalanceMode() <= 1 and not GetConVar("arccw_apex_freecharge"):GetBool() then
            ok = true
            if SERVER then wep:GetOwner():SetArmor(wep:GetOwner():Armor() - 50) end
	else
		if GetConVar("arccw_apex_freecharge"):GetBool() then ok = true end
    end

    if CLIENT and not ok then
            wep.ApexHintEnd = CurTime() + 1.5
            wep.ApexHintAlpha = 0
    end
    if not ok then return true end

    wep:PlayAnimationEZ("charge", 1, true)
    local n = CurTime() + wep:GetAnimKeyTime("charge", true)
    wep:SetNextPrimaryFire(n)
    wep:SetPriorityAnim(n)
    wep:SetHeat(wep:GetMaxHeat())
    return true
end

SWEP.Hook_PostDrawCrosshair = function(wep)
    if (wep.ApexHintEnd or 0) > CurTime() then
        wep.ApexHintAlpha = math.Approach(wep.ApexHintAlpha or 0, 1, FrameTime() * 5)
    else
        wep.ApexHintAlpha = math.Approach(wep.ApexHintAlpha or 0, 0, FrameTime() * 10)
    end
    ArcCW.Apex.DrawCrosshairHint(ArcCW.Apex:GetBalanceMode() == 2 and "apex.hint.req_arcstar" or "apex.hint.req_armor", wep.ApexHintAlpha)
end

SWEP.O_Hook_Override_Tracer = function(wep, data)
    if wep:GetHeat() > 0 then
        return {current = "arccw_apex_tracer_energy_sniper"}
    else
        return {current = "arccw_apex_tracer_sniper"}
    end
end

SWEP.O_Hook_Override_PhysTracerProfile = function(wep, data)
    if wep:GetHeat() > 0 then
        return {current = "apex_bullet_energy"}
    else
        return {current = "apex_bullet"}
    end
end

SWEP.O_Hook_Override_MuzzleFlashColor = function(wep, data)
    if wep:GetHeat() > 0 then
        return {current = Color(39, 90, 255)}
    end
end

SWEP.O_Hook_Override_MuzzleEffect = function(wep,data)
    if wep:GetHeat() > 0 then
        return {current = "tfa_apex_muzzle_dmr_charged"}
    else
        return {current = "tfa_apex_muzzle_dmr"}
    end
end