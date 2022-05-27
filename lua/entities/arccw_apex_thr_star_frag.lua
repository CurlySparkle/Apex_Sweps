AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_star_frag", "VGUI/apex_nade_killicon_arcstar", Color(251, 85, 25, 255))
end

ENT.Type = "anim"
ENT.Base = "arccw_apex_thr_star_arc"
ENT.PrintName = "Blast Star"
ENT.Spawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.TrailColor = Color(100, 200, 100, 250)

ENT.ImpactDamage = {
    [0] = 15,
    [1] = 30,
    [2] = 25,
}

ENT.BlastDamage = {
    [0] = 75,
    [1] = 100,
    [2] = 50,
}

function ENT:Think()
    if SERVER and self.Armed and self.DetonateTime < CurTime() then

        local pos = self:GetPos()
        --if IsValid(self:GetParent()) and not self:GetParent():IsWorld() then pos = self:GetParent():WorldSpaceCenter() end

        local eff = EffectData()
        eff:SetOrigin(pos)
        util.Effect("HelicopterMegaBomb", eff)
        self:EmitSound("weapons/grenades/explode" .. math.random(1,3) .. ".wav", 90, 110, 1, CHAN_AUTO)

        local hit = false
        local blastdmg = self.BlastDamage[ArcCW.Apex.GetBalanceMode()]

        local optimized = IsValid(self:GetParent()) and (self:GetParent():IsPlayer() or self:GetParent():IsNPC() or self:GetParent():IsNextBot())

        for _, ent in pairs(ents.FindInSphere(pos, 200)) do
            if ArcCW.Apex.GrenadeBlacklist[ent:GetClass()] or ent:IsWeapon() or not self:CheckLOS(ent, pos) then continue end
            local f = 1

            local distSqr = ent:GetPos():DistToSqr(pos)
            if distSqr > 4096 then -- 64 * 64
                f = Lerp((distSqr - 4096) / (40000 - 4096), 1, 0.25)
            end


            local phyobj = ent:GetPhysicsObject()
            local mass = 1
            if IsValid(phyobj) then
                ent:SetPhysicsAttacker(self:GetOwner(), 5)
                mass = phyobj:GetMass() ^ 0.5
            end

            ent:SetPhysicsAttacker(self:GetOwner(), 5)

            local dmginfo = DamageInfo()
            dmginfo:SetDamageType(DMG_BLAST)
            dmginfo:SetAttacker(self:GetOwner())
            dmginfo:SetDamage(blastdmg * f)
            if ent == self:GetParent() or optimized then
                dmginfo:ScaleDamage(2)
            end
            if ent ~= self:GetParent() and math.random() <= 0.05 then
                -- MAXIMUM FUNNY
                dmginfo:SetDamageForce((ent:WorldSpaceCenter() - pos):GetNormalized() * 9001 * f * mass)
            else
                dmginfo:SetDamagePosition(pos)
                dmginfo:SetDamageForce((ent:WorldSpaceCenter() - pos):GetNormalized() * 3000 * f * mass)
            end
            dmginfo:SetInflictor(self)
            ent:TakeDamageInfo(dmginfo)

            if not hit and IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() and ent ~= self:GetOwner() and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then
                hit = true
                net.Start("arccw_apex_hit")
                    net.WriteBool(false)
                net.Send(self:GetOwner())
            end
        end

        -- HEAT SEEKING DUMPSTERS
        local physobj = IsValid(self:GetParent()) and self:GetParent():GetPhysicsObject()
        if IsValid(physobj) then
            local tgt, tgtdistsqr
            for _, ply in pairs(player.GetAll()) do
                if ply:Alive() and ply ~= self:GetOwner() then
                    local dot = (ply:GetPos() - self:GetPos()):GetNormalized():Dot(self:GetForward())
                    if dot > 0.5 then
                        local distsqr = ply:GetPos():DistToSqr(self:GetPos())
                        if distsqr <= 490000 and (not tgt or distsqr < tgtdistsqr) then
                            tgt = ply
                            tgtdistsqr = distsqr
                        end
                    end
                end
            end
            local mass = physobj:GetMass() ^ 0.5
            if IsValid(tgt) then
                local f = (math.Clamp(tgtdistsqr / 490000 * 0.5, 0, 0.5) + 0.5) ^ 2
                physobj:ApplyForceCenter((tgt:WorldSpaceCenter() - self:GetParent():GetPos()):GetNormalized() * 20000 * mass * f + Vector(0, 0, 1000 * mass * f))
            else
                physobj:ApplyForceOffset(self:GetForward() * 20000 * mass, self:GetPos())
            end
        end

        self:Remove()
    elseif CLIENT and self:GetStuck() then
        local emitter = ParticleEmitter(self:GetPos())
        if not IsValid(emitter) then return end
        self.NextFlareTime = self.NextFlareTime or CurTime()
        if self.NextFlareTime <= CurTime() then
            self.NextFlareTime = CurTime() + 0.025
            local fire = emitter:Add("particle/smokestack", self:GetPos())
            fire:SetVelocity(self:GetForward() * -800 + VectorRand() * 50)
            fire:SetGravity(Vector(0, 0, -25))
            fire:SetDieTime(math.Rand(0.3, 0.5))
            fire:SetStartAlpha(75)
            fire:SetEndAlpha(0)
            fire:SetStartSize(10)
            fire:SetEndSize(35)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(125, 160, 125)
            fire:SetAirResistance(25)
            fire:SetPos(self:GetPos())
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0.8)
        end
        emitter:Finish()
    end
