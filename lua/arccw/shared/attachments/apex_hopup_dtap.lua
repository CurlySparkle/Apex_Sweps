att.PrintName = "Hop-up - Double Tap Trigger"
att.AbbrevName = "Double Tap Trigger"
att.Icon = Material("entities/attach_icons/hopup_apex_doubletap.png", "noclamp smooth")
att.Description = "Gives the weapon an additional firemode that shoots two rounds in rapid succession."

att.SortOrder = 1

att.Desc_Pros = {
}
att.AutoStats = true
att.Slot = {"apex_hopup_dtap"}

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = -2,
        RunawayBurst = true,
        PostBurstDelay = 0.333,
        Mult_RPM = 5,
        Override_ShotRecoilTable = {[1] = 0.1},
    }
}

att.EntityCategory = "ArcCW - Apex Legends (Att.)"
att.EntityIcon = "entities/attach_icons/hopup_apex_doubletap.png"