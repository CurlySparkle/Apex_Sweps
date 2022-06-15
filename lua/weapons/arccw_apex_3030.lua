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
SWEP.Trivia_Desc = "An old-school design made modern, this rifle has no external magazine, and uses a lever under the grip to cycle. A fitting weapon for the Frontier.\nAiming down sights revs up the battery mechanism, increasing damage for the next round."
SWEP.Trivia_Manufacturer = "Holdener Arms"

SWEP.SpawnmenuType = "Marksman"

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
SWEP.WorldModel = "models/weapons/w_apex_3030.mdl"
-- SWEP.MirrorVMWM = false
-- -- SWEP.WorldModelOffset = {
    -- -- pos        =    Vector(-6.5, 5, -1.5),
    -- -- ang        =    Angle(-20, 0, 180),
    -- -- bone    =    "ValveBiped.Bip01_R_Hand",
    -- -- scale   =   1,
-- -- }
-- SWEP.WorldModelOffset = {
    -- pos        =    Vector(15, 0.5, -3),
    -- ang        =    Angle(-20, 180, 180),
    -- bone    =    "ValveBiped.Bip01_R_Hand",
    -- scale   =   1,
-- }

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
    [1] = {
        Damage = 48,
        DamageMin = 35,
    },
    [2] = {
        Damage = 30, -- 3 shot kill (remember damage gets charged up to +36%)
        DamageMin = 30,
        BodyDamageMults = {
            [HITGROUP_HEAD] = 2.15, -- Head + chest = lethal (104dmg)
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
        }
    },
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
        ApexCharge = true,
        PrintName = "fcg.lever"
    }}

SWEP.AccuracyMOA = 1 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 100
SWEP.JumpDispersion = 500

SWEP.SightedSpeedMult = 0.5

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

SWEP.MuzzleEffect = "tfa_apex_muzzle_dmr"
SWEP.ShellModel = "models/shells/shelleject_repeater3030.mdl"
SWEP.ShellScale = 1.5
SWEP.ShellTime = 1

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

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
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.AttachmentElements = {
    ["weapon_sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["ref_sight_mount"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
    ["weapon_dot"] = {
        VMBodygroups = {
            {ind = 3, bg = 1},
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
        Slot = {"apex_sights","3030"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        ExtraSightDist = 6,
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(6, 0.4, -5.2),
            wang = Angle(-13, 0, 180)
        },
        InstalledEles = {"weapon_sight", "ref_sight_mount", "weapon_dot"},
        CorrectivePos = Vector(2.4,0,-0.72),
        CorrectiveAng = Angle(-1.227, 0.298, 5.913),
        RandomChance = 2,
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_sniper2", "apex_stock_combat"}
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_heavy2"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_shatter", "apex_hopup_dshell"}
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
            vpos = Vector(0.8, 1.4, -0.7), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -85),
            wpos = Vector(7, 1.2, -4),
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
            vpos = Vector(1, -3.75, 17), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -55),
            wpos = Vector(18.5, 1.5, -6.7),
            wang = Angle(-10, 0, 215)
        },
		VMScale = Vector(1, 1, 1),
		WMScale = Vector(1, 1, 1),
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
        RareSource = "draw_first_secret",
        RareSourceChance = 50,
        SoundTable = {
            {s = "weapons/3030/weapon_3030_equip.wav", t = 0 / 30},
			{s = "weapons/3030/weapon_3030_firstdraw_lever_out.wav", t = 5 / 30},
			{s = "weapons/3030/weapon_3030_firstdraw_lever_in.wav", t = 13 / 30},
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
        Source = "fire",
    },
    ["cycle_sight"] = {
        Source = "rechamber",
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
    ["sgreload_start"] = {
        Source = "reload_start",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0,
        SoundTable = {
            {s = "weapons/3030/weapon_3030_reload_begin.wav", t = 0 / 30},
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
            {s = "weapons/3030/weapon_3030_reload_complete.wav", t = 0 / 30},
        },
    },
    ["sgreload_start_empty"] = {
        Source = "reload_start_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0,
        SoundTable = {
		    {s = "weapons/3030/weapon_3030_reload_begin.wav", t = 0 / 30},
            {s = "ArcCW_APEX.3030Repeater.Reload_Insert", t = 8 / 30},
        },
    },
    ["sgreload_finish_empty"] = {
        Source = "reload_end_empty",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 1,
        SoundTable = {
            {s = "weapons/3030/weapon_3030_reload_complete.wav", t = 0 / 30},
            {s = "weapons/3030/3030_Reload_Lever.wav", t = 8 / 30}
        },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
        },
    },
}

