if CLIENT then
    killicon.Add( "arccw_apex_tripletake", "VGUI/apex_killicon_tripletake", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_tripletake")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Triple Take"
SWEP.Trivia_Class = "Designated Marksman Rifle"
SWEP.Trivia_Desc = "Energy rifle with three barrels firing in a horizontal line. In the past, it is confusingly named the \"Double Take\", despite also firing 3 rounds."
SWEP.Trivia_Manufacturer = "Burrell Defense"

SWEP.SpawnmenuType = "Marksman"

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-6.5, -3, 2)
SWEP.CrouchAng = Angle(1.043, 0.623, -53)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_tripletake.mdl"
SWEP.WorldModel = "models/weapons/w_apex_tripletake.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(13, 1, 2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 21
SWEP.DamageMin = 21
SWEP.Range = 200
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 32000 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [1] = {
        Damage = 25,
        DamageMin = 20,
    },
    [2] = {
        Damage = 15, -- Very strong with a 2-shot so knocked it down a peg (3-shot kill now)
        DamageMin = 15
    },
}
SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 2.15,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
}

SWEP.Tracer = "arccw_apex_tracer_energy_sniper" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerCol = Color(25, 125, 255)
SWEP.TracerWidth = 10
SWEP.PhysTracerProfile = "apex_bullet_energy"

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 18
SWEP.MaxRecoilBlowback = 1

SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 1
SWEP.RecoilSide = 0.5
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1
SWEP.VisualRecoilMult = 1
SWEP.RecoilPunchBackMaxSights = 1

SWEP.Delay = 60 / 72 -- 60 / RPM.
SWEP.Num = 3 -- number of shots per trigger pull.
-- Just 3 happy bullets side-by-side
SWEP.ShotgunSpreadPattern = {
    [1] = Angle(0, -0.5, 0),
    [2] = Angle(0, 0, 0),
    [3] = Angle(0, 0.5, 0),
}
SWEP.Hook_ShotgunSpreadOffset = function(wep, data)
    local p = wep.ShotgunSpreadPattern[data.num]
    if not p then return end

    local d = Lerp(wep:GetSightDelta(), 0.75, 1)
    local chg = wep:GetNWFloat("ApexCharge", 0)
    if chg >= 1 then
        d = d * 0.15
    elseif chg >= 0.67 then
        d = d * 0.35
    elseif chg >= 0.33 then
        d = d * 0.65
    end
    data.ang = Angle(p.p * d, p.y * d, 0)

    return data
end
SWEP.NoRandSpread = true

SWEP.Firemodes = {
    {
        Mode = 1,
    }
}

SWEP.AccuracyMOA = 1
SWEP.HipDispersion = 400
SWEP.MoveDispersion = 75
SWEP.JumpDispersion = 300

SWEP.SightedSpeedMult = 0.5

SWEP.Primary.Ammo = "apex_energy"
SWEP.AmmoPerShot = 3

SWEP.ShootVol = 160 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "ArcCW_APEX.Triple_Take.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_3"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""
SWEP.FiremodeSound = {"weapons/fx/firemode_1.wav","weapons/fx/firemode_2.wav"}

local s = "weapons/wpn_lowammo_rifle01.wav"
local p = {
    [2] = 80,
    [1] = 90,
    [0] = 100,
}
SWEP.Hook_AddShootSound = function(wep, data)
    local pitch = p[wep:Clip1()]
    if pitch then
        wep:MyEmitSound(s, 70, pitch, 0.5, CHAN_AUTO)
    end
end

SWEP.MuzzleEffect = "tfa_apex_energy_muzzle_ttake"
SWEP.MuzzleFlashColor = Color(39, 90, 255)
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellPitch = 85
SWEP.ShellScale = 1.55
SWEP.ShellTime = 1
-- SWEP.ShellRotateAngle = Angle(0, 0, 0)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.BarrelLength = 15

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}


