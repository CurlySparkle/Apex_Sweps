if CLIENT then
    killicon.Add( "arccw_apex_re45", "VGUI/apex_killicon_re45", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_re45")
end

SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "RE-45 Auto"
SWEP.Trivia_Class = "Pistol"
SWEP.Trivia_Desc = "Full-auto pistol."
SWEP.Trivia_Manufacturer = "Paradinha Arsenal"

SWEP.Slot = 1

SWEP.CrouchPos = Vector(-4.5, -2, 1.5)
SWEP.CrouchAng = Angle(1.569, 0.88, -50.458)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.NPCWeaponType = "weapon_pistol"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_re45.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-10.8, 4, -2.7),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 12
SWEP.DamageMin = 12
SWEP.Range = 15
SWEP.Penetration = 5
SWEP.PhysBulletMuzzleVelocity = 19500 * ArcCW.HUToM

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
}

local balance = {
    [0] = {
        -- Apex Legends Settings
        Damage = 12,
        DamageMin = 12,
        Penetration = 5,
    },
    [1] = {
        -- Arcwc Settings
        Damage = 21,
        DamageMin = 21,
        Penetration = 20,
    }
}

function SWEP:ArcCW_Apex_Setup()
    local val = GetConVar("arccw_apex_bal"):GetInt()
    for i, v in pairs(balance[val]) do
        self[i] = v
    end
end
DEFINE_BASECLASS("arccw_base")
function SWEP:Initialize()
    BaseClass.Initialize(self)

    self:ArcCW_Apex_Setup()
end

SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 750 -- projectile or phys bullet muzzle velocity

SWEP.ChamberSize = 1 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 16 -- DefaultClip is automatically set.
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.425
SWEP.RecoilSide = 0.5
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 0.1

SWEP.Delay = 60 / 780 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 1.95 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 120 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 100

SWEP.Primary.Ammo = "pistol"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 101 -- pitch of shoot sound


SWEP.FirstShootSound = "ArcCW_APEX.R99.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.R99.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Pistol_Dry_A"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.Tracer = "hl2mmod_generic_tracer"
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 3

SWEP.MuzzleEffect = "hl2mmod_muzzleflash_pistol"
SWEP.ShellModel = "models/shells/shelleject_pistol.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.25
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 5

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.Lunge = true -- Whether to allow the bash/melee to lunge a short distance
SWEP.LungeLength = 64
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
    Magnification = 1.1,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "revolver"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

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
}

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
            wang = Angle(90, 0, -90),
        },
        InstalledEles = {"ref_sights", "weapon_dot"},
         CorrectivePos = Vector(1.33,0,-0.55),
         CorrectiveAng = Angle(1.045, -0.682, 1.999)
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
            wang = Angle(0, 0, -90),
        },
    },
    {
        PrintName = "Mag Type",
        Slot = {"apex_mag_light2"}
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
            {p = 100, s = "weapons/p2020/smartpistol_reload_slideback_st_01.wav", t = 15 / 30},
            {p = 100, s = "weapons/p2020/smartpistol_reload_slideforward_st_01.wav", t = 22 / 30}
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
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
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
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.4,
        LHIKEaseOut = 0.2,
        MinProgress = 60 / 40,
        SoundTable = {
            {p = 100, s = "weapons/re45/wpn_re45_reload_magpull_fr4_2ch_v1_01.wav", t = 4 / 30},
            {p = 100, s = "weapons/re45/Wpn_RE45_Reload_MagInsert_fr28_2ch_v2_01.wav", t = 28 / 30},
            {p = 100, s = "weapons/re45/Wpn_RE45_Reload_MagPat_fr35_2ch_v2_02.wav", t = 37 / 30},
            {p = 100, s = "weapons/re45/wpn_re45_reload_handrest_fr40_2ch_v1_01.wav", t = 40 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.5,
        LHIKEaseOut = 0.2,
        MinProgress = 97/40,
        SoundTable = {
            {p = 100, s = "weapons/re45/wpn_re45_emptyreload_magpull_fr4_2ch_v1_01.wav", t = 4 / 30},
            {p = 100, s = "weapons/re45/Wpn_RE45_EmptyReload_MagInsert_fr27_2ch_v2_01.wav", t = 27 / 30},
            {p = 100, s = "weapons/re45/Wpn_RE45_Reload_MagPat_fr35_2ch_v2_02.wav", t = 37 / 30},
            {p = 100, s = "weapons/re45/wpn_re45_emptyreload_boltback_fr47_2ch_v1_01.wav", t = 47 / 30},
            {p = 100, s = "weapons/re45/wpn_re45_emptyreload_boltfront_fr50_2ch_v1_02.wav", t = 50 / 30},
            {p = 100, s = "weapons/re45/wpn_re45_emptyreload_handrest_fr55_2ch_v1_01.wav", t = 55 / 30}
        },
    },
}