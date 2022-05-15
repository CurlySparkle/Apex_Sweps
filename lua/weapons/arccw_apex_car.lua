if CLIENT then
    killicon.Add( "arccw_apex_car", "VGUI/apex_killicon_car", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_car")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "C.A.R. SMG"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "Adaptable SMG capable of using two ammo calibres without an impact on performance."
SWEP.Trivia_Manufacturer = "Siwhan Industries"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-6, -2, 2)
SWEP.CrouchAng = Angle(1.037, 0.623, -53.174)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)
SWEP.ViewModelFOV = 70

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -1)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_car.mdl"
SWEP.WorldModel = "models/weapons/c_apex_car.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-2, 4.5, -4),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.Damage = 13
SWEP.DamageMin = 13
SWEP.Range = 10
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 18500 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [0] = {
        -- Apex Legends Settings
        Damage = 13,
        DamageMin = 13,
        Penetration = 10,
    },
    [1] = {
        -- Arcwc Settings
        Damage = 18,
        DamageMin = 18,
        Penetration = 25,
    }
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
}

SWEP.TracerNum = 1 -- tracer every X
SWEP.Tracer = "arccw_apex_tracer_smg" -- override tracer (hitscan) effect
SWEP.TracerCol = Color(255, 85, 25)
SWEP.TracerWidth = 2

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 20
SWEP.ExtendedClipSize = 30
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.4
SWEP.RecoilSide = 0.25
SWEP.RecoilRise = 0.8
SWEP.VisualRecoilMult = 0.65
SWEP.RecoilVMShake = 0.15

SWEP.Delay = 60 / 930
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        PrintName = "fcg.apex.heavy",
        Mode = 2,
        RestoreAmmo = true,
    },
    {
        PrintName = "fcg.apex.light",
        Mode = 2,
        Override_Ammo = "apex_light",
        RestoreAmmo = true,
    },
}

SWEP.AccuracyMOA = 4
SWEP.HipDispersion = 200 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 100
SWEP.JumpDispersion = 300

SWEP.Primary.Ammo = "apex_heavy"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot soun

SWEP.FirstShootSound = "ArcCW_APEX.CAR.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.CAR.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.SMG_Dry_E"
SWEP.ShootSoundSilenced = "ArcCW_APEX.CAR.Fire"
SWEP.DistantShootSound = ""
SWEP.FiremodeSound = ""

SWEP.MuzzleEffect = "muzzle_smgs_l4d"
SWEP.MuzzleFlashColor = Color(255, 255, 55)
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellPitch = 95
SWEP.ShellScale = 1
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.BarrelLength = 8

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false
SWEP.KeepBaseIrons = false
SWEP.SprintTime = 0

SWEP.CaseBones = {}

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

