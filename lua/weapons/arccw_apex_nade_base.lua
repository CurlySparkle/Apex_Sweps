SWEP.Base = "arccw_base_nade"
SWEP.Spawnable = false
SWEP.Category = "ArcCW - Apex Legends"
SWEP.AdminOnly = false

SWEP.PrintName = "Apex Nade Base"
SWEP.DrawCrosshair = true

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
SWEP.MeleeSwingSound = ""
SWEP.MeleeMissSound = ""
SWEP.MeleeHitSound = "ArcCW_APEX.Melee.Hit.Default"
SWEP.MeleeHitNPCSound = "ArcCW_APEX.Melee.Hit.Flesh"

SWEP.MeleeDamage = 50
SWEP.MeleeRange = 48
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 1
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

SWEP.HipDispersion = 150
SWEP.MoveDispersion = 50

SWEP.Throwing = true
SWEP.Singleton = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 0.5

SWEP.ShootWhileSprint = false -- You cannot throw nades while sprinting on apex, so i thought it should be the same here

if ArcCW.Apex.GetBalanceMode() == 2 then
    SWEP.MeleeDamage = 30
end

DEFINE_BASECLASS("arccw_base_nade")
function SWEP:Initialize()
    BaseClass.Initialize(self)

    if self.Apex_Balance then
        local val = ArcCW.Apex.GetBalanceMode()
        for i, v in pairs(self.Apex_Balance[val] or {}) do
            self[i] = v
        end
    end
end

-- Sliding Ability
SWEP.SuppressSlidingViewModelTilt = true