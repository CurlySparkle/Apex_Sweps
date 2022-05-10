if CLIENT then
    killicon.Add( "arccw_apex_eva", "VGUI/apex_killicon_eva", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_eva")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "EVA-8 Auto"
SWEP.Trivia_Class = "Shotgun"
SWEP.Trivia_Desc = "Pump-action/automatic shotgun developed for the IMC, although variants used in the Apex Games like this one are automatic only.\n\nFires 9 pellets in the shape of an '8'."
SWEP.Trivia_Manufacturer = "Wonyeon Interstellar"

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_eva8.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-3, 4.5, -6),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.WorldModel = "models/weapons/c_apex_eva8.mdl"
SWEP.ViewModelFOV = 70

SWEP.DefaultBodygroups = "00000"

SWEP.Damage = 6
SWEP.DamageMin = 6
SWEP.RangeMin = 0
SWEP.Range = 50

SWEP.HullSize = 0
SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.25,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 1,
    [HITGROUP_RIGHTLEG] = 1,
}

SWEP.Apex_Balance = {
    [0] = {
        -- Apex Legends Settings
        Damage = 6,
        DamageMin = 6,
        Penetration = 5,
    },
    [1] = {
        -- Arcwc Settings
        Damage = 12,
        DamageMin = 12,
        Penetration = 15,
    }
}

SWEP.Penetration = 2
SWEP.DamageType = DMG_BUCKSHOT
SWEP.PhysBulletMuzzleVelocity = 16000 * ArcCW.HUToM

SWEP.Num = 9
-- Shaped like an '8'
SWEP.ShotgunSpreadPattern = {
    [1] = Angle(0, 0, 0),
    [2] = Angle(0, 1, 0),
    [3] = Angle(0, -1, 0),
    [4] = Angle(2.1, 0, 0),
    [5] = Angle(-2.1, 0, 0),
    [6] = Angle(1.4, 1.2, 0),
    [7] = Angle(-1.4, 1.2, 0),
    [8] = Angle(1.4, -1.2, 0),
    [9] = Angle(-1.4, -1.2, 0),
}
SWEP.NoRandSpread = true

SWEP.Tracer = "hl2mmod_generic_tracer"
SWEP.TracerNum = 8 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 8

SWEP.Recoil = 0.7
SWEP.RecoilSide = 0.5
SWEP.MaxRecoilBlowback = 2
SWEP.RecoilRise = 3
SWEP.RecoilPunch = 3.5
SWEP.RecoilVMShake = 2

SWEP.ShotgunReload = false
SWEP.ManualAction = false

SWEP.Delay = 60 / 120
SWEP.RunawayBurst = false
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_shotgun"
SWEP.NPCWeight = 100

SWEP.AccuracyMOA = 50 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 300 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 100

SWEP.Primary.Ammo = "apex_shotgun" -- what ammo type the gun uses

SWEP.ShootVol = 180 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "ArcCW_APEX.Eva.Fire"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""
SWEP.ShootDrySound = "ArcCW_APEX.Shotgun_Dry_A"

local s = "weapons/wpn_lowammo_shotgun1.wav"
local p = {
    [2] = 80,
    [1] = 90,
    [0] = 100,
}
SWEP.Hook_AddShootSound = function(wep, data)
    local pitch = p[wep:Clip1()]
    if pitch then
        wep:MyEmitSound(s, 70, pitch, 0.5, CHAN_AUTO)
    end
end

SWEP.MuzzleEffect = "muzzleflash_shotgun"
SWEP.ShellModel = "models/shells/shelleject_shotshell.mdl"
SWEP.ShellPitch = 100
SWEP.ShellSounds = ArcCW.ShotgunShellSoundsTable
SWEP.ShellScale = 1.5

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
-- SWEP.ProceduralViewBobAttachment = 1
SWEP.CamAttachment = 3

SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
    -- [0] = "bulletchamber",
    -- [1] = "bullet1"
}

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(0, 2, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
    CrosshairInSights = false,
}


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "shotgun"
SWEP.HoldtypeSights = "ar2"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

