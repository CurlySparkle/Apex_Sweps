local rand_weight = {
    [1] = 55,
    [2] = 25,
    [3] = 19,
    [4] = 1,
}

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
            [4] = {4, 6, 12, 12}, -- Rampage
        },
        "entities/ammo_energy_reloaded.png",
        "models/weapons/attachments/upgrades/mag_energy.mdl",
    },
    ["light"] = {
        "Extended Light Magazine",
        {
            [1] = {2, 4, 7, 7}, -- CAR SMG
            [2] = {3, 6, 9, 9}, -- RE-45
            [3] = {2, 7, 10, 10}, -- R-301
            [4] = {3, 6, 8, 8}, -- Alternator
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
            [6] = {2, 4, 7, 7}, -- CAR SMG
            [7] = {4, 6, 12, 12}, -- Rampage LMG
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
            att.RandomWeight = rand_weight[i]

            att.Add_ClipSize = v[2][j][i]

            if j > 1 then
                att.InvAtt = "apex_mag_" .. k .. "1_" .. i
            else
                att.EntityIcon = icon
                att.EntityCategory = "ArcCW - Apex Legends (Att.)"
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

-- L-STAR magazine
for i = 1, 4 do
    local att = {}
    att.PrintName = "Extended Energy Magazine - Level " .. i
    att.AbbrevName = "Extended Mag - Level " .. i
    att.Icon = Material("entities/attach_icons/apex_ext_energy_" .. i .. ".png", "mips smooth")
    att.Description = "apex.mag." .. i
    att.AutoStats = true
    att.Slot = "apex_mag_lstar"
    att.SortOrder = i
    att.RandomWeight = rand_weight[i]

    att.Mult_HeatCapacity = 1 + math.min(i, 3) * 0.1
    att.Mult_HeatDissipation = 1 + math.min(i, 3) * 0.1

    att.InvAtt = "apex_mag_energy1_" .. i

    att.DroppedModel = "models/weapons/attachments/upgrades/mag_energy.mdl"

    ArcCW.LoadAttachmentType(att, "apex_mag_lstar_" .. i)
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
        Mult_MoveDispersion = 0.8,
        Add_BarrelLength = 4,
    },
    [2] = {
        Mult_AccuracyMOA = 0.65,
        Mult_PhysBulletMuzzleVelocity = 1.15,
        Mult_MoveDispersion = 0.65,
        Add_BarrelLength = 6,
    },
    [3] = {
        Mult_AccuracyMOA = 0.5,
        Mult_PhysBulletMuzzleVelocity = 1.3,
        Mult_MoveDispersion = 0.5,
        Add_BarrelLength = 8,
    },
}

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
    att.RandomWeight = rand_weight[i]

    att.EntityIcon = icon
    att.EntityCategory = "ArcCW - Apex Legends (Att.)"

    att.AttachSound = "items/player_pickup_loot_attachment_2ch_v1_" .. i .. ".wav"
    att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_" .. i .. ".wav"
    att.ToggleSound = "items/UI_Menu_Select.wav"

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
    att2.RandomWeight = rand_weight[i]

    att2.EntityIcon = icon2
    att2.EntityCategory = "ArcCW - Apex Legends (Att.)"

    att2.AttachSound = "items/player_pickup_loot_attachment_2ch_v1_" .. i .. ".wav"
    att2.DetachSound = "items/player_drop_loot_attachment_2ch_v1_" .. i .. ".wav"
    att2.ToggleSound = "items/UI_Menu_Select.wav"

    ArcCW.LoadAttachmentType(att2, "apex_muzz_supp_" .. i)
end

-------------------------------------------------
-- Stocks
-------------------------------------------------

