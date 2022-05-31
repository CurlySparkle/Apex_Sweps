if CLIENT then
    killicon.Add( "arccw_apex_peacekeeper", "VGUI/apex_killicon_peacekeeper", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_peacekeeper")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Peacekeeper"
SWEP.Trivia_Class = "Shotgun"
SWEP.Trivia_Desc = "Lever action shotgun that uses a battery pack instead of ballistic munitions.\n\nFires 11 pellets in a star pattern, tightened when aiming."
SWEP.Trivia_Manufacturer = "Paradinha Arsenal"

SWEP.Slot = 3

SWEP.Sway = 0.25

SWEP.ViewModelFOV = 70

SWEP.CrouchPos = Vector(-4, -2, -0)
SWEP.CrouchAng = Angle(0.863, 1.062, -21.854)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_shotgun"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_peacekeeper.mdl"
SWEP.WorldModel = "models/weapons/w_apex_peacekeeper.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos = Vector(14, 1, 1.5),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.Damage = 9
SWEP.DamageMin = 9
SWEP.Range = 15
SWEP.Penetration = 5
SWEP.DamageType = DMG_BUCKSHOT
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.PhysBulletMuzzleVelocity = 16000 * ArcCW.HUToM

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.25,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.8,
    [HITGROUP_RIGHTLEG] = 0.8,
}

SWEP.Apex_Balance = {
    [1] = {
        Damage = 15,
        DamageMin = 9,
    },
    [2] = {
        Damage = 7, -- marginally less damage than TTT shotgun (tighter spread)
        DamageMin = 7,
    },
}

SWEP.Tracer = "arccw_apex_tracer_energy_sg" -- override tracer (hitscan) effect
SWEP.TracerNum = 1
SWEP.TracerWidth = 1
SWEP.PhysTracerProfile = "apex_bullet_energy"

SWEP.ChamberSize = 0 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 5
SWEP.MaxRecoilBlowback = 1.5

SWEP.PhysBulletMuzzleVelocity = 550

SWEP.Recoil = 2.5
SWEP.RecoilSide = 0.550
SWEP.RecoilRise = 0.2
SWEP.RecoilPunch = 3
SWEP.RecoilVMShake = 3
SWEP.VisualRecoilMult = 1

SWEP.ManualAction = true
SWEP.NoLastCycle = true -- do not cycle on last shot

SWEP.Delay = 60 / 55 -- 60 / RPM.
SWEP.Num = 11 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.lever"
    }
}

SWEP.ShotgunSpreadPattern = {
    [1] = Angle(1, 0, 0),
    [2] = Angle(2, 0, 0),

    [3] = Angle(0.5, 0.866, 0), -- cos(60), sin(60)
    [4] = Angle(1, 1.732, 0),

    [5] = Angle(0.5, -0.866, 0), -- cos(300), sin(300)
    [6] = Angle(1, -1.732, 0),

    [7] = Angle(-0.766, 0.643, 0), -- cos(140), sin(140)
    [8] = Angle(-1.532, 1.287, 0),

    [9] = Angle(-0.766, -0.643, 0), -- cos(220), sin(220)
    [10] = Angle(-1.532, -1.287, 0),

    [11] = Angle(0, 0, 0),
}
SWEP.Hook_ShotgunSpreadOffset = function(wep, data)
    local d = 1
    local chg = wep:GetNWFloat("ApexCharge", 0)
    if chg >= 1 then
        d = d * 0.35
    elseif chg >= 0.67 then
        d = d * 0.65
    elseif chg >= 0.33 then
        d = d * 0.85
    end
    local p = wep.ShotgunSpreadPattern[data.num]
    data.ang = Angle(p.p * -d, p.y * d,0)

    return data
end
SWEP.NoRandSpread = true

SWEP.AccuracyMOA = 0
SWEP.HipDispersion = 150
SWEP.MoveDispersion = 50
SWEP.JumpDispersion = 150

SWEP.SightedSpeedMult = 0.75

SWEP.Primary.Ammo = "apex_shotgun"

SWEP.ShootVol = 160 -- volume of shoot sound

SWEP.ShootSound = "ArcCW_APEX.Peacekeeper.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Shotgun_Dry_A"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""
SWEP.FiremodeSound = {"weapons/fx/firemode_1.wav","weapons/fx/firemode_2.wav"}

local s = "weapons/wpn_lowammo_shotgun1.wav"
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

SWEP.MuzzleEffect = "tfa_apex_energy_muzzle_shotgun"

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.BarrelLength = 24

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}


