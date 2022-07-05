att.PrintName = "Blast Star"
att.AbbrevName = "Blast"
att.Icon = Material("entities/arccw_apex_nade_arcstar.png", "mips smooth")

att.Description = "Payload releasing a thermobaric explosion in a small radius.\nHas a shorter throwing windup, and typically not lethal on an indirect hit.\n\nIf the Blast Star hits a target, the onboard microprocessor can optimize its blast force, doubling damage dealt and launching the stuck object towards any players in front."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Slot = {"apex_star"}
att.ActivateElements = {"skin_3"}

att.EntityCategory = "ArcCW - Apex Legends (Gren.)"

att.Override_ShootEntity = "arccw_apex_thr_star_frag"
att.Mult_PullPinTime = 0.75