local stock_types = {
    ["standard"] = {
        "Standard Stock",
        "models/weapons/attachments/upgrades/stock_regular.mdl",
        "entities/attach_icons/apex_stock_{}.png",
        {
            -- All (excl. L-STAR)
            [1] = {
                [1] = {
                    Mult_ReloadTime = 0.967,
                    Mult_DrawTime = 0.85,
                    Mult_HolsterTime = 0.85,
                    Mult_SightTime = 0.85,
                    Mult_Sway = 0.85,
                },
                [2] = {
                    Mult_ReloadTime = 0.933,
                    Mult_DrawTime = 0.8,
                    Mult_HolsterTime = 0.8,
                    Mult_SightTime = 0.8,
                    Mult_Sway = 0.75,
                },
                [3] = {
                    Mult_ReloadTime = 0.9,
                    Mult_DrawTime = 0.75,
                    Mult_HolsterTime = 0.75,
                    Mult_SightTime = 0.75,
                    Mult_Sway = 0.55,
                }
            },
            -- L-STAR
            [2] = {
                [1] = {
                    Mult_FixTime = 0.967,
                    Mult_DrawTime = 0.85,
                    Mult_HolsterTime = 0.85,
                    Mult_SightTime = 0.85,
                    Mult_Sway = 0.85,
                },
                [2] = {
                    Mult_FixTime = 0.933,
                    Mult_DrawTime = 0.8,
                    Mult_HolsterTime = 0.8,
                    Mult_SightTime = 0.8,
                    Mult_Sway = 0.75,
                },
                [3] = {
                    Mult_FixTime = 0.9,
                    Mult_DrawTime = 0.75,
                    Mult_HolsterTime = 0.75,
                    Mult_SightTime = 0.75,
                    Mult_Sway = 0.55,
                }
            }
        },
    },
    ["sniper"] = {
        "Sniper Stock",
        "models/weapons/attachments/upgrades/stock_sniper.mdl",
        "entities/attach_icons/apex_stock_sniper_{}.png",
        {
            -- All (excl. 30-30)
            [1] = {
                [1] = {
                    Mult_ReloadTime = 0.967,
                    Mult_DrawTime = 0.9,
                    Mult_HolsterTime = 0.9,
                    Mult_SightTime = 0.9,
                    Mult_Sway = 0.85,
                },
                [2] = {
                    Mult_ReloadTime = 0.933,
                    Mult_DrawTime = 0.85,
                    Mult_HolsterTime = 0.85,
                    Mult_SightTime = 0.85,
                    Mult_Sway = 0.5,
                },
                [3] = {
                    Mult_ReloadTime = 0.9,
                    Mult_DrawTime = 0.8,
                    Mult_HolsterTime = 0.8,
                    Mult_SightTime = 0.8,
                    Mult_Sway = 0.2,
                }
            },
            -- 30-30
            [2] = {
                [1] = {
                    Mult_ReloadTime = 0.95,
                    Mult_DrawTime = 0.9,
                    Mult_HolsterTime = 0.9,
                    Mult_SightTime = 0.9,
                    Mult_Sway = 0.85,
                },
                [2] = {
                    Mult_ReloadTime = 0.875,
                    Mult_DrawTime = 0.85,
                    Mult_HolsterTime = 0.85,
                    Mult_SightTime = 0.85,
                    Mult_Sway = 0.5,
                },
                [3] = {
                    Mult_ReloadTime = 0.8,
                    Mult_DrawTime = 0.8,
                    Mult_HolsterTime = 0.8,
                    Mult_SightTime = 0.8,
                    Mult_Sway = 0.2,
                }
            }
        },
    }
}


for k, v in pairs(stock_types) do
    for j = 1, #v[4] do
        for i = 1, #v[4][j] do
            local att = table.Copy(v[4][j][i])
            local l =  " - Level " .. i
            att.PrintName = v[1] .. l
            att.AbbrevName = (v[5] or v[1]) .. l
            local icon = string.Replace(v[3], "{}", i)
            att.Icon = Material(icon, "mips smooth")
            att.Description = "apex.stock." .. i
            att.AutoStats = true
            att.Slot = "apex_stock_" .. k .. (j > 1 and j or "")
            att.SortOrder = i
            att.RandomWeight = rand_weight[i]

            att.AttachSound = "items/player_pickup_loot_attachment_2ch_v1_" .. i .. ".wav"
            att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_" .. i .. ".wav"
            att.ToggleSound = "items/UI_Menu_Select.wav"

            if j > 1 then
                att.InvAtt = "apex_stock_" .. k .. "_" .. i
            else
                att.EntityIcon = icon
                att.EntityCategory = "ArcCW - Apex Legends (Att.)"
            end

            att.DroppedModel = v[2]

            ArcCW.LoadAttachmentType(att, "apex_stock_" .. k .. (j > 1 and j or "") .. "_" .. i)
        end
    end
