if CLIENT then
    killicon.Add( "arccw_apex_hemlok", "VGUI/apex_killicon_hemlok", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_hemlok")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Hemlok Burst AR"
SWEP.Trivia_Class = "Assault Rifle"
SWEP.Trivia_Desc = "Burst-fire rifle capable of killing in one burst if all shots hit the head.\n\nIt is rumored among Militia soldiers that the IMC procures these because their grunts are poorly trained, although the Hemlok is a common sight on either side of the battlefield."
SWEP.Trivia_Manufacturer = "Wonyeon Interstellar"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-6, -1.5, 1)
SWEP.CrouchAng = Angle(0.837, 0, -56.513)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_hemlok.mdl"
SWEP.WorldModel = "models/weapons/w_apex_hemlok.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(13, 1, 2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 20
SWEP.DamageMin = 20
SWEP.Range = 150
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 27500 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [1] = {
        Damage = 23,
        DamageMin = 18,
    },
    [2] = {
        Damage = 12,
        DamageMin = 12,
        BodyDamageMults = {
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
        }
    },
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.75,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
}

SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 750 -- projectile or phys bullet muzzle velocity

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 18 -- DefaultClip is automatically set.
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.3
SWEP.RecoilSide = 0.175
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 0.1

SWEP.Delay = 60 / 900 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = -3,
        RunawayBurst = true,
        PostBurstDelay = 0.175,
    },
    {
        Mode = 1,
    }
}

SWEP.AccuracyMOA = 2
SWEP.HipDispersion = 400
SWEP.MoveDispersion = 100
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.45

SWEP.Primary.Ammo = "apex_heavy"

SWEP.ShootVol = 120 -- volume of shoot sound
-- SWEP.ShootPitch = 101 -- pitch of shoot sound


SWEP.FirstShootSound = "ArcCW_APEX.Hemlok.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.Hemlok.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_3"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""
SWEP.FiremodeSound = {"weapons/fx/firemode_1.wav","weapons/fx/firemode_2.wav"}

SWEP.Tracer = "arccw_apex_tracer_smg"
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 3

SWEP.MuzzleEffect = "tfa_apex_muzzle_ar"
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.1
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 12

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(0, -2, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.AttachmentElements = {
    ["ref_sights"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["weapon_dot"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
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
        DefaultAttName = "Iron Sights",
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(5, 1.0, -6.9),
            wang = Angle(-9, 0, 180)
        },
        InstalledEles = {"ref_sights", "weapon_dot"},
        ExtraSightDist = -2,
         CorrectivePos = Vector(1.89, 0, -0.4),
         CorrectiveAng = Angle(-1.19, 0.066, 3.362)
    },
    {
        PrintName = "Muzzle",
        Slot = "apex_muzzle",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(21.3, 1.0, -7.58),
            wang = Angle(-9, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard", "apex_stock_precision"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_heavy4"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_selfire4", "apex_hopup_loader2"}
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
            vpos = Vector(0.8, 0.8, -2), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -80),
            wpos = Vector(2.5, 1.8, -5.5),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(0.3, 0.3, 0.3),
		WMScale = Vector(0.3, 0.3, 0.3),
    },
	{
        PrintName = "Stats",
        Slot = {"killcounter2","killcounter"},
        FreeSlot = true,
        Bone = "def_c_base", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1.3, -4.2, 13), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(16, 2, -6.5),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(1, 1, 1),
		WMScale = Vector(1, 1, 1),
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
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_empty_chargeback_fr68_2ch_v1_01.ogg", t = 15 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_empty_chargeforward_fr76_2ch_v1_01.ogg", t = 25 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_empty_handgrab_fr85_2ch_v1_01.ogg", t = 28 / 30}
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
        Source = {"iron_fire", "iron_fire2"},
        ShellEjectAt = 0,
    },
    ["exit_sight"] = {
        Source = "iron_out",
    },
    ["1_to_2"] = {
        Source = "firemode_switch1",
        MinProgress = 0.15,
    },
    ["2_to_1"] = {
        Source = "firemode_switch2",
        MinProgress = 0.15,
    },
    ["1_to_2_sight"] = {
        Source = "ads_firemode_switch",
    },
    ["2_to_1_sight"] = {
        Source = "ads_firemode_switch",
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
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_Start_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_Mid_V1_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_Mid_V1_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_AR_End_V1_2ch_01.wav", t = 316 / 30}
    },
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
    },
    ["idle_inspect"] = {
        Source = "inspect",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
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
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_movearm_fr0_2ch_v1_01.ogg", t = 0 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_removemag_fr15_2ch_v1_01.ogg", t = 15 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_insertmag_fr36_2ch_v1_01.ogg", t = 36 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_popmag_fr50_2ch_v1_01.ogg", t = 50 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_handgrab_fr57_2ch_v1_01.ogg", t = 57 / 30}
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
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_empty_removemag_fr10_2ch_v1_01.ogg", t = 10 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_empty_insertmag_fr39_2ch_v1_01.ogg", t = 39 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_empty_popmag_fr54_2ch_v1_01.ogg", t = 54 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_empty_chargeback_fr68_2ch_v1_01.ogg", t = 68 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_empty_chargeforward_fr76_2ch_v1_01.ogg", t = 76 / 30},
            {p = 100, s = "weapons/hemlok/wpn_hemlok_reload_empty_handgrab_fr85_2ch_v1_01.ogg", t = 85 / 30}
        },
    },
}

SWEP.TTTWeaponType = "weapon_zm_mac10"
SWEP.TTTWeight = 100