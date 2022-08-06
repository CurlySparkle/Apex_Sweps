local ApexPanel_SV = {
    { type = "h", text = "#arccw.adminonly" },

    { type = "o", text = "#arccw.cvar.apex_bal", var = "arccw_apex_bal", sv = true,
            choices = {[-1] = "#arccw.cvar.apex_bal.-1", [0] = "#arccw.cvar.apex_bal.0", [1] = "#arccw.cvar.apex_bal.1", [2] = "#arccw.cvar.apex_bal.2"}},
    { type = "h", text = "#arccw.cvar.apex_bal.desc" },
    { type = "c", text = "#arccw.cvar.apex_bal.desc.0" },
    { type = "c", text = "#arccw.cvar.apex_bal.desc.1" },
    { type = "c", text = "#arccw.cvar.apex_bal.desc.2" },

    { type = "b", text = "#arccw.cvar.apex_freecharge", var = "arccw_apex_freecharge", sv = true },
    { type = "c", text = "#arccw.cvar.apex_freecharge.desc" },

    { type = "b", text = "#arccw.cvar.apex_ammo", var = "arccw_apex_ammo", sv = true },
    { type = "b", text = "#arccw.cvar.apex_ttt_ammo", var = "arccw_apex_ttt_ammo", sv = true },
    { type = "c", text = "#arccw.cvar.apex_ttt_ammo.desc" },
    --{ type = "b", text = "#arccw.cvar.apex_ttt_exclusive", var = "arccw_apex_ttt_exclusive", sv = true },
    --{ type = "c", text = "#arccw.cvar.apex_ttt_exclusive.desc" },

    { type = "b", text = "#arccw.cvar.apex_ttt_gas_halo", var = "arccw_apex_ttt_gas_halo", sv = true },
}
local ApexPanel_CL = {
    { type = "h", text = "#arccw.clientcfg" },
    { type = "b", text = "#arccw.cvar.apex_hitsound", var = "arccw_apex_hitsound"},
    { type = "b", text = "#arccw.cvar.apex_hitsound_headshot", var = "arccw_apex_hitsound_headshot"},
    { type = "b", text = "#arccw.cvar.apex_hitmarker", var = "arccw_apex_hitmarker"},
    { type = "b", text = "#arccw.cvar.apex_hitmarker_headshot", var = "arccw_apex_hitmarker_headshot"},
    { type = "i", text = "#arccw.cvar.apex_hitmarker_size", var = "arccw_apex_hitmarker_size", min = 16, max = 64},
}

--[[]
ArcCW.ClientMenus["ArcCW_Options_Apex_SV"] = ApexPanel_SV
ArcCW.ClientMenus["ArcCW_Options_Apex_CL"] = ApexPanel_CL
]]

hook.Add("PopulateToolMenu", "ArcCW_GSOE_Options", function()
    spawnmenu.AddToolMenuOption("Options", "ArcCW", "ArcCW_Options_Apex_SV", "#arccw.menus.apex.sv", "", "", function(panel)
        ArcCW.GeneratePanelElements(panel, ApexPanel_SV)
    end)
    spawnmenu.AddToolMenuOption("Options", "ArcCW", "ArcCW_Options_Apex_CL", "#arccw.menus.apex.cl", "", "", function(panel)
        ArcCW.GeneratePanelElements(panel, ApexPanel_CL)
    end)
end)

hook.Add("TTTSettingsTabs", "ArcCW_Apex", function(dtabs)

    local padding = dtabs:GetPadding() * 2

    local panellist = vgui.Create("DPanelList", dtabs)
    panellist:StretchToParent(0,0,padding,0)
    panellist:EnableVerticalScrollbar(true)
    panellist:SetPadding(10)
    panellist:SetSpacing(10)

    local form = vgui.Create("DForm", panellist)
    form:SetName("#arccw.menus.apex.sv")
    ArcCW.GeneratePanelElements(form, ApexPanel_SV)
    panellist:AddItem(form)

    local form2 = vgui.Create("DForm", panellist)
    form2:SetName("#arccw.menus.apex.cl")
    ArcCW.GeneratePanelElements(form2, ApexPanel_CL)
    panellist:AddItem(form2)

    dtabs:AddSheet("ArcCW Apex", panellist, "icon16/gun.png", false, false, "ArcCW Settings")
end)