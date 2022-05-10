CreateConVar("arccw_apex_bal", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Tweaks the balancing for the Apex Legends Weapons. See the options page under Options > ArcCW > Apex Settings for more information.", 0, 1)
CreateConVar("arccw_apex_ammo", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED, "If set, use hl2 ammo types instead of custom ammo types.", 0, 1)

ArcCW.Apex = {}

ArcCW.Apex.BlendSights = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    local delta = wep:GetSightDelta()
    local coolilove = math.cos(delta * (math.pi / 2))
    vm:SetPoseParameter( "sights", Lerp(coolilove, 0, 1) ) -- thanks fesiug
end

game.AddAmmoType({name = "apex_light"})
game.AddAmmoType({name = "apex_heavy"})
game.AddAmmoType({name = "apex_shotgun"})
game.AddAmmoType({name = "apex_energy"})
game.AddAmmoType({name = "apex_sniper"})

ArcCW.Apex.AmmoConvert = {
    apex_light = "pistol",
    apex_heavy = "smg1",
    apex_energy = "ar2",
    apex_shotgun = "buckshot",
    apex_sniper = "SniperPenetratedRound"
}

function ArcCW.Apex.Setup(self, balance)
    local val = GetConVar("arccw_apex_bal"):GetInt()
    for i, v in pairs(balance[val]) do
        self[i] = v
    end

    if not GetConVar("arccw_apex_ammo"):GetBool() then
        self.Primary.Ammo = ArcCW.Apex.AmmoConvert[self.Primary.Ammo]
    end
end

if SERVER then
    util.AddNetworkString("arccw_apex_autoreload")
else
    net.Receive("arccw_apex_autoreload", function()
        local wep = net.ReadEntity()

        LocalPlayer():EmitSound("items/UI_InGame_GoldMag_Reload_v3_0" .. math.random(1, 3) .. ".wav")

        if IsValid(Apex_AutoReloadPanel) then Apex_AutoReloadPanel:Remove() end
        Apex_AutoReloadPanel = vgui.Create("DImage")
        Apex_AutoReloadPanel:SetSize(512, 64)
        Apex_AutoReloadPanel:SetPos(ScrW() - 512 + 64, ScrH() * 0.7)
        Apex_AutoReloadPanel:SetImage(wep:GetBuff_Override("AutoReloadMaterial") or "entities/ammo_heavy_reloaded.png")

        Apex_AutoReloadPanel.Gun = vgui.Create("DImage", Apex_AutoReloadPanel)
        Apex_AutoReloadPanel.Gun:SetSize(killicon.GetSize(wep:GetClass()))
        Apex_AutoReloadPanel.Gun:SetPos(256 - 24 - Apex_AutoReloadPanel.Gun:GetWide() * 0.5, (64 - Apex_AutoReloadPanel.Gun:GetTall()) * 0.5)
        Apex_AutoReloadPanel.Gun:SetMaterial("VGUI/" .. string.Replace(wep:GetClass(), "arccw_apex_", "apex_killicon_"))

        Apex_AutoReloadPanel.CreateTime = CurTime()
        Apex_AutoReloadPanel.Alpha = 0

        Apex_AutoReloadPanel.Think = function()
            if Apex_AutoReloadPanel.CreateTime + 3.5 < CurTime() then
                Apex_AutoReloadPanel.Alpha = math.Approach(Apex_AutoReloadPanel.Alpha, 0, FrameTime() * 2)
                if Apex_AutoReloadPanel.Alpha <= 0 then
                    Apex_AutoReloadPanel:Remove()
                end
            elseif Apex_AutoReloadPanel.Alpha < 1 then
                Apex_AutoReloadPanel.Alpha = math.Approach(Apex_AutoReloadPanel.Alpha, 1, FrameTime() * 5)
            end
            Apex_AutoReloadPanel:SetAlpha(Apex_AutoReloadPanel.Alpha * 255)
        end
    end)
end