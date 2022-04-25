att.PrintName = "Barrel Stabilizer - Level 4"
att.Icon = Material("entities/attach_icons/apex_barrel_4.png", "noclamp smooth")
att.Description = "Combat suppressor issues for rifles - Level 4"

att.SortOrder = 1

att.Desc_Pros = {
}
att.AutoStats = true
att.Slot = {"apex_muzzle"}

att.Model = "models/weapons/attachments/barrel_6.mdl"

att.Silencer = false
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

-- att.Mult_ShootPitch = 1
-- att.Mult_ShootVol = 1
att.Mult_AccuracyMOA = 0.95
att.Mult_Range = 1.2

-- att.Mult_SightTime = 1.1
att.Mult_HipDispersion = 0.9

att.Add_BarrelLength = 9

att.Override_MuzzleEffectAttachment = 1

att.ModelOffset = Vector(0, 0, 0)

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then return false end
end


att.GivesFlags = {"muz_long"}
att.ExcludeFlags = {"tac_short"}