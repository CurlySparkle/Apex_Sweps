if CLIENT then
    killicon.Add( "arccw_apex_spitfire", "VGUI/apex_killicon_spitfire", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_spitfire")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "M600 Spitfire"
SWEP.Trivia_Class = "Light Machine Gun"
SWEP.Trivia_Desc = "A light machine gun with a generous capacity and controllable rate of fire."
SWEP.Trivia_Manufacturer = "Siwhan Industries"

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-6, -1.5, 1)
SWEP.CrouchAng = Angle(0.837, 0, -56.513)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
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
SWEP.WorldModel = "models/weapons/w_apex_spitfire.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(12.5, 1, 2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 19
SWEP.DamageMin = 19
SWEP.Range = 150
SWEP.Penetration = 12
SWEP.PhysBulletMuzzleVelocity = 27500 * ArcCW.HUToM

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.75,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.85,
    [HITGROUP_RIGHTLEG] = 0.85,
}

SWEP.Apex_Balance = {
    [1] = {
        Damage = 33,
        DamageMin = 16,
    },
    [2] = {
        Damage = 10, -- Similar to HUGE but about half as fast
        DamageMin = 10,
    },
}

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 35
SWEP.Primary.Ammo = "apex_heavy"

-- SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 0.35
SWEP.RecoilSide = 0.125
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
    }
}

SWEP.AccuracyMOA = 9
SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 150
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.4

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.FirstShootSound = "ArcCW_APEX.Spitfire.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.Spitfire.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "tfa_apex_muzzle_hmg"
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellScale = 1
SWEP.ShellTime = 1

SWEP.Tracer = "arccw_apex_tracer_hmg" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 15

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}


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
SWEP.HoldtypeActive = "smg"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.AttachmentElements = {
    ["weapon_sights"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["weapon_dot"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
}

SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"apex_sights","apex_optic"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(5.15, 1.0, -7.3),
            wang = Angle(-10, 0, 180)
        },
        InstalledEles = {"weapon_sights", "weapon_dot"},
        CorrectivePos = Vector(1.84,0,-0.42),
        CorrectiveAng = Angle(0, 0, 2.593),
        ExtraSightDist = -2
    },
    {
        PrintName = "Muzzle",
        Slot = "apex_muzzle",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(29, 1.0, -9.08),
            wang = Angle(-9, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard", "apex_stock_precision"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_heavy5"}
    },
    {
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
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
    ["1_to_2"] = {
        Source = "firemode1",
        MinProgress = 0.15,
    },
    ["2_to_1"] = {
        Source = "firemode2",
        MinProgress = 0.15,
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

SWEP.TTTWeaponType = "weapon_zm_sledge"
SWEP.TTTWeight = 100