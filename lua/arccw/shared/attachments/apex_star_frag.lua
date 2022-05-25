att.PrintName = "Blast Star"
att.AbbrevName = "Blast"
att.Icon = Material("entities/arccw_apex_nade_arcstar.png", "mips smooth")

att.Description = "Payload releasing a thermobaric explosion in a small radius.\nHas a shorter throwing windup, and typically not lethal on an indirect hit.\nStuck targets will take double damage, and the explosive presure will push it in the direction of impact."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = {"apex_star"}
att.ActivateElements = {"skin_3"}

att.Override_ShootEntity = "arccw_apex_thr_star_frag"
att.Mult_PullPinTime = 0.75