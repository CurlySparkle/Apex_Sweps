if CLIENT then
    killicon.Add( "arccw_apex_g7", "VGUI/apex_killicon_g7", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_g7")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "G7 Scout"
SWEP.Trivia_Class = "Designated Marksman Rifle"
SWEP.Trivia_Desc = "A long-lasting rifle design tracing back to even before the Frontier War. With excellent damage and a high rate of fire, this is a flexible weapon in medium to long range engagements."
SWEP.Trivia_Manufacturer = "Lastimosa Armory"

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-6, -2, 1)
SWEP.CrouchAng = Angle(0, 0, -53)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_g7.mdl"
SWEP.WorldModel = "models/weapons/w_apex_g7.mdl"
SWEP.MirrorVMWM = true
SWEP.MirrorWorldModel = "models/weapons/w_apex_g7.mdl"
SWEP.WorldModelOffset = {
    pos        =    Vector(-4, 4.5, -5),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 36
SWEP.DamageMin = 36
SWEP.Range = 200
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 30000 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [1] = {
        Damage = 42,
        DamageMin = 36,
    },
    [2] = {
        Damage = 30,
        DamageMin = 30,
        BodyDamageMults = {
            [HITGROUP_HEAD] = 2, -- head + chest + chest = lethal (120);
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
        }
    },
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
}

SWEP.Tracer = "arccw_apex_tracer_sniper" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 20
SWEP.MaxRecoilBlowback = 1

-- SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 0.7
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
    }
}

SWEP.AccuracyMOA = 0.5
SWEP.HipDispersion = 450 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 75
SWEP.JumpDispersion = 300

SWEP.Primary.Ammo = "apex_light"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "ArcCW_APEX.G7.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_1"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "tfa_apex_muzzle_sniper"
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellPitch = 65
SWEP.ShellScale = 1.55
SWEP.ShellTime = 1
-- SWEP.ShellRotateAngle = Angle(0, 0, 0)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 15

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}


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

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

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
        Slot = {"apex_sights", "g7"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
        InstalledEles = {"weapon_sights","weapon_dot"},
        CorrectivePos = Vector(1.99, 0, -0.7),
        CorrectiveAng = Angle(0, 0, 3.6),
        ExtraSightDist = -1.5
    },
    {
        PrintName = "Muzzle",
        Slot = "apex_muzzle",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_sniper"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_light1"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_dtap", "apex_hopup_selfire5"},
    },
    {
        PrintName = "Hold Style",
        Slot = {"g7_special"},
        Bone = "def_c_base",
        Offset = {
            vpos = Vector(3.5, -5.5, -7),
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
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
    ["enter_sprint"] = {
        Source = "sprint_in",
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
    ["ready"] = {
        Source = "draw_first",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
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
        ShellEjectAt = 0.1,
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = {"iron_fire", "iron_fire2"},
        ShellEjectAt = 0.1,
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
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.9,
    },
    ["idle_inspect"] = {
        Source = "inspect",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_Start_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_Mid_V1_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_Mid_V1_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_End_V1_2ch_01.wav", t = 316 / 30}
    },
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
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.6,
        SoundTable = {
            {p = 100, s = "weapons/g7/wpn_g2a4_reload_empty_grabmag_fr0_2ch_v1_01.wav", t = 8 / 30},
            {p = 100, s = "weapons/g7/wpn_g2a4_reload_empty_ejectmag_fr18_2ch_v1_01.wav", t = 14 / 30},
            {p = 100, s = "weapons/g7/wpn_g2a4_reload_empty_insertmag_fr34_2ch_v1_01.wav", t = 39 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.6,
        SoundTable = {
            {s = "weapons/g7/wpn_g2a4_reload_empty_grabmag_fr0_2ch_v1_01.wav", t = 0 / 30},
            {s = "weapons/g7/wpn_g2a4_reload_empty_ejectmag_fr18_2ch_v1_01.wav", t = 18 / 30},
            {s = "weapons/g7/wpn_g2a4_reload_empty_insertmag_fr34_2ch_v1_01.wav", t = 34 / 30},
            {s = "weapons/g7/wpn_g2a4_reload_handgrab_fr44_2ch_v1_01.wav", t = 44 / 30},
            {s = "weapons/g7/wpn_g2a4_reload_empty_charge_fr49_2ch_v1_01.wav", t = 49 / 30}
    },
},
}

SWEP.TTTWeaponType = {"weapon_zm_rifle", "weapon_ttt_m16"}
SWEP.TTTWeight = 75