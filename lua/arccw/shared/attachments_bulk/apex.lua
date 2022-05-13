-------------------------------------------------
-- Magazines
-------------------------------------------------

local mag_types = {
    ["energy"] = {
        "Extended Energy Magazine",
        {
            [1] = {2, 4, 7, 7}, -- Volt SMG
            [2] = {4, 8, 12, 12}, -- Devotion LMG, HAVOC
			[3] = {3, 6, 9, 9}, -- Triple Take
        },
        "entities/ammo_energy_reloaded.png",
        "models/weapons/attachments/upgrades/mag_energy.mdl",
    },
    ["light"] = {
        "Extended Light Magazine",
        {
            [1] = {2, 4, 7, 7},
            [2] = {3, 6, 9, 9}, -- RE-45
            [3] = {2, 7, 10, 10}, -- R-301
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
            att.EntityCategory = "ArcCW - Apex Legends (Att.)"

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

-------------------------------------------------
-- Barrel Extenders & Stabilizers
-------------------------------------------------

local stab = {
    [1] = {
        Mult_Recoil = 0.9,
        Mult_RecoilSide = 0.8,
        Add_BarrelLength = 4,
    },
    [2] = {
        Mult_Recoil = 0.85,
        Mult_RecoilSide = 0.65,
        Add_BarrelLength = 6,
    },
    [3] = {
        Mult_Recoil = 0.75,
        Mult_RecoilSide = 0.5,
        Add_BarrelLength = 8,
    },
}

local supp = {
    [1] = {
        Mult_AccuracyMOA = 0.8,
        Mult_PhysBulletMuzzleVelocity = 1.1,
        Mult_MoveDispersion = 0.85,
        Add_BarrelLength = 4,
    },
    [2] = {
        Mult_AccuracyMOA = 0.65,
        Mult_PhysBulletMuzzleVelocity = 1.15,
        Mult_MoveDispersion = 0.75,
        Add_BarrelLength = 6,
    },
    [3] = {
        Mult_AccuracyMOA = 0.5,
        Mult_PhysBulletMuzzleVelocity = 1.25,
        Mult_MoveDispersion = 0.6,
        Add_BarrelLength = 8,
    },
}

local noshotguns = function(wep)
    if wep:GetIsShotgun() then return false end
end

for i = 1, 3 do
    local att = table.Copy(stab[i])

    att.PrintName = "Barrel Stabilizer - Level " .. i
    local icon = "entities/attach_icons/apex_barrel_" .. i .. ".png"
    att.Icon = Material(icon, "mips smooth")
    att.Description = "apex.barrel.stabilizer." .. i
    att.AutoStats = true
    att.Slot = "apex_muzzle"
	att.Override_MuzzleEffect = "muzzle_pistols_l4d"
    att.SortOrder = 10
    att.Override_MuzzleEffectAttachment = 1
    att.IsMuzzleDevice = true
    att.Model = "models/weapons/attachments/barrel_" .. i .. ".mdl"

    att.EntityIcon = icon
    att.EntityCategory = "ArcCW - Apex Legends (Att.)"

    att.Hook_Compatible = noshotguns

    ArcCW.LoadAttachmentType(att, "apex_muzz_stab_" .. i)

    local att2 = table.Copy(supp[i])

    att2.PrintName = "Barrel Extender - Level " .. i
    local icon2 = "entities/attach_icons/apex_suppressor_" .. i .. ".png"
    att2.Icon = Material(icon2, "mips smooth")
    att2.Description = "apex.barrel.suppressor." .. i
    att2.AutoStats = true
    att2.Slot = "apex_muzzle"
	att2.Override_MuzzleEffect = "muzzle_pistols_l4d"
    att2.SortOrder = 5
    att2.Override_MuzzleEffectAttachment = 1
    att2.IsMuzzleDevice = true
    att2.Model = "models/weapons/attachments/barrel_" .. (i + 3) .. ".mdl"

    att2.EntityIcon = icon2
    att2.EntityCategory = "ArcCW - Apex Legends (Att.)"

    att2.Hook_Compatible = noshotguns

    ArcCW.LoadAttachmentType(att2, "apex_muzz_supp_" .. i)
end

