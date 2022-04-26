if CLIENT then
    killicon.Add( "arccw_apex_mastiff", "VGUI/apex_killicon_mastiff", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_mastiff")
end

SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Mastiff Shotgun"
SWEP.Trivia_Class = "semi-automatic shotgun"
SWEP.Trivia_Desc = "The Mastiff Shotgun, also called Mastiff, is a semi-automatic shotgun that utilizes Shotgun Shells. It fires 8 pellets in the shape of a horizontal line, which decreases in width while aiming down the sights, reducing the spread and thus increasing accuracy. "
SWEP.Trivia_Manufacturer = "Lastimosa Armory"
SWEP.Trivia_Country = "Unknown"
SWEP.Trivia_Calibre = "Shotgun Shells"
SWEP.Trivia_Year = "2734"

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_mastiff.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-3, 4.5, -6),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.WorldModel = "models/weapons/c_apex_mastiff.mdl"
SWEP.ViewModelFOV = 65

SWEP.DefaultBodygroups = "00000"

SWEP.Damage = 14
SWEP.DamageMin = 11 -- damage done at maximum range
SWEP.RangeMin = 30
SWEP.Range = 95 -- in METRES
SWEP.RangeMin = 35

SWEP.HullSize = 2
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = 1,}

SWEP.Penetration = 5
SWEP.DamageType = DMG_BUCKSHOT
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 700 -- projectile or phys bullet muzzle velocity
-- IN M/S

SWEP.Num = 8
SWEP.ShotgunSpreadPattern = true
SWEP.Hook_ShotgunSpreadOffset = function(wep, data)
    data.ang = Angle(0, math.Rand(-3, 3), 0)
   -- if self:GetState() == ArcCW.STATE_SIGHTS then
   -- data.ang = Angle(0, math.Rand(1, 1), 1)
    return data
end

SWEP.Tracer = "hl2mmod_generic_tracer"
SWEP.TracerNum = 8 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ChamberSize = 0 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 6 -- DefaultClip is automatically set.

SWEP.Recoil = 2
SWEP.RecoilSide = 2
SWEP.MaxRecoilBlowback = 2
SWEP.RecoilRise = 3
SWEP.RecoilPunch = 3.5
SWEP.RecoilVMShake = 2

SWEP.ShotgunReload = true
SWEP.ManualAction = false