SWEP.IronSightStruct = {
    Pos = Vector(0, 0, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "shotgun"
SWEP.HoldtypeSights = "ar2"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

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
    ["charged_skin"] = {
        VMSkin = 2,
        WMSkin = 2,
    },
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
    ["skin_charged"] = {
        VMSkin = 3,
        WMSkin = 3,
    },
}

SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"apex_sights"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(13, 1.0, -7.65),
            wang = Angle(-8.85, 0, 180)
        },
        InstalledEles = {"ref_sight","ref_dot"},
        ExtraSightDist = 5,
        CorrectivePos = Vector(2.4,0,-0.47),
        CorrectiveAng = Angle(-1.485, -1.705, 5.868)
    },
    {
        PrintName = "Shotgun Bolt",
        Slot = {"apex_sg"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_choke", "apex_hopup_kinetic2"}
    },
    {
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
    },
}

SWEP.Hook_Think = ArcCW.Apex.BlendSights

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.8},
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
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_LeverOut_2ch_v1_01.wav", t = 7 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_LeverIn_2ch_v2_01.wav", t = 16 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt5_2ch_v1.wav", t = 1 / 30},
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
        Source = "fire",
        -- Time = 9 / 10,
        MinProgress = 0.4,
    },
    ["cycle"] = {
        Source = "rechamber",
        MinProgress = 0.875,
        SoundTable = {
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_LeverOut_2ch_v1_01.wav", t = 7 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_LeverIn_2ch_v2_01.wav", t = 16 / 30},
        },
    },
    ["enter_sight"] = {
        Source = "iron_in",
        MinProgress = 0.1,
    },
    ["fire_sight"] = {
        Source = "fire",
        -- Time = 9 / 10,
        MinProgress = 0.4,
    },
    ["cycle_sight"] = {
        Source = "rechamber",
        MinProgress = 0.875,
        SoundTable = {
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_LeverOut_2ch_v1_02.wav", t = 3 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_LeverIn_2ch_v2_02.wav", t = 15 / 30},
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
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Shotgun_End_V1_2ch_01.wav", t = 0 / 30},
    },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Shotgun_Start_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Shotgun_Mid_V1_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Shotgun_Mid_V1_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Shotgun_End_V1_2ch_01.wav", t = 316 / 30}
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
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt1_2ch_v1.wav", t = 5 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_EnergyCrackle_2ch_v1.wav", t = 10 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt2_2ch_v1.wav", t = 25 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt3_2ch_v1.wav", t = 39 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt4_2ch_v1.wav", t = 55 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt6_2ch_v1.wav", t = 64 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt1_2ch_v1.wav", t = 5 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_EnergyCrackle_2ch_v1.wav", t = 10 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt2_2ch_v1.wav", t = 25 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt3_2ch_v1.wav", t = 39 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt4_2ch_v1.wav", t = 58 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt5_2ch_v1.wav", t = 72 / 30},
            {v = 25, p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt6_2ch_v1.wav", t = 87 / 30}
    },
},
}

SWEP.Hook_Think = function(wep)

    local vm = wep:GetOwner():GetViewModel()
    local delta = wep:GetSightDelta()
    local coolilove = math.cos(delta * (math.pi / 2))
    vm:SetPoseParameter( "sights", Lerp(coolilove, 0, 1) ) -- thanks fesiug

    local charge = wep:GetNWFloat("ApexCharge", 0)
    if wep:GetBuff_Override("ApexCharge") and wep:GetNextPrimaryFire() < CurTime() and wep:GetNWState() == ArcCW.STATE_SIGHTS and wep:Clip1() >= 1 then
        wep:SetNWFloat("ApexCharge", math.min(1, charge + FrameTime() / 1))
        if (game.SinglePlayer() and SERVER) or (not game.SinglePlayer() and CLIENT) then
            local f = wep:GetNWFloat("ApexCharge", 0)
            if f >= 1 and charge < 1 then
                wep:EmitSound("ArcCW_APEX.Peacekeeper.Level_Tick_3")
            elseif f >= 0.67 and charge < 0.67 then
                wep:EmitSound("ArcCW_APEX.Peacekeeper.Level_Tick_2")
            elseif f >= 0.33 and charge < 0.33 then
                wep:EmitSound("ArcCW_APEX.Peacekeeper.Level_Tick_1")
            elseif f > 0 and charge == 0 then
                wep:EmitSound("ArcCW_APEX.Peacekeeper.ChargeStart")
            end
        end
    elseif wep:GetBuff_Override("ApexCharge") and charge > 0 then
        wep:SetNWFloat("ApexCharge", 0)
        wep:EmitSound("ArcCW_APEX.Peacekeeper.ChargeEnd")
    end
end

SWEP.Hook_PostFireBullets = function(wep)
    wep:SetNWFloat("ApexCharge", 0)
end

SWEP.TTTWeaponType = "weapon_zm_shotgun"
SWEP.TTTWeight = 75