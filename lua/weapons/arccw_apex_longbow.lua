if CLIENT then
    killicon.Add( "arccw_apex_longbow", "VGUI/apex_killicon_longbow", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_longbow")
end

SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Longbow DMR"
SWEP.Trivia_Class = "Semi-auto sniper rifle"
SWEP.Trivia_Desc = "The D-101 Longbow DMR (Designated Marksman Rifle) is a semi-automatic sniper rifle made by Lastimosa Armory. Models from the Frontier War were variants of the then-current R-201 Assault Rifle, the model used in the Apex Games then would most likely be a variant of the R-201's successor, the R-301 Carbine. "
SWEP.Trivia_Manufacturer = "Lastimosa Armory"
SWEP.Trivia_Country = "Unkown"
SWEP.Trivia_Calibre = "5.8x42mm"
SWEP.Trivia_Year = "2734"

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-6, 0, 1)
SWEP.CrouchAng = Angle(0, 0, -53)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -1, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_longbow.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.ViewModelFOV = 70

SWEP.Damage = 65
SWEP.DamageMin = 45 -- damage done at maximum range
SWEP.Range = 150 -- in METRES
SWEP.Penetration = 35
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 950 -- projectile or phys bullet muzzle velocity
-- IN M/S
SWEP.Tracer = "tfa_apex_tracer_sniper" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerCol = Color(255, 85, 25)
SWEP.TracerWidth = 10

SWEP.ChamberSize = 1 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 5 -- DefaultClip is automatically set.
SWEP.MaxRecoilBlowback = 1

SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 1.670
SWEP.RecoilSide = 0.345
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5

SWEP.Delay = 60 / 78 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 2 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 725 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 175

SWEP.Primary.Ammo = "XBowBolt" 

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = { "weapons/longbow/wpn_dmr_fire_1.wav", "weapons/longbow/wpn_dmr_fire_2.wav", "weapons/longbow/wpn_dmr_fire_3.wav" }
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_1"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "tfa_apex_muzzle_sniper"
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellPitch = 85
SWEP.ShellScale = 1
SWEP.ShellTime = 1
-- SWEP.ShellRotateAngle = Angle(0, 0, 0)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.BarrelLength = 15

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
    Magnification = 1,
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
    ["longbow_sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
	["weapon_sights"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
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
        Slot = {"apex_sights", "apex_scope_snipers", "apex_optic"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
		InstalledEles = {"longbow_sight","weapon_sights"},
		CorrectivePos = Vector(2.025,0,-0.5),
        CorrectiveAng = Angle(-1.967, 0.033, 3.6)
    },
    {
        PrintName = "Muzzle Type",
        DefaultAttName = "Barrel Stabilizer",
        Slot = "apex_muzzle",
        Bone = "muzzle_flash",
        Offset = {
            vpos = Vector(-4.5, 0, 0),
            vang = Angle(0, 0, -90),
        },
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
            {p = 100, s = "weapons/longbow/wpn_dmr_emptyreload_boltback_fr73_2ch_v1_01.wav", t = 17 / 35},
            {p = 100, s = "weapons/longbow/wpn_dmr_emptyreload_boltforward_fr80_2ch_v1_01.wav", t = 22 / 35}
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
            {p = 100, s = "weapons/longbow/wpn_dmr_emptyreload_magpull_fr8_2ch_v1_01.wav", t = 8 / 30},
            {p = 100, s = "weapons/longbow/wpn_dmr_emptyreload_maggrab_fr14_2ch_v1_02.wav", t = 14 / 30},
			{p = 100, s = "weapons/longbow/wpn_dmr_emptyreload_maginsert_fr39_2ch_v1_02.wav", t = 39 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		SoundTable = {
            {s = "weapons/longbow/wpn_dmr_emptyreload_magpull_fr8_2ch_v1_01.wav", t = 8 / 30},
            {s = "weapons/longbow/wpn_dmr_emptyreload_maggrab_fr14_2ch_v1_02.wav", t = 14 / 30},
			{s = "weapons/longbow/wpn_dmr_emptyreload_maginsert_fr39_2ch_v1_02.wav", t = 39 / 30},
			{s = "weapons/longbow/wpn_dmr_emptyreload_boltback_fr73_2ch_v1_01.wav", t = 73 / 30},
			{s = "weapons/longbow/wpn_dmr_emptyreload_boltforward_fr80_2ch_v1_01.wav", t = 80 / 30}
    },
},
}

sound.Add({
    name = "Apex_Draw_Rifle",
    channel = 16,
    volume = 1.0,
    sound = "weapons/wpn_sniper_draw_lr_v1_1.wav"
})

sound.Add({
    name = "Apex_Holster_Rifle",
    channel = 16,
    volume = 1.0,
    sound = "weapons/wpn_sniper_holster_lr_v1_1.wav"
})