if CLIENT then
    killicon.Add( "arccw_apex_r99", "VGUI/apex_killicon_r99", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_r99")
end

SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "R-99"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "High fire rate weapon designed for orbital boarding."
SWEP.Trivia_Manufacturer = "Lastimosa Armory"
SWEP.Trivia_Calibre = "5.8x42mm"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-4.5, 0, 1.5)
SWEP.CrouchAng = Angle(0, 0, -53)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -1.5, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.NPCWeaponType = "weapon_smg1"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_r99.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"
SWEP.ViewModelFOV = 65

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

SWEP.ChamberSize = 1 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 19 -- DefaultClip is automatically set.
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.625
SWEP.RecoilSide = 0.215
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 0.1

SWEP.Delay = 60 / 1080 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 6
SWEP.HipDispersion = 200
SWEP.MoveDispersion = 100

SWEP.Primary.Ammo = "smg1"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 101 -- pitch of shoot sound


SWEP.FirstShootSound = "ArcCW_APEX.R99.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.R99.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.SMG_Dry_E"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.TracerNum = 1 -- tracer every X
SWEP.Tracer = "hl2mmod_generic_tracer" -- override tracer (hitscan) effect
SWEP.TracerCol = Color(255, 85, 25)
SWEP.TracerWidth = 2

SWEP.MuzzleEffect = "hl2mmod_muzzleflash_smg1"
SWEP.MuzzleFlashColor = Color(244, 209, 66)
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

SWEP.Lunge = true -- Whether to allow the bash/melee to lunge a short distance
SWEP.MeleeSwingSound = "weapons/Pilot_Mvmt_Melee_RightHook_1P_2ch_v1_1.wav"
SWEP.MeleeHitSound = "weapons/Imp_Player_MeleePunch_Default_1ch_v1_1.wav"
SWEP.MeleeHitNPCSound = "weapons/Pilot_Mvmt_Melee_Hit_Flesh_1P_2ch_v1_1.wav"

SWEP.MeleeDamage = 50
SWEP.MeleeRange = 60
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 1
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

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

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.ExtraSightDist = 2.5

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
}

SWEP.WorldModelOffset = {
    pos = Vector(-5, 5, -5.5),
    ang = Angle(-10, 0, 180-5)
}

SWEP.MirrorVMWM = true
SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic Type", -- print name
        DefaultAttName = "Iron Sights",
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
        InstalledEles = {"ref_dot", "ref_sights"},
         CorrectivePos = Vector(1.5,0,-0.8),
         CorrectiveAng = Angle(0, 0, 3.494)
    },
    {
        PrintName = "Muzzle Type",
        DefaultAttName = "Barrel Stabilizer",
        Slot = "apex_muzzle",
        Bone = "muzzle_flash",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, -90),
        },
    },
    {
        PrintName = "Stock Type",
        Slot = {"apex_standard_stock"}
    },
    {
        PrintName = "Mag Type",
        Slot = {"apex_light_mags"}
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
    ["idle_sprint"] = {Source = "sprint", Mult = 0.9},
    ["enter_sprint"] = {Source = "sprint_in", Mult = 1},
    ["exit_sprint"] = {Source = "sprint_out", Mult = 1},
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {p = 100, s = "weapons/r99/slideforward_1.wav", t = 13 / 30},
            {p = 100, s = "weapons/r99/slideback_1.wav", t = 17 / 30},
            {p = 100, s = "weapons/r99/handgrab_1.wav", t = 19 / 30}
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
    },
    ["idle_inspect"] = {
        Source = "inspect",
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