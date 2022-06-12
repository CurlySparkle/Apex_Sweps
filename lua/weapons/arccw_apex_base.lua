SWEP.Base = "arccw_base"
SWEP.Spawnable = false
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Apex Base"
SWEP.Apex_Balance = nil

SWEP.PhysTracerProfile = "apex_bullet"

DEFINE_BASECLASS("arccw_base")
function SWEP:Initialize()
    BaseClass.Initialize(self)

    if self.Apex_Balance then
        local val = ArcCW.Apex.GetBalanceMode()
        for i, v in pairs(self.Apex_Balance[val] or {}) do
            self[i] = v
        end
    end
end

SWEP.FiremodeSound = {"weapons/fx/firemode_1.wav","weapons/fx/firemode_2.wav"}

SWEP.Lunge = true -- Whether to allow the bash/melee to lunge a short distance
SWEP.LungeLength = 72
SWEP.MeleeSwingSound = ""
SWEP.MeleeMissSound = ""
SWEP.MeleeHitSound = "ArcCW_APEX.Melee.Hit.Default"
SWEP.MeleeHitNPCSound = "ArcCW_APEX.Melee.Hit.Flesh"

SWEP.MeleeDamage = 50
SWEP.MeleeRange = 50
SWEP.MeleeDamageType = DMG_CLUB + DMG_AIRBOAT + DMG_GENERIC
SWEP.MeleeTime = 1
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

-- SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
-- SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3 -- This doesn't seem to work if its here on the base :(

SWEP.MuzzleFlashColor = Color(245, 153, 86)

SWEP.NoHideLeftHandInCustomization = true

SWEP.Sway = 0.25

SWEP.LockSightsInPriorityAnim = false

if ArcCW.Apex.GetBalanceMode() == 2 then
    SWEP.MeleeDamage = 30
end

SWEP.Hook_ChangeFiremode = function(wep)
    if wep:GetState() == ArcCW.STATE_SIGHTS then
        wep:ExitSights()
        wep:SetPriorityAnim(CurTime() + 0.75)
    end
end

-- Sliding Ability
SWEP.SuppressSlidingViewModelTilt = true