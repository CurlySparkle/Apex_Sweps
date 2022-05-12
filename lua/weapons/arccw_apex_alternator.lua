if CLIENT then
    killicon.Add( "arccw_apex_alternator", "VGUI/apex_killicon_alternator", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_alternator")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Alternator SMG"
SWEP.Trivia_Class = "Submachine Gun"
SWEP.Trivia_Desc = "A high-damage submachine gun that fires from its two alternating barrels."
SWEP.Trivia_Manufacturer = "Burrell Defense"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-4.5, -1.5, 1)
SWEP.CrouchAng = Angle(1.589, 0.793, -50.437)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -1.5, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.NPCWeaponType = "weapon_smg1"
SWEP.NPCWeight = 250


SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_alternator.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"
SWEP.ViewModelFOV = 65

SWEP.Damage = 16
SWEP.DamageMin = 16
SWEP.Range = 10
SWEP.Penetration = 4
SWEP.PhysBulletMuzzleVelocity = 19500 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [0] = {
        -- Apex Legends Settings
        Damage = 16,
        DamageMin = 16,
        Penetration = 4,
    },
    [1] = {
        -- Arcwc Settings
        Damage = 19,
        DamageMin = 19,
        Penetration = 15,
    }
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
}

SWEP.TracerNum = 1 -- tracer every X
SWEP.Tracer = "arccw_tracer" -- override tracer (hitscan) effect
SWEP.TracerWidth = 5

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 18
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.35
SWEP.RecoilSide = 0.15
SWEP.RecoilRise = 0.15
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 0.2

SWEP.Delay = 60 / 600 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 6 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 125
SWEP.JumpDispersion = 300

SWEP.Primary.Ammo = "apex_light"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "ArcCW_APEX.Alternator.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.SMG_Dry_E"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "hl2mmod_muzzleflash_smg1"
SWEP.ShellModel = "models/shells/shelleject_pistol.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.2
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 12

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.Lunge = true -- Whether to allow the bash/melee to lunge a short distance
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
    Magnification = 1.2,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

SWEP.AttachmentElements = {
    ["weapon_sights"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
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
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
        InstalledEles = {"weapon_sights"},
         CorrectivePos = Vector(1.665,0,-0.77),
         CorrectiveAng = Angle(0.045, -0.683, 3.746)
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
        Slot = {"apex_mag_light4"}
    },
	{
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
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
            {p = 100, s = "ArcCW_APEX.Alternator.first_pullout.CLOTH_f00.", t = 0 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.first_pullout.FOLEY_f00", t = 0 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.first_pullout.FOLEY_f26", t = 26 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.first_pullout.MECH_f08", t = 8 / 30}
    },
    },
    ["draw"] = {
        Source = "draw",
    },
    ["holster"] = {
        Source = "holster",
    },
    ["idle_iron"] = {
        Source = "iron_idle",
    },
    ["fire"] = {
        Source = "fire",
        ShellEjectAt = 0,
    },
    ["fire2"] = {
        Source = "fire2",
        ShellEjectAt = 0,
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = "iron_fire",
        ShellEjectAt = 0,
    },
    ["fire_sight2"] = {
        Source = "iron_fire2",
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
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
    },
    ["idle_inspect"] = {
        Source = "inspect",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Start_V2_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Mid_V2_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Mid_V2_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_End_V2_2ch_01.wav", t = 316 / 30}
    },
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
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Cloth_0", t = 0 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Foley_28", t = 32 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Foley_77", t = 64 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.ClipIn", t = 49 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.ClipOut", t = 12 / 30}
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
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Cloth_0", t = 0 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Cloth_45", t = 45 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Foley_28", t = 28 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.Foley_77", t = 77 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.ClipOut", t = 12 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.ClipIn", t = 49 / 30},
            {p = 100, s = "ArcCW_APEX.Alternator.Empty_Reload.PullBolt", t = 70 / 30}
        },
    },
}

-- Alternate between the left/right fire animation
SWEP.Hook_SelectFireAnimation = function(wep, data)
    if wep:GetNthShot() % 2 == 0 then
        return wep:GetNWState() == ArcCW.STATE_SIGHTS and "fire_sight2" or "fire2"
    else
        return wep:GetNWState() == ArcCW.STATE_SIGHTS and "fire_sight" or "fire"
    end
end