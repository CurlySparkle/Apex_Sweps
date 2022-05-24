AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Arc Star"
ENT.Spawnable = false
ENT.Model = "models/weapons/w_apex_nade_arcstar_thrown.mdl"

ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
ENT.Armed = false

ENT.ImpactDamage = {
    [0] = 10,
    [1] = 25,
    [2] = 25,
}

ENT.BlastDamage = {
    [0] = 70,
    [1] = 80,
    [2] = 50,
}

function ENT:Initialize()
    if SERVER then
        self:SetModel(self.Model)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:PhysicsInitSphere(2, "weapon")
        self:DrawShadow(true)
        local phys = self:GetPhysicsObject()

        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
            phys:AddAngleVelocity(Vector(0, -700, 3000))
        end

        self.SpawnTime = CurTime()
    end
end

function ENT:Think()
    if SERVER and self.Stuck and self.DetonateTime < CurTime() then
        --util.BlastDamage(self, self:GetOwner(), self:GetPos(), 300, 90)
        local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())
        effectdata:SetNormal(self:GetForward())
        effectdata:SetMagnitude(1)
        effectdata:SetScale(1)
        effectdata:SetRadius(32)
        effectdata:SetEntity(self)
        util.Effect("HelicopterMegaBomb", effectdata)

        self:EmitSound("weapons/grenades/arcstar/explo_star_close_2ch_v1_0" .. math.random(1, 3) .. ".wav", 125, 100, 1, CHAN_AUTO)

        local hit = false
        local blastdmg = self.BlastDamage[ArcCW.Apex.GetBalanceMode()]

        for _, ent in pairs(ents.FindInSphere(self:GetPos(), 300)) do
            if ArcCW.Apex.GrenadeBlacklist[ent:GetClass()] or ent:IsWeapon() then continue end
            local distSqr = ent:GetPos():DistToSqr(self:GetPos())
            local f = 1
            if distSqr > 9216 then -- 96 * 96
                f = Lerp((distSqr - 9216) / (90000 - 9216), 1, 0.25)
            end

            local dmginfo = DamageInfo()
            dmginfo:SetDamageType(DMG_SHOCK)
            dmginfo:SetAttacker(self:GetOwner())
            dmginfo:SetDamage(blastdmg * f)
            dmginfo:SetDamageForce((ent:WorldSpaceCenter() - self:GetPos()):GetNormalized() * 9001 * f)
            dmginfo:SetInflictor(self)
            ent:TakeDamageInfo(dmginfo)

            if ent:IsPlayer() then
                ArcCW.Apex.ArcStarSlow(ent, 5 * f)
            end
            if not hit and IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then
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
    if self.Stuck then return end
    self.Stuck = true

    local tgt = data.HitEntity

    local f = {self}
    table.Add(f, tgt:GetChildren())

    local tr = util.TraceLine({
        start = data.HitPos - data.OurOldVelocity * 0.5,
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

    local angles = self:GetAngles()

    self:EmitSound("weapons/grenades/arcstar/Wpn_ArcStar_3P_Warning_StaticWindup_1ch_01.wav")

    if tgt:IsWorld() or (IsValid(tgt) and tgt:GetPhysicsObject():IsValid()) then
        timer.Simple(0, function()
            self:SetAngles(angles)
            self:SetPos(data.HitPos)
            self:GetPhysicsObject():Sleep()

            if tgt:IsWorld() or IsValid(tgt) then
                tr = util.TraceLine({
                    start = data.HitPos - data.OurOldVelocity * 0.5,
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
                    elseif not tgt:IsWorld() then
                        self:SetParent(tgt)
                        self:GetParent():DontDeleteOnRemove(self)
                    else
                        self.AttachToWorld = true
                    end
                end
            end
        end)

        self:SetTrigger(true)
        self:UseTriggerBounds(true, 16)
    end

    self.DetonateTime = CurTime() + 2.5
end

function ENT:OnRemove()
    if not self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:DrawTranslucent()
    self:DrawModel()
end

function ENT:Draw()
    self:DrawModel()
end
