CreateConVar("arccw_apex_bal", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Tweaks the balancing for the Apex Legends Weapons. See the options page under Options > ArcCW > Apex Settings for more information.", 0, 1)

ArcCW.ADSReload = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    local delta = wep:GetSightDelta()
    local coolilove = math.cos(delta * (math.pi / 2))
    vm:SetPoseParameter( "sights", Lerp(coolilove, 0, 1) ) -- thanks fesiug
end

if SERVER then
    util.AddNetworkString("arccw_apex_autoreload")
else

    --[[]
    surface.CreateFont("ArcCW_Apex_UI", {
        font = "Arial Bold",
        size = 18,
        weight = 500,
        antialias = true,
        extended = true,
    })
    ]]

    net.Receive("arccw_apex_autoreload", function()
        local wep = net.ReadEntity()

        LocalPlayer():EmitSound("items/UI_InGame_GoldMag_Reload_v3_0" .. math.random(1, 2) .. ".wav")

        if IsValid(Apex_AutoReloadPanel) then Apex_AutoReloadPanel:Remove() end
        Apex_AutoReloadPanel = vgui.Create("DImage")
        Apex_AutoReloadPanel:SetSize(512, 64)
        Apex_AutoReloadPanel:SetPos(ScrW() - 512 + 64, ScrH() * 0.7)
        Apex_AutoReloadPanel:SetImage(wep:GetBuff_Override("AutoReloadMaterial") or "entities/ammo_heavy_reloaded.png")

        Apex_AutoReloadPanel.Gun = vgui.Create("DImage", Apex_AutoReloadPanel)
        Apex_AutoReloadPanel.Gun:SetSize(killicon.GetSize(wep:GetClass()))
        Apex_AutoReloadPanel.Gun:SetPos(256 - Apex_AutoReloadPanel.Gun:GetWide() * 0.5, (64 - Apex_AutoReloadPanel.Gun:GetTall()) * 0.5)
        Apex_AutoReloadPanel.Gun:SetMaterial("VGUI/" .. string.Replace(wep:GetClass(), "arccw_apex_", "apex_killicon_"))

        --[[]
        local wepname = wep.PrintName
        Apex_AutoReloadPanel.Text = vgui.Create("DLabel", Apex_AutoReloadPanel)
        Apex_AutoReloadPanel.Text:SetFont("ArcCW_Apex_UI")
        Apex_AutoReloadPanel.Text:SetPos(256 + 16, 64 - 24)
        Apex_AutoReloadPanel.Text:SetText(wepname)
        ]]

        Apex_AutoReloadPanel.CreateTime = CurTime()
        Apex_AutoReloadPanel.Alpha = 1

        Apex_AutoReloadPanel.Think = function()
            if Apex_AutoReloadPanel.CreateTime + 3 < CurTime() then
                Apex_AutoReloadPanel.Alpha = math.Approach(Apex_AutoReloadPanel.Alpha, 0, FrameTime() * 1)
                if Apex_AutoReloadPanel.Alpha <= 0 then
                    Apex_AutoReloadPanel:Remove()
                else
                    Apex_AutoReloadPanel:SetAlpha(Apex_AutoReloadPanel.Alpha * 255)
                end
            end
        end
    end)
end