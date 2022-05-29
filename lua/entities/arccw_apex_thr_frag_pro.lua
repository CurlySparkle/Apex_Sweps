AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_frag_pro", "VGUI/apex_nade_killicon_frag", Color(251, 85, 25, 255))
end
ENT.Type = "anim"
ENT.Base = "arccw_apex_thr_frag"
ENT.PrintName = "Pro Frag Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.Model = "models/weapons/w_apex_nade_frag_thrown.mdl"
ENT.Skin = 3
ENT.FuseTime = 2.5
ENT.TrailColor = Color(0, 200, 0, 250)

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
            if not ArcCW.Apex.ValidNadeTarget(ent) or not self:CheckLOS(ent) then continue end
            local distSqr = ent:GetPos():DistToSqr(pos)
            local f = 1
            if distSqr > 16384 then -- 128 * 128
                f = Lerp((distSqr - 16384) / (122500 - 16384), 0.75, 0.2)
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
