AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_frag_arc", "VGUI/apex_nade_killicon_frag", Color(251, 85, 25, 255))
end
ENT.Type = "anim"
ENT.Base = "arccw_apex_thr_frag"
ENT.PrintName = "Firecracker"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.Model = "models/weapons/w_apex_nade_frag_thrown.mdl"
ENT.Skin = 1
ENT.FuseTime = 1.5
ENT.Booms = 0
ENT.TrailColor = Color(255, 200, 50, 250)
ENT.TrailTexture = "sprites/purplelaser1"

ENT.Armed = false
ENT.Thermites = {}
ENT.Damaged = {}

function ENT:Think()
    if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
        self:Detonate()
    end
    if not self.Armed then return end
    if (self.NextDamageTick or 0) > CurTime() then return end

    local eff = EffectData()
    eff:SetOrigin(self:GetPos())
    eff:SetMagnitude(2)
    eff:SetScale(1)
    eff:SetRadius(4)
    util.Effect("HelicopterMegaBomb", eff)

    if self.Booms == 1 then
        local explode = ents.Create( "info_particle_system" )
        explode:SetKeyValue( "effect_name", "tfa_apex_frag_explode" )
        explode:SetOwner( self.Owner )
        explode:SetPos( self:GetPos() )
        explode:Spawn()
        explode:Activate()
        explode:Fire( "start", "", 0 )
        explode:Fire( "kill", "", 30 )
        self:EmitSound("weapons/grenades/explode3.wav", 100, 90, 1)
    else
        self:EmitSound("weapons/ar2/ar2_altfire.wav", 90, 115, 0.8)
        if self.Booms <= 4 then
            self:EmitSound("buttons/blip1.wav", 90, 100 + (5 - self.Booms) * 25)
        end
    end

    local targets = {}

    local hit = false
    for k, v in pairs(ents.FindInSphere(self:GetPos(), 700)) do
        if ArcCW.Apex.ValidNadeTarget(ent) and self:CheckLOS(v, o) then
            local distSqr = v:GetPos():DistToSqr(self:GetPos())
            local dmgd = false
            if distSqr <= (self.Booms == 1 and 90000 or 40000) then
                dmgd = true
                local f = 1
                if distSqr > 9216 then -- 96 * 96
                    f = Lerp((distSqr - 9216) / (122500 - 9216), 1, 0.25)
                end

                local phyobj = v:GetPhysicsObject()
                local mass = 1
                if IsValid(phyobj) then
                    v:SetPhysicsAttacker(self:GetOwner(), 5)
                    mass = phyobj:GetMass() ^ 0.5
                end

                local dmg = DamageInfo()
                dmg:SetDamageType(ArcCW.Apex.FireDirectDamage[v:GetClass()] and DMG_DIRECT or DMG_BURN + (self.Booms == 1 and DMG_BLAST or 0))
                dmg:SetDamage(f * (self.Booms == 1 and 60 or 25))
                dmg:SetInflictor(self)
                dmg:SetAttacker(self:GetOwner())
                dmg:SetDamagePosition(self:GetPos())
                dmg:SetDamageForce((v:WorldSpaceCenter() - self:GetPos()):GetNormalized() * (self.Booms == 1 and 4000 or 1500) * f * mass)
                v:TakeDamageInfo(dmg)
            end

            if v:Health() > 0 and (v:IsNPC() or (v:IsPlayer() and v:Alive()) or v:IsNextBot()) then
                if dmgd and not hit and IsValid(self:GetOwner()) and v ~= self:GetOwner() then
                    hit = true
                    net.Start("arccw_apex_hit")
                        net.WriteBool(false)
                    net.Send(self:GetOwner())
                end
                table.insert(targets, v)
            end
        end
    end

    if #targets > 0 and math.random() <= 0.5 then
        local tgt = targets[math.random(1, #targets)]
        self:GetPhysicsObject():SetVelocityInstantaneous((tgt:WorldSpaceCenter() - self:GetPos()) * math.Rand(0.8, 1.25) + VectorRand() * 250)
    else
        self:GetPhysicsObject():SetVelocityInstantaneous(ArcCW.Apex.CircleRandVector(256) * 3 + Vector(0, 0, math.Rand(0, 128)))
    end

    self.Booms = self.Booms - 1
    if self.Booms <= 0 then self:Remove() end
    self.NextDamageTick = CurTime() + math.Rand(0.25, 1)
end

function ENT:Detonate(hitentity)
    if not self:IsValid() or self.Armed then return end

    self.Armed = true
    self.ArcCW_Killable = false
    self.Booms = math.random(6, 10)

    --self:SetMoveType(MOVETYPE_NONE)
    --self:SetNoDraw(true)

    if self:WaterLevel() >= 2 then
        local eff = EffectData()
        eff:SetOrigin(self:GetPos())
        util.Effect("WaterSurfaceExplosion", eff)
        self:Remove()
        return
    end
end

-- Old feature: Ring of flames
--[[]
function ENT:Detonate(hitentity)
    if not self:IsValid() or self.Armed then return end

    self.Armed = true
    self.ArcCW_Killable = false

    if not IsValid(hitentity) or hitentity:IsWorld() then hitentity = nil end

    self:SetMoveType(MOVETYPE_NONE)
    self:SetNoDraw(true)

    local eff = EffectData()
    eff:SetOrigin(self:GetPos())
    eff:SetMagnitude(2)
    eff:SetScale(1)
    eff:SetRadius(4)

    if self:WaterLevel() >= 2 then
        util.Effect("WaterSurfaceExplosion", eff)
        self:Remove()
        return
    else
        util.Effect("HelicopterMegaBomb", eff)
    end

    self.FireSound = CreateSound(self, "weapons/grenades/thermite/Wpn_ThermiteGrenade_ExploBurn_Close_2ch_v2_04.wav")
    self.FireSound:PlayEx(1, 95)
    self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_ExploBurn_Dist_2ch_v1_0" .. math.random(1, 6) .. ".wav", 140, 90, 0.5)

    self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_Explo_Close_2ch_v1_0" .. math.random(1, 3) .. ".wav", 100, 90)
    self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_Explo_Dist_2ch_v1_0" .. math.random(1, 3) .. ".wav", 140, 90, 0.5)

    -- If we throw the thermite onto a roof, it should not clip through it
    local tr_h = util.QuickTrace(self:GetPos(), Vector(0, 0, 72), self)
    local h = tr_h.Fraction * 72

    -- ring 1
    local r = 48
    for i = 1, 4 do
        local theta = 2 * math.pi * (i / 4)
        local dir = Vector(r * math.cos(theta), r * math.sin(theta), 0)
        local tr = util.TraceLine({
            start = self:GetPos() + Vector(0, 0, h),
            endpos = self:GetPos() + Vector(0, 0, h) + dir,
            mask = MASK_NPCSOLID_BRUSHONLY,
            ignore = {self, hitentity},
        })
        if tr.Fraction < 0.5 then continue end
        local t = util.QuickTrace(tr.HitPos, Vector(0, 0, -h), self)
        local thermite = ents.Create("arccw_apex_thermite")
        thermite:SetPos(t.HitPos + Vector(0, 0, 8))
        thermite:SetAngles(tr.Normal:Cross(Vector(0, 0, 1)):Angle())
        thermite.Owner = self.Owner
        thermite.FireTime = self.FireTime
        thermite:Spawn()
        table.insert(self.Thermites, thermite)
    end

    -- ring 2
    r = 128
    for i = 1, 9 do
        local theta = 2 * math.pi * (i / 9)
        local dir = Vector(r * math.cos(theta), r * math.sin(theta), 0)
        local tr = util.TraceLine({
            start = self:GetPos() + Vector(0, 0, h),
            endpos = self:GetPos() + Vector(0, 0, h) + dir,
            mask = MASK_NPCSOLID_BRUSHONLY,
            ignore = {self, hitentity},
        })
        if tr.Fraction < 0.5 then continue end
        local t = util.QuickTrace(tr.HitPos, Vector(0, 0, -h), self)
        local thermite = ents.Create("arccw_apex_thermite")
        thermite:SetPos(t.HitPos + Vector(0, 0, 8))
        thermite:SetAngles(tr.Normal:Cross(Vector(0, 0, 1)):Angle())
        thermite.Owner = self.Owner
        thermite.FireTime = self.FireTime
        thermite:Spawn()
        table.insert(self.Thermites, thermite)
    end

    timer.Simple(self.FireTime - 1, function()
        if not IsValid(self) then return end
        self.FireSound:Stop()
        self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_ExploBurn_Close_End_2ch_v2_0" .. math.random(4, 8) .. ".wav", 95)
        for k, v in ipairs(self.Thermites) do SafeRemoveEntity(v) end
    end)

    timer.Simple(self.FireTime, function()
        if not IsValid(self) then return end
        self:Remove()
    end)

end
]]