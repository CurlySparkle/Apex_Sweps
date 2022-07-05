att.PrintName = "Pro Mod. Frag Grenade"
att.AbbrevName = "Pro"
att.Icon = Material("entities/arccw_apex_nade_frag.png", "mips smooth")

att.Description = "Modified grenade with a 2.5-second cooked fuse.\nLethal radius is slightly increased, but damage falloff is significantly higher.\n\nCommonly seen in the hands of Pilots, who rely on the cooked fuse to breach indoor spaces at high speeds."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = {"apex_nade"}
att.ActivateElements = {"skin_1"}

att.EntityCategory = "ArcCW - Apex Legends (Gren.)"

att.Override_ShootEntity = "arccw_apex_thr_frag_pro"
att.Override_CookPrimFire = true
att.Override_CookAltFire = true
att.Override_FuseTime = 2.5