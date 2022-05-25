AddCSLuaFile()

ENT.Base                      = "arccw_ammo_apex_light"

ENT.PrintName                 = "Energy Ammo"
ENT.Category                  = "ArcCW - Apex Legends (Ammo)"

ENT.Spawnable                 = true
ENT.Model                     = "models/ammo/energy_ammo.mdl"
ENT.IconOverride              = "entities/items/apex_ammo_energy.png"

ENT.AmmoType = "apex_energy"
ENT.AmmoCount = 20
ENT.PickupSound = "items/Pickups_Ammo_Energy_V1_1ch_01.wav"

ENT.DetonationRadius = 256
ENT.DetonationDamage = 75

if engine.ActiveGamemode() == "terrortown" then
    ENT.AmmoCount = ENT.AmmoCount * 1.5
end

function ENT:Detonate(wet, attacker)
    local explode = ents.Create( "info_particle_system" )
    explode:SetKeyValue( "effect_name", "tfa_apex_arcstar_explode" )
    explode:SetOwner( self.Owner )
    explode:SetPos( self:GetPos() )
    explode:Spawn()
    explode:Activate()
    explode:Fire( "start", "", 0 )
    explode:Fire( "kill", "", 30 )

    self:EmitSound("weapons/grenades/arcstar/explo_star_close_2ch_v1_0" .. math.random(1, 3) .. ".wav", 100, 100, 1, CHAN_AUTO)

    util.BlastDamage(self, attacker, self:GetPos(), self.DetonationRadius, self.DetonationDamage)
    self:Remove()
end
