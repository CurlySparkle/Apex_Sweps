if CLIENT then
    killicon.Add( "arccw_apex_chargerifle", "VGUI/apex_killicon_chargerifle", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_chargerifle")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Charge Rifle"
SWEP.Trivia_Class = "Sniper Rifle"
SWEP.Trivia_Desc = "A energy-discharging weapon shooting a deadly beam of energy upon a target.\nUnlike its predecessor, the model produced by Vinson Dynamics emits the beam as it is charging up, instead of releasing all of the energy as a single shot."
SWEP.Trivia_Manufacturer = "Vinson Dynamics"

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-9, -7, 1)
SWEP.CrouchAng = Angle(0, 0, -53)

SWEP.SprintPos = Vector(0, -6, 0)
SWEP.SprintAng = Angle(0, 0, 0)

-- SWEP.ActivePos = Vector(0, -6, 0)
SWEP.ActivePos = Vector(0, -5, 0.2)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, -5, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_chargerifle.mdl"
SWEP.WorldModel = "models/weapons/w_apex_chargerifle.mdl"
SWEP.MirrorVMWM = false
SWEP.MirrorWorldModel = "models/weapons/w_apex_chargerifle.mdl"
SWEP.WorldModelOffset = {
    pos        =  Vector(12, 1, 2),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 45
SWEP.DamageMin = 30
SWEP.Range = 300
SWEP.RangeMin = 150
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 30000 * ArcCW.HUToM
SWEP.AlwaysPhysBullet = false
SWEP.NeverPhysBullet = true

SWEP.Apex_Balance = {
    [1] = {
        Damage = 42,
        DamageMin = 36,
    },
    [2] = {
        Damage = 45,
        DamageMin = 30,
    },
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1.25,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 1,
    [HITGROUP_RIGHTLEG] = 1,
}

SWEP.Tracer = "arccw_apex_tracer_chargerifle_1" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ImpactDecal = "FadingScorch"
SWEP.ImpactEffect = "StunstickImpact"

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 8
SWEP.MaxRecoilBlowback = 1

-- SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 1.25
SWEP.RecoilSide = 0.5
SWEP.RecoilRise = 0.5
SWEP.RecoilPunch = 2.5
SWEP.VisualRecoilMult = 3
SWEP.RecoilVMShake = 1

SWEP.Delay = 60 / 60
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        PrintName = "fcg.semi",
        Mode = -16,
        RunawayBurst = true,
        PostBurstDelay = 1
    }
}

SWEP.AccuracyMOA = 0
SWEP.HipDispersion = 0
SWEP.MoveDispersion = 0
SWEP.JumpDispersion = 0

SWEP.SightedSpeedMult = 0.35

SWEP.Primary.Ammo = "apex_sniper"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = {"weapons/chargerifle/fire_1.wav", "weapons/chargerifle/fire_2.wav", "weapons/chargerifle/fire_3.wav"}
SWEP.ShootDrySound = "ArcCW_APEX.Rifle_Dry_A_1"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = "tfa_apex_chargerifle_muzzle"
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
    Pos = Vector(0, -8.5, -0.45),
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
        Slot = {"apex_sights", "apex_optics","apex_scope_chargerifle"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(12, 0.98, -10.06),
            wang = Angle(-10, 0, 180)
        },
        InstalledEles = {"weapon_sights","weapon_dot"},
        CorrectivePos = Vector(2.88, 0, 0.44),
        CorrectiveAng = Angle(0, 0, 6, 108),
        ExtraSightDist = -1.5,
        RandomChance = 5,
    },
    {
        PrintName = "Stock",
        Slot = {"apex_stock_sniper", "apex_stock_combat"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_turbo3", "apex_hopup_shatter4", "apex_hopup_selfire6"},
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
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        SoundTable = {
            --{p = 100, s = "weapons/g7/wpn_g2a4_reload_empty_charge_fr49_2ch_v1_01.wav", t = 7 / 35}
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
    ["fire_windup"] = {
        Source = "fire_windup",
    },
    ["fire_windup2"] = {
        Source = "fire_windup",
        Mult = 0.66667,
    },
    ["trigger"] = {
        Source = "fire_windup",
        Mult = 1.25,
        MinProgress = 0.6,
    },
    ["untrigger"] = {
        Source = "idle",
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = {"iron_fire", "iron_fire2"},
    },
    ["fire_sight_windup"] = {
        Source = "iron_fire_windup",
    },
    ["fire_sight_windup2"] = {
        Source = "iron_fire_windup",
        Mult = 0.66667,
    },
    ["trigger_sight"] = {
        Source = "iron_fire_windup",
        Mult = 1.25,
        MinProgress = 0.6,
    },
    ["untrigger_sight"] = {
        Source = "iron_idle",
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
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Sniper_End_V1_2ch_01.wav", t = 0 / 30},
        },
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
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR04_ArmLift_2ch_v1_01.wav", t = 8 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR13_EjectMag_2ch_v1_01.wav", t = 13 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR18_SteamRelease_2ch_v1_01.wav", t = 18 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR41_ArmLift_2ch_v1_01.wav", t = 41 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR51_InsertMag_2ch_v1_01.wav", t = 51 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR61_TwistLever_2ch_v1_01.wav", t = 61 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR77_PullOut_2ch_v1_01.wav", t = 77 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR93_ArmLift_2ch_v1_01.wav", t = 93 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR105_SlapClosed_2ch_v1_01.wav", t = 105 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR121_HandSettle_2ch_v1_01.wav", t = 121 / 30}
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.6,
        SoundTable = {
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR04_ArmLift_2ch_v1_01.wav", t = 8 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR13_EjectMag_2ch_v1_01.wav", t = 13 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR18_SteamRelease_2ch_v1_01.wav", t = 18 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR41_ArmLift_2ch_v1_01.wav", t = 41 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR51_InsertMag_2ch_v1_01.wav", t = 51 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR61_TwistLever_2ch_v1_01.wav", t = 61 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR77_PullOut_2ch_v1_01.wav", t = 77 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR93_ArmLift_2ch_v1_01.wav", t = 93 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_ReloadEmpty_FR100_SwitchFlip_2ch_v1_01.wav", t = 100 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_ReloadEmpty_FR113_SwitchFlip_2ch_v1_01.wav", t = 113 / 30},
            {p = 100, s = "weapons/chargerifle/Wpn_ChargeRifle_Reload_FR105_SlapClosed_2ch_v1_01.wav", t = 145 / 30},
        },
    },
}

