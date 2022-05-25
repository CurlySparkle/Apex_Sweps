if CLIENT then
    killicon.Add( "arccw_apex_nade_arcstar", "VGUI/apex_nade_killicon_arcstar", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_nade_arcstar")
end

SWEP.Base = "arccw_apex_nade_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Arc Star"
SWEP.Trivia_Class = "Hand Grenade"
SWEP.Trivia_Desc = "Energy-based ordnance with a shuriken-inspired design.\nSticks upon impact and explodes after a short delay, slowing targets within.\nThrown farther and faster than regular grenades."

SWEP.Slot = 4

SWEP.NotForNPCs = true

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_nade_arcstar.mdl"
SWEP.WorldModel = "models/weapons/c_apex_nade_arcstar.mdl"
-- SWEP.MirrorVMWM = true
-- SWEP.WorldModelOffset = {
    -- pos = Vector(3, 2, -1),
    -- ang = Angle(-10, 0, 180)
-- }

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.nade",
    },
}

SWEP.FuseTime = 3.5
SWEP.Primary.Ammo = "grenade"

SWEP.Primary.ClipSize = 1

SWEP.MuzzleVelocity = 2200
SWEP.MuzzleVelocityAlt = 1300
SWEP.ShootEntity = "arccw_apex_thr_star_arc"

SWEP.PullPinTime = 0.5

SWEP.ViewModelFOV = 70

SWEP.CamAttachment = 3

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
SWEP.AnimShootAlt = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE

SWEP.Attachments = {
    {
        PrintName = "Payload",
        DefaultAttName = "Arc",
        DefaultAttIcon = Material("entities/arccw_apex_nade_arcstar.png", "mips smooth"),
        Slot = {"apex_star"},
    }
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
           {s = "ArcCW_APEX.ArcStar.Draw", t = 0 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {s = "ArcCW_APEX.ArcStar.Draw", t = 0 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {s = "ArcCW_APEX.ArcStar.Holster", t = 0 / 30}
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
            {s = "weapons/grenades/wpn_fraggrenade_1p_prep_01.wav", t = 0 / 30},
        },
    },
    ["throw"] = {
        Source = {"toss_overhead"},
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = "ArcCW_APEX.ArcStar.Throw", t = 0 / 30}
        },
    },
    ["throw_alt"] = {
        Source = {"underhand"},
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = "ArcCW_APEX.ArcStar.Throw", t = 0 / 30}
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