SWEP.CrouchPos = Vector(-6, -1, 1)
SWEP.CrouchAng = Angle(1.923, -1.375, -45.334)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.MeleeSwingSound = "weapons/Pilot_Mvmt_Melee_RightHook_1P_2ch_v1_1.wav"
SWEP.MeleeHitSound = "weapons/Imp_Player_MeleePunch_Default_1ch_v1_1.wav"
SWEP.MeleeHitNPCSound = "weapons/Pilot_Mvmt_Melee_Hit_Flesh_1P_2ch_v1_1.wav"

SWEP.MeleeDamage = 50
SWEP.MeleeRange = 60
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 1
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

SWEP.AttachmentElements = {
    ["sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
}

SWEP.Attachments = {
    {
        PrintName = "Optic Type", -- print name
        DefaultAttName = "Iron Sights",
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
        },
        ExtraSightDist = 3,
        InstalledEles = {"sight"},
        CorrectivePos = Vector(1.75, 0, -0.7),
        CorrectiveAng = Angle(0, 0, 4.7)
    },
    {
        PrintName = "Shotgun Bolt",
        Slot = {"apex_shotgun_bolt"}
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
        Mult = 4,
    },
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {s = "weapons/eva/wpn_shotgun_reload_pumpin_2ch_v1_01.wav", t = 10 / 30},
            {s = "weapons/eva/wpn_shotgun_reload_pumpout_2ch_v1_01.wav", t = 20 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 0.9,
    },
    ["holster"] = {
        Source = "holster",
        Mult = 0.9,
    },
    ["idle_iron"] = {
        Source = "iron_idle",
    },
    ["fire"] = {
        Source = {"fire", "fire2"},
        ShellEjectAt = 0,
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = {"iron_fire", "iron_fire2"},
        ShellEjectAt = 0,
    },
    ["exit_sight"] = {
        Source = "iron_out",
    },
    ["bash"] = {
        Source = {"melee"},
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
    },
    ["enter_inspect"] = {
        Source = "inspect",
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Shotgun_End_V1_2ch_01.wav", t = 0 / 30},
        },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Shotgun_Start_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Shotgun_Mid_V1_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Shotgun_Mid_V1_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Shotgun_End_V1_2ch_01.wav", t = 316 / 30}
        },
    },
    ["reload"] = {
        Source = "reload",
        Time = nil,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.4,
        SoundTable = {
            {s = "weapons/eva/Wpn_Shotgun_Reload_PullDrum_2ch_v2_01A.wav", t = 8 / 30},
            {s = "weapons/eva/Wpn_Shotgun_Reload_PullDrum_2ch_v2_01B.wav", t = 12 / 30},
            {s = "weapons/eva/Wpn_Shotgun_Reload_InsertDrum_2ch_v2_01A.wav", t = 55 / 30},
            {s = "weapons/eva/Wpn_Shotgun_Reload_InsertDrum_2ch_v2_01B.wav", t = 60 / 30},
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        Time = nil,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.4,
        SoundTable = {
            {s = "weapons/eva/Wpn_Shotgun_Reload_PullDrum_2ch_v2_01A.wav", t = 8 / 30},
            {s = "weapons/eva/Wpn_Shotgun_Reload_PullDrum_2ch_v2_01B.wav", t = 12 / 30},
            {s = "weapons/eva/Wpn_Shotgun_Reload_InsertDrum_2ch_v2_01A.wav", t = 55 / 30},
            {s = "weapons/eva/Wpn_Shotgun_Reload_InsertDrum_2ch_v2_01B.wav", t = 60 / 30},
            {s = "weapons/eva/wpn_shotgun_reload_pumpin_2ch_v1_01.wav", t = 80 / 30},
            {s = "weapons/eva/wpn_shotgun_reload_pumpout_2ch_v1_01.wav", t = 90 / 30},
        },
    },
    ["enter_sprint"] = {
        Source = "sprint_in",
    },
    ["idle_sprint"] = {
        Source = "sprint",
        mult = 0.8,
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
}