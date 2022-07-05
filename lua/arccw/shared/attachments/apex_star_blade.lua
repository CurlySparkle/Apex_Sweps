att.PrintName = "Blade Star"
att.AbbrevName = "Blade"
att.Icon = Material("entities/arccw_apex_nade_arcstar.png", "mips smooth")

att.Description = "A throwing star with no payload except a sharpened blade.\nLethal on upper body hit, and stars can be recovered after impact. Thrown much quicker than other throwing stars, and can be charged to increase thrown velocity.\n\nEdgy Legends and Pilots would say the crimson trail is made of the blood of their enemies, but in reality it's just a cool LED light."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = {"apex_star"}
att.ActivateElements = {"skin_2"}

att.EntityCategory = "ArcCW - Apex Legends (Gren.)"

att.Override_ShootEntity = "arccw_apex_thr_star_blade"
att.Mult_ThrowTime = 0.75
att.Mult_PullPinTime = 0.6
att.Mult_ReloadTime = 0.6
att.Mult_RPM = 1.25

att.Override_WindupTime = 0.8
att.Override_WindupMinimum = 0.25
att.Mult_MuzzleVelocity = 2
