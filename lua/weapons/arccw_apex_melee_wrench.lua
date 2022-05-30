if CLIENT then
    killicon.Add( "arccw_apex_melee_wrench", "VGUI/apex_killicon_melee_rampart", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_melee_rampart")
end

SWEP.Base = "arccw_base_melee"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Problem Solver"
SWEP.Trivia_Class = "Melee Weapon"
SWEP.Trivia_Desc = "An electric wrench with a gumball dispenser."
SWEP.Trivia_Manufacturer = "Rampart"

SWEP.Slot = 0

SWEP.NPCWeaponType = "weapon_crowbar"
SWEP.NPCWeight = 250

SWEP.CamAttachment = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/melee/c_apex_melee_rampart.mdl"
SWEP.WorldModel = "models/weapons/melee/c_apex_melee_rampart.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos = Vector(-10.5, 9, -8),
    ang = Angle(-10, 0, 180+5)
}

SWEP.SprintPos = Vector(0, -2, 1)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, -2, 1)
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.ViewModelFOV = 70

--SWEP.ImpactDecal = "FadingScorch" -- No decals for melee sadly
--SWEP.ImpactEffect = "StunstickImpact"

SWEP.MeleeGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE

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
SWEP.MeleeRange = 60
SWEP.MeleeDamageType = DMG_SLASH + DMG_AIRBOAT + DMG_GENERIC + DMG_CLUB

SWEP.MeleeHitSound = "ArcCW_APEX.Rampart.Wrench.Hit_Default"
SWEP.MeleeHitNPCSound = "ArcCW_APEX.Rampart.Wrench.Hit_Flesh"

SWEP.MeleeTime = 1
SWEP.MeleeAttackTime = 0.35*0.75
SWEP.Delay = 60 / 600 

SWEP.Lunge = true
SWEP.LungeLength = 72

SWEP.Melee2 = true
SWEP.Melee2Damage = 50
SWEP.Melee2DamageBackstab = 180
SWEP.Melee2Range = 65
SWEP.Melee2Time = 0.55
SWEP.Melee2Gesture = nil
SWEP.Melee2AttackTime = 0.4*0.75

SWEP.Backstab = true
SWEP.BackstabMultiplier = 2

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "melee"
SWEP.DrawCrosshair = true
SWEP.IronSightStruct = false
SWEP.ShootWhileSprint = false

SWEP.Primary.ClipSize = -1

SWEP.AttachmentElements = {
    ["extra"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.9},
    ["enter_sprint"] = {
        Source = "sprint_in",
		MinProgress = 0.01,
        SoundTable = {
            {s = "ArcCW_APEX.Rampart.Wrench.Swing_Foley_Big", t = 0 / 30},
        },
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
		MinProgress = 0.01,
        SoundTable = {
            {s = "ArcCW_APEX.Rampart.Wrench.Swing_Foley_Big", t = 0 / 30},
        },
    },
    ["draw"] = {
        Source = {"draw","draw3"},
        SoundTable = {
            {s = "ArcCW_APEX.Rampart.Wrench.Draw", t = 0 / 30},
        },
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {s = "ArcCW_APEX.Rampart.Wrench.Draw", t = 0 / 30},
        },
    },
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
			{ind = 2, bg = 1, s = "weapons/melee/rampart/Rampart_Mvmt_ProblemSolver_FirstDraw_A.wav", t = 0 / 30},
			{ind = 2, bg = 0, s = "weapons/melee/rampart/Rampart_Mvmt_ProblemSolver_FirstDraw_B.wav", t = 50 / 30},
        },
    },
    ["bash"] = {
        Source = {"melee_jump","melee_sliding","melee_smack_down","melee_sprinting","melee_swing_down"},
        SoundTable = {
            {s = "ArcCW_APEX.Rampart.Wrench.Swing_light", t = 0 / 30},
        },
    },
    ["bash2"] = {
        Source = {"melee_swirl","melee_reversal"},
        SoundTable = {
            {s = "ArcCW_APEX.Rampart.Wrench.Smack", t = 0 / 30},
--			{s = "ArcCW_APEX.Rampart.Wrench.Swing_Foley", t = 5 / 30},
        },
    },
    ["bash_backstab"] = {
        Source = {"melee_crouch","melee_shoot"},
        SoundTable = {
            {s = "ArcCW_APEX.Rampart.Wrench.Crouch", t = 0 / 30},
			{c = CHAN_WEAPON, s = "weapons/melee/rampart/ProblemSolver_Ratchet_OpenLong_v1_2ch_01.wav", t = 9 / 30},
        },
    },
    ["bash2_backstab"] = {
        Source = {"melee_shoot","melee_crouch"},
        SoundTable = {
            {s = "ArcCW_APEX.Rampart.Wrench.Crouch", t = 0 / 30},
			{c = CHAN_WEAPON, s = "weapons/melee/rampart/ProblemSolver_Ratchet_OpenLong_v1_2ch_01.wav", t = 9 / 30},
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
            {s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_A_v1_2ch_01.wav", t = 0 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_B_v1_2ch_01.wav", t = 10 / 30},
			{ind = 2, bg = 1, p = 85,s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_B_v1_2ch_01.wav", t = 30 / 30},
			{p = 115,s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_B_v1_2ch_01.wav", t = 56 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_I_v1_2ch_01.wav", t = 30 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_F_v1_2ch_01.wav", t = 107 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_C_v1_2ch_01.wav", t = 110 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_E_v1_2ch_01.wav", t = 134 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_F_v1_2ch_01.wav", t = 163 / 30},
			{s = "weapons/melee/rampart/Rampart_Mvmt_ProblemSolver_Inspect_BatteryReplace_Pt6.wav", t = 165 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_G_v1_2ch_01.wav", t = 188 / 30},
			{ind = 2, bg = 0, s = "weapons/melee/rampart/Rampart_Mvmt_ProblemSolver_Inspect_BatteryReplace_Pt8.wav", t = 189 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_H_v1_2ch_01.wav", t = 190 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Ratchet_Close_v1_2ch_01.wav", t = 240 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_J_v1_2ch_01.wav", t = 265 / 30},
			{s = "weapons/melee/rampart/ProblemSolver_Insp_BatteryReplace_K_v1_2ch_01.wav", t = 340 / 30},
        },
    },
}