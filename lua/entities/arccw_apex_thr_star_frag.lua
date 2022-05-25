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
    [0] = 120,
    [1] = 150,
    [2] = 100,
}

function ENT:Think()
    if SERVER and self.Armed and self.DetonateTime < CurTime() then

        local pos = self:GetPos()
        if IsValid(self:GetParent()) then pos = self:GetParent():WorldSpaceCenter() end

        local eff = EffectData()
        eff:SetOrigin(pos)
        util.Effect("HelicopterMegaBomb", eff)
        self:EmitSound("weapons/grenades/explode" .. math.random(1,3) .. ".wav", 90, 110, 1, CHAN_AUTO)

        local hit = false
        local blastdmg = self.BlastDamage[ArcCW.Apex.GetBalanceMode()]

        for _, ent in pairs(ents.FindInSphere(pos, 200)) do
            if ArcCW.Apex.GrenadeBlacklist[ent:GetClass()] or ent:IsWeapon() or not self:CheckLOS(ent) then continue end
            local distSqr = ent:GetPos():DistToSqr(pos)
            local f = 1
            if distSqr > 4096 then -- 64 * 64
                f = Lerp((distSqr - 4096) / (40000 - 4096), 1, 0.25)
            end
            local dmginfo = DamageInfo()
            dmginfo:SetDamageType(DMG_BLAST)
            dmginfo:SetAttacker(self:GetOwner())
            dmginfo:SetDamage(blastdmg * f)
            if ent == self:GetParent() then dmginfo:ScaleDamage(2) end
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
    end
end

function ENT:PhysicsCollide(data, physobj)
    if self.Stuck or self.Armed then return end
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
    dmginfo:SetDamageType(DMG_NEVERGIB + DMG_CRUSH)
    dmginfo:SetDamage(self.ImpactDamage[ArcCW.Apex.GetBalanceMode()])
    if hs then dmginfo:ScaleDamage(2) end
    dmginfo:SetAttacker(self:GetOwner())
    dmginfo:SetInflictor(self)
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

    local angles = self:GetAngles()

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
                if IsValid(ent) then
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
                    self.Stuck = true
                    self.AttachToWorld = tgt:IsWorld()
                end
            end
        end)
    end

    self.DetonateTime = CurTime() + 0.4
end