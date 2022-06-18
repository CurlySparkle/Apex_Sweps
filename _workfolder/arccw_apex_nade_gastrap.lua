if CLIENT then
    killicon.Add( "arccw_apex_nade_gastrap", "VGUI/apex_nade_killicon_gastrap", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_nade_gastrap")
end

SWEP.Base = "arccw_apex_nade_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Nox Gas Trap"
SWEP.Trivia_Class = "Tactical"
SWEP.Trivia_Desc = "Place up to 6 canisters that release deadly Nox gas when shot or triggered by enemies."

SWEP.Slot = 4

SWEP.CamAttachment = 3

SWEP.NotForNPCs = true

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_nade_gastrap.mdl"
SWEP.WorldModel = "models/weapons/c_apex_nade_gastrap.mdl"
SWEP.MirrorVMWM = true
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

SWEP.MuzzleVelocity = 750
SWEP.ShootEntity = "arccw_apex_thr_gastrap"

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
    ["exit_sprint"] = {Source = "sprint_out", Mult = 1},
    ["ready"] = {
        Source = "draw",
        SoundTable = {
            {s = "weapons/grenades/gastrap/Caustic_Mvmt_GasTrap_DrawHold_Pt1_2ch_v1_01.wav", t = 0 / 30},
            {s = "weapons/grenades/gastrap/Caustic_Mvmt_GasTrap_DrawHold_Pt2_2ch_v1_01.wav", t = 25 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {s = "weapons/grenades/gastrap/Caustic_Mvmt_GasTrap_DrawHold_Pt1_2ch_v1_02.wav", t = 0 / 30},
            {s = "weapons/grenades/gastrap/Caustic_Mvmt_GasTrap_DrawHold_Pt2_2ch_v1_02.wav", t = 25 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        Mult = 0.8,
        SoundTable = {
            {s = "weapons/grenades/gastrap/Caustic_Mvmt_GasTrap_DrawHold_Pt1_2ch_v1_01.wav", t = 0 / 30},
			{s = "weapons/grenades/gastrap/Caustic_Mvmt_GasTrap_Holster_Closed_v1_01.wav", t = 0 / 30},
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
        Source = "toss_underhand",
        SoundTable = {
            {s = "weapons/grenades/gastrap/Caustic_Mvmt_GasTrap_Throw_Short_2ch_v1_02.wav", t = 0 / 30},
        },
    },
    ["throw"] = {
        Source = {"toss_underhand"},
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = "weapons/grenades/gastrap/Caustic_Mvmt_GasTrap_Throw_Short_2ch_v1_01.wav", t = 0 / 30}
        },
    },
    -- ["throw_alt"] = {
        -- Source = {"toss_underhand"},
        -- Mult = 1.6,
        -- TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        -- SoundTable = {
            -- {s = "weapons/grenades/nox/Caustic_Mvmt_GasGrenade_Throw_2ch_v1_01.wav", t = 0 / 30}
        -- },
    -- },
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

SWEP.TTTWeight = 100
if engine.ActiveGamemode() == "terrortown" then
    SWEP.Kind = WEAPON_EQUIP2
    SWEP.Slot = 6
    SWEP.CanBuy = { ROLE_DETECTIVE }
    SWEP.AutoSpawnable = false
    SWEP.EquipMenuData = {
        type = "Gastrap Mine",
        desc = "Deployable anti-personnel gastrap.\nDoes not discriminate.\nFront towards enemy!"
    }
    SWEP.Icon = "arccw/ttticons/arccw_nade_claymore.png"
end