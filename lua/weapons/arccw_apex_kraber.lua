--Curretly buggy

if CLIENT then
    killicon.Add( "arccw_apex_kraber", "VGUI/apex_killicon_kraber", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_kraber")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Kraber .50-Cal Sniper"
SWEP.Trivia_Class = "Sniper Rifle"
SWEP.Trivia_Desc = "Powerful bolt-action sniper rifle."
SWEP.Trivia_Manufacturer = "Lastimosa Armory"

SWEP.Slot = 4

SWEP.Sway = 0.1

SWEP.CrouchPos = Vector(-9.5, -5, 0.5)
SWEP.CrouchAng = Angle(0, 0, -53.128)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_crossbow"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_kraber.mdl"
SWEP.WorldModel = "models/weapons/c_apex_kraber.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos        =    Vector(-10, 8, -5.5),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 145
SWEP.DamageMin = 145
SWEP.Range = 15
SWEP.Penetration = 40
SWEP.PhysBulletMuzzleVelocity = 29500 * ArcCW.HUToM

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 3,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
}

SWEP.Tracer = "arccw_apex_tracer_sniper" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ChamberSize = 0 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 4
SWEP.MaxRecoilBlowback = 1

SWEP.PhysBulletMuzzleVelocity = 750

SWEP.Recoil = 3.300
SWEP.RecoilSide = 0.550
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1
SWEP.VisualRecoilMult = 0.2

SWEP.ManualAction = true
SWEP.NoLastCycle = true -- do not cycle on last shot

SWEP.Delay = 60 / 60
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.bolt"
    }
}

SWEP.AccuracyMOA = 0.1
SWEP.HipDispersion = 1000
SWEP.MoveDispersion = 100
SWEP.JumpDispersion = 500

SWEP.SightedSpeedMult = 0.35

SWEP.Primary.Ammo = "apex_sniper"

SWEP.ShootVol = 180 -- volume of shoot sound

SWEP.ShootSound = "weapons/kraber/wpn_kraber_fire_1p.wav"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_4"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "tfa_apex_muzzle_sniper"
SWEP.ShellModel = "models/shells/shelleject_large_rifle.mdl"
SWEP.ShellPitch = 55
SWEP.ShellScale = 1.2
SWEP.ShellTime = 1
SWEP.ShellRotateAngle = Angle(0, 0, 0)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.BarrelLength = 24

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}


SWEP.SightedSpeedMult = 0.5
SWEP.IronSightStruct = {
    Pos = Vector(0, 10, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
    CrosshairInSights = true,
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.AttachmentElements = {
    ["ref_sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["ref_dot"] = {
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
        DefaultAttName = "None",
        Slot = {"kraber"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(7, 0.6, -8.15),
            wang = Angle(-9, 0, 185)
        },
        Installed = "apex_scope_1_kraber",
        CorrectivePos = Vector(3.65, 0, 0.1),
        CorrectiveAng = Angle(0, 0, 2.337)
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_sniper", "apex_stock_combat"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_shatter3"}
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
    ["idle_sprint"] = {Source = "sprint", Mult = 1},
    ["enter_sprint"] = {
        Source = "sprint_in",
        MinProgress = 0.1,
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
        MinProgress = 0.1,
    },
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {p = 100, s = "weapons/kraber/mech_kraber_ads_in_2ch_v1_01.wav", t = 0 / 30},
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_boltback_2ch_v1_01.wav", t = 18 / 30},
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_boltforward_2ch_v1_01.wav", t = 27 / 30}
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1,
        SoundTable = {
            {p = 100, s = "weapons/kraber/mech_kraber_ads_in_2ch_v1_02.wav", t = 0 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        Mult = 1,
        SoundTable = {
            {p = 100, s = "weapons/kraber/mech_kraber_ads_in_2ch_v1_03.wav", t = 0 / 30},
        },
    },
    ["idle_sight"] = {
        Source = "iron_idle",
    },
    ["fire"] = {
        Source = "fire",
        -- Time = 9 / 10,
        MinProgress = 0.8,
    },
    ["cycle"] = {
        Source = "rechamber",
        ShellEjectAt = 0.5,
        -- Time = 63 / 40,
        MinProgress = 1.5,
        SoundTable = {
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_boltback_2ch_v1_01.wav", t = 15 / 30},
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_boltforward_2ch_v1_01.wav", t = 24 / 30}
        },
    },
    ["enter_sight"] = {
        Source = "iron_in",
        MinProgress = 0.1,
    },
    ["fire_sight"] = {
        Source = "iron_fire",
        -- Time = 9 / 10,
        MinProgress = 0.8,
    },
    ["cycle_sight"] = {
        Source = "iron_rechamber",
        ShellEjectAt = 0.5,
        -- Time = 63 / 40,
        MinProgress = 1.5,
        SoundTable = {
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_boltback_2ch_v1_01.wav", t = 16 / 30},
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_boltforward_2ch_v1_01.wav", t = 22 / 30}
        },
    },
    ["exit_sight"] = {
        Source = "iron_out",
        MinProgress = 0.1,
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
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_Start_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_Mid_V1_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_Mid_V1_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_End_V1_2ch_01.wav", t = 316 / 30}
    },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_magout_2ch_v1_01.wav", t = 15 / 30},
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_magin_2ch_v1_01.wav", t = 53 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_magout_2ch_v1_01.wav", t = 15 / 30},
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_magin_2ch_v1_01.wav", t = 53 / 30},
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_boltback_2ch_v1_01.wav", t = 83 / 30},
            {p = 100, s = "weapons/kraber/wpn_krabersniper_1p_reload_boltforward_2ch_v1_01.wav", t = 96 / 30}
    },
},
}

if engine.ActiveGamemode() == "terrortown" then
    SWEP.AutoSpawnable = false
    SWEP.Primary.Ammo = "none"
    SWEP.ForceDefaultClip = 0
    SWEP.CanBuy = {1, 2} --{ROLE_TRAITOR, ROLE_DETECTIVE}
    SWEP.Kind = 7 -- WEAPON_EQUIP2
    SWEP.EquipMenuData = {
        type = "Weapon",
        desc = "Powerful sniper rifle with 4 shots.\n\nComes with scope, stock, and Shatter Caps attachments."
    }
    SWEP.Attachments[1].Installed = "apex_scope_3_kraber"
    SWEP.Attachments[2].Installed = "apex_stock_sniper_3"
    SWEP.Attachments[3].Installed = "apex_hopup_shatter3"
end