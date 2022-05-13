att.PrintName = "Hop-up - Anvil Receiver"
att.AbbrevName = "Anvil Receiver"
att.Icon = Material("entities/attach_icons/hopup_apex_anvil.png", "noclamp smooth")
att.Description = "Modifies the semi-automatic firing group of the weapon, firing an extra-powerful shot at the cost of fire rate and 2 ammo per shot."

att.SortOrder = 1

att.Desc_Pros = {
}
att.AutoStats = true
att.Slot = {"apex_hopup_anvil2"}
att.InvAtt = "apex_hopup_anvil"

-- For VK-47, slightly reduced multiplier
att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
        Mult_RPM = 300 / 600,
        Mult_Damage = 2.25,
        Mult_DamageMin = 2.25,
        Add_AmmoPerShot = 1,
		Override_Tracer = "arccw_apex_tracer_anvil"
    }
}