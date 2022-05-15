if CLIENT then
    killicon.Add( "arccw_apex_3030", "VGUI/apex_killicon_3030", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_3030")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "30-30 Repeater"
SWEP.Trivia_Class = "Designated Marksman Rifle"
SWEP.Trivia_Desc = "Semi-auto heavy repeater."
SWEP.Trivia_Manufacturer = "Holdener Arms"

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

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_3030.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-6.5, 5.5, -1.5),
    ang        =    Angle(-20, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.Damage = 42
SWEP.DamageMin = 42
SWEP.Range = 15
SWEP.Penetration = 15
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any
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
    [0] = {
        -- Apex Legends Settings
        Damage = 42,
        DamageMin = 42,
        Penetration = 15,
    },
    [1] = {
        -- Arcwc Settings
        Damage = 48,
        DamageMin = 35,
        Penetration = 15,
    }
}

SWEP.Tracer = "arccw_apex_tracer_ar" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 6

SWEP.PhysBulletMuzzleVelocity = 550

SWEP.Recoil = 0.45
SWEP.RecoilSide = 0.15
SWEP.RecoilRise = 0.75
SWEP.RecoilPunch = 2.5
SWEP.RecoilVMShake = 1.5
SWEP.VisualRecoilMult = 5
SWEP.MaxRecoilBlowback = 2

SWEP.ManualAction = true
SWEP.NoLastCycle = true -- do not cycle on last shot
SWEP.ShotgunReload = true

SWEP.Delay = 60 / 139 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.lever"
    },
    {
        Mode = 0
    }
}

SWEP.AccuracyMOA = 1 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 100
SWEP.SightsDispersion = 0

SWEP.Primary.Ammo = "apex_heavy"

SWEP.ShootVol = 160 -- volume of shoot sound

SWEP.ShootSound = "ArcCW_APEX.3030Repeater.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_5"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""
-- SWEP.FiremodeSound = {"weapons/fx/firemode_1.wav","weapons/fx/firemode_2.wav"}

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

