AddCSLuaFile()

SWEP.Base = "arc9_base"

SWEP.Spawnable = true
SWEP.Category = "ARC-9 - Apex Legends (Not working)"

SWEP.PrintName = "R-301 Carbine"
SWEP.Class = "Assault rifle"

SWEP.ViewModel = "models/weapons/c_apex_r301.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"

SWEP.Slot = 2

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    Pos = Vector(-9.5, 1.5, -5.5),
    Ang = Angle(-5, 0, 180),
    Scale = 1
}

SWEP.SpreadMultHipFire = 3
SWEP.RecoilMultHipFire = 1.25
SWEP.RecoilAutoControlMultHipFire = 0.5

-------------------------- DAMAGE PROFILE

SWEP.DamageMax = 25 -- Damage done at point blank range
SWEP.DamageMin = 15 -- Damage done at maximum range

SWEP.DamageRand = 0 -- Damage varies randomly per shot by this fraction. 0.1 = +- 10% damage per shot.

SWEP.RangeMin = 300 -- How far bullets retain their maximum damage for.
SWEP.RangeMax = 10000 -- In Hammer units, how far bullets can travel before dealing DamageMin.

SWEP.Penetration = 5 -- Units of wood that can be penetrated by this gun.

-------------------------- PHYS BULLET BALLISTICS

SWEP.PhysBulletMuzzleVelocity = 15000

-------------------------- MAGAZINE

SWEP.Ammo = "smg1" -- What ammo type this gun uses.

SWEP.ChamberSize = 1 -- The amount of rounds this gun can chamber.
SWEP.ClipSize = 19 -- Self-explanatory.
SWEP.SupplyLimit = 6 -- Amount of magazines of ammo this gun can take from an ARC9 supply crate.
SWEP.SecondarySupplyLimit = 2 -- Amount of reserve UBGL magazines you can take.

SWEP.ReloadInSights = true -- This weapon can aim down sights while reloading.

-- SWEP.DropMagazineModel = "models/weapons/arc9/droppedmags/mp5_mag.mdl" -- Set to a string or table to drop this magazine when reloading.
-- SWEP.DropMagazineSounds = {
    -- "weapons/arc9_ud/common/smg_pistol_magdrop_1.ogg", "weapons/arc9_ud/common/smg_pistol_magdrop_2.ogg", "weapons/arc9_ud/common/smg_pistol_magdrop_3.ogg", "weapons/arc9_ud/common/smg_pistol_magdrop_4.ogg"
-- }  -- Table of sounds a dropped magazine should play.
-- SWEP.DropMagazineAmount = 1 -- Amount of mags to drop.
-- SWEP.DropMagazineTime = 1

-------------------------- FIREMODES

SWEP.RPM = 810

-- Works different to ArcCW

-- -1: Automatic
-- 0: Safe. Don't use this for safety.
-- 1: Semi.
-- 2: Two-round burst.
-- 3: Three-round burst.
-- n: n-round burst.
SWEP.Firemodes = {
    {
        Mode = -1,
        -- add other attachment modifiers
    },
    {
        Mode = 3,
        RPMMult = 1.05
    },
    {
        Mode = 1
    }
}

SWEP.AutoBurst = false -- Hold fire to keep firing bursts
SWEP.PostBurstDelay = 0.05
SWEP.RunAwayBurst = false -- Burst will keep firing until all of the burst has been expended.
SWEP.NonResetBurst = true -- Annoying behaviour where you have to shoot ALL THREE BULLETS of a burst before it resets. Supposedly realistic for the M16.

-- Use this hook to modify features of a firemode.
-- SWEP.Hook_P_ModifyFiremode = function(self, firemode) return firemode end

-------------------------- MELEE

SWEP.Bash = true
SWEP.PrimaryBash = false

SWEP.BashDamage = 50
SWEP.BashLungeRange = 128
SWEP.BashRange = 64
SWEP.PreBashTime = 0.25
SWEP.PostBashTime = 0.5

-------------------------- RECOIL

-- General recoil multiplier
SWEP.Recoil = 1

-- These multipliers affect the predictible recoil by making the pattern taller, shorter, wider, or thinner.
SWEP.RecoilUp = 0.2 -- Multiplier for vertical recoil
SWEP.RecoilSide = 0.2 -- Multiplier for vertical recoil

-- These values determine how much extra movement is applied to the recoil entirely randomly, like in a circle.
-- This type of recoil CANNOT be predicted.
SWEP.RecoilRandomUp = 0.1
SWEP.RecoilRandomSide = 0.1

SWEP.RecoilDissipationRate = 50 -- How much recoil dissipates per second.
SWEP.RecoilResetTime = 0.05 -- How long the gun must go before the recoil pattern starts to reset.

SWEP.RecoilAutoControl = 1 * 0.25 -- Multiplier for automatic recoil control.

SWEP.RecoilKick = 0.75

-------------------------- SPREAD

SWEP.Spread = 0.00315

SWEP.SpreadAddRecoil = 0.0001 -- Applied per unit of recoil.

-------------------------- HANDLING

