att.PrintName = "Arc Grenade"
att.AbbrevName = "Arc"
att.Icon = Material("entities/arccw_apex_nade_frag.png", "mips smooth")

att.Description = "Payload that deploys directed energy to disrupt targets, slowing them but doing less direct damage.\n\nThe fuse is replaced with a 2-second cooked fuse."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = {"apex_nade"}
att.ActivateElements = {"skin_3"}

att.EntityCategory = "ArcCW - Apex Legends (Gren.)"

att.Override_ShootEntity = "arccw_apex_thr_frag_arc"
att.Override_CookPrimFire = true
att.Override_CookAltFire = true
att.Override_FuseTime = 2