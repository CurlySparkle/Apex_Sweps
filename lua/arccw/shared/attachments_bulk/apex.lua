-------------------------------------------------
-- Magazines
-------------------------------------------------

local mag_types = {
    ["energy"] = {
        "Extended Energy Magazine",
        {
            [1] = {2, 4, 7, 7}, -- Volt SMG
        },
        "entities/ammo_light_reloaded.png",
        "models/weapons/attachments/upgrades/mag_energy.mdl",
    },
    ["light"] = {
        "Extended Light Magazine",
        {
            [1] = {2, 4, 7, 7},
            [2] = {3, 6, 9, 9}, -- RE-45
        },
        "entities/ammo_light_reloaded.png",
        "models/weapons/attachments/upgrades/mag_light.mdl",
    },
    ["heavy"] = {
        "Extended Heavy Magazine",
        {
            [1] = {1, 2, 3, 3}, -- Wingman
            [2] = {2, 4, 6, 6}, -- 30-30
            [3] = {5, 8, 10, 10}, -- VK-47 Flatline
            [4] = {6, 9, 12, 12}, -- Hemlok Burst AR
            [5] = {5, 10, 15, 15}, -- Prowler Burst SMG, M600 Spitfire
        },
        "entities/ammo_heavy_reloaded.png",
        "models/weapons/attachments/upgrades/mag_heavy.mdl",

    },
    ["sniper"] = {
        "Extended Sniper Magazine",
        {
            [1] = {1, 2, 3, 3}, -- Sentinel
            [2] = {2, 4, 6, 6}, -- Longbow DMR
        },
        "entities/ammo_sniper_reloaded.png",
        "models/weapons/attachments/upgrades/mag_sniper.mdl",
    },
}

local function autoreload(wep)
    local t = "apex_autoreload_" .. wep:EntIndex()
    if timer.Exists(t) then timer.Remove(t) end

    if wep:Clip1() < wep:GetCapacity() + wep:GetChamberSize() then
        timer.Create(t, 5, 1, function()
            if IsValid(wep) and (!IsValid(wep:GetOwner()) or wep:GetOwner():GetActiveWeapon() != wep) then
                wep:RestoreAmmo()
                if IsValid(wep:GetOwner()) and wep:GetOwner():IsPlayer() then
                    net.Start("arccw_apex_autoreload")
                        net.WriteEntity(wep)
                    net.Send(wep:GetOwner())
                end
            end
        end)
    end
end
local function autoreload2(wep)
    local t = "apex_autoreload_" .. wep:EntIndex()
    if timer.Exists(t) then timer.Remove(t) end
end

for k, v in pairs(mag_types) do
    for j = 1, #v[2] do
        for i = 1, 4 do
            if !v[2][j][i] then continue end
            local att = {}
            local l =  " - Level " .. i
            att.PrintName = v[1] .. l
            att.AbbrevName = "Extended Mag" .. l
            local icon = "entities/attach_icons/apex_ext_" .. k .. "_" .. i .. ".png"
            att.Icon = Material(icon, "mips smooth")
            att.Description = "apex.mag." .. i
            att.AutoStats = true
            att.Slot = "apex_mag_" .. k .. j
            att.SortOrder = i
            att.Add_ClipSize = v[2][j][i]

            att.EntityIcon = icon
            att.EntityCategory = "ArcCW - Apex Legends"

            if j > 1 then
                att.InvAtt = "apex_mag_" .. k .. "1_" .. i
            end

            if i == 4 then
                att.Hook_OnHolsterEnd = autoreload
                att.Hook_OnDeploy = autoreload2
                att.Desc_Pros = {"apex.autoreload"}
                att.AutoReloadMaterial = v[3]
            end

            att.DroppedModel = v[4]

            ArcCW.LoadAttachmentType(att, "apex_mag_" .. k .. j .. "_" .. i)
        end
    end
end