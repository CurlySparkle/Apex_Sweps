att.PrintName = "Hop-up - Turbocharger"
att.AbbrevName = "Turbocharger"
att.Icon = Material("entities/attach_icons/hopup_apex_turbocharger.png", "noclamp smooth")
att.Description = "Allows the weapon to wind-up more quickly."

att.SortOrder = 1

att.Desc_Pros = {
}
att.AutoStats = true
att.Slot = {"apex_hopup_turbo2"}
att.InvAtt = "apex_hopup_turbo"

att.Hook_ModifyRPM = function(wep, delay)
    return delay / Lerp(wep:GetBurstCount() / 10, 1, 3)
end
att.Hook_ModifyRPM_Priority = 10