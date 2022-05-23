if CLIENT then
    killicon.Add( "arccw_apex_nade_thermite", "VGUI/apex_nade_killicon_thermite", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_nade_thermite")
end

SWEP.Base = "arccw_apex_nade_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Thermite Grenade"
SWEP.Trivia_Class = "Hand Grenade"
SWEP.Trivia_Desc = "Creates a horizontal wall of flames."

SWEP.Slot = 4

SWEP.NotForNPCs = true

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_nade_thermite.mdl"
SWEP.WorldModel = "models/weapons/w_apex_nade_thermite.mdl"
-- SWEP.MirrorVMWM = true
-- SWEP.WorldModelOffset = {
    -- pos = Vector(-10.5, -3, -5),
    -- ang = Angle(0, 0, -50)
-- }

SWEP.Delay = 2
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.nade",
    },
}

SWEP.FuseTime = 3.5
SWEP.Primary.Ammo = "grenade"

SWEP.Throwing = true
SWEP.Singleton = false

SWEP.DrawCrosshair = false
SWEP.ShootWhileSprint = false

SWEP.Primary.ClipSize = 1

SWEP.MuzzleVelocity = 1300
SWEP.MuzzleVelocityAlt = 550
SWEP.ShootEntity = "arccw_apex_thr_thermite"

SWEP.PullPinTime = 0.5

SWEP.ViewModelFOV = 70

SWEP.MuzzleEffectAttachment = 1
SWEP.CamAttachment = 3

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -1)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.IronSightStruct = false

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
            {s = "weapons/grenades/thermite/Wpn_ThermiteGrenade_Draw_2ch_v2_01.wav", t = 0 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {s = "weapons/grenades/thermite/Wpn_ThermiteGrenade_Draw_2ch_v2_01.wav", t = 0 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {s = "weapons/grenades/thermite/Wpn_ThermiteGrenade_Holster_2ch_v1_01.wav", t = 1 / 30}
        },
    },
    ["pre_throw"] = {
        Source = "pullpin",
        SoundTable = {
            {s = "weapons/grenades/wpn_fraggrenade_1p_throw_2ch_v1_02.wav", t = 0 / 30},
        },
        MinProgress = 0.5,
    },
    ["fire"] = {
        Source = "pullpin",
        SoundTable = {
            {s = "weapons/grenades/wpn_fraggrenade_1p_throw_2ch_v1_02.wav", t = 0 / 30},
        },
    },
    ["throw"] = {
        Source = {"toss_overhead"},
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = "weapons/grenades/Wpn_ThermiteGrenade_Throw_2ch_v1_01.wav", t = 0 / 30}
        },
    },
    ["throw_alt"] = {
        Source = {"underhand"},
        Mult = 1,
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
            {s = "weapons/Pilot_Mvmt_Melee_RightHook_1P_2ch_v1_1.wav", t = 0 / 30}
        },
    },
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