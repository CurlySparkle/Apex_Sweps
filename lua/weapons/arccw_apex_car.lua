if CLIENT then
    killicon.Add( "arccw_apex_car", "VGUI/apex_killicon_car", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_car")
end

SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "C.A.R. SMG"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "Adaptable SMG. Uses light and heavy ammo."
SWEP.Trivia_Manufacturer = "Siwhan Industries"
SWEP.Trivia_Country = "Unknown"
SWEP.Trivia_Calibre = "Heavy Rounds/Light Rounds"
SWEP.Trivia_Year = "2734"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-6, 0, 2)
SWEP.CrouchAng = Angle(1.037, 0.623, -53.174)
SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)
SWEP.ActivePos = Vector(0, 0, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_car.mdl"
SWEP.WorldModel = "models/weapons/c_apex_car.mdl"
SWEP.WorldModelOffset = {
    pos        =    Vector(-2, 4.5, -4),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.ViewModelFOV = 65

SWEP.Damage = 20
SWEP.DamageMin = 13 -- damage done at maximum range
SWEP.Range = 85 -- in METRES
SWEP.Penetration = 25
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 950 -- projectile or phys bullet muzzle velocity
-- IN M/S

SWEP.TracerNum = 1 -- tracer every X
SWEP.Tracer = "arccw_tracer" -- override tracer (hitscan) effect
SWEP.TracerCol = Color(255, 85, 25)
SWEP.TracerWidth = 15

SWEP.ChamberSize = 1 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 18 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 28
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.85
SWEP.RecoilSide = 0.25
SWEP.RecoilRise = 0.8
SWEP.VisualRecoilMult = 0.65
SWEP.RecoilVMShake = 0.15

SWEP.Delay = 60 / 810 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 1.25 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 350 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 250
SWEP.JumpDispersion = 300 -- dispersion penalty when in the air

SWEP.Primary.Ammo = "ar2" 

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot soun

SWEP.ShootSound = { "weapons/car/fire_1.wav", "weapons/car/fire_2.wav", "weapons/car/fire_3.wav" }
SWEP.ShootDrySound = "ArcCW_APEX.SMG_Dry_B"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "muzzleflash_6"
SWEP.MuzzleFlashColor = Color(244, 209, 66)
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellPitch = 95
SWEP.ShellScale = 1
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.SpeedMult = 0.9
SWEP.SightedSpeedMult = 0.55

SWEP.BarrelLength = 8

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false
SWEP.KeepBaseIrons = false
SWEP.SprintTime = 0

SWEP.CaseBones = {}

SWEP.Lunge = 100 -- Whether to allow the bash/melee to lunge a short distance
SWEP.MeleeSwingSound = "weapons/Pilot_Mvmt_Melee_RightHook_1P_2ch_v1_1.wav"
SWEP.MeleeHitSound = "weapons/Imp_Player_MeleePunch_Default_1ch_v1_1.wav"
SWEP.MeleeHitNPCSound = "weapons/Pilot_Mvmt_Melee_Hit_Flesh_1P_2ch_v1_1.wav"

SWEP.Lunge = true -- Whether to allow the bash/melee to lunge a short distance
SWEP.LungeLength = 64 -- Maximum distance for lunging

SWEP.MeleeDamage = 90
SWEP.MeleeRange = 60
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 0.5
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

SWEP.IronSightStruct = {
    Pos = Vector(0, 0, 0),
    Ang = Angle(0, 0, 0),
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

SWEP.AttachmentElements = {		
	["sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
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
        PrintName = "Muzzle Type",
        DefaultAttName = "Barrel Stabilizer",
        Slot = "apex_muzzle",
        Bone = "muzzle_flash",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, -90),
		    wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
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
			{s = "weapons/car/wpn_car_emptyreload_boltback_fr47_2ch_v1_01.wav", t = 8 / 30},
            {s = "weapons/car/wpn_car_emptyreload_boltfront_fr56_2ch_v1_01.wav", t = 14 / 30}
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
        Source = "inspect_in",
		LHIK = true,
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
		LHIK = true,
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
		SoundTable = {
            {s = "weapons/car/wpn_car_emptyreload_maggrab_fr2_2ch_v1_01.wav", t = 2 / 30},
            {s = "weapons/car/Wpn_Car_Reload_MagEject_New_v1_02.wav", t = 17 / 30},
			{s = "weapons/car/Wpn_Car_Reload_MagInsert_New_v1_02.wav", t = 34 / 30},
			{s = "weapons/car/Wpn_Car_Reload_BoltBack_New_v1_01.wav", t = 53 / 30},
			{s = "weapons/car/Wpn_Car_Reload_BoltFwd_New_v1_01.wav", t = 61 / 30},
            {s = "weapons/car/wpn_car_emptyreload_handrest_fr61_2ch_v1_01.wav", t = 61 / 30}
    },	
},
}