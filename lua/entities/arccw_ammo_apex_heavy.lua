AddCSLuaFile()

ENT.Base                      = "arccw_ammo_apex_light"

ENT.PrintName                 = "Heavy Rounds"
ENT.Category                  = "ArcCW - Apex Legends (Ammo)"

ENT.Spawnable                 = true
ENT.Model                     = "models/ammo/heavy_ammo.mdl"
ENT.IconOverride              = "entities/items/apex_ammo_heavy.png"

ENT.AmmoType = "apex_heavy"
ENT.AmmoCount = 20
ENT.PickupSound = "items/Pickups_Ammo_Heavy_V1_1ch_01.wav"

if engine.ActiveGamemode() == "terrortown" then
    ENT.AmmoCount = ENT.AmmoCount * 1.5
end