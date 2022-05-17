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
SWEP.Trivia_Desc = "A veritably powerful sniper rifle with the ability to charge a more powerful shot with the use of a shield battery."
SWEP.Trivia_Manufacturer = "Paradinha Arsenal"

SWEP.Slot = 4

SWEP.Sway = 0.1

SWEP.CrouchPos = Vector(-8, -2, 1.5)
SWEP.CrouchAng = Angle(0, 0, -53)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_crossbow"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_sentinel.mdl"
SWEP.WorldModel = "models/weapons/c_apex_sentinel.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-8.5, 5.5, -5.5),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 70
SWEP.DamageMin = 70
SWEP.Range = 200
SWEP.Penetration = 30
SWEP.PhysBulletMuzzleVelocity = 31000 * ArcCW.HUToM


SWEP.Apex_Balance = {
    [1] = {
        Damage = 85,
        DamageMin = 40,
    },
    [2] = {
        Damage = 55, -- roughly equivalent to TTT scout
        DamageMin = 55
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

SWEP.Delay = 60 / 31
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.bolt"
    }}

SWEP.AccuracyMOA = 0.2
SWEP.HipDispersion = 500
SWEP.MoveDispersion = 50
SWEP.JumpDispersion = 300

SWEP.Primary.Ammo = "apex_sniper"

SWEP.ShootVol = 180 -- volume of shoot sound

SWEP.ShootSound = { "weapons/sentinel/fire_1.wav", "weapons/sentinel/fire_2.wav", "weapons/sentinel/fire_3.wav" }
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_4"
SWEP.ShootSoundSilenced = { "weapons/sentinel/fire_charged_1.wav", "weapons/sentinel/fire_charged_2.wav", "weapons/sentinel/fire_charged_3.wav" }
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "muzzleflash_shotgun"
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
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

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
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
        InstalledEles = {"ref_sight","ref_dot"},
        CorrectivePos = Vector(2.69,0,-0.47),
        CorrectiveAng = Angle(-0.001, 0.005, 4.997)
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_sniper"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_sniper1"}
    },
    {
        PrintName = "Specials",
        Slot = {"apex_specials"}
    },
    {
        PrintName = "Extras",
        Installed = "apex_hitsound_headshot",
        Slot = {"apex_extras"}
    },
    {
        PrintName = "Extras 2",
        Installed = "apex_hitsound",
        Slot = {"apex_extras2"}
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.8},
    ["enter_sprint"] = {
        Source = "sprint_in",
        MinProgress = 0.1,
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
        MinProgress = 0.1,
    },
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_FirstDraw_2ch_v1_01.wav", t = 1 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Draw_2ch_v2_01.wav", t = 0 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        Mult = 1,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Holster_2ch_v1_01.wav", t = 0 / 30},
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
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Bolt_2ch_v1_01.wav", t = 5 / 40},
        },
    },
    ["enter_sight"] = {
        Source = "iron_in",
        MinProgress = 0.1,
    },
    ["fire_sight"] = {
        Source = "iron_fire",
        -- Time = 9 / 10,
        MinProgress = 0.4,
    },
    ["cycle_sight"] = {
        Source = "iron_rechamber",
        ShellEjectAt = 0.3,
        Time = 63 / 40,
        MinProgress = 0.875,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Bolt_2ch_v1_02.wav", t = 5 / 40},
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
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunUp_Fr022_2ch_v1_01.wav", t = 8 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagOut_Fr041_2ch_v1_01.wav", t = 25 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagGrab_Fr061_2ch_v1_01.wav", t = 46 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagSlot_Fr067_2ch_v1_01.wav", t = 67 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagInsert_Fr086_2ch_v1_01.wav", t = 69 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunDown_Fr100_2ch_v1_01.wav", t = 89 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        ShellEjectAt = 0.2,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BoltBack_2ch_v2_01.wav", t = 5 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunUp_Fr022_2ch_v1_01.wav", t = 22 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagOut_Fr041_2ch_v1_01.wav", t = 38 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagGrab_Fr061_2ch_v1_01.wav", t = 61 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagSlot_Fr067_2ch_v1_01.wav", t = 67 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagInsert_Fr086_2ch_v1_01.wav", t = 86 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunDown_Fr100_2ch_v1_01.wav", t = 100 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_ReChamber_Fr109_2ch_v2_01.wav", t = 109 / 30}
        },
    },
    ["charge"] = {
        Source = "charge",
        Time = 5,
        SoundTable = {
            {p = 100, s = "weapons/rampage/wpn_rampage_thermite_charge_3p_v1.wav", t = 0 / 30},
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
        return "weapons/sentinel/fire_charged_" .. math.random(1, 3) .. ".wav"
    end
end

SWEP.M_Hook_Mult_Damage = function(wep, data)
    if wep:GetHeat() > 0 then
        data.mult = data.mult * 1.25
    end
end

SWEP.M_Hook_Mult_DamageMin = function(wep, data)
    if wep:GetHeat() > 0 then
        data.mult = data.mult * 1.25
    end
end

SWEP.Hook_ChangeFiremode = function(wep)
    -- TODO: check for batteries or something
    if wep:GetReloading() or wep:GetPriorityAnim() then return true end
    wep:PlayAnimationEZ("charge", 1, true)
    local n = CurTime() + wep:GetAnimKeyTime("charge", true)
    wep:SetNextPrimaryFire(n)
    wep:SetPriorityAnim(n)
    wep:SetHeat(wep:GetMaxHeat())
    return true
end