end

-------------------------------------------------
-- Shotgun Bolts & Loaders
-------------------------------------------------

local bolt = {
    [1] = {
        Mult_RPM = 1.1,
        Mult_CycleTime = 0.92,
    },
    [2] = {
        Mult_RPM = 1.15,
        Mult_CycleTime = 0.87,
    },
    [3] = {
        Mult_RPM = 1.2,
        Mult_CycleTime = 0.83,
    },
}

local loader = {
    [1] = {
        Mult_ReloadTime = 0.9,
    },
    [2] = {
        Mult_ReloadTime = 0.85,
    },
    [3] = {
        Mult_ReloadTime = 0.8,

    },
}

for i = 1, 3 do
    local att = table.Copy(bolt[i])

    att.PrintName = "Shotgun Bolt - Level " .. i
    local icon = "entities/attach_icons/apex_pump_" .. i .. ".png"
    att.Icon = Material(icon, "mips smooth")
    att.Description = "apex.sg.bolt." .. i
    att.AutoStats = true
    att.Slot = "apex_sg"
    att.SortOrder = 10

    att.Model = "models/weapons/attachments/upgrades/mag_heavy2.mdl"
    att.RandomWeight = rand_weight[i]

    att.EntityIcon = icon
    att.EntityCategory = "ArcCW - Apex Legends (Att.)"

    att.AttachSound = "items/player_pickup_loot_attachment_2ch_v1_" .. i .. ".wav"
    att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_" .. i .. ".wav"
    att.ToggleSound = "items/UI_Menu_Select.wav"

    ArcCW.LoadAttachmentType(att, "apex_sg_bolt_" .. i)

    local att2 = table.Copy(loader[i])

    att2.PrintName = "Shotgun Loader - Level " .. i
    local icon2 = "entities/attach_icons/apex_pump_" .. i .. ".png"
    att2.Icon = Material(icon2, "mips smooth")
    att2.Description = "apex.sg.load." .. i
    att2.AutoStats = true
    att2.Slot = "apex_sg"
    att2.SortOrder = 5

    att2.DroppedModel = "models/weapons/attachments/upgrades/mag_heavy2.mdl"
    att2.RandomWeight = rand_weight[i]

    att2.EntityIcon = icon2
    att2.EntityCategory = "ArcCW - Apex Legends (Att.)"

    att2.AttachSound = "items/player_pickup_loot_attachment_2ch_v1_" .. i .. ".wav"
    att2.DetachSound = "items/player_drop_loot_attachment_2ch_v1_" .. i .. ".wav"
    att2.ToggleSound = "items/UI_Menu_Select.wav"

    ArcCW.LoadAttachmentType(att2, "apex_sg_load_" .. i)
end

-------------------------------------------------
-- Hop-ups
-------------------------------------------------

local function loadertime(wep, data)
    local cs = wep:GetBuff("ClipSize", true, wep.RegularClipSize or wep.Primary.ClipSize)
    if wep:Clip1() > 0 and wep:Clip1() <= cs * (wep:GetBuff_Override("ApexLoaderMin") or 0) then
        data.mult = data.mult * 0.75
    end
end
local function loadercapacity(wep, data)
    local cs = wep:GetBuff("ClipSize", true, wep.RegularClipSize or wep.Primary.ClipSize)
    if wep:Clip1() > 0 and (wep:Clip1() <= cs * (wep:GetBuff_Override("ApexLoaderMin") or 0) or wep:Clip1() > cs) then
        return cs + (wep:GetBuff_Override("ApexLoaderAdd") or 0)
    end
end


