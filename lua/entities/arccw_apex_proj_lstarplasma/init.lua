
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SetDamage(dmg, inflictor)
    self.Damage = dmg
    self.Inflictor = inflictor
end

function ENT:RadiusDamage(origin, inflictor, attacker, damage, radius, hitent, dmgtype)
    inflictor = IsValid(inflictor) and inflictor or self
    dmgtype = dmgtype or DMG_BLAST
    local mins = Vector()
    local maxs = Vector()
    local v = Vector()

    if radius < 1 then
        radius = 1
    end
    
    for i = 1, 3 do
        mins[i] = origin[i] - radius
        maxs[i] = origin[i] + radius
    end
    
    local numListedEntities = ents.FindInBox(mins, maxs)
    
    for _, ent in pairs(numListedEntities) do
        local absmin, absmax = ent:WorldSpaceAABB()
    
        for i = 1, 3 do
            if origin[i] < absmin[i] then
                v[i] = absmin[i] - origin[i]
            elseif origin[i] > absmax[i] then
                v[i] = origin[i] - absmax[i]
            else
                v[i] = 0
            end
        end
        
        local dist = v:Length()
        if dist >= radius then
            continue
        end
        
        local points = damage * (1 - dist / radius)
        
        local dir = ent:GetPos() - origin
        local dmginfo = DamageInfo()
        dmginfo:SetAttacker(attacker)
        dmginfo:SetInflictor(inflictor)
        dmginfo:SetReportedPosition(origin)
        dmginfo:SetDamageType(dmgtype)
        // splash damage doesn't apply to person directly hit
        if ent != hitent then
            dir[3] = dir[3] + 64
            dmginfo:SetDamageForce(dir)
            dmginfo:SetDamage(points)
            ent:TakeDamageInfo(dmginfo)
        else
            dir[3] = dir[3] + 24
            dmginfo:SetDamageForce(dir)
            dmginfo:SetDamage(damage)
            ent:TakeDamageInfo(dmginfo)
        end
    end    
end

function ENT:Initialize()
    self.ParticleCreated = false
    self:SetModel("models/dav0r/hoverball.mdl")
    self:SetMoveCollide(COLLISION_GROUP_PROJECTILE)
    self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_CUSTOM)
    self:DrawShadow(false)

    --util.SpriteTrail( self, 0, Color( 255, 100, 50 ), false, 10, 10, 0.3, 1 / ( 250 ), "trails/plasma.vmt" )

    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:SetMass(1)
        phys:EnableDrag(false)
        phys:EnableGravity(false)
        phys:SetBuoyancyRatio(0)
    end
    
    if self.ParticleCreated == false then
        ParticleEffectAttach( "tfa_apex_lstar_projectile", PATTACH_POINT_FOLLOW, self,0)
        self.ParticleCreated = true
    end
end

function ENT:PhysicsCollide(data, physobj)

    local start = data.HitPos + data.HitNormal
    local endpos = data.HitPos - data.HitNormal
    
    local trace1 = {}
    trace1.filter = {self.Entity}
    data.HitNormal = data.HitNormal * -1
    util.Decal("FadingScorch",start,endpos)

    local trace = {}
    trace.start = start
    trace.endpos = endpos
    trace.filter = self
    local tr = util.TraceLine(trace)
    
    local effectdata = EffectData()
    effectdata:SetOrigin(self:GetPos())
        
    local explode2 = ents.Create( "info_particle_system" )
    explode2:SetKeyValue( "effect_name", "tfa_apex_lstar_explode_core" )
    explode2:SetOwner( self.Owner )
    explode2:SetPos( self:GetPos() )
    explode2:Spawn()
    explode2:Activate()
    explode2:Fire( "start", "", 0 )
    explode2:Fire( "kill", "", 15 )
    --self:EmitSound( "TFA_QC_SUPERNAILGUN.Impact" )

    if IsValid(self:GetOwner()) then
        self:RadiusDamage(tr.HitPos, self, self:GetOwner(), 17, 17, data.HitEntity, DMG_AIRBOAT)
    end

    timer.Simple(0, function()
        if IsValid(self) then
            self:Remove()
        end
    end)
end

function ENT:Think()
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then phys:SetVelocity(self:GetAngles():Forward() * 2000) return end    
end