SWEP.AttachmentElements = {
    ["sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
}

SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic",
        ExtraSightDist = 5,
        DefaultAttName = "Iron Sights",
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
        InstalledEles = {"sight"},
        CorrectivePos = Vector(1.75,0,-0.55),
        CorrectiveAng = Angle(-1.318, 0, 4.45)
    },
    {
        PrintName = "Muzzle",
        Slot = {"apex_muzzle"},
        Bone = "muzzle_flash",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_standard_stock"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_light1", "apex_mag_heavy6"}
    },
    {
        PrintName = "Hold Style",
        Slot = {"car_special"},
        Bone = "def_c_base",
        Offset = {
            vpos = Vector(3.3, -6.5, -8),
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
    },
    {
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
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
    ["enter_sprint"] = {Source = "sprint_in", Mult = 1, MinProgress = 0.1,},
    ["exit_sprint"] = {Source = "sprint_out", Mult = 1, MinProgress = 0.1,},
    ["ready"] = {
        Source = "draw_first",
        LHIK = true,
        LHIKOut = 0.6,
        SoundTable = {
            {s = "weapons/car/wpn_car_emptyreload_boltback_fr47_2ch_v1_01.wav", t = 8 / 30},
            {s = "weapons/car/wpn_car_emptyreload_boltfront_fr56_2ch_v1_01.wav", t = 14 / 30}
        },
    },
    ["draw"] = {
        Source = "draw",
    },
    ["holster"] = {
        Source = "holster",
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
        MinProgress = 0.1,
    },
    ["fire_sight"] = {
        Source = "iron_fire",
        ShellEjectAt = 0,
    },
    ["exit_sight"] = {
        Source = "iron_out",
        MinProgress = 0.1,
    },
    ["bash"] = {
        Source = {"melee"},
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
    },
    ["enter_inspect"] = {
        Source = "inspect_in",
        LHIK = true,
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        LHIK = true,
        LHIKOut = 0.6,
        SoundTable = {
            {s = "weapons/car/Wpn_Car_Inspect_Settle_fr471_v1_01.wav", t = 0 / 30}
        },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        LHIK = true,
        SoundTable = {
            {s = "weapons/car/Wpn_Car_Inspect_Raise_fr004_v1_01.wav", t = 4 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_GrabPull_fr078_v1_01.wav", t = 78 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_MoveLeft_fr128_v1_01.wav", t = 128 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_LookAtStock_fr168_v1_01.wav", t = 168 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_LookAtRightSide_fr204_v1_01.wav", t = 204 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_LookAtBarrel_fr251_v1_01.wav", t = 251 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_FlipGunFoley_fr306_v1_01.wav", t = 306 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_PullOutMag_fr320_v1_01.wav", t = 320 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_InspectMag_fr361_v1_01.wav", t = 361 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_CatchMag_fr386_v1_01.wav", t = 386 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_InsertMag_fr405_v1_01.wav", t = 405 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_ArmRaiseCloth_fr429_v1_01.wav", t = 429 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_ChargingHandleBack_fr439_v1_01.wav", t = 439 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_ChargingHandlRelease_fr456_v1_01.wav", t = 456 / 30},
            {s = "weapons/car/Wpn_Car_Inspect_ChargingHandleSlap_fr464_v1_01.wav", t = 464 / 30}
        },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKOut = 0.6,
        SoundTable = {
            {s = "weapons/car/wpn_car_reload_maggrab_fr2_2ch_v1_01.wav", t = 2 / 30},
            {s = "weapons/car/Wpn_Car_Reload_MagEject_New_v1_01.wav", t = 23 / 30},
            {s = "weapons/car/Wpn_Car_Reload_MagInsert_New_v1_01.wav", t = 39 / 30},
            {s = "weapons/car/wpn_car_reload_handrest_fr48_2ch_v1_01.wav", t = 48 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        SoundTable = {
            {s = "weapons/car/wpn_car_emptyreload_maggrab_fr2_2ch_v1_01.wav", t = 2 / 30},
            {s = "weapons/car/Wpn_Car_Reload_MagEject_New_v1_02.wav", t = 17 / 30},
            {s = "weapons/car/Wpn_Car_Reload_MagInsert_New_v1_02.wav", t = 34 / 30},
            {s = "weapons/car/Wpn_Car_Reload_BoltBack_New_v1_01.wav", t = 53 / 30},
            {s = "weapons/car/Wpn_Car_Reload_BoltFwd_New_v1_01.wav", t = 61 / 30},
            {s = "weapons/car/wpn_car_emptyreload_handrest_fr61_2ch_v1_01.wav", t = 61 / 30}
        },
    },
    ["1_to_2"] = {
        Source = {"switchammo1"},
        Blocking = true,
        LHIK = true,
        LHIKIn = 0.6,
        LHIKOut = 0.6,
        SoundTable = {
            {s = "weapons/car/Wpn_Car_AmmoSwap00_PopOutMag__fr07_v1_01.wav", t = 7 / 30},
            {s = "weapons/car/Wpn_Car_AmmoSwap00_PullOutMag__fr025_v1_01.wav", t = 25 / 30},
            {s = "weapons/car/Wpn_Car_AmmoSwap00_InsertMag__fr040_v1_01.wav", t = 40 / 30},
            {s = "weapons/car/Wpn_Car_AmmoSwap00_SlapMag__fr069_v1_01.wav", t = 69 / 30},
            {s = "weapons/car/Wpn_Car_AmmoSwap00_Charge__fr086_v1_01.wav", t = 86 / 30},
            {s = "weapons/car/Wpn_Car_AmmoSwap00_Settle__fr099_v1_01.wav", t = 99 / 30}
        },
    },
    ["2_to_1"] = {
        Source = {"switchammo2"},
        Blocking = true,
        LHIK = true,
        LHIKIn = 0.6,
        LHIKOut = 0.6,
        SoundTable = {
            {s = "weapons/car/Wpn_Car_AmmoSwap01_MagEject__fr009_v1_01.wav", t = 9 / 30},
            {s = "weapons/car/Wpn_Car_AmmoSwap01_MagPullOut__fr026_v1_01.wav", t = 26 / 30},
            {s = "weapons/car/Wpn_Car_AmmoSwap01_NewMagGrab__fr037_v1_01.wav", t = 37 / 30},
            {s = "weapons/car/Wpn_Car_AmmoSwap01_MagInsertBump__fr059_v1_01.wav", t = 59 / 30},
            {s = "weapons/car/Wpn_Car_AmmoSwap01_MagInsertComplete__fr069_v1_01.wav", t = 69 / 30},
            {s = "weapons/car/Wpn_Car_AmmoSwap01_MagInsertComplete__fr088_v1_01.wav", t = 88 / 30}
    },
},
}