AddCSLuaFile()

ENT.Base                      = "arccw_ammo"

ENT.PrintName                 = "Light Rounds"
ENT.Category                  = "ArcCW - Apex Legends (Ammo)"

ENT.Spawnable                 = true
ENT.Model                     = "models/ammo/light_ammo.mdl"
ENT.IconOverride              = "entities/items/apex_ammo_light.png"

ENT.AmmoType = "apex_light"
ENT.AmmoCount = 20
ENT.PickupSound = "items/Pickups_Ammo_Light_V1_1ch_01.wav"

if engine.ActiveGamemode() == "terrortown" then
    ENT.AmmoCount = ENT.AmmoCount * 2
end

function ENT:ApplyAmmo(ply)
    if self.USED then return end
    if engine.ActiveGamemode() == "terrortown" then
        -- Stupid checks mate... but we'll play along unless an override exists
        if !self.IgnoreTTTChecks and !self:TTT_PlayerCanPickup(ply) or !self:TTT_CheckForWeapon(ply) then return end

        local giveCount = math.min(self.AmmoCount, ArcCW.TTTAmmoToClipMax[string.lower(self.AmmoType)] - ply:GetAmmoCount(self.AmmoType))
        if giveCount <= 0 then return end

        self.AmmoCount = self.AmmoCount - giveCount
        ply:GiveAmmo(giveCount, self.AmmoType, true)
        ply:EmitSound(self.PickupSound)

        -- Ugly hack to let client update ammo count
        -- Why not just use NWInts or NetworkVars to begin with? Good question!
        self:SetNWInt("truecount", self.AmmoCount)

        if self.AmmoCount <= 0 then
            self.USED = true
            self:Remove()
        end
    else
        self.USED = true -- Prevent multiple uses
        ply:GiveAmmo(self.AmmoCount, self.AmmoType, true)
        ply:EmitSound(self.PickupSound)
        self:Remove()
    end
end