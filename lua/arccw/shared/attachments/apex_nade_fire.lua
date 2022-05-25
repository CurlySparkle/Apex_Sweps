att.PrintName = "Firebomb"
att.AbbrevName = "Fire"
att.Icon = Material("entities/arccw_apex_nade_frag.png", "mips smooth")

att.Description = "Payload containing an incendiary compound and a 4-second timed fuse.\nA ring of flames is dispersed on impact. Compared to Thermite grenades, Firebombs last shorter but deal much more damage."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = {"apex_nade"}

att.Override_ShootEntity = "arccw_apex_thr_frag_fire"
att.Override_FuseTime = 4