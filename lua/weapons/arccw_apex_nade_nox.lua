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
SWEP.Trivia_Desc = "Blankets a large area in Nox gas."

SWEP.Slot = 4

SWEP.NotForNPCs = true

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_nade_nox.mdl"
SWEP.WorldModel = "models/weapons/c_apex_nade_nox.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos = Vector(3, 2, -1),
    ang = Angle(-10, 0, 180)
}


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

-- SWEP.CookPrimFire = true
-- SWEP.CookAltFire = true

SWEP.DrawCrosshair = false
SWEP.ShootWhileSprint = true

SWEP.Primary.ClipSize = 1

SWEP.Recoil = 0

SWEP.MuzzleVelocity = 1500
SWEP.MuzzleVelocityAlt = 500
SWEP.ShootEntity = "arccw_apex_thr_gas"

SWEP.PullPinTime = 0
SWEP.WindupTime = 0

SWEP.CrouchPos = Vector(0, -2, -0.5)
SWEP.CrouchAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0, -2, 2)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, -2, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.ViewModelFOV = 70

SWEP.MuzzleEffectAttachment = 1
SWEP.CamAttachment = 3

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -1)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.MeleeSwingSound = ""
SWEP.MeleeHitSound = "weapons/Imp_Player_MeleePunch_Default_1ch_v1_1.wav"
SWEP.MeleeHitNPCSound = "weapons/Pilot_Mvmt_Melee_Hit_Flesh_1P_2ch_v1_1.wav"

SWEP.Lunge = true -- Whether to allow the bash/melee to lunge a short distance
SWEP.LungeLength = 64 -- Maximum distance for lunging

SWEP.MeleeDamage = 50
SWEP.MeleeRange = 60
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 1
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

SWEP.SprintTime = 0

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
        Source = "toss",
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
        Source = {"toss_overhead"},
        Mult = 2,
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