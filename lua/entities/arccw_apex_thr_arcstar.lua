AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Arc Star"
ENT.Spawnable = false
ENT.Model = "models/weapons/w_apex_nade_arcstar_thrown.mdl"

ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
ENT.Armed = false

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
            phys:AddAngleVelocity(Vector(0, -750, 1000))
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
        if self:WaterLevel() >= 1 then
            util.Effect( "WaterSurfaceExplosion", effectdata )
            self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
        else
            util.Effect( "Explosion", effectdata)
            self:EmitSound("phx/kaboom.wav", 125, 100, 1, CHAN_AUTO)
        end

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
            dmginfo:SetDamage(70 * f)
            dmginfo:SetDamageForce((ent:WorldSpaceCenter() - self:GetPos()):GetNormalized() * 9001 * f)
            dmginfo:SetInflictor(self)
            ent:TakeDamageInfo(dmginfo)

            if ent:IsPlayer() then
                ArcCW.Apex.ArcStarSlow(ent, 5 * f)
            end
        end

        self:Remove()
    end
end

function ENT:PhysicsCollide(data, physobj)
    if self.Stuck then return end
    self.Stuck = true
    local tgt = data.HitEntity
    local dmginfo = DamageInfo()
    dmginfo:SetDamageType(DMG_NEVERGIB)
    dmginfo:SetDamage(10)
    dmginfo:SetAttacker(self:GetOwner())
    dmginfo:SetInflictor(self)
    tgt:TakeDamageInfo(dmginfo)
    local angles = self:GetAngles()

    if tgt:IsWorld() or (IsValid(tgt) and tgt:GetPhysicsObject():IsValid()) then
        timer.Simple(0, function()
            self:SetAngles(angles)
            self:SetPos(data.HitPos)
            self:GetPhysicsObject():Sleep()

            if tgt:IsWorld() or IsValid(tgt) then
                self:SetSolid(SOLID_NONE)
                self:SetMoveType(MOVETYPE_NONE)
                self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

                local f = {self}
                table.Add(f, tgt:GetChildren())

                local tr = util.TraceLine({
                    start = data.HitPos - data.OurOldVelocity * 0.5,
                    endpos = data.HitPos + data.OurOldVelocity,
                    filter = f,
                    mask = MASK_SHOT
                })

                local bone = tr.Entity:TranslatePhysBoneToBone(tr.PhysicsBone) or tr.Entity:GetHitBoxBone(tr.HitBox, tr.Entity:GetHitboxSet())
                local matrix = tgt:GetBoneMatrix(bone or 0)
                if tr.Entity == tgt and bone and matrix then
                    local pos = matrix:GetTranslation()
                    local ang = matrix:GetAngles()
                    self:FollowBone(tgt, bone)
                    local n_pos, n_ang = WorldToLocal(tr.HitPos, tr.Normal:Angle(), pos, ang)
                    self:SetLocalPos(n_pos)
                    self:SetLocalAngles(n_ang)
                    debugoverlay.Cross(pos, 8, 5, Color(255, 0, 255), true)
                elseif not tgt:IsWorld() then
                    self:SetParent(tgt)
                    self:GetParent():DontDeleteOnRemove(self)
                else
                    self.AttachToWorld = true
                end
            end
        end)

        self:SetTrigger(true)
        self:UseTriggerBounds(true, 16)
    end

    self.DetonateTime = CurTime() + 3
end

function ENT:OnRemove()
    if not self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:Detonate()
    if not self:IsValid() or self.Armed then return end
    self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_Explo_Close_2ch_v1_0" .. math.random(1, 3) .. ".wav")
    self.Armed = true
    self.FireSound = CreateSound(self, "weapons/grenades/thermite/Wpn_ThermiteGrenade_ExploBurn_Close_2ch_v2_04.wav")
    self.FireSound:Play()
end

function ENT:DrawTranslucent()
    self:DrawModel()
end


function ENT:Draw()
    self:DrawModel()
end
