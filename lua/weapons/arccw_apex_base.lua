SWEP.Base = "arccw_base"
SWEP.Spawnable = false
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Apex Base"
SWEP.Apex_Balance = nil

DEFINE_BASECLASS("arccw_base")
function SWEP:Initialize()
    BaseClass.Initialize(self)

    if self.Apex_Balance then
        local val = GetConVar("arccw_apex_bal"):GetInt()
        for i, v in pairs(self.Apex_Balance[val] or {}) do
            self[i] = v
        end
    end
end

SWEP.FiremodeSound = {"weapons/fx/firemode_1.wav","weapons/fx/firemode_2.wav"}

SWEP.Lunge = true -- Whether to allow the bash/melee to lunge a short distance
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

SWEP.Sway = 0.4

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