SWEP.FreeAimRadius = 0 -- In degrees, how much this gun can free aim in hip fire.
SWEP.Sway = 0.85 + 1 -- How much the gun sways.

SWEP.SwayMultMidAir = 2
SWEP.SwayMultMove = 1.15
SWEP.SwayMultCrouch = 0.66
SWEP.SwayMultShooting = 1.2

SWEP.FreeAimRadiusSights = 1

SWEP.SwayMultSights = 0.3

SWEP.AimDownSightsTime = 0.26 -- How long it takes to go from hip fire to aiming down sights.
SWEP.SprintToFireTime = 0.30 -- How long it takes to go from sprinting to being able to fire.

SWEP.SpeedMult = 0.97
SWEP.SpeedMultSights = 0.75
SWEP.SpeedMultShooting = 0.9
SWEP.SpeedMultMelee = 0.75
SWEP.SpeedMultCrouch = 1
SWEP.SpeedMultBlindFire = 1

-------------------------- TRACERS

SWEP.TracerNum = 1 -- Tracer every X
SWEP.TracerColor = Color(255, 225, 200) -- Color of tracers. Only works if tracer effect supports it. For physical bullets, this is compressed down to 9-bit color.

-------------------------- POSITIONS

SWEP.IronSightStruct = {
    Pos = Vector(0, 0, 0),
    Ang = Angle(0, 0, 0),
	    Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
	Magnification = 1.1,
}


SWEP.ViewModelFOVBase = 64

SWEP.CrouchPos = Vector(-3, 0, -3)
SWEP.CrouchAng = Angle(1.037, 0.623, -53.174)
SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)
SWEP.ActivePos = Vector(0, 0, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizeAng = Angle(90, 0, 0)
SWEP.CustomizePos = Vector(12, 32, 4)

-------------------------- HoldTypes

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeHolstered = "passive"
SWEP.HoldTypeSights = "ar2"
SWEP.HoldTypeCustomize = "slam"
SWEP.HoldTypeBlindfire = "pistol"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.AnimReload = ACT_HL2MP_GESTURE_RELOAD_AR2
SWEP.AnimDraw = false

-------------------------- EFFECTS

SWEP.MuzzleParticle = "muzzleflash_3" -- Used for some muzzle effects.

SWEP.ShellModel = "models/shells/shelleject_large_rifle.mdl"
-- SWEP.ShellCorrectAng = Angle(0, 180, 0)
SWEP.ShellScale = 1
SWEP.ShellPhysBox = Vector(0.5, 0.5, 2)

SWEP.CamQCA = 3
-- SWEP.CamOffsetAng = Angle(0, 0, 90)

-------------------------- SOUNDS

SWEP.ShootSound = { "weapons/r301/rifle_fire_1.wav", "weapons/r301/rifle_fire_2.wav", "weapons/r301/rifle_fire_3.wav" }
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_3"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.FiremodeSound = "arc9/firemode.wav"

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
		EventTable = {
            {p = 150, s = "weapons/r301/wpn_r101_reload_magpull_fr0_2ch_v1_02.wav", t = 0 / 30},
            {p = 100, s = "weapons/r301/wpn_r101_reload_maggrab_fr18_2ch_v1_02.wav", t = 18 / 30},
			{p = 100, s = "weapons/r301/wpn_r101_reload_maginsert_fr35_2ch_v1_02.wav", t = 31 / 30},
            {p = 100, s = "weapons/r301/wpn_r101_reload_handrest_fr44_2ch_v1_02.wav", t = 44 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		EventTable = {
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

-------------------------- ATTACHMENTS

SWEP.AttachmentElements = {
    ["r301_sight"] = {
        Bodygroups = {
            {1, 1}
        },
    },
	["r301_sight2"] = {
        Bodygroups = {
            {2, 1}
        },
    },
}


SWEP.Hook_ModifyBodygroups = function(wep, data)
end

-- SWEP.Attachments = {
    -- {
        -- PrintName = "Optic",
        -- DefaultAttName = "Iron Sights",
        -- Category = "r301", -- what kind of attachments can fit here, can be string or table
        -- Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        -- Pos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
        -- Ang = Angle(90, 0, -90),
        -- InstalledElements = {"r301_sight", "r301_sight2"},
		-- CorrectivePos = Vector(1.57,0,-0.5),
        -- CorrectiveAng = Angle(-0.846, 0, 5.955)
    -- },
    -- {
        -- PrintName = "Muzzle",
        -- DefaultAttName = "Barrel Stabilizer",
        -- Category = "apex_muzzle",
        -- Bone = "muzzle_flash",
        -- Pos = Vector(0, 0, 0),
        -- Ang = Angle(0, 0, -90),
    -- },
	-- {
        -- PrintName = "Stock",
        -- Category = {"apex_standard_stock"}
    -- },
	-- {
        -- PrintName = "Magazine",
        -- Category = {"apex_mag_light"}
    -- },
	-- {
        -- PrintName = "Extras",
		-- Installed = "apex_hitsound_headshot",
        -- Category = {"apex_extras"}
    -- },
	-- {
        -- PrintName = "Extras 2",
		-- Installed = "apex_hitsound",
        -- Category = {"apex_extras2"}
    -- },
-- }