SWEP.TriggerPullWhenEmpty = false

SWEP.TTTWeaponType = "weapon_zm_rifle"
SWEP.TTTWeight = 75

SWEP.ShotRecoilTable = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
    [8] = 0,
    [9] = 0,
    [10] = 0,
    [11] = 0,
    [12] = 0,
    [13] = 0,
    [14] = 0,
    [15] = 0,
}

SWEP.Hook_GetShootSound = function(wep, fsound)
    if wep:GetCurrentFiremode().Mode >= 0 then return end
    if wep:GetBurstCount() == 1 then
        wep.ChargeSound = CreateSound(wep, "weapons/chargerifle/fire_windup_" .. math.random(1, 3) .. ".wav")
        wep.ChargeSound:Play()
        return ""
    elseif wep:GetBurstCount() < (math.abs(wep:GetCurrentFiremode().Mode) - 1) then
        return ""
    elseif wep.ChargeSound then
        wep.ChargeSound:Stop()
        wep.ChargeSound = nil
        return ""
    end
end

SWEP.Hook_OnTriggerHeld = function(wep)
    if SERVER then
        if wep.ChargeSound then
            wep.ChargeSound:Stop()
            wep.ChargeSound = nil
        end
        wep.ChargeSound = CreateSound(wep, "weapons/chargerifle/fire_windup_alt_1.wav")
        wep.ChargeSound:Play()
    end
end

SWEP.Hook_OnTriggerRelease = function(wep)
    if wep.ChargeSound then
        wep.ChargeSound:FadeOut(0.1)
        wep.ChargeSound = nil
        wep:EmitSound("weapons/chargerifle/fire_winddown.wav")
    end
end

SWEP.Hook_PostFireBullets = function(wep)
    if wep:GetCurrentFiremode().Mode >= 0 and wep.ChargeSound then
        wep.ChargeSound:Stop()
        wep.ChargeSound = nil
    end
end

SWEP.Hook_OnHolster = function(wep)
    if wep.ChargeSound then
        wep.ChargeSound:Stop()
        wep.ChargeSound = nil
    end
end

SWEP.Hook_SelectFireAnimation = function(wep, curanim)
    if wep:GetCurrentFiremode().Mode >= 0 then return end
    if wep:GetBurstCount() <= 1 and wep.Animations[curanim .. "_windup"] then
        return curanim .. "_windup"
    elseif wep:GetBurstCount() <= (math.abs(wep:GetCurrentFiremode().Mode) - 1) then
        return ""
    end
end

SWEP.ChargeDamage = 3

SWEP.O_Hook_Override_Damage = function(wep, data)
    if wep:GetCurrentFiremode().Mode >= 0 then return end
    if wep:GetBurstCount() < (math.abs(wep:GetCurrentFiremode().Mode) - 1) then
        return {current = wep:GetBuff("ChargeDamage")}
    end
end

SWEP.O_Hook_Override_DamageMin = function(wep, data)
    if wep:GetCurrentFiremode().Mode >= 0 then return end
    if wep:GetBurstCount() < (math.abs(wep:GetCurrentFiremode().Mode) - 1) then
        return {current = wep:GetBuff("ChargeDamage")}
    end
end

SWEP.ChargeDelay = 0.03

SWEP.Hook_ModifyRPM = function(wep, delay)
    if wep:GetCurrentFiremode().Mode >= 0 then return end
    if wep:GetBurstCount() < (math.abs(wep:GetCurrentFiremode().Mode) - 1) then
        return wep:GetBuff("ChargeDelay")
    end
end

SWEP.AmmoPerShot = 2
SWEP.O_Hook_Override_AmmoPerShot = function(wep, data)
    if wep:GetCurrentFiremode().Mode >= 0 then return end
    if wep:GetBurstCount() > 0 then
        return {current = 0}
    end
end

SWEP.O_Hook_Override_Tracer = function(wep, data)
    if wep:GetCurrentFiremode().Mode < 0 and wep:GetBurstCount() < (math.abs(wep:GetCurrentFiremode().Mode) - 1) then
        return {current = wep:GetBuff("Num") > 1 and "arccw_apex_tracer_chargerifle_2" or "arccw_apex_tracer_chargerifle"}
    end
end

SWEP.O_Hook_Override_MuzzleEffect = function(wep,data)
    if wep:GetCurrentFiremode().Mode < 0 and wep:GetBurstCount() < (math.abs(wep:GetCurrentFiremode().Mode) - 1) then
        return {current = "tfa_apex_chargerifle_muzzle_charge"}
    end
end