SWEP.IronSightStruct = {
    Pos = Vector(0, -5, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.15,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW

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
        Slot = {"apex_sights", "triple"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(7.8, 1.0, -6.30),
            wang = Angle(-8, 0, 180)
        },
        InstalledEles = {"weapon_sights","weapon_dot"},
        ExtraSightDist = -2,
        CorrectivePos = Vector(1.7,0,-0.43),
        CorrectiveAng = Angle(-2.165, -1.132, 2.418),
        RandomChance = 2,
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_sniper", "apex_stock_combat"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_energy3"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_choke2", "apex_hopup_selfire7", "apex_hopup_kinetic"}
    },
    {
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
    },
    {
        PrintName = "Charm",
        Slot = "charm",
        FreeSlot = true,
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.85,1.5,-6), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(5.2, 2.3, -4.5),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(0.3, 0.3, 0.3),
		WMScale = Vector(0.3, 0.3, 0.3),
    },
    {
        PrintName = "Stats",
        Slot = {"killcounter2","killcounter"},
        FreeSlot = true,
        Bone = "def_c_base", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1.1, -4, 13), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(14, 2, -6),
            wang = Angle(-10, 0, 180)
        },
		VMScale = Vector(1, 1, 1),
		WMScale = Vector(1, 1, 1),
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
            {p = 100, s = "weapons/tripletake/Wpn_Doubletake_FirstPullout_01.ogg", t = 1 / 35},
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
    },
    ["enter_sight"] = {
        Source = "iron_in",
        MinProgress = 0.1,
    },
    ["fire_sight"] = {
        Source = "iron_fire",
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
        SoundTable = {
            {s = "ArcCW_APEX.Melee.Swing.Punch", t = 0 / 30},
    },
    },
    ["enter_inspect"] = {
        Source = "inspect_in",
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_End_V1_2ch_01.wav", t = 0 / 30}
    },
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
            {p = 100, s = "weapons/tripletake/Wpn_DoubleTake_Reload_Foley_LftArm_fr02_2ch_v1_01.ogg", t = 2 / 30},
            {p = 100, s = "weapons/tripletake/Wpn_DoubleTake_Reload_Foley_LftArmMagOut_fr18_2ch_v1_01.ogg", t = 18 / 30},
            {p = 100, s = "weapons/tripletake/Wpn_DoubleTake_Reload_Foley_LftArmMagIn_fr45_2ch_v2_01.ogg", t = 45 / 30},
            {p = 100, s = "weapons/tripletake/Wpn_DoubleTake_Reload_Foley_WpnSettle_fr64_2ch_v2_01.ogg", t = 64 / 30},

            {p = 100, s = "weapons/tripletake/Wpn_DoubleTake_Reload_MechGunRattle_fr01_2ch_v2_01.ogg", t = 1 / 30},
            {p = 100, s = "weapons/tripletake/Wpn_DoubleTake_Reload_MechMagRelease_fr18_2ch_v1_01.ogg", t = 18 / 30},
            {p = 100, s = "weapons/tripletake/Wpn_DoubleTake_Reload_MechMagIn_fr42_2ch_v1_01.ogg", t = 42 / 30},
            {p = 100, s = "weapons/tripletake/Wpn_DoubleTake_Reload_MechGunRattle_fr62_2ch_v2_01.ogg", t = 62 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "weapons/tripletake/Wpn_DoubleTake_Reload_Empty_Foley_LftArmGrabMag_fr04_2ch_v1_01.ogg", t = 4 / 30},
            {s = "weapons/tripletake/Wpn_DoubleTake_Reload_Empty_Foley_LftArmMagOut_fr29_2ch_v2_01.ogg", t = 29 / 30},
            {s = "weapons/tripletake/Wpn_DoubleTake_Reload_Empty_Foley_LftArmPullBolt_fr60_2ch_v2_01.ogg", t = 60 / 30},
            {s = "weapons/tripletake/Wpn_DoubleTake_Reload_Empty_Foley_LftArmGrabGun_fr90_2ch_v2_01.ogg", t = 90 / 30},

            {s = "weapons/tripletake/Wpn_DoubleTake_Reload_Empty_Mech_GunRattle_fr04_2ch_v2_01.ogg", t = 4 / 30},
            {s = "weapons/tripletake/Wpn_DoubleTake_Reload_Empty_Mech_MagHitEject_fr19_2ch_v1_01.ogg", t = 19 / 30},
            {s = "weapons/tripletake/Wpn_DoubleTake_Reload_Empty_Mech_MagInsert_fr46_2ch_v2_01.ogg", t = 46 / 30},
            {s = "weapons/tripletake/Wpn_DoubleTake_Reload_Empty_Mech_GunRattle_fr56_2ch_v1_01.ogg", t = 56 / 30},
            {s = "weapons/tripletake/Wpn_DoubleTake_Reload_Empty_Mech_AccuateBolt_fr77_2ch_v2_01.ogg", t = 77 / 30},
            {s = "weapons/tripletake/Wpn_DoubleTake_Reload_Empty_Mech_GunRattle_fr79_2ch_v2_01.ogg", t = 79 / 30}
    },
},
}

SWEP.Hook_Think = function(wep)
    local charge = wep:GetNWFloat("ApexCharge", 0)
    if wep:GetBuff_Override("ApexCharge") and wep:GetNextPrimaryFire() < CurTime() and wep:GetNWState() == ArcCW.STATE_SIGHTS and wep:Clip1() >= 1 then
        wep:SetNWFloat("ApexCharge", math.min(1, charge + FrameTime() / 1))
        if (game.SinglePlayer() and SERVER) or (not game.SinglePlayer() and CLIENT) then
            local f = wep:GetNWFloat("ApexCharge", 0)
            if f >= 1 and charge < 1 then
                wep:EmitSound("ArcCW_APEX.TripleTake.Level_Tick_3")
            elseif f >= 0.67 and charge < 0.67 then
                wep:EmitSound("ArcCW_APEX.TripleTake.Level_Tick_2")
            elseif f >= 0.33 and charge < 0.33 then
                wep:EmitSound("ArcCW_APEX.TripleTake.Level_Tick_1")
            elseif f > 0 and charge == 0 then
                wep:EmitSound("ArcCW_APEX.TripleTake.ChargeStart")
            end
        end
    elseif wep:GetBuff_Override("ApexCharge") and charge > 0 then
        wep:SetNWFloat("ApexCharge", 0)
        wep:EmitSound("ArcCW_APEX.TripleTake.ChargeEnd")
    end
end

SWEP.Hook_PostFireBullets = function(wep)
    wep:SetNWFloat("ApexCharge", 0)
end

SWEP.TTTWeaponType = "weapon_zm_rifle"
SWEP.TTTWeight = 100