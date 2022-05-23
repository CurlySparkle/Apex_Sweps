SWEP.Base = "arccw_base_nade"
SWEP.Spawnable = false
SWEP.Category = "ArcCW - Apex Legends"
SWEP.AdminOnly = false

SWEP.PrintName = "Apex Nade Base"

SWEP.IronSightStruct = false

SWEP.CrouchPos = Vector(0, -2, -0.5)
SWEP.CrouchAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0, -2, 1)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, -2, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.ThrowInertia = false

SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.Lunge = true
SWEP.LungeLength = 72
SWEP.MeleeSwingSound = "weapons/Pilot_Mvmt_Melee_RightHook_1P_2ch_v1_1.wav"
SWEP.MeleeHitSound = "weapons/Imp_Player_MeleePunch_Default_1ch_v1_1.wav"
SWEP.MeleeHitNPCSound = "weapons/Pilot_Mvmt_Melee_Hit_Flesh_1P_2ch_v1_1.wav"

SWEP.MeleeDamage = 50
SWEP.MeleeRange = 48
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 1
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

if ArcCW.Apex.GetBalanceMode() == 2 then
    SWEP.MeleeDamage = 30
end