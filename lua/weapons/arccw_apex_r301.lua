if CLIENT then
    killicon.Add( "arccw_apex_r301", "VGUI/apex_killicon_r301", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_r301")
end

SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "R-301 Carbine"
SWEP.Trivia_Class = "Assault rifle"
SWEP.Trivia_Desc = "The R-301 Carbine, also called R-301, is an assault rifle that utilizes Light Rounds.."
SWEP.Trivia_Manufacturer = "Lastimosa Armory"
SWEP.Trivia_Country = "Unkown"
SWEP.Trivia_Calibre = "5.8x42mm"
SWEP.Trivia_Year = "2734"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-4.324, 0, 1.5)
SWEP.CrouchAng = Angle(1.037, 0.623, -53.174)
SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)
SWEP.ActivePos = Vector(0, 0, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_r301.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.ViewModelFOV = 70

SWEP.Damage = 25
SWEP.DamageMin = 14 -- damage done at maximum range
SWEP.Range = 85 -- in METRES
SWEP.Penetration = 25
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 550 -- projectile or phys bullet muzzle velocity
-- IN M/S
SWEP.Tracer = "hl2mmod_generic_tracer"
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 3

SWEP.ChamberSize = 1 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 19 -- DefaultClip is automatically set.
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.425
SWEP.RecoilSide = 0.215
SWEP.RecoilRise = 0.4
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1

SWEP.Sway = 0

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

SWEP.AccuracyMOA = 15 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 150
SWEP.SightsDispersion = 0 -- dispersion that remains even in sights
SWEP.JumpDispersion = 300 -- dispersion penalty when in the air

SWEP.Primary.Ammo = "smg1" 

SWEP.ShootVol = 85 -- volume of shoot sound
SWEP.ShootPitch = 95 -- pitch of shoot soun
-- SWEP.ShootPitchVariation = 0.1

SWEP.ShootSound = { "weapons/r301/rifle_fire_1.wav", "weapons/r301/rifle_fire_2.wav", "weapons/r301/rifle_fire_3.wav" }
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_3"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "hl2mmod_muzzleflash_smg1"
SWEP.MuzzleFlashColor = Color(255, 209, 66)
SWEP.ShellModel = "models/shells/shelleject_large_rifle.mdl"
SWEP.ShellPitch = 95
SWEP.ShellScale = 1
SWEP.ShellTime = 1
-- SWEP.ShellRotateAngle = Angle(0, 0, 90)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.SpeedMult = 0.9
SWEP.SightedSpeedMult = 0.55

SWEP.BarrelLength = 12

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false
SWEP.SprintTime = 0

SWEP.CaseBones = {}

SWEP.Lunge = 100 -- Whether to allow the bash/melee to lunge a short distance
SWEP.MeleeSwingSound = "weapons/Pilot_Mvmt_Melee_RightHook_1P_2ch_v1_1.wav"
SWEP.MeleeHitSound = "weapons/Imp_Player_MeleePunch_Default_1ch_v1_1.wav"
SWEP.MeleeHitNPCSound = "weapons/Pilot_Mvmt_Melee_Hit_Flesh_1P_2ch_v1_1.wav"

SWEP.MeleeDamage = 90
SWEP.MeleeRange = 25
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
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.AttachmentElements = {		
    ["r301_sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
	["r301_sight2"] = {
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
        Slot = "r301", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },			
        InstalledEles = {"r301_sight", "r301_sight2"},
		 CorrectivePos = Vector(1.57,0,-0.5),
         CorrectiveAng = Angle(-0.846, 0, 5.955)
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
	["ready"] = {Source = "draw_first", Mult = 0.8},
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
            {p = 150, s = "weapons/r301/wpn_r101_reload_magpull_fr0_2ch_v1_02.wav", t = 0 / 30},
            {p = 100, s = "weapons/r301/wpn_r101_reload_maggrab_fr18_2ch_v1_02.wav", t = 18 / 30},
			{p = 100, s = "weapons/r301/wpn_r101_reload_maginsert_fr35_2ch_v1_02.wav", t = 31 / 30},
            {p = 100, s = "weapons/r301/wpn_r101_reload_handrest_fr44_2ch_v1_02.wav", t = 44 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		SoundTable = {
            {p = 100, s = "weapons/r301/wpn_r101_emptyreload_magpull_fr9_2ch_v1_02.wav", t = 9 / 30},
            {p = 100, s = "weapons/r301/wpn_r101_emptyreload_maggrab_fr21_2ch_v1_02.wav", t = 21 / 30},
			{p = 100, s = "weapons/r301/wpn_r101_emptyreload_maginsert_fr38_2ch_v1_02.wav", t = 38 / 30},
			{p = 100, s = "weapons/r301/wpn_r101_emptyreload_boltback_fr51_2ch_v1_02.wav", t = 51 / 30},
			{p = 100, s = "weapons/r301/wpn_r101_emptyreload_boltforward_fr55_2ch_v1_02.wav", t = 55 / 30},
            {p = 100, s = "weapons/r301/wpn_r101_emptyreload_handrest_fr64_2ch_v1_02.wav", t = 64 / 30}
    },	
},
}

sound.Add({
    name = "R301.Draw",
    channel = 32,
    volume = 1.0,
    sound = "weapons/r301/rifle_deploy_1.wav"
})