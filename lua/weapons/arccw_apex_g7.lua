if CLIENT then
    killicon.Add( "arccw_apex_g7", "VGUI/apex_killicon_g7", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_g7")
end

SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "G7 Scout"
SWEP.Trivia_Class = "Designated Marksman Rifle"
SWEP.Trivia_Desc = "A long-lasting rifle design tracing back to even before the Frontier War. With excellent damage and a high rate of fire, this is a flexible weapon in medium to long range engagements."
SWEP.Trivia_Manufacturer = "Lastimosa Armory"

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-6, 0, 1)
SWEP.CrouchAng = Angle(0, 0, -53)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -1.5, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_g7.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.ViewModelFOV = 65

SWEP.Damage = 36
SWEP.DamageMin = 36
SWEP.Range = 10
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 30000 * ArcCW.HUToM

local balance = {
    [0] = {
        -- Apex Legends Settings
        Damage = 36,
        DamageMin = 36,
		Penetration = 10,
    },
    [1] = {
        -- Arcwc Settings
        Damage = 42,
        DamageMin = 36,
		Penetration = 25,
    }
}

function SWEP:ArcCW_Apex_Setup()
    local val = GetConVar("arccw_apex_bal"):GetInt()
    for i, v in pairs(balance[val]) do
        self[i] = v
    end
end

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
}

SWEP.Tracer = "tfa_apex_tracer_sniper" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ChamberSize = 1 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 20
SWEP.MaxRecoilBlowback = 1

-- SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 1.1
SWEP.RecoilSide = 0.345
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.VisualRecoilMult = 1.25
SWEP.RecoilVMShake = 1

SWEP.Delay = 60 / 240 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = -1,
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 0.5
SWEP.HipDispersion = 400 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 75

SWEP.Primary.Ammo = "smg1"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = { "weapons/g7/fire_1.wav", "weapons/g7/fire_2.wav", "weapons/g7/fire_3.wav" }
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_1"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "tfa_apex_muzzle_sniper"
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellPitch = 85
SWEP.ShellScale = 1.1
SWEP.ShellTime = 1
-- SWEP.ShellRotateAngle = Angle(0, 0, 0)

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

SWEP.MeleeDamage = 50
SWEP.MeleeRange = 60
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 1
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

SWEP.IronSightStruct = {
    Pos = Vector(0, -5, 0),
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

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.ExtraSightDist = 4

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
        Slot = {"apex_sights", "apex_scope_snipers", "apex_optic"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
        InstalledEles = {"weapon_sights"},
        CorrectivePos = Vector(1.98, 0, -0.75),
        CorrectiveAng = Angle(0, 0, 3.6),
        ExtraSightDist = -1.5
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
            {p = 100, s = "weapons/g7/wpn_g2a4_reload_empty_charge_fr49_2ch_v1_01.wav", t = 7 / 35}
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
        Source = {"iron_fire", "iron_fire2"},
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
            {p = 100, s = "weapons/g7/wpn_g2a4_reload_empty_grabmag_fr0_2ch_v1_01.wav", t = 8 / 30},
            {p = 100, s = "weapons/g7/wpn_g2a4_reload_empty_ejectmag_fr18_2ch_v1_01.wav", t = 14 / 30},
            {p = 100, s = "weapons/g7/wpn_g2a4_reload_empty_insertmag_fr34_2ch_v1_01.wav", t = 39 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "weapons/g7/wpn_g2a4_reload_empty_grabmag_fr0_2ch_v1_01.wav", t = 0 / 30},
            {s = "weapons/g7/wpn_g2a4_reload_empty_ejectmag_fr18_2ch_v1_01.wav", t = 18 / 30},
            {s = "weapons/g7/wpn_g2a4_reload_empty_insertmag_fr34_2ch_v1_01.wav", t = 34 / 30},
            {s = "weapons/g7/wpn_g2a4_reload_handgrab_fr44_2ch_v1_01.wav", t = 44 / 30},
            {s = "weapons/g7/wpn_g2a4_reload_empty_charge_fr49_2ch_v1_01.wav", t = 49 / 30}
    },
},
}