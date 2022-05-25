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
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.Model = "models/weapons/w_apex_nade_frag_thrown.mdl"
ENT.FuseTime = 3.5
ENT.TrailColor = Color(255, 0, 0, 250)

ENT.BlastDamage = {
    [0] = 100,
    [1] = 300,
    [2] = 100,
}

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
        self.Trail = util.SpriteTrail(self, 0, self.TrailColor, false, 4, 0, 1, 4, "trails/plasma")
        self:SetPhysicsAttacker(self:GetOwner(), 10)
    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        if data.Speed > 75 then
            self:EmitSound(Sound("weapons/grenades/wpn_fraggrenade_1p_hardsurface_bounce_01_lr_v" .. math.random(1,2) .. ".wav"))
        elseif data.Speed > 25 then
            self:EmitSound(Sound("weapons/grenades/grenade_bounce_2ch_v2_0" .. math.random(1,3) .. ".wav"))
        end

        if IsValid(data.HitEntity) and not data.HitEntity:IsWorld() and data.Speed > 50 then
            local dmginfo = DamageInfo()
            dmginfo:SetDamageType(DMG_NEVERGIB + DMG_CRUSH)
            dmginfo:SetDamage(10)
            dmginfo:SetAttacker(self:GetOwner())
            dmginfo:SetInflictor(self)
            dmginfo:SetDamageForce(data.OurOldVelocity * 0.5)
            data.HitEntity:TakeDamageInfo(dmginfo)
            if IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() then
                net.Start("arccw_apex_hit")
                    net.WriteBool(false)
                net.Send(self:GetOwner())
            end
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
        local effectdata = EffectData()
            effectdata:SetOrigin( self:GetPos() )

        if self:WaterLevel() >= 1 then
            util.Effect("WaterSurfaceExplosion", effectdata)
            self:EmitSound("weapons/underwater_explode3.wav", 120, 100, 1, CHAN_AUTO)
        else
            local explode = ents.Create( "info_particle_system" )
            explode:SetKeyValue( "effect_name", "tfa_apex_frag_explode" )
            explode:SetOwner( self.Owner )
            explode:SetPos( self:GetPos() )
            explode:Spawn()
            explode:Activate()
            explode:Fire( "start", "", 0 )
            explode:Fire( "kill", "", 30 )
            --util.Effect("Explosion", effectdata)
            --util.Effect("hl2mmod_explosion_grenade", effectdata)
            self:EmitSound("weapons/grenades/explode" .. math.random(1,3) .. ".wav", 120, 100, 1, CHAN_AUTO)
        end

        local attacker = self

        if self.Owner:IsValid() then
            attacker = self.Owner
        end

        local hit = false
        local blastdmg = self.BlastDamage[ArcCW.Apex.GetBalanceMode()]
        local pos = self:GetPos()

        for _, ent in pairs(ents.FindInSphere(pos, 350)) do
            if ArcCW.Apex.GrenadeBlacklist[ent:GetClass()] or ent:IsWeapon() or not self:CheckLOS(ent) then continue end
            local distSqr = ent:GetPos():DistToSqr(pos)
            local f = 1
            if distSqr > 9216 then -- 96 * 96
                f = Lerp((distSqr - 9216) / (122500 - 9216), 1, 0.25)
            end
            local dmginfo = DamageInfo()
            dmginfo:SetDamageType(DMG_BLAST)
            dmginfo:SetAttacker(attacker)
            dmginfo:SetDamage(blastdmg * f)
            dmginfo:SetDamageForce((ent:WorldSpaceCenter() - pos):GetNormalized() * 9001 * f)
            dmginfo:SetInflictor(self)
            ent:TakeDamageInfo(dmginfo)

            if not hit and IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() and ent ~= self:GetOwner() and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then
                hit = true
                net.Start("arccw_apex_hit")
                    net.WriteBool(false)
                net.Send(self:GetOwner())
            end
        end
        self:Remove()
        util.Decal("Scorch", pos, pos - Vector(0, 0, 16))
    end
end

function ENT:DrawTranslucent()
    self:Draw()
end

function ENT:Draw()
    self:DrawModel()
end