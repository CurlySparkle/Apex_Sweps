if CLIENT then
    killicon.Add( "arccw_apex_melee_baton", "VGUI/apex_killicon_melee_lifeline", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_melee_lifeline")
end

SWEP.Base = "arccw_base_melee"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Shock Sticks"
SWEP.Trivia_Class = "Melee Weapon"
SWEP.Trivia_Desc = "A pair of defibrillator drumsticks with Lifeline deco on it. Also causes lightning sparks when swinging."
SWEP.Trivia_Manufacturer = "Lifeline"

SWEP.Slot = 0

SWEP.NPCWeaponType = "weapon_crowbar"
SWEP.NPCWeight = 250

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/melee/c_apex_melee_lifeline.mdl"
SWEP.WorldModel = "models/weapons/melee/c_apex_melee_lifeline.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos = Vector(-14, 5, -8),
    ang = Angle(-10, 0, 180 + 5)
}

SWEP.SprintPos = Vector(0, -2, 1)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, -2, 1)
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(0, -2, -1)
SWEP.CrouchAng = Angle(0, 0, 0)

SWEP.ViewModelFOV = 70

--SWEP.ImpactDecal = "FadingScorch" -- No decals for melee sadly
SWEP.ImpactEffect = "StunstickImpact"

SWEP.MeleeGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE

SWEP.NotForNPCs = true

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "Blunt"
    },
}

SWEP.PrimaryBash = true
SWEP.CanBash = true
SWEP.MeleeDamage = 65
SWEP.MeleeRange = 50
SWEP.MeleeDamageType = DMG_SHOCK + DMG_AIRBOAT + DMG_GENERIC + DMG_CLUB

SWEP.MeleeHitSound = "ArcCW_APEX.Lifeline.Baton.Hit.Default"
SWEP.MeleeHitNPCSound = "ArcCW_APEX.Lifeline.Baton.Hit.Flesh"
SWEP.MeleeMissSound = ""
SWEP.MeleeSwingSound = ""

SWEP.MeleeTime = 1
SWEP.MeleeAttackTime = 0.35*0.75
SWEP.Delay = 60 / 600

SWEP.Lunge = true
SWEP.LungeLength = 72

SWEP.Melee2 = true
SWEP.Melee2Damage = 50
SWEP.Melee2DamageBackstab = 180
SWEP.Melee2Range = 40
SWEP.Melee2Time = 1
SWEP.Melee2Gesture = nil
SWEP.Melee2AttackTime = 0.25

SWEP.Backstab = true
SWEP.BackstabMultiplier = 2

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "melee"
SWEP.DrawCrosshair = true
SWEP.IronSightStruct = false
SWEP.ShootWhileSprint = false

SWEP.Primary.ClipSize = -1

-- SWEP.AttachmentElements = {
    -- ["extra"] = {
        -- VMBodygroups = {
            -- {ind = 2, bg = 1},
        -- },
    -- },
-- }

SWEP.NoHideLeftHandInCustomization = true

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {
    Source = "sprint",
    MinProgress = 0,
    },
    ["enter_sprint"] = {
        Source = "sprint_in",
        MinProgress = 0,
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
        MinProgress = 0,
    },
    ["draw"] = {
        Source = {"draw"},
		MinProgress = 0.1,
        SoundTable = {
            {s = "ArcCW_APEX.Lifeline.Baton.Draw", t = 0 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {s = "weapons/melee/lifeline/Lifeline_Mvmt_Baton_Holster.wav", t = 0 / 30},
        },
    },
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {s = "weapons/melee/lifeline/Lifeline_Mvmt_Baton_FirstDraw_Twirl.wav", t = 0 / 30},
            {s = "weapons/melee/lifeline/Lifeline_Mvmt_Baton_FirstDraw_Extend.wav", t = 30 / 30},
        },
    },
    ["bash"] = {
        Source = {"melee_idle","melee_sprinting"},
        SoundTable = {
            { s = "ArcCW_APEX.Lifeline.Baton.DoubleSwipe", t = 0 / 30},
			-- { e = "arccw_apex_melee_blur", att = 1, mag = 100, t = 5 / 30},
        },
    },
    ["bash2"] = {
        Source = {"melee_jump"},
        SoundTable = {
            {s = "ArcCW_APEX.Lifeline.Baton.Chop", t = 0 / 30},
        },
    },
    ["bash_backstab"] = {
        Source = {"melee_sprinting2"},
        SoundTable = {
            {s = "ArcCW_APEX.Lifeline.Baton.Stab", t = 0 / 30},
        },
    },
    ["bash2_backstab"] = {
        Source = {"melee_crouch"},
        SoundTable = {
            {s = "ArcCW_APEX.Lifeline.Baton.DoubleSwipe", t = 0 / 30},
        },
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
            {s = "weapons/melee/lifeline/Lifeline_Mvmt_Baton_Inspect_PT1.wav", t = 0 / 30},
			{s = "weapons/melee/lifeline/Lifeline_Mvmt_Baton_Inspect_PT2.wav", t = 115 / 30},
			{s = "weapons/melee/lifeline/Lifeline_Mvmt_Baton_Inspect_PT3.wav", t = 380 / 30},
			{s = "weapons/melee/lifeline/Lifeline_Mvmt_Baton_Inspect_PT4.wav", t = 430 / 30},
			{s = "weapons/melee/lifeline/Lifeline_Mvmt_Baton_Inspect_PT5.wav", t = 500 / 30},
        },
    },
}