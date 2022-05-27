if CLIENT then
    killicon.Add( "arccw_apex_r301", "VGUI/apex_killicon_r301", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_r301")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "R-301 Carbine"
SWEP.Trivia_Class = "Assault Rifle"
SWEP.Trivia_Desc = "The current generation of a line of rifles widely used in the Frontier War. Highly accurate with decent stopping power."
SWEP.Trivia_Manufacturer = "Lastimosa Armory"

SWEP.Slot = 2

SWEP.CrouchPos = Vector(-5, -1, 1.5)
SWEP.CrouchAng = Angle(1.037, 0.623, -53.174)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -1, 1.5)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -1)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.CustomizePos = Vector(0, -1, 1.5)
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_r301.mdl"
SWEP.WorldModel = "models/weapons/w_apex_r301.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(13, 1, 2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 14
SWEP.DamageMin = 14
SWEP.Range = 10
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 29000 * ArcCW.HUToM

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.75,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
}

SWEP.Apex_Balance = {
    [1] = {
        Damage = 25,
        DamageMin = 19,
    },
    [2] = {
        Damage = 11,
        DamageMin = 11,
    },
}

SWEP.PhysTracerProfile = "apex_bullet"
SWEP.Tracer = "arccw_apex_tracer_ar"
SWEP.TracerNum = 1 -- tracer every X
-- SWEP.TracerWidth = 3

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 17
SWEP.MaxRecoilBlowback = 1

SWEP.Recoil = 0.3
SWEP.RecoilSide = 0.1
SWEP.RecoilRise = 0.4
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1

SWEP.Delay = 60 / 810 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.

SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    }
}

SWEP.AccuracyMOA = 2
SWEP.HipDispersion = 350
SWEP.MoveDispersion = 100
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.45

SWEP.Primary.Ammo = "apex_light"

SWEP.ShootVol = 120 -- volume of shoot sound

SWEP.FirstShootSound = "ArcCW_APEX.R301.Fire_Start"
SWEP.ShootSound = "ArcCW_APEX.R301.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_3"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.Hook_GetShootSound = function(wep, fsound)
    if wep:GetCurrentFiremode().Mode == 1 and fsound == wep.FirstShootSound then return "ArcCW_APEX.R301.Fire_Alt" elseif fsound == wep.FirstShootSound then return "ArcCW_APEX.R301.Fire_Start" end
end

SWEP.MuzzleEffect = "tfa_apex_muzzle_ar"
SWEP.MuzzleFlashColor = Color(255, 255, 55)
SWEP.ShellModel = "models/shells/shelleject_large_rifle.mdl"
SWEP.ShellPitch = 95
SWEP.ShellScale = 0.5
SWEP.ShellTime = 1
-- SWEP.ShellRotateAngle = Angle(0, 0, 90)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.BarrelLength = 12

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}


SWEP.IronSightStruct = {
    Pos = Vector(0, 0, 0),
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

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

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
        Slot = {"r301"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(4.8, 1.0, -5.45),
            wang = Angle(-10, 0, 180)
        },
        InstalledEles = {"r301_sight", "r301_sight2"},
         CorrectivePos = Vector(1.57,0,-0.5),
         CorrectiveAng = Angle(-0.846, 0, 5.955)
    },
    {
        PrintName = "Muzzle",
        Slot = "apex_muzzle",
        Bone = "def_c_suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(26.62, 1.0, -7.5),
            wang = Angle(-10, 0, 180)
        },
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_standard", "apex_stock_precision"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_light3"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_anvil"},
    },
    {
        PrintName = "Foregrip",
        Slot = {"apex_fg"},
        Bone = "def_c_base",
        Offset = {
            vpos = Vector(0, -1.75, 16.7),
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
        LHIK = true,
        LHIKOut = 0.6,
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
        Source = "inspect_in",
        LHIK = true,
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        LHIK = true,
        LHIKOut = 0.6,
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_End_V2_2ch_01.wav", t = 0 / 30},
    },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        LHIK = true,
        LHIKOut = 0.6,
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Start_V2_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Mid_V2_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_Mid_V2_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_SMG_End_V2_2ch_01.wav", t = 316 / 30}
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
        LHIKOut = 0.9,
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
        LHIK = true,
        LHIKOut = 0.6,
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

SWEP.TTTWeaponType = "weapon_ttt_m16"
SWEP.TTTWeight = 100