SWEP.Delay = 60 / 66 -- 60 / RPM.
SWEP.RunawayBurst = false
SWEP.Firemodes = {
    {
        PrintName = "fcg.slam",
        Mode = 2,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_shotgun"
SWEP.NPCWeight = 100

SWEP.AccuracyMOA = 30 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 350 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 150

SWEP.Primary.Ammo = "buckshot" -- what ammo type the gun uses

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = { "weapons/mastiff/fire_1.wav", "weapons/mastiff/fire_2.wav", "weapons/mastiff/fire_3.wav" }
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""
SWEP.ShootDrySound = "ArcCW_APEX.Shotgun_Dry_A"

SWEP.MuzzleEffect = "muzzleflash_shotgun"
SWEP.ShellModel = "models/shells/shelleject_shotshell.mdl"
SWEP.ShellPitch = 100
SWEP.ShellSounds = ArcCW.ShotgunShellSoundsTable
SWEP.ShellScale = 1.5

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
-- SWEP.ProceduralViewBobAttachment = 1
SWEP.CamAttachment = 3

SWEP.SpeedMult = 0.95
SWEP.SightedSpeedMult = 0.75
SWEP.SightTime = 0.27

SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
    -- [0] = "bulletchamber",
    -- [1] = "bullet1"
}

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(0, 0, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
	    Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "shotgun"
SWEP.HoldtypeSights = "ar2"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

SWEP.CrouchPos = Vector(-2.5, 0, 0.5)
SWEP.CrouchAng = Angle(-0.606, 0, -8.576)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, 0, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.MeleeSwingSound = "weapons/Pilot_Mvmt_Melee_RightHook_1P_2ch_v1_1.wav"
SWEP.MeleeHitSound = "weapons/Imp_Player_MeleePunch_Default_1ch_v1_1.wav"
SWEP.MeleeHitNPCSound = "weapons/Pilot_Mvmt_Melee_Hit_Flesh_1P_2ch_v1_1.wav"
SWEP.MeleeDamage = 90
SWEP.MeleeRange = 60
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 0.5
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

SWEP.AttachmentElements = {
	["sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
}

SWEP.ExtraSightDist = 5

SWEP.Attachments = {
    {
        PrintName = "Optic Type", -- print name
        DefaultAttName = "Iron Sights",
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 90),
            wang = Angle(90, 0, -90),
        },			
        InstalledEles = {"sight"},
		 CorrectivePos = Vector(1.81,0,-0.7),
         CorrectiveAng = Angle(0, 0, 3.494)
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
    },
    ["idle_empty"] = {
        Source = "idle_dry",
    },
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {s = "weapons/mastiff/Mastiff_Drawfirst_V1_2ch_02.wav", t = 6 / 30},
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
        Source = {"fire", "fire"},
        ShellEjectAt = 0.1,
        SoundTable = {
			{s = "ArcCW_APEX.Mastiff_Mech", t = 22 / 30},
        },
    },
	["fire_empty"] = {
        Source = {"fire_dry"},
        ShellEjectAt = 0.1,
        SoundTable = {
			{s = "ArcCW_APEX.Mastiff_Mech", t = 22 / 30},
        },
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = "iron_fire",
        ShellEjectAt = 0.1,
        SoundTable = {
			{s = "ArcCW_APEX.Mastiff_Mech", t = 22 / 30},
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
        Source = "reload_pap",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.4,
        SoundTable = {
            {s = "weapons/mastiff/wpn_mastiff_reload_start_fr6_2ch_v2_01.wav", t = 6 / 30},
            {s = "ArcCW_APEX.Mastiff_Shell", t = 23 / 30},
            {s = "weapons/mastiff/wpn_mastiff_reload_end_fr3_2ch_v2_01.wav", t = 32 / 30},
        },
    },
    ["reload_empty"] = {
        Source = "reload_pap",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.4,
        SoundTable = {
            {s = "weapons/mastiff/wpn_mastiff_reload_start_fr6_2ch_v2_01.wav", t = 6 / 30},
            {s = "ArcCW_APEX.Mastiff_Shell", t = 23 / 30},
            {s = "weapons/mastiff/wpn_mastiff_reload_end_fr3_2ch_v2_01.wav", t = 32 / 30},
        },
    },
    ["sgreload_start"] = {
        Source = "reload_start",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0,
		Time = 15 / 30,
        SoundTable = {
            {s = "weapons/mastiff/wpn_mastiff_reload_start_fr6_2ch_v2_01.wav", t = 6 / 30},
			{s = "ArcCW_APEX.Mastiff_Shell", t = 23 / 30},
        },
    },
    ["sgreload_start_empty"] = {
        Source = "reload_start_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0,
        SoundTable = {
            {s = "weapons/mastiff/wpn_mastiff_reloadempty_start_fr1_2ch_v2_01.wav", t = 1 / 30},
            {s = "weapons/mastiff/wpn_mastiff_reloadempty_start_fr6_2ch_v2_01.wav", t = 2 / 30},
        },
    },
    ["sgreload_insert"] = {
        Source = "reload_loop",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.3,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
		Time = 15 / 30,
        SoundTable = {
            {s = "ArcCW_APEX.Mastiff_Shell", t = 7 / 30},
        },
    },
    ["sgreload_finish"] = {
        Source = "reload_end",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 1,
        SoundTable = {
            {s = "weapons/mastiff/wpn_mastiff_reload_end_fr3_2ch_v2_01.wav", t = 3 / 30},
        },
    },
    ["sgreload_finish_empty"] = {
        Source = "reload_end",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 1,
        SoundTable = {
            {s = "weapons/mastiff/wpn_mastiff_reload_end_fr3_2ch_v2_01.wav", t = 3 / 30},
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