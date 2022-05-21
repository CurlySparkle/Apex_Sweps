AddCSLuaFile()

ENT.Base                      = "arccw_ammo_apex_light"

ENT.PrintName                 = "Arrows"
ENT.Category                  = "ArcCW - Apex Legends (Ammo)"

ENT.Spawnable                 = true
ENT.Model                     = "models/ammo/light_ammo.mdl"
ENT.IconOverride              = "entities/items/apex_ammo_Arrows.png"

ENT.AmmoType = "apex_arrow"
ENT.AmmoCount = 16
ENT.PickupSound = "items/Pickups_Ammo_Arrows_V1_1ch_01.wav"

if engine.ActiveGamemode() == "terrortown" then
    ENT.AmmoCount = ENT.AmmoCount * 2
end