local ApexPanel = {
    { type = "h", text = "#arccw.apex_info" },

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
    { type = "b", text = "#arccw.cvar.apex_ttt_exclusive", var = "arccw_apex_ttt_exclusive", sv = true },
    { type = "c", text = "#arccw.cvar.apex_ttt_exclusive.desc" },

}

hook.Add("PopulateToolMenu", "ArcCW_GSOE_Options", function()
    spawnmenu.AddToolMenuOption("Options", "ArcCW", "ArcCW_Options_Apex", "#arccw.menus.apex", "", "", function(panel)
        ArcCW.GeneratePanelElements(panel, ApexPanel)
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
    form:SetName("#arccw.menus.apex")
    ArcCW.GeneratePanelElements(form, ApexPanel)
    panellist:AddItem(form)

    dtabs:AddSheet("ArcCW Apex", panellist, "icon16/gun.png", false, false, "ArcCW Settings")
end)