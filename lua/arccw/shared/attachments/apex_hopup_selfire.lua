att.PrintName = "Hop-up - Select Fire"
att.AbbrevName = "Select Fire"
att.Icon = Material("entities/attach_icons/hopup_apex_selectfire.png", "noclamp smooth")
att.Description = "Gives the weapon an automatic firemode. When firing automatically, rate of fire is reduced and recoil is increased."

att.SortOrder = 1

att.Desc_Pros = {
}
att.AutoStats = true
att.Slot = {"apex_hopup_selfire"}

att.Override_Firemodes = {
    {
        Mode = -5,
        RunawayBurst = true,
    },
    {
        Mode = 2,
        Mult_RPM = 900 / 1260,
        Mult_Recoil = 1.25,
        Mult_RecoilSide = 1.5
    },
    {
        Mode = 0
    }
}

att.EntityCategory = "ArcCW - Apex Legends (Att.)"
att.EntityIcon = "entities/attach_icons/hopup_apex_selectfire.png"