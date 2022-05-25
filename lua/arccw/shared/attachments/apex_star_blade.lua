att.PrintName = "Blade Star"
att.AbbrevName = "Blade"
att.Icon = Material("entities/arccw_apex_nade_arcstar.png", "mips smooth")

att.Description = "A throwing star with no payload except a sharpened blade.\nLethal on a direct hit, and stars can be recovered after impact.\nCan be pulled and thrown much quicker than other throwing stars.\n\nEdgy Legends and Pilots would say the crimson trail is made from the blood of their enemies, but in reality it's just a cool LED light."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = {"apex_star"}
att.ActivateElements = {"skin_2"}

att.Override_ShootEntity = "arccw_apex_thr_star_blade"
att.Mult_ThrowTime = 0.75
att.Mult_PullPinTime = 0.6
att.Mult_ReloadTime = 0.6
att.Mult_RPM = 1.25