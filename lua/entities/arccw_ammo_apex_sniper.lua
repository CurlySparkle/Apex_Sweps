AddCSLuaFile()

ENT.Base                      = "arccw_ammo_apex_light"

ENT.PrintName                 = "Sniper Ammo"
ENT.Category                  = "ArcCW - Apex Legends (Ammo)"

ENT.Spawnable                 = true
ENT.Model                     = "models/ammo/sniper_ammo.mdl"
ENT.IconOverride              = "entities/items/apex_ammo_sniper.png"

ENT.AmmoType = "apex_sniper"
ENT.AmmoCount = 12
ENT.PickupSound = "items/Pickups_Ammo_Sniper_V1_1ch_01.wav"

if engine.ActiveGamemode() == "terrortown" then
    ENT.AmmoCount = ENT.AmmoCount * 2
end