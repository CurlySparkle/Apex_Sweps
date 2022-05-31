if CLIENT then
    killicon.Add( "arccw_apex_nade_nox", "VGUI/apex_nade_killicon_nox", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_nade_nox")
end

SWEP.Base = "arccw_apex_nade_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Nox Gas Grenade"
SWEP.Trivia_Class = "Hand Grenade"
SWEP.Trivia_Desc = "Caustic's signature grenades, containing dangerous Nox gas.\nBlankets a large area in gas on impact, dealing increased damage over time.\nThrown instantly, but not as far as regular grenades."

SWEP.Slot = 4

SWEP.CamAttachment = 3

SWEP.NotForNPCs = true

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_nade_nox.mdl"
SWEP.WorldModel = "models/weapons/w_apex_nade_nox.mdl"
-- SWEP.MirrorVMWM = true
-- SWEP.WorldModelOffset = {
    -- pos = Vector(3, 2, -1),
    -- ang = Angle(-10, 0, 180)
-- }

SWEP.Delay = 2.25
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.nade",
    },
}

SWEP.Primary.Ammo = "grenade"

SWEP.Throwing = true
SWEP.Singleton = false

SWEP.Primary.ClipSize = 1

SWEP.MuzzleVelocity = 1000
SWEP.MuzzleVelocityAlt = 400
SWEP.ShootEntity = "arccw_apex_thr_gas"

SWEP.PullPinTime = 0
SWEP.WindupTime = 0

SWEP.ViewModelFOV = 70

SWEP.MuzzleEffectAttachment = 1
SWEP.CamAttachment = 3

SWEP.IronSightStruct = false

SWEP.HoldtypeActive = "slam"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2
SWEP.AnimShootAlt = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM

SWEP.Attachments = {
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.9},
    ["enter_sprint"] = {Source = "sprint_in", Mult = 0.1},
    ["exit_sprint"] = {Source = "sprint_out", Mult = 0.1},
    ["ready"] = {
        Source = "draw",
        SoundTable = {
            {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Draw_Pt1_2ch_v1_01.wav", t = 0 / 30},
            {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Draw_Pt2_2ch_v1_01.wav", t = 17 / 30},
            {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Draw_Pt3_2ch_v1_01.wav", t = 25 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Draw_Pt1_2ch_v1_01.wav", t = 0 / 30},
            {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Draw_Pt2_2ch_v1_01.wav", t = 17 / 30},
            {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Draw_Pt3_2ch_v1_01.wav", t = 25 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        Mult = 0.5,
        SoundTable = {
            {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_ThrowOverhead_Windup_2ch_v1_01.wav", t = 1 / 30}
        },
    },
    -- ["pre_throw"] = {
        -- Source = "pullpin",
        -- SoundTable = {
            -- {s = "weapons/grenades/wpn_fraggrenade_1p_throw_2ch_v1_02.wav", t = 0 / 30},
        -- },
        -- MinProgress = 0.5,
    -- },
    ["fire"] = {
        Source = "toss_overhead",
        SoundTable = {
            {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Throw_2ch_v1_01.wav", t = 0 / 30},
        },
    },
    ["throw"] = {
        Source = {"toss_overhead"},
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Throw_2ch_v1_01.wav", t = 0 / 30}
        },
    },
    ["throw_alt"] = {
        Source = {"toss_underhand"},
        Mult = 1.6,
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Throw_2ch_v1_01.wav", t = 0 / 30}
        },
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
    -- ["reload_empty"] = {
        -- Source = "draw",
        -- SoundTable = {
            -- {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Draw_Pt1_2ch_v1_01.wav", t = 0 / 30},
            -- {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Draw_Pt2_2ch_v1_01.wav", t = 17 / 30},
            -- {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Draw_Pt3_2ch_v1_01.wav", t = 25 / 30},
        -- },
    -- },
    ["enter_inspect"] = {
        Source = "inspect_in",
        LHIK = true,
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        LHIK = true,
    },
    ["idle_inspect"] = {
        Source = "inspect",
        LHIK = true,
    },
}

SWEP.TTTWeaponType = {"weapon_zm_molotov", "weapon_ttt_confgrenade", "weapon_ttt_smokegrenade"}
SWEP.TTTWeight = 100