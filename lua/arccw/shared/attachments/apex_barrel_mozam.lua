att.PrintName = "Extended Barrel"
att.Icon = Material("entities/attach_icons/apex_barrel_4.png", "mips smooth")
att.Description = "Gives the mozambique its own specialized barrel."

att.SortOrder = 1

att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"mozambique_barrel"}

att.Model = "models/weapons/attachments/barrel_mozam.mdl"

att.Silencer = true
att.Override_MuzzleEffect = "tfa_apex_muzzle_barrel"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1
att.Mult_ShootVol = 1
att.Mult_AccuracyMOA = 0.75
att.Mult_Range = 1.25
att.Mult_RPM = 1.3

att.Mult_SightTime = 1.25
att.Mult_HipDispersion = 0.95

att.Add_BarrelLength = 5

att.Override_MuzzleEffectAttachment = 1

att.ModelOffset = Vector(0, 0, 0)


att.GivesFlags = {"muz_long"}
att.ExcludeFlags = {"tac_short"}