SWEP.MuzzleEffect = "weapon_muzzle_flash_huntingrifle"
SWEP.ShellModel = "models/shells/shelleject_assault_rifle.mdl"
SWEP.ShellScale = 1.2
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 24

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
    Pos = Vector(0, 0, 0),
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
        DefaultAttName = "Iron Sights",
        Slot = {"apex_sights"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        ExtraSightDist = 6,
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
        InstalledEles = {"ref_sight","ref_dot"},
        CorrectivePos = Vector(2.4,0,-0.72),
        CorrectiveAng = Angle(-1.227, 0.298, 5.913)
    },
    {
        PrintName = "Stock",
        Slot = {"apex_sniper_stock"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_heavy2"}
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
            {p = 100, s = "weapons/3030/3030_Reload_Lever.wav", t = 5 / 30},
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
    },
    ["cycle"] = {
        Source = "rechamber",
        MinProgress = 0.35,
        ShellEjectAt = 0.1,
        SoundTable = {
            {p = 100, s = "weapons/3030/3030_Reload_Lever.wav", t = 0 / 30},
        },
    },
    ["enter_sight"] = {
        Source = "iron_in",
        MinProgress = 0.1,
    },
    ["fire_sight"] = {
        Source = "iron_fire",
    },
    ["cycle_sight"] = {
        Source = "iron_rechamber",
        MinProgress = 0.35,
        ShellEjectAt = 0.1,
        SoundTable = {
            {p = 100, s = "weapons/3030/3030_Reload_Lever.wav", t = 0 / 30},
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
    },
    ["2_to_1"] = {
        Source = "firemode2",
    },
    ["sgreload_start"] = {
        Source = "reload_start",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0,
        SoundTable = {
            -- {s = "weapons/mastiff/wpn_mastiff_reload_start_fr6_2ch_v2_01.wav", t = 0 / 30},
        },
    },
    ["sgreload_insert"] = {
        Source = {"reload_loop","reload_loop2","reload_loop3"},
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.3,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
        SoundTable = {
            {s = "ArcCW_APEX.3030Repeater.Reload_Insert", t = 5 / 30},
        },
    },
    ["sgreload_finish"] = {
        Source = "reload_end",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 1,
        SoundTable = {
            {s = "weapons/alternator/wep_alternator_first_pullout_CLOTH_f00_1.wav", t = 0 / 30},
        },
    },
    ["sgreload_start_empty"] = {
        Source = "reload_start_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0,
        SoundTable = {
            {s = "ArcCW_APEX.3030Repeater.Reload_Insert", t = 8 / 30},
        },
    },
    ["sgreload_finish_empty"] = {
        Source = "reload_end_empty",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 1,
        SoundTable = {
            {s = "weapons/alternator/wep_alternator_first_pullout_CLOTH_f00_1.wav", t = 0 / 30},
            {s = "weapons/3030/3030_Reload_Lever.wav", t = 8 / 30}
        },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt1_2ch_v1.wav", t = 5 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt2_2ch_v1.wav", t = 25 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt3_2ch_v1.wav", t = 39 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt4_2ch_v1.wav", t = 55 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt6_2ch_v1.wav", t = 64 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_EnergyCrackle_2ch_v1.wav", t = 10 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt2_2ch_v1.wav", t = 25 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt3_2ch_v1.wav", t = 39 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt4_2ch_v1.wav", t = 55 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt6_2ch_v1.wav", t = 64 / 30},
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt1_2ch_v1.wav", t = 5 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt2_2ch_v1.wav", t = 25 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt3_2ch_v1.wav", t = 39 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt4_2ch_v1.wav", t = 58 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt5_2ch_v1.wav", t = 72 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt6_2ch_v1.wav", t = 87 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_EnergyCrackle_2ch_v1.wav", t = 10 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt2_2ch_v1.wav", t = 25 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt3_2ch_v1.wav", t = 39 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt4_2ch_v1.wav", t = 58 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt5_2ch_v1.wav", t = 72 / 30},
            -- {p = 100, s = "weapons/peacekeeper/Wpn_Peacekeeper_Reload_1p_Pt6_2ch_v1.wav", t = 87 / 30},
    },
},
}

SWEP.Hook_Think = function(wep)
    local charge = wep:GetNWFloat("ApexCharge", 0)
    if wep:GetBuff_Override("ApexCharge") and wep:GetNextPrimaryFire() < CurTime() and wep:GetNWState() == ArcCW.STATE_SIGHTS and wep:Clip1() > 1 then
        wep:SetNWFloat("ApexCharge", math.min(1, charge + FrameTime() / 1))
        if SERVER then
            local f = wep:GetNWFloat("ApexCharge", 0)
            if f >= 0.33 and charge < 0.33 then
                wep:EmitSound("weapons/3030/3030_Charge_Spin_Whine_Loop_1ch_v1_01.wav")
            elseif f > 0 and charge == 0 then
                wep:EmitSound("weapons/3030/3030_Charge_Spin_Whine_Start_1ch_v2_01.wav")
            end
        end
    elseif charge > 0 then
        wep:SetNWFloat("ApexCharge", 0)
        wep:EmitSound("weapons/3030/3030_Charge_Spin_Whine_Stop_1ch_v1_01.wav")
    end
	
	if charge > 0 and charge <= 0.999 then
		wep.ShootSound = "ArcCW_APEX.3030Repeater.Fire_Semi_Charged"
	elseif charge >= 1 then
		wep.Damage = 57
		wep.DamageMin = 57
		wep.ShootSound = "ArcCW_APEX.3030Repeater.Fire_Charged"
	else
		wep.Damage = 42
		wep.DamageMin = 42
		wep.ShootSound = "ArcCW_APEX.3030Repeater.Fire"
	end
end

SWEP.Hook_PostFireBullets = function(wep)
    wep:SetNWFloat("ApexCharge", 0)
end