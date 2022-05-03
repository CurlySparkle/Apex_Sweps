if CLIENT then
    killicon.Add( "arccw_apex_sentinel", "VGUI/apex_killicon_sentinel", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_sentinel")
end

SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Sentinel"
SWEP.Trivia_Class = "Sniper Rifle"
SWEP.Trivia_Desc = "A veritably powerful sniper rifle with the ability to charge a more powerful shot with the use of a shield battery."
SWEP.Trivia_Manufacturer = "Paradinha Arsenal"

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-8, -2, 1.5)
SWEP.CrouchAng = Angle(0, 0, -53)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_crossbow"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_sentinel.mdl"
SWEP.WorldModel = "models/weapons/c_apex_sentinel.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-8.5, 5.5, -5.5),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}


SWEP.ViewModelFOV = 70

SWEP.Damage = 70
SWEP.DamageMin = 70
SWEP.Range = 15
SWEP.Penetration = 30
SWEP.PhysBulletMuzzleVelocity = 31000 * ArcCW.HUToM

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
}

SWEP.Tracer = "tfa_apex_tracer_sniper" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ChamberSize = 1 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 4
SWEP.MaxRecoilBlowback = 1

SWEP.PhysBulletMuzzleVelocity = 750

SWEP.Recoil = 3.300
SWEP.RecoilSide = 0.550
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1
SWEP.VisualRecoilMult = 0.2

SWEP.ManualAction = true
SWEP.NoLastCycle = true -- do not cycle on last shot

SWEP.Delay = 60 / 31 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "FIRE"
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 0.2
SWEP.HipDispersion = 700
SWEP.MoveDispersion = 100
SWEP.JumpDispersion = 300

SWEP.Primary.Ammo = "XBowBolt"

SWEP.ShootVol = 140 -- volume of shoot sound

SWEP.ShootSound = { "weapons/sentinel/fire_1.wav", "weapons/sentinel/fire_2.wav", "weapons/sentinel/fire_3.wav" }
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_4"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "muzzleflash_m82"
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellPitch = 75
SWEP.ShellScale = 1.6
SWEP.ShellTime = 1
-- SWEP.ShellRotateAngle = Angle(0, 0, 0)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.BarrelLength = 24

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
    Pos = Vector(0, -3, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.25,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.AttachmentElements = {
    ["ref_sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["ref_dot"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
}

SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic Type", -- print name
        DefaultAttName = "Iron Sights",
        Slot = {"apex_sights", "apex_scope_snipers", "apex_optic"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
        InstalledEles = {"ref_sight","ref_dot"},
        CorrectivePos = Vector(2.69,0,-0.47),
        CorrectiveAng = Angle(-0.001, 0.005, 4.997)
    },
    {
        PrintName = "Stock Type",
        Slot = {"apex_sniper_stock"}
    },
    {
        PrintName = "Mag Type",
        Slot = {"apex_sniper_mags"}
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
    ["idle_sprint"] = {Source = "sprint", Mult = 0.8},
    ["enter_sprint"] = {
        Source = "sprint_in",
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_FirstDraw_2ch_v1_01.wav", t = 1 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Draw_2ch_v2_01.wav", t = 0 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        Mult = 1,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Holster_2ch_v1_01.wav", t = 0 / 30},
        },
    },
    ["idle_iron"] = {
        Source = "iron_idle",
    },
    ["fire"] = {
        Source = "fire",
		Time = 32 / 32,
    },
    ["cycle"] = {
        Source = "rechamber",
        ShellEjectAt = 0.3,
		Time = 63/40,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Bolt_2ch_v1_01.wav", t = 5 / 40},
        },
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = "iron_fire",
		Time = 32 / 32,
    },
    ["cycle_sight"] = {
        Source = "iron_rechamber",
        ShellEjectAt = 0.3,
		Time = 63/40,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Bolt_2ch_v1_02.wav", t = 5 / 40},
        },
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
        Source = "inspect_in",
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
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunUp_Fr022_2ch_v1_01.wav", t = 8 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagOut_Fr041_2ch_v1_01.wav", t = 25 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagGrab_Fr061_2ch_v1_01.wav", t = 46 / 30},
			{p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagSlot_Fr067_2ch_v1_01.wav", t = 67 / 30},
			{p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagInsert_Fr086_2ch_v1_01.wav", t = 69 / 30},
			{p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunDown_Fr100_2ch_v1_01.wav", t = 89 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_BoltBack_2ch_v2_01.wav", t = 5 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunUp_Fr022_2ch_v1_01.wav", t = 22 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagOut_Fr041_2ch_v1_01.wav", t = 38 / 30},
            {p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagGrab_Fr061_2ch_v1_01.wav", t = 61 / 30},
			{p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagSlot_Fr067_2ch_v1_01.wav", t = 67 / 30},
			{p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_MagInsert_Fr086_2ch_v1_01.wav", t = 86 / 30},
			{p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_GunDown_Fr100_2ch_v1_01.wav", t = 100 / 30},
			{p = 100, s = "weapons/sentinel/Wpn_Sentinel_Foley_Reload_ReChamber_Fr109_2ch_v2_01.wav", t = 109 / 30}
    },
},
}