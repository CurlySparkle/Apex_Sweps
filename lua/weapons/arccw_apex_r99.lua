if CLIENT then
    killicon.Add( "arccw_apex_r99", "VGUI/apex_killicon_r99", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_r99")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "R-99"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "High fire rate weapon designed for orbital boarding."
SWEP.Trivia_Manufacturer = "Lastimosa Armory"
SWEP.Trivia_Calibre = "5.8x42mm"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-4.5, -2, 1.5)
SWEP.CrouchAng = Angle(0, 0, -53)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -1.7, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.NPCWeaponType = "weapon_smg1"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_r99.mdl"
SWEP.WorldModel = "models/weapons/c_apex_r99.mdl"
SWEP.WorldModelOffset = {
    pos = Vector(-5.5, 4, -4.5),
    ang = Angle(-10, 0, 180-5),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.MirrorVMWM = false

SWEP.ViewModelFOV = 70

SWEP.Damage = 11
SWEP.DamageMin = 11
SWEP.Range = 10
SWEP.Penetration = 4
SWEP.PhysBulletMuzzleVelocity = 21000 * ArcCW.HUToM

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
}

SWEP.Apex_Balance = {
    [1] = {
        -- Arcwc Settings
        Damage = 15,
        DamageMin = 10,
    },
    [2] = {
        Damage = 9,
        DamageMin = 9,
    },
}

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 19 -- DefaultClip is automatically set.
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.55
SWEP.RecoilSide = 0.215
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 0.1

SWEP.Delay = 60 / 1080 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = 2,
    }
}

SWEP.AccuracyMOA = 12
SWEP.HipDispersion = 250
SWEP.MoveDispersion = 100

SWEP.Primary.Ammo = "apex_light"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 101 -- pitch of shoot sound


SWEP.FirstShootSound = "ArcCW_APEX.R99.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.R99.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.SMG_Dry_E"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.TracerNum = 1 -- tracer every X
SWEP.Tracer = "arccw_apex_tracer_smg" -- override tracer (hitscan) effect
SWEP.TracerCol = Color(255, 85, 25)
SWEP.TracerWidth = 2

SWEP.MuzzleEffect = "muzzle_smgs_l4d"
SWEP.MuzzleFlashColor = Color(255, 255, 55)
SWEP.ShellModel = "models/shells/shelleject_pistol.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.55
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.BarrelLength = 12

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(0, 0, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.2,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.AttachmentElements = {
    ["ref_dot"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["ref_sights"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
}

-- SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(6, 0.9, -5.2),
            wang = Angle(-10, 0, 180)
        },
        InstalledEles = {"ref_dot", "ref_sights"},
        ExtraSightDist = 2,
         CorrectivePos = Vector(1.5,0,-0.8),
         CorrectiveAng = Angle(0, 0, 3.494)
    },
    {
        PrintName = "Muzzle",
        Slot = "apex_muzzle",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(20, 1, -6),
            wang = Angle(-10, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_light1"}
    },
    {
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.9},
    ["enter_sprint"] = {Source = "sprint_in", Mult = 1},
    ["exit_sprint"] = {Source = "sprint_out", Mult = 1},
    ["ready"] = {
        Source = "draw_first",
        Mult = 0.6,
        SoundTable = {
            {p = 100, s = "weapons/r99/deploy_1.wav", t = 1 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 0.8,
    },
    ["holster"] = {
        Source = "holster",
        Mult = 0.8,
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
        Source = "iron_fire",
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
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_End_V2_2ch_01.wav", t = 316 / 30},
    },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Start_V2_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Mid_V2_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Mid_V2_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_End_V2_2ch_01.wav", t = 316 / 30}
    },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.4,
        LHIKEaseOut = 0.2,
        MinProgress = 60 / 40,
        SoundTable = {
            {p = 100, s = "weapons/r99/clip_out_1.wav", t = 7 / 30},
            {p = 100, s = "weapons/r99/clip_in_1.wav", t = 49 / 30},
            {p = 100, s = "weapons/r99/handgrab_1.wav", t = 58 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.5,
        LHIKEaseOut = 0.2,
        MinProgress = 97 / 40,
        SoundTable = {
            {p = 100, s = "weapons/r99/clip_out_1.wav", t = 7 / 30},
            {p = 100, s = "weapons/r99/clip_in_1.wav", t = 49 / 30},
            {p = 100, s = "weapons/r99/slideforward_1.wav", t = 67 / 30},
            {p = 100, s = "weapons/r99/slideback_1.wav", t = 69 / 30},
            {p = 100, s = "weapons/r99/handgrab_1.wav", t = 74 / 30},
        },
    },
}

SWEP.TTTWeaponType = "weapon_ttt_m16"
SWEP.TTTWeight = 100