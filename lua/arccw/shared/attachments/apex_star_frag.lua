att.PrintName = "Blast Star"
att.AbbrevName = "Frag"
att.Icon = Material("entities/arccw_apex_nade_arcstar.png", "mips smooth")

att.Description = "Payload containing shrapnel, doing damage in a small radius.\nTypically not lethal on an indirect hit, but stuck targets take double damage and is a guaranteed instant kill, rewarding skillshots.\nBlast Stars can be thrown with a shorter windup due to its lighter weight."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = {"apex_star"}

att.Override_ShootEntity = "arccw_apex_thr_star_frag"
att.Mult_PullPinTime = 0.75