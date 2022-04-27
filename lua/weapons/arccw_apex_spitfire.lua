if CLIENT then
    killicon.Add( "arccw_apex_spitfire", "VGUI/apex_killicon_spitfire", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_spitfire")
end

SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "M600 Spitfire"
SWEP.Trivia_Class = "Light machine gun"
SWEP.Trivia_Desc = "The Volt SMG, is an sub machine gun that utilizes Heavy Rounds for its energy makeshift bullets."
SWEP.Trivia_Manufacturer = "Siwhan Industries"
SWEP.Trivia_Country = "Unkown"
SWEP.Trivia_Calibre = "Heavy Rounds"
SWEP.Trivia_Year = "2734"

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-6, 0, 1)
SWEP.CrouchAng = Angle(0.837, 0, -56.513)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -1.5, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -1)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_spitfire.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.ViewModelFOV = 65

SWEP.Damage = 33
SWEP.DamageMin = 19 -- damage done at maximum range
SWEP.Range = 170 -- in METRES
SWEP.Penetration = 40
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 550 -- projectile or phys bullet muzzle velocity IN M/S

SWEP.ChamberSize = 1 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 48 -- DefaultClip is automatically set.
SWEP.Primary.Ammo = "ar2"

-- SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 0.425
SWEP.RecoilSide = 0.215
SWEP.RecoilRise = 0.4
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1
SWEP.VisualRecoilMult = 0.1
SWEP.MaxRecoilBlowback = 1

SWEP.Delay = 60 / 540 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 1 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 225 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 255

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.FirstShootSound = "ArcCW_APEX.Spitfire.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.Spitfire.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "hl2mmod_muzzleflash_smg1"
SWEP.ShellModel = "models/shells/shelleject_large_rifle.mdl"
SWEP.ShellScale = 1
SWEP.ShellTime = 1

SWEP.Tracer = "hl2mmod_generic_tracer" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 15

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.Lunge = true -- Whether to allow the bash/melee to lunge a short distance
SWEP.MeleeSwingSound = "weapons/Pilot_Mvmt_Melee_RightHook_1P_2ch_v1_1.wav"
SWEP.MeleeHitSound = "weapons/Imp_Player_MeleePunch_Default_1ch_v1_1.wav"
SWEP.MeleeHitNPCSound = "weapons/Pilot_Mvmt_Melee_Hit_Flesh_1P_2ch_v1_1.wav"

SWEP.MeleeDamage = 90
SWEP.MeleeRange = 60
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 0.5
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

SWEP.IronSightStruct = {
    Pos = Vector(0, -1, 0),
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

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

SWEP.ExtraSightDist = 2.5

SWEP.AttachmentElements = {		
    ["weapon_sights"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
}

SWEP.WorldModelOffset = {
    pos = Vector(-5, 5, -5.5),
    ang = Angle(-10, 0, 180-5)
}

SWEP.MirrorVMWM = false
SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic Type", -- print name
        DefaultAttName = "Iron Sights",
        Slot = {"apex_sights","apex_optic"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
		InstalledEles = {"weapon_sights"},
		CorrectivePos = Vector(1.84,0,-0.45),
        CorrectiveAng = Angle(0, 0, 2.593),
		ExtraSightDist = -3
    },
    {
        PrintName = "Muzzle Type",
        DefaultAttName = "Barrel Stabilizer",
        Slot = "apex_muzzle",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
        },
    },
	{
        PrintName = "Stock Type",
        Slot = {"apex_standard_stock"}
    },
	{
        PrintName = "Mag Type",
        Slot = {"apex_energy_mags"}
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
    ["enter_sprint"] = {
        Source = "sprint_in",
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
    ["ready"] = {
        Source = "draw_first",
		SoundTable = {
            {p = 100, s = "weapons/spitfire/wpn_lmg_firstdraw_2ch_v1_01.wav", t = 1 / 35}
        },
    },
    ["draw"] = {
        Source = "draw",
		Mult = 1,
    },
	["holster"] = {
        Source = "holster",
		Mult = 1,
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
            {p = 100, s = "weapons/spitfire/wpn_lmg_reload_drumremove_fr5_2ch_v1_01.wav", t = 5 / 30},
            {p = 100, s = "weapons/spitfire/wpn_lmg_reload_drumgrab_fr30_2ch_v1_02.wav", t = 30 / 30},
			{p = 100, s = "weapons/spitfire/Wpn_LMG_EmptyReload_DrumInsert_fr55_2ch_v2_03.wav", t = 48 / 30},
			{p = 100, s = "weapons/spitfire/Wpn_LMG_EmptyReload_DrumPat_fr69_2ch_v2_02.wav", t = 60 / 30},
			{p = 100, s = "weapons/spitfire/wpn_lmg_reload_handrest_fr76_2ch_v1_02.wav", t = 75 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		SoundTable = {
            {s = "weapons/spitfire/Wpn_LMG_EmptyReload_drumremove_fr0_2ch_v1_01.wav", t = 5 / 30},
			{s = "weapons/spitfire/Wpn_LMG_EmptyReload_drumgrab_fr22_2ch_v1_02.wav", t = 30 / 30},
			{s = "weapons/spitfire/Wpn_LMG_EmptyReload_DrumInsert_fr55_2ch_v2_03.wav", t = 48 / 30},
			{s = "weapons/spitfire/Wpn_LMG_EmptyReload_DrumPat_fr69_2ch_v2_02.wav", t = 60 / 30},
			{s = "weapons/spitfire/Wpn_LMG_EmptyReload_BoltBack_fr85_2ch_v2_01.wav", t = 77 / 30},
			{s = "weapons/spitfire/Wpn_LMG_EmptyReload_BoltFront_fr94_2ch_v2_01.wav", t = 84 / 30},
			{s = "weapons/spitfire/Wpn_LMG_EmptyReload_handrest_fr102_2ch_v1_02.wav", t = 91 / 30}
    },
},
}