SWEP.Hook_Think = function(wep)
    local charge = wep:GetNWFloat("ApexCharge", 0)
    if wep:GetBuff_Override("ApexCharge") and  wep:GetNextPrimaryFire() < CurTime() and wep:GetNWState() == ArcCW.STATE_SIGHTS and wep:Clip1() > 0 then
        wep:SetNWFloat("ApexCharge", math.min(1, charge + FrameTime() / 0.35))
        if (game.SinglePlayer() and SERVER) or (not game.SinglePlayer() and CLIENT) then
            local f = wep:GetNWFloat("ApexCharge", 0)
            if f >= 1 and charge < 1 then
                if wep.ApexLoopSound then
                    wep.ApexLoopSound:Stop()
                    wep.ApexLoopSound = nil
                end
                wep.ApexLoopSound = CreateSound(wep, "ArcCW_APEX.3030.ChargeLoop_2")
                wep.ApexLoopSound:Play()
            elseif f > 0 and charge == 0 then
                wep:EmitSound("ArcCW_APEX.3030.ChargeStart")
            end
        end
    elseif charge > 0 then
        wep:SetNWFloat("ApexCharge", 0)
        wep:EmitSound("ArcCW_APEX.3030.ChargeEnd")
        if wep.ApexLoopSound then
            wep.ApexLoopSound:Stop()
            wep.ApexLoopSound = nil
        end
    end
    local vm = wep:GetOwner():GetViewModel()
    local delta = wep:GetSightDelta()
    local coolilove = math.cos(delta * (math.pi / 2))
    vm:SetPoseParameter( "sights", Lerp(coolilove, 0, 1) ) -- thanks fesiug
end

SWEP.M_Hook_Mult_Damage = function(wep, data)
    data.mult = data.mult * Lerp(wep:GetNWFloat("ApexCharge", 0), 1, 1.36)
end
SWEP.M_Hook_Mult_DamageMin = function(wep, data)
    data.mult = data.mult * Lerp(wep:GetNWFloat("ApexCharge", 0), 1, 1.36)
end

SWEP.O_Hook_Override_Num = function(wep,data)
    if wep:GetCurrentFiremode().PrintName == "fcg.apex.shatter" and wep:GetNWState() == ArcCW.STATE_SIGHTS then
		return {current = 1}
    elseif wep:GetCurrentFiremode().PrintName == "fcg.apex.shatter" and wep:GetNWState() != ArcCW.STATE_SIGHTS then
		return {current = 7}
    end
end

SWEP.O_Hook_Override_NoRandSpread = function(wep,data)
	if wep:GetCurrentFiremode().PrintName == "fcg.apex.shatter" and wep:GetNWState() == ArcCW.STATE_SIGHTS then
		return {current  = false}
    elseif wep:GetCurrentFiremode().PrintName == "fcg.apex.shatter" and wep:GetNWState() != ArcCW.STATE_SIGHTS then
		return {current = true}
	end
end

SWEP.Hook_GetShootSound = function(wep, sound)
    local c = wep:GetNWFloat("ApexCharge", 0)
    if c >= 1 then
        return "ArcCW_APEX.3030Repeater.Fire_Charged"
    elseif c > 0 then
        return "ArcCW_APEX.3030Repeater.Fire_Semi_Charged"
    end
end

SWEP.Hook_PostFireBullets = function(wep)
    wep:SetNWFloat("ApexCharge", 0)
    if wep.ApexLoopSound then
        wep.ApexLoopSound:Stop()
        wep.ApexLoopSound = nil
    end
end

SWEP.TTTWeaponType = {"weapon_zm_rifle", "weapon_zm_mac10"}
SWEP.TTTWeight = 75