hook.Add( "PopulateToolMenu", "ArcCW_Apex_Options", function()
    spawnmenu.AddToolMenuOption( "Options", "ArcCW", "ArcCW_Apex_Options", "Apex Weapons", "", "", ArcCW_Apex_Options)
end )

function ArcCW_Apex_Options( CPanel )

    CPanel:AddControl("Header", {Description = "All options below are serverside and require a restart to apply."})
    CPanel:AddControl("Header", {Description = ""})

    CPanel:AddControl("Header", {Description = "Damage Balance."})
    CPanel:AddControl("Label", {Text = "This controls how the Apex weapons are balanced on their overall damage."})
    CPanel:AddControl("Slider", {Label = "What to balance?", Command = "arccw_apex_bal", min = 0, max = 1 })
    CPanel:AddControl("Label", {Text = "0. Apex Settings, the default damage balance as in Apex Legends."})
    CPanel:AddControl("Label", {Text = "1. ArcCW Settings, good for deathmatch servers. This will balance the weapons damage to behave similarly to other weaponry to make them feel more decent."})
    CPanel:AddControl("Label", {Text = "Altrough this will not change things such as fire rate or animation speeds and neiter recoil or accuracy. This primarily will only affect the damage for more decency agains't players or stronger NPCs."})
end