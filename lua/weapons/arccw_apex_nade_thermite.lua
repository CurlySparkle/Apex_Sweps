if CLIENT then
    killicon.Add( "arccw_apex_nade_thermite", "VGUI/apex_nade_killicon_thermite", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_nade_thermite")
end

SWEP.Base = "arccw_base_nade"
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
SWEP.WorldModel = "models/weapons/c_apex_nade_thermite.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos = Vector(3, 2, -1),
    ang = Angle(-10, 0, 180)
}

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "NADE"
    },
}

SWEP.FuseTime = 3.5
SWEP.Primary.Ammo = "grenade"

SWEP.Throwing = true
SWEP.Singleton = false

-- SWEP.CookPrimFire = true
-- SWEP.CookAltFire = true

SWEP.DrawCrosshair = false
SWEP.ShootWhileSprint = false

SWEP.Primary.ClipSize = 1

SWEP.MuzzleVelocity = 1000
SWEP.MuzzleVelocityAlt = 750
SWEP.ShootEntity = "arccw_apex_thr_thermite"

SWEP.TTTWeaponType = "weapon_zm_molotov"
SWEP.NPCWeaponType = "weapon_grenade"
SWEP.NPCWeight = 50

SWEP.PullPinTime = 0.5

SWEP.CrouchPos = Vector(0, -2, -0.5)
SWEP.CrouchAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0, -2, 1)
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

SWEP.MeleeSwingSound = "weapons/Pilot_Mvmt_Melee_RightHook_1P_2ch_v1_1.wav"
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