AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_frag", "VGUI/apex_nade_killicon_frag", Color(251, 85, 25, 255))
end
ENT.Type = "anim"
ENT.Base = "arccw_apex_thr"
ENT.PrintName = "Fragnade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/w_apex_nade_frag_thrown.mdl"
ENT.FuseTime = 3.5
ENT.ArmTime = 0
ENT.ImpactFuse = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

function ENT:Initialize()
    if SERVER then
        self:SetModel(self.Model)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:PhysicsInit(SOLID_VPHYSICS)

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.SpawnTime = CurTime()
        self.Trail = util.SpriteTrail(self, 0, Color(255, 0, 0, 200), false, 4, 0, 0.75, 2, "trails/plasma")

    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        if data.Speed > 75 then
            self:EmitSound(Sound("weapons/grenades/wpn_fraggrenade_1p_hardsurface_bounce_01_lr_v" .. math.random(1,2) .. ".wav"))
        elseif data.Speed > 25 then
            self:EmitSound(Sound("weapons/grenades/grenade_bounce_2ch_v2_0" .. math.random(1,3) .. ".wav"))
        end

        if (CurTime() - self.SpawnTime >= self.ArmTime) and self.ImpactFuse then
            self:Detonate()
        end
    end
end

function ENT:Think()
    if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
        self:Detonate()
    end
end

function ENT:Detonate()
    if SERVER then
        if !self:IsValid() then return end
        local effectdata = EffectData()
            effectdata:SetOrigin( self:GetPos() )

        if self:WaterLevel() >= 1 then
            util.Effect("WaterSurfaceExplosion", effectdata)
            self:EmitSound("weapons/underwater_explode3.wav", 120, 100, 1, CHAN_AUTO)
        else
            util.Effect("Explosion", effectdata)
            util.Effect("hl2mmod_explosion_grenade", effectdata)
            self:EmitSound("weapons/grenades/explode" .. math.random(1,3) .. ".wav", 120, 100, 1, CHAN_AUTO)
        end

        local attacker = self

        if self.Owner:IsValid() then
            attacker = self.Owner
        end
        util.BlastDamage(self, attacker, self:GetPos(), 400, 150)

        self:Remove()

    end
end

function ENT:DrawTranslucent()
    self:Draw()
end

function ENT:Draw()
    self:DrawModel()
end