att.PrintName = "Firecracker" --"Firebomb"
att.AbbrevName = "Fire"
att.Icon = Material("entities/arccw_apex_nade_frag.png", "mips smooth")
--att.Description = "Payload containing an incendiary compound and a 3-second timed fuse.\nA ring of flames is dispersed on impact. Compared to Thermite grenades, Firebombs last shorter but deal much more damage."
att.Description = "Grenade containing superheated air and a 1.5-second fuse.\nWhen detonating, the firecracker will bounce around several times, venting hot air and dealing burn damage in a small area. The final explosion ejects heated shrapnel and is more powerful.\n\nFirecrackers seem to have a tendency to chase down targets, although its designers swear no such mechanism exists."

att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = {"apex_nade"}
att.ActivateElements = {"skin_2"}

att.EntityCategory = "ArcCW - Apex Legends (Gren.)"

att.Override_ShootEntity = "arccw_apex_thr_frag_fire"
att.Override_FuseTime = 1.5