end

function ENT:PhysicsCollide(data, physobj)
    if self:GetStuck() or self.Armed then return end
    self.Armed = true

    local tgt = data.HitEntity

    local f = {self}
    table.Add(f, tgt:GetChildren())

    local tr = util.TraceLine({
        start = data.HitPos,
        endpos = data.HitPos + data.OurOldVelocity,
        filter = f,
        mask = MASK_SHOT
    })
    local hs = tr.Entity == tgt and tr.HitGroup == HITGROUP_HEAD
    local dmginfo = DamageInfo()
    dmginfo:SetDamageType(DMG_SLASH)
    dmginfo:SetDamage(self.ImpactDamage[ArcCW.Apex.GetBalanceMode()])
    if hs then dmginfo:ScaleDamage(2) end
    dmginfo:SetAttacker(self:GetOwner())
    dmginfo:SetInflictor(self)
    dmginfo:SetDamageForce(data.OurOldVelocity * 1)
    dmginfo:SetDamagePosition(data.HitPos)
    tgt:TakeDamageInfo(dmginfo)

    if IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() and (tgt:IsPlayer() or tgt:IsNPC() or tgt:IsNextBot()) then
        net.Start("arccw_apex_hit")
            net.WriteBool(hs)
        net.Send(self:GetOwner())
    end

    local effectdata = EffectData()
    effectdata:SetOrigin(data.HitPos)
    effectdata:SetNormal(data.HitNormal)
    effectdata:SetRadius(32)
    util.Effect("cball_explode", effectdata)

    local angles = data.OurOldVelocity:GetNormalized():Angle()
    self.ImpactNormal = data.HitNormal

    self:EmitSound("weapons/grenades/arcstar/Phys_Imp_GrenadeArc_Flesh_3p_1ch_v1_0" .. math.random(1, 3) .. ".wav", 80)

    if tgt:IsWorld() or (IsValid(tgt) and tgt:GetPhysicsObject():IsValid()) then
        timer.Simple(0, function()
            self:SetAngles(angles)
            self:SetPos(data.HitPos)
            self:GetPhysicsObject():Sleep()

            if tgt:IsWorld() or IsValid(tgt) then
                tr = util.TraceLine({
                    start = data.HitPos,
                    endpos = data.HitPos + data.OurOldVelocity,
                    filter = f,
                    mask = MASK_SHOT
                })
                local ent = tr.Entity
                if ent:IsWorld() or IsValid(ent) then
                    local bone = ent:TranslatePhysBoneToBone(tr.PhysicsBone) or ent:GetHitBoxBone(tr.HitBox, ent:GetHitboxSet())
                    local matrix = tgt:GetBoneMatrix(bone or 0)
                    self:SetSolid(SOLID_NONE)
                    self:SetMoveType(MOVETYPE_NONE)
                    self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
                    if ent == tgt and bone and matrix then
                        local pos = matrix:GetTranslation()
                        local ang = matrix:GetAngles()
                        self:FollowBone(tgt, bone)
                        local n_pos, n_ang = WorldToLocal(tr.HitPos, tr.Normal:Angle(), pos, ang)
                        self:SetLocalPos(n_pos)
                        self:SetLocalAngles(n_ang)
                        self:GetParent():DontDeleteOnRemove(self)
                    elseif not tgt:IsWorld() then
                        self:SetParent(tgt)
                        self:GetParent():DontDeleteOnRemove(self)
                    end
                    self:SetStuck(true)
                    self.AttachToWorld = tgt:IsWorld()
                end
            end
        end)
    end

    self.DetonateTime = CurTime() + 0.4
end