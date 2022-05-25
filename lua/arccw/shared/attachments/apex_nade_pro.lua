att.PrintName = "Pro Mod. Frag Grenade"
att.AbbrevName = "Pro"
att.Icon = Material("entities/arccw_apex_nade_frag.png", "mips smooth")

att.Description = "Modified grenade with a 3-second cooked fuse.\nCommonly seen in the hands of Pilots, who rely on the cooked fuse to breach indoor spaces at high speeds."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = {"apex_nade"}

att.Override_ShootEntity = "arccw_apex_thr_frag_pro"
att.Override_CookPrimFire = true
att.Override_CookAltFire = true
att.Override_FuseTime = 3