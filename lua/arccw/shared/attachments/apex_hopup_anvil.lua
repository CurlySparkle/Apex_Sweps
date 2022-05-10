att.PrintName = "Hop-up - Anvil Receiver"
att.AbbrevName = "Anvil Receiver"
att.Icon = Material("entities/attach_icons/hopup_apex_anvil.png", "noclamp smooth")
att.Description = "Modifies the semi-automatic firing group of the weapon, firing an extra-powerful shot at the cost of fire rate and 2 ammo per shot."

att.SortOrder = 1

att.Desc_Pros = {
}
att.AutoStats = true
att.Slot = {"apex_hopup_anvil"}

att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
        Mult_RPM = 300 / 810,
        Mult_Damage = 2.5,
        Mult_DamageMin = 2.5,
        Add_AmmoPerShot = 1,
    }
}

att.EntityCategory = "ArcCW - Apex Legends (Att.)"
att.EntityIcon = "entities/attach_icons/hopup_apex_anvil.png"