if CLIENT then
    killicon.Add( "arccw_apex_mozambique", "VGUI/apex_killicon_mozambique", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_mozambique")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Mozambique Shotgun"
SWEP.Trivia_Class = "Pistol"
SWEP.Trivia_Desc = "Compact triple-barrel shotgun. Commonly ridiculed by participants of the Apex Games, it is nevertheless capable in the right hands.\n\nFires 3 pellets in a triangular pattern, tightened when aiming."
SWEP.Trivia_Manufacturer = "Altamirano Armory"

SWEP.Slot = 1

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_mozambique.mdl"
SWEP.WorldModel = "models/weapons/w_apex_mozambique.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(4.5, 1.5, 2.25),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}
SWEP.ViewModelFOV = 70

SWEP.DefaultBodygroups = "00000"

SWEP.Damage = 15
SWEP.DamageMin = 15
SWEP.RangeMin = 0
SWEP.Range = 50

SWEP.Apex_Balance = {
    [1] = {
        Damage = 17,
        DamageMin = 10,
    },
    [2] = {
        Damage = 12, -- Roughly equivalent to TTT deagle but fires faster. This thing can actually shred so keep it low
        DamageMin = 12,
    },
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.25,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
}

SWEP.Penetration = 2
SWEP.DamageType = DMG_BUCKSHOT
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 700 -- projectile or phys bullet muzzle velocity
SWEP.PhysBulletMuzzleVelocity = 10000 * ArcCW.HUToM

SWEP.Num = 3
-- Triangular shape
SWEP.ShotgunSpreadPattern = {
    [1] = Angle(-0.9, 0, 0),
    [2] = Angle(0.8, 0.7, 0),
    [3] = Angle(0.8, -0.7, 0),
}
SWEP.Hook_ShotgunSpreadOffset = function(wep, data)
    local d = Lerp(wep:GetSightDelta(), 0.75, 1)
    local p = wep.ShotgunSpreadPattern[data.num]
    data.ang = Angle(p.p * d, p.y * d, 0)

    return data
end
SWEP.NoRandSpread = true

SWEP.Tracer = "arccw_apex_tracer_shotgun"
SWEP.TracerNum = 1
SWEP.TracerWidth = 2

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 6

SWEP.Recoil = 0.4
SWEP.RecoilSide = 0.75
SWEP.MaxRecoilBlowback = 2
SWEP.RecoilRise = 3
SWEP.RecoilPunch = 3.5
SWEP.RecoilVMShake = 2

SWEP.ShotgunReload = false
SWEP.ManualAction = false

SWEP.Delay = 60 / 132
SWEP.RunawayBurst = false
SWEP.Firemodes = {
    {
        Mode = 2,
    }
}

SWEP.NPCWeaponType = "weapon_shotgun"
SWEP.NPCWeight = 100

SWEP.AccuracyMOA = 0
SWEP.HipDispersion = 100 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50
SWEP.JumpDispersion = 100

SWEP.SightedSpeedMult = 0.9

SWEP.Primary.Ammo = "apex_shotgun" -- what ammo type the gun uses

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "ArcCW_APEX.Mozambique.Fire"
SWEP.ShootSoundSilenced = "ArcCW_APEX.Mozambique.Silenced_Fire"
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

SWEP.MuzzleEffect = "tfa_apex_muzzle_shotgun"
SWEP.MuzzleFlashColor = Color(254, 188, 148)
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
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "revolver"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER

SWEP.CrouchPos = Vector(-3, -4, 0)
SWEP.CrouchAng = Angle(1.081, -0.071, -21.688)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, -2, 1)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.AttachmentElements = {
    ["weapon_dot"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(7.2, 1.4, -5.25),
            wang = Angle(-10, -2.0, 180)
        },
        InstalledEles = {"weapon_dot"},
        CorrectivePos = Vector(1.19, 0, -0.7),
        CorrectiveAng = Angle(-0.75, -0.44, 3.7),
        ExtraSightDist = 1,
    },
    {
        PrintName = "Muzzle",
        Slot = "mozambique_barrel",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(31, 1.0, -9.0),
            wang = Angle(-9, 0, 180)
        },
    },
    {
        PrintName = "Shotgun Bolt",
        Slot = {"apex_sg"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_qdraw", "apex_hopup_hp3", "apex_hopup_dtap3"}
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
            vpos = Vector(0.7, 0.7, -2), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(5, 2.5, -4),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(0.3, 0.3, 0.3),
		WMScale = Vector(0.3, 0.3, 0.3),
    },
    {
        PrintName = "Stats",
        Slot = {"killcounter2","killcounter"},
        FreeSlot = true,
        Bone = "def_front_top", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1.2, 0.5, -5), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -60),
            wpos = Vector(6, 2.7, -4),
            wang = Angle(-10, 0, 205)
        },
		VMScale = Vector(1, 1, 1),
		WMScale = Vector(1, 1, 1),
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
            {p = 100, s = "weapons/mozambique/Wpn_Mozambique_FirstDraw_2ch_V1_01.wav", t = 1 / 30},
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
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = {"iron_fire", "iron_fire2"},
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
        SoundTable = {
            {s = "ArcCW_APEX.Melee.Swing.Punch", t = 0 / 30},
    },
    },
    ["enter_inspect"] = {
        Source = "inspect",
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
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
        Mult = 0.9,
        SoundTable = {
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Cloth_fr00_2ch_v1_01.wav", t = 1 / 30},
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Cloth_fr22_2ch_v1_01.wav", t = 22 / 30},
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Cloth_fr35_2ch_v1_01.wav", t = 35 / 30},
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Cloth_fr57_2ch_v1_01.wav", t = 57 / 30},
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Tech_fr13_2ch_v1_01.wav", t = 13 / 30},
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Tech_fr30_2ch_v1_01.wav", t = 30 / 30},
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Tech_fr50_2ch_v1_01.wav", t = 30 / 30},
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Mech_fr00_2ch_v1_01.wav", t = 0 / 30},
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Mech_fr22_2ch_v1_01.wav", t = 22 / 30},
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Mech_fr44_2ch_v1_01.wav", t = 44 / 30},
            {v = 55, p = 100, s = "weapons/mozambique/Wpn_Mozambique_Reload_Mech_fr59_2ch_v1_01.wav", t = 59 / 30}
             },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        Time = nil,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.4,
        Mult = 0.9,
        SoundTable = {
            {p = 100, s = "weapons/mozambique/Wpn_Mozambique_Emptyreload_Part01_2ch_V1_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/mozambique/Wpn_Mozambique_Emptyreload_Part02_2ch_V1_01.wav", t = 22 / 30},
            {p = 100, s = "weapons/mozambique/Wpn_Mozambique_Emptyreload_Part03_2ch_V2_01.wav", t = 44 / 30},
            {p = 100, s = "weapons/mozambique/Wpn_Mozambique_Emptyreload_Part04_2ch_V1_01.wav", t = 65 / 30}
        },
    },
    ["enter_sprint"] = {
        Source = "sprint_in",
    },
    ["idle_sprint"] = {
        Source = "sprint",
        mult = 0.9,
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
}

SWEP.Hook_Think = function(wep)
    if wep:GetNWState() == ArcCW.STATE_SIGHTS then
        wep.ShotgunSpreadPattern = {
            [1] = Angle(-0.45, 0, 0),
            [2] = Angle(0.4, 0.35, 0),
            [3] = Angle(0.4, -0.35, 0),
        }
    else
        wep.ShotgunSpreadPattern = {
            [1] = Angle(-0.9, 0, 0),
            [2] = Angle(0.8, 0.7, 0),
            [3] = Angle(0.8, -0.7, 0),
        }
    end
end

SWEP.TTTWeaponType = {"weapon_zm_pistol", "weapon_ttt_glock", "weapon_zm_revolver"}
SWEP.TTTWeight = 35