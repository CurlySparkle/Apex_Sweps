ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Bocek Arrow"

ENT.Model = "models/ammo/w_arrow_projectile.mdl"
ENT.AmmoType = "apex_arrow"

if SERVER then
    AddCSLuaFile()

    function ENT:InitPhys()
        self:PhysicsInitBox(Vector(-4, -1, -1), Vector(4, 1, 1))
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then
            phys:Wake()
            phys:SetMass(5)
        end
    end

    function ENT:Initialize()
        self:SetModel(self.Model)
        self:SetNoDraw(false)
        self:SetSolid(SOLID_VPHYSICS)
        self:InitPhys()
        self:DrawShadow(false)

        self:SetTrigger(true)
        self:UseTriggerBounds(true, 16)
        SafeRemoveEntityDelayed(self, 60)

		local impacteff = ents.Create( "info_particle_system" )
		impacteff:SetKeyValue( "effect_name", "tfa_apex_bocek_impact" )
		impacteff:SetOwner( self )
		impacteff:SetPos( self:GetPos() )
		impacteff:Spawn()
		impacteff:Activate()
		impacteff:Fire( "start", "", 0 )
		impacteff:Fire( "kill", "", 30 )

        self.CanPickup = true
    end

    function ENT:Think()
        if not IsValid(self:GetParent()) then
            self:SetParent(NULL)
        end
    end

    function ENT:ApplyAmmo(ply)
        if self.USED then return end
        if engine.ActiveGamemode() == "terrortown" then
            -- Stupid checks mate... but we'll play along unless an override exists
            if !self.IgnoreTTTChecks and !ply:HasWeapon("arccw_apex_bocek") then return end

            ply:GiveAmmo(1, self.AmmoType, true)
            ply:EmitSound("items/Pickups_Ammo_Arrows_V1_1ch_0" .. math.random(1, 4) .. ".wav")
            self.USED = true
            self:Remove()
        else
            self.USED = true -- Prevent multiple uses
            ply:GiveAmmo(1, self.AmmoType, true)
            ply:EmitSound("items/Pickups_Ammo_Arrows_V1_1ch_0" .. math.random(1, 4) .. ".wav")
            self:Remove()
        end
    end

    function ENT:StartTouch(ply)
        if self.CanPickup and ply:IsPlayer() then
            self:ApplyAmmo(ply)
        end
    end

    function ENT:Use(ply)
        if self.CanPickup and ply:IsPlayer() then
            self:ApplyAmmo(ply)
        end
    end
end

function ENT:Draw()
    if self:GetParent() ~= LocalPlayer() or LocalPlayer():ShouldDrawLocalPlayer() then self:DrawModel() end
end