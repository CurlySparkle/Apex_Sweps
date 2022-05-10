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