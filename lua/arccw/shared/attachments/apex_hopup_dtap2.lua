att.PrintName = "Hop-up - Double Tap Trigger"
att.AbbrevName = "Double Tap Trigger"
att.Icon = Material("entities/attach_icons/hopup_apex_doubletap.png", "noclamp smooth")
att.Description = "Gives the weapon an additional firemode that shoots two rounds in rapid succession."

att.SortOrder = 1

att.Desc_Pros = {
}
att.AutoStats = true
att.Slot = {"apex_hopup_dtap2"}
att.InvAtt = "apex_hopup_dtap"

-- For EVA-8, auto firemode and faster firing
att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = -2,
        RunawayBurst = true,
        PostBurstDelay = 0.45,
        Mult_RPM = 4,
    }
}