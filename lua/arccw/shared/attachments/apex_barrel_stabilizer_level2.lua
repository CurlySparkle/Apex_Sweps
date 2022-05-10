att.PrintName = "Barrel Stabilizer - Level 2"
att.Icon = Material("entities/attach_icons/apex_barrel_2.png", "mips smooth", Color(168, 168, 168, 255))
att.Description = "A standard muzzle attachment that reduces weapon recoil."

att.SortOrder = 1

att.Desc_Pros = {
}
att.AutoStats = true
att.Slot = {"apex_muzzle"}

att.Model = "models/weapons/attachments/barrel_2.mdl"

att.Silencer = false
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_Recoil = 0.85
att.Mult_RecoilSide = 0.7

att.Add_BarrelLength = 8

att.Override_MuzzleEffectAttachment = 1

att.ModelOffset = Vector(0, 0, 0)

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then return false end
end

att.GivesFlags = {"muz_long"}
att.ExcludeFlags = {"tac_short"}

att.EntityCategory = "ArcCW - Apex Legends (Att.)"
att.EntityIcon = "entities/attach_icons/apex_barrel_2.png"