local hopups = {
    ["dtap"] = {
        name = "Double Tap Trigger",
        icon = "entities/attach_icons/hopup_apex_doubletap.png",
        desc = "Gives the weapon an additional firemode that shoots two rounds in rapid succession.",
        variants = {
            -- G7 Scout
            [1] = {
                Override_Firemodes = {
                    {
                        Mode = 1,
                    },
                    {
                        Mode = -2,
                        RunawayBurst = true,
                        PostBurstDelay = 0.333,
                        Mult_RPM = 5,
                        Override_ShotRecoilTable = {[1] = 0.1},
                    }
                }
            },
            -- EVA-8 Auto
            [2] = {
                Override_Firemodes = {
                    {
                        Mode = 2,
                    },
                    {
                        Mode = -2,
                        RunawayBurst = true,
                        PostBurstDelay = 0.45,
                        Mult_RPM = 4,
                    }
                }
            },
            -- Mozambique
            [3] = {
                Override_Firemodes = {
                    {
                        Mode = 1,
                    },
                    {
                        Mode = -2,
                        RunawayBurst = true,
                        PostBurstDelay = 0.6,
                        Mult_RPM = 4,
                    }
                }
            },
            -- Alternator
            [4] = {
                Override_Firemodes = {
                    {
                        Mode = 2,
                    },
                    {
                        Mode = 2,
                        PrintName = "fcg.apex.alt",
                        Mult_RPM = 0.5,
                    }
                },
                Hook_ModifyRPM = function(wep, delay)
                    if wep:GetFireMode() == 2 and wep:GetBurstCount() % 2 == 0 then
                        return 0.035
                    end
                end
            }
        }
    },
    ["turbo"] = {
        name = "Turbocharger",
        icon = "entities/attach_icons/hopup_apex_turbocharger.png",
        variants = {
            -- HAVOC
            [1] = {
                Description = "Improves performance of wind-up weapons.\n\nThe HAVOC can shoot immediately without charging up.",
                Override_TriggerDelay = false,
                ActivateElements = {"charged_skin"},
            },
            -- Devotion
            [2] = {
                Description = "Improves performance of wind-up weapons.\n\nThe Devotion reaches its maximum firerate much faster.",
                Hook_ModifyRPM = function(wep, delay)
                    return delay / Lerp(wep:GetBurstCount() / 10, 1, 3)
                end,
                Hook_ModifyRPM_Priority = 10,
            },
            -- Charge Rifle
            [3] = {
                Description = "Improves performance of wind-up weapons.\n\nThe Charge Rifle fires its charge quicker, but does less damage.\nFurthermore, it will use 1 Energy Ammo per shot instead of 2 Sniper Ammo.",
                Mult_Damage = 30 / 45,
                Mult_DamageMin = 20 / 30,
                Override_Firemodes = {
                    {
                        PrintName = "fcg.semi",
                        Mode = -11,
                        RunawayBurst = true,
                        PostBurstDelay = 0.25,
                        Mult_RPM = 1.5,
                    }
                },
                Override_AmmoPerShot = 1,
                Override_Ammo = "apex_energy",
                Hook_SelectFireAnimation = function(wep, curanim)
                    if wep:GetBurstCount() <= 1 and wep.Animations[curanim .. "_windup2"] then
                        return curanim .. "_windup2"
                    elseif wep:GetBurstCount() <= (-wep:GetCurrentFiremode().Mode - 1) then
                        return ""
                    end
                end,
                Hook_SelectFireAnimation_Priority = 100
            },
        }
    },
    ["selfire"] = {
        name = "Selectfire Receiver",
        icon = "entities/attach_icons/hopup_apex_selectfire.png",
        variants = {
            -- Prowler SMG
            [1] = {
                Description = "Weapons gains an alternative firemode.\n\nThe Prowler receives an automatic firemode with increased recoil and decreased firerate.",
                Override_Firemodes = {
                    {
                        Mode = -5,
                        RunawayBurst = true,
                    },
                    {
                        Mode = 2,
                        Mult_RPM = 900 / 1260,
                        Mult_Recoil = 1.25,
                        Mult_RecoilSide = 1.5
                    }
                }
            },
            -- HAVOC
            [2] = {
                Description = "Weapons gains an alternative firemode.\n\nThe HAVOC receives a semi-automatic firemode that releases a laser beam.",
                Override_Firemodes = {
                    {
                        Mode = 2,
                    },
                    {
                        Mode = 1,
                        Mult_RPM = 107 / 672,
                        Mult_Recoil = 0.85,
                        Mult_RecoilSide = 0.85,
                        Add_AmmoPerShot = 3,
                        Override_Damage = 60,
                        Override_DamageMin = 50,
                        Override_Tracer = "arccw_apex_tracer_havoc",
                        Override_AlwaysPhysBullet = false,
                        Override_NeverPhysBullet = true,
                    }
                },
                Hook_GetShootSound = function(wep, fsound)
                    if wep:GetCurrentFiremode().Mode == 1 and fsound == wep.FirstShootSound then return "ArcCW_APEX.Havoc.Fire_Alt" elseif fsound == wep.FirstShootSound then return "ArcCW_APEX.Havoc.Fire_Start" end
                end
            },
            -- P2020
            [3] = {
                Description = "Weapons gains an alternative firemode.\n\nThe P2020 receives a 3-round burst mode with increased muzzle velocity.",
                Override_Firemodes = {
                    {
                        Mode = 1,
                    },
                    {
                        Mode = -3,
                        Mult_RPM = 1.5,
                        PostBurstDelay = 0.25,
                        RunawayBurst = true,
                        Mult_PhysBulletMuzzleVelocity = 1.5,
                    }
                }
            },
            -- Hemlok
            [4] = {
                Description = "Weapons gains an alternative firemode.\n\nThe Hemlok receives an automatic firemode with reduced firerate.",
                Override_Firemodes = {
                    {
                        Mode = -3,
                        RunawayBurst = true,
                        PostBurstDelay = 0.175,
                    },
                    {
                        Mode = 2,
                        Mult_RPM = 550 / 900,
                    },
                    {
                        Mode = 1,
                    }
                }
            },
            -- G7 Scout
            [5] = {
                Description = "Weapons gains an alternative firemode.\n\nThe G7 Scout receives a faster semi-automatic firemode with less damage and recoil.",
                Override_Firemodes = {
                    {
                        Mode = 1,
                    },
                    {
                        Mode = 1,
                        Mult_RPM = 360 / 240,
                        Mult_Damage = 30 / 36,
                        Mult_DamageMin = 30 / 36,
                        Mult_Recoil = 0.85,
                        PrintName = "fcg.apex.rapid",
                    }
                }
            },
        },
        variants_ttt = {
            [2] = {
                Description = "Weapons gains an alternative firemode.\n\nThe HAVOC receives a semi-automatic firemode that releases a laser beam.",
                Override_Firemodes = {
                    {
                        Mode = 2,
                    },
                    {
                        Mode = 1,
                        Mult_RPM = 107 / 672,
                        Mult_Recoil = 0.85,
                        Mult_RecoilSide = 0.85,
                        Add_AmmoPerShot = 3,
                        Override_Range = 50,
                        Override_RangeMin = 15,
                        Override_Damage = 57,
                        Override_DamageMin = 40,
                        Override_Tracer = "arccw_apex_tracer_havoc",
                        Override_AlwaysPhysBullet = false,
                        Override_NeverPhysBullet = true,
                    }
                },
                Hook_GetShootSound = function(wep, fsound)
                    if wep:GetCurrentFiremode().Mode == 1 and fsound == wep.FirstShootSound then return "ArcCW_APEX.Havoc.Fire_Alt" elseif fsound == wep.FirstShootSound then return "ArcCW_APEX.Havoc.Fire_Start" end
                end
            },
        }
    },
    ["hp"] = {
        name = "Hammerpoint Rounds",
        icon = "entities/attach_icons/hopup_apex_hammerpoint.png",
        desc = "Weapon damage against non-armored players is increased significantly.",
        variants = {
            -- P2020
            [1] = {
                Hook_BulletHit = function(wep, data)
                    if IsValid(data.tr.Entity) and data.tr.Entity:IsPlayer() and data.tr.Entity:Armor() <= 0 and (engine.ActiveGamemode() != "terrortown" or !data.tr.Entity:HasEquipmentItem(EQUIP_ARMOR)) then
                        -- this doesn't do the fancy check apex does, but also hl2 armor is weird and I would prefer to work with a new armor system
                        data.damage = data.damage * 1.5
                    end
                end,
                Hook_GetShootSound = function(wep, fsound)
                    if wep:GetCurrentFiremode().Mode == 1 and fsound == wep.ShootSound then return "ArcCW_APEX.P2020_HammerPoint.Fire" elseif fsound == wep.ShootSound then return "ArcCW_APEX.P2020.Fire" end
                end
            },
            -- RE-45 Auto
            [2] = {
                Hook_BulletHit = function(wep, data)
                    if IsValid(data.tr.Entity) and data.tr.Entity:IsPlayer() and data.tr.Entity:Armor() <= 0 and (engine.ActiveGamemode() != "terrortown" or !data.tr.Entity:HasEquipmentItem(EQUIP_ARMOR)) then
                        data.damage = data.damage * 1.35
                    end
                end
            },
            -- Mozambique
            [3] = {
                Hook_BulletHit = function(wep, data)
                    if IsValid(data.tr.Entity) and data.tr.Entity:IsPlayer() and data.tr.Entity:Armor() <= 0 and (engine.ActiveGamemode() != "terrortown" or !data.tr.Entity:HasEquipmentItem(EQUIP_ARMOR)) then
                        data.damage = data.damage * 1.35
                    end
                end,
                Hook_GetShootSound = function(wep, fsound)
                    if wep:GetCurrentFiremode().Mode == 1 and fsound == wep.ShootSound then return "ArcCW_APEX.Mozambique_Hammer.Fire" elseif fsound == wep.ShootSound then return "ArcCW_APEX.Mozambique.Fire" end
                end
            },
        },
        variants_ttt = {
            [1] = {
                Hook_BulletHit = function(wep, data)
                    if IsValid(data.tr.Entity) and data.tr.Entity:IsPlayer() and data.tr.Entity:Armor() <= 0 and (engine.ActiveGamemode() != "terrortown" or !data.tr.Entity:HasEquipmentItem(EQUIP_ARMOR)) then
                        data.damage = data.damage * 1.3
                    end
                end
            },
            [2] = {
                Hook_BulletHit = function(wep, data)
                    if IsValid(data.tr.Entity) and data.tr.Entity:IsPlayer() and data.tr.Entity:Armor() <= 0 and (engine.ActiveGamemode() != "terrortown" or !data.tr.Entity:HasEquipmentItem(EQUIP_ARMOR)) then
                        data.damage = data.damage * 1.15
                    end
                end
            },
            [3] = {
                Hook_BulletHit = function(wep, data)
                    if IsValid(data.tr.Entity) and data.tr.Entity:IsPlayer() and data.tr.Entity:Armor() <= 0 and (engine.ActiveGamemode() != "terrortown" or !data.tr.Entity:HasEquipmentItem(EQUIP_ARMOR)) then
                        data.damage = data.damage * 1.15
                    end
                end,
                Hook_GetShootSound = function(wep, fsound)
                    if wep:GetCurrentFiremode().Mode == 1 and fsound == wep.ShootSound then return "ArcCW_APEX.Mozambique_Hammer.Fire" elseif fsound == wep.ShootSound then return "ArcCW_APEX.Mozambique.Fire" end
                end
            },
        },
    },
    ["anvil"] = {
        name = "Anvil Receiver",
        icon = "entities/attach_icons/hopup_apex_anvil.png",
        desc = "The weapon's semi-automatic fire mode is modified to fire an slower, more powerful shot that costs 2 rounds.",
        variants = {
            -- R-301 Carbine
            [1] = {
                Override_Firemodes = {
                    {
                        Mode = 2,
                    },
                    {
                        Mode = 1,
                        Mult_RPM = 300 / 810,
                        Mult_Damage = 2.5,
                        Mult_DamageMin = 2.5,
                        Add_AmmoPerShot = 1,
                        Override_Tracer = "arccw_apex_tracer_anvil"
                    }
                }
            },
            -- VK-47 Flatline
            [2] = {
                Override_Firemodes = {
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
            }
        }
    },
    ["qdraw"] = {
        name = "Quickdraw Holster",
        icon = "entities/attach_icons/hopup_apex_quickdrawholster.png",
        desc = "Improves the weapon's handling speed drastically.",
        variants = {
            [1] = {
                Mult_DrawTime = 0.25,
                Mult_HolsterTime = 0.25,
                Mult_SightTime = 0.25,
                Mult_HipDispersion = 0.5,
            }
        }
    },
    ["shatter"] = {
        name = "Shatter Caps",
        icon = "entities/attach_icons/hopup_apex_shattercaps.png",
        variants = {
            -- 30-30 Repeater
            [1] = {
                Description = "Weapon gains an additional firemode that shoots 7 pellets in a shotgun pattern, but cannot charge up damage.",
                Override_Firemodes = {
                    {
                        Mode = 1,
                        ApexCharge = true,
                        PrintName = "fcg.lever"
                    },
                    {
                        PrintName = "fcg.apex.shatter",
                        ApexCharge = true,
                        Mode = 1,
                        Override_Num = 7,
                        Override_Damage = 49,
                        Override_DamageMin = 49,
                        Override_AccuracyMOA = 35,
                        Mult_HipDispersion = 0.5,
                    }
                }
            },
            -- RE-45 Auto
            [2] = {
                Description = "Weapon gains an additional firemode that shoots 3 pellets in a shotgun pattern, consuming 2 rounds per shot at a lower rate of fire.",
                Override_Firemodes = {
                    {
                        Mode = 2,
                    },
                    {
                        PrintName = "fcg.apex.shatter",
                        Mode = 2,
                        Override_Num = 3,
                        Override_Damage = 30,
                        Override_DamageMin = 30,
                        Override_AccuracyMOA = 40,
                        Override_AmmoPerShot = 2,
                        Mult_RPM = 0.75
                    }
                }
            },
            -- Kraber 50cal Sniper
            [3] = {
                Description = "Weapon gains an additional firemode that shoots 24 pellets in a shotgun pattern.",
                Override_Firemodes = {
                    {
                        Mode = 1,
                        PrintName = "fcg.bolt"
                    },
                    {
                        PrintName = "fcg.apex.shatter",
                        Mode = 1,
                        Override_Num = 24,
                        Override_Damage = 144,
                        Override_DamageMin = 144,
                        Override_AccuracyMOA = 45
                    }
                }
            },
        },
        variants_ttt = {
            [1] = {
                Description = "Weapon gains an additional firemode that shoots 7 pellets in a shotgun pattern, but cannot charge up damage.",
                Override_Firemodes = {
                    {
                        Mode = 1,
                        ApexCharge = true,
                        PrintName = "fcg.lever"
                    },
                    {
                        PrintName = "fcg.apex.shatter",
                        Mode = 1,
                        Override_Num = 7,
                        Override_Damage = 35,
                        Override_DamageMin = 35,
                        Override_AccuracyMOA = 35,
                        Mult_HipDispersion = 0.5,
                        Override_BodyDamageMults = {
                            [HITGROUP_HEAD] = 1.25,
                            [HITGROUP_CHEST] = 1,
                            [HITGROUP_STOMACH] = 1,
                            [HITGROUP_LEFTARM] = 1,
                            [HITGROUP_RIGHTARM] = 1,
                            [HITGROUP_LEFTLEG] = 0.8,
                            [HITGROUP_RIGHTLEG] = 0.8,
                        }
                    }
                }
            },
            [2] = {
                Description = "Weapon gains an additional firemode that shoots 3 pellets in a shotgun pattern, consuming 2 rounds per shot at a lower rate of fire.",
                Override_Firemodes = {
                    {
                        Mode = 2,
                    },
                    {
                        PrintName = "fcg.apex.shatter",
                        Mode = 2,
                        Override_Num = 3,
                        Override_Damage = 24,
                        Override_DamageMin = 24,
                        Override_AccuracyMOA = 40,
                        Override_AmmoPerShot = 2,
                        Mult_RPM = 0.75
                    }
                }
            },
        }
    },
    ["skull"] = {
        name = "Skullpiercer Rifling",
        icon = "entities/attach_icons/hopup_apex_skullpiercer.png",
        desc = "Weapon does increased damage on a headshot.",
        variants = {
            -- Wingman
            [1] = {
                Override_BodyDamageMults = {
                    [HITGROUP_HEAD] = 2.5,
                    [HITGROUP_CHEST] = 1,
                    [HITGROUP_STOMACH] = 1,
                    [HITGROUP_LEFTARM] = 1,
                    [HITGROUP_RIGHTARM] = 1,
                    [HITGROUP_LEFTLEG] = 0.9,
                    [HITGROUP_RIGHTLEG] = 0.9,
                }
            },
            -- Longbow DMR
            [2] = {
                Override_BodyDamageMults = {
                    [HITGROUP_HEAD] = 2.5,
                    [HITGROUP_CHEST] = 1,
                    [HITGROUP_STOMACH] = 1,
                    [HITGROUP_LEFTARM] = 1,
                    [HITGROUP_RIGHTARM] = 1,
                    [HITGROUP_LEFTLEG] = 0.8,
                    [HITGROUP_RIGHTLEG] = 0.8,
                }
            },
        },
        variants_ttt = {
            -- Wingman
            [1] = {
                Override_BodyDamageMults = {
                    [HITGROUP_HEAD] = 3.5, -- one-shot hs kill!
                    [HITGROUP_CHEST] = 1,
                    [HITGROUP_STOMACH] = 1,
                    [HITGROUP_LEFTARM] = 1,
                    [HITGROUP_RIGHTARM] = 1,
                    [HITGROUP_LEFTLEG] = 0.9,
                    [HITGROUP_RIGHTLEG] = 0.9,
                }
            },
            -- Longbow DMR
            [2] = {
                Override_BodyDamageMults = {
                    [HITGROUP_HEAD] = 3, -- can now one-hit hs armored targets
                    [HITGROUP_CHEST] = 1,
                    [HITGROUP_STOMACH] = 1,
                    [HITGROUP_LEFTARM] = 1,
                    [HITGROUP_RIGHTARM] = 1,
                    [HITGROUP_LEFTLEG] = 0.8,
                    [HITGROUP_RIGHTLEG] = 0.8,
                }
            },
        }
    },
    ["choke"] = {
        name = "Precision Choke",
        icon = "entities/attach_icons/hopup_apex_choke.png",
        desc = "Weapon gains an additional firemode that reduces weapon spread while aiming down sights.",
        variants = {
            -- Peacekeeper
            [1] = {
                Override_Firemodes = {
                    {
                        Mode = 1,
                        PrintName = "fcg.apex.charge",
                        ApexCharge = true
                    },
                    {
                        Mode = 1,
                        PrintName = "fcg.lever"
                    }
                }
            },
            -- Triple Take
            [2] = {
                Override_Firemodes = {
                    {
                        Mode = 1,
                        PrintName = "fcg.apex.charge",
                        ApexCharge = true
                    },
                    {
                        Mode = 1,
                    }
                }
            },
        }
    },
    ["loader"] = {
        name = "Boosted Loader",
        icon = "entities/attach_icons/hopup_apex_boostedloader.png",
        desc = "Reloading while low and not empty increases speed and grants additional ammo.",
        variants = {
            -- Wingman
            [1] = {
                ApexLoaderMin = 0.34,
                ApexLoaderAdd = 2,
                M_Hook_Mult_ReloadTime = loadertime,
                Hook_GetCapacity = loadercapacity
            },
            -- Hemlok Burst AR
            [2] = {
                ApexLoaderAdd = 6,
                M_Hook_Mult_ReloadTime = function(wep, data)
                    local cs = wep:GetBuff("ClipSize", true, wep.RegularClipSize or wep.Primary.ClipSize)
                    if wep:Clip1() > 0 and wep:Clip1() <= 3 + (cs - 18) * 0.5 then
                        data.mult = data.mult * 0.75
                    end
                end,
                Hook_GetCapacity = function(wep, data)
                    local cs = wep:GetBuff("ClipSize", true, wep.RegularClipSize or wep.Primary.ClipSize)
                    if wep:Clip1() > 0 and (wep:Clip1() <= 3 + (cs - 18) * 0.5 or wep:Clip1() > cs) then
                        return cs + (wep:GetBuff_Override("ApexLoaderAdd") or 0)
                    end
                end
            },
        }
    }
}

for k, v in SortedPairs(hopups) do
    for i = 1, #v.variants do
        local att = table.Copy(GetConVar("arccw_apex_bal"):GetInt() == 2 and v.variants_ttt and v.variants_ttt[i] or v.variants[i])

        att.PrintName = "Hop-up - " .. v.name
        att.AbbrevName = v.name
        att.Icon = Material(v.icon, "mips smooth")
        if v.desc then att.Description = v.desc end
        att.AutoStats = true
        att.Slot = "apex_hopup_" .. k .. (i > 1 and i or "")

        if i > 1 then
            att.InvAtt = "apex_hopup_" .. k
        else
            att.EntityIcon = v.icon
            att.EntityCategory = "ArcCW - Apex Legends (Att.)"
            att.DroppedModel = "models/weapons/attachments/upgrades/mod_chip.mdl"
        end

        ArcCW.LoadAttachmentType(att, "apex_hopup_" .. k .. (i > 1 and i or ""))
    end
end