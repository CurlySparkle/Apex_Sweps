AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "arccw_apex_thr"
ENT.PrintName = "Incendiary Grenade"
ENT.Spawnable = false
ENT.Model = "models/weapons/w_apex_nade_thermite_thrown.mdl"

ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
ENT.Armed = false
ENT.Thermites = {}
ENT.Damaged = {}

ENT.FireTime = 10

function ENT:Initialize()
    if SERVER then
        self:SetModel(self.Model)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:PhysicsInitSphere(1, "weapon")
        self:DrawShadow(true)
        local phys = self:GetPhysicsObject()

        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.SpawnTime = CurTime()
        self.InitialDir = self.Owner:GetAngles():Right()
    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        self:Detonate(data.HitEntity)
    end
end

function ENT:OnRemove()
    if not self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:Think()
    if CLIENT then return end
    if (self.NextDamageTick or 0) > CurTime() then return end
    local damaged = {}
    local toclear = table.Copy(self.Damaged)
    for i, ent in ipairs(self.Thermites) do
        if not IsValid(ent) then table.remove(self.Thermites, i) continue end
        for k, v in pairs(ents.FindInSphere(ent:GetPos() + Vector(0, 0, 16), 72)) do
            if not damaged[v] and not ArcCW.Apex.GrenadeBlacklist[v:GetClass()] and not v:IsWeapon() and self:CheckLOS(v) then -- As it turns out, this will ignite ALL weapons on a player's inventory
                damaged[v] = true
                if toclear[v:EntIndex()] then toclear[v:EntIndex()] = nil end
            end
        end
    end

    local hit = false
    for v, i in pairs(damaged) do
        self.Damaged[v:EntIndex()] = (self.Damaged[v:EntIndex()] or 0) + 1
        local o = self.Owner
        local dmg = DamageInfo()
        dmg:SetDamageType(DMG_BURN)
        dmg:SetDamage(3 + self.Damaged[v:EntIndex()])
        dmg:SetInflictor(IsValid(self) and self or o)
        dmg:SetAttacker(o)
        dmg:SetDamageForce(Vector(0, 0, 0))
        v:TakeDamageInfo(dmg)

        if v:IsNPC() or (v:IsPlayer() and v:Alive()) or v:IsNextBot() then
            if not hit and IsValid(self:GetOwner()) and v ~= self:GetOwner() then
                hit = true
                net.Start("arccw_apex_hit")
                    net.WriteBool(false)
                net.Send(self:GetOwner())
            end
            if timer.Exists("thermite_burn_" .. v:EntIndex()) then timer.Remove("thermite_burn_" .. v:EntIndex()) end
            timer.Create("thermite_burn_" .. v:EntIndex(), 0.5, 5, function()
                if not IsValid(v) or (v:IsPlayer() and not v:Alive()) then return end
                local d = DamageInfo()
                d:SetDamageType(DMG_BURN)
                d:SetDamage(5)
                d:SetInflictor(IsValid(self) and self or o)
                d:SetAttacker(o)
                d:SetDamageForce(Vector(0, 0, 0))
                v:TakeDamageInfo(d)
                if IsValid(self) and IsValid(self:GetOwner()) and v ~= self:GetOwner() then
                    net.Start("arccw_apex_hit")
                        net.WriteBool(false)
                    net.Send(self:GetOwner())
                end
            end)
        elseif not v:IsOnFire() then
            v:Ignite(5)
        end
        damaged[v] = true
    end
    for e, _ in pairs(toclear) do
        self.Damaged[e] = 0
    end
    self.NextDamageTick = CurTime() + 0.15
end

function ENT:Detonate(hitentity)
    if not self:IsValid() or self.Armed then return end
    self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_Explo_Close_2ch_v1_0" .. math.random(1, 3) .. ".wav", 100)
    self.Armed = true
    self.FireSound = CreateSound(self, "weapons/grenades/thermite/Wpn_ThermiteGrenade_ExploBurn_Close_2ch_v2_04.wav")
    self.FireSound:PlayEx(1, 95)
    self.ArcCW_Killable = false

    if not IsValid(hitentity) or hitentity:IsWorld() then hitentity = nil end

    self:SetMoveType(MOVETYPE_NONE)
    self:SetNoDraw(true)

    local eff = EffectData()
    eff:SetOrigin(self:GetPos())
    eff:SetMagnitude(2)
    eff:SetScale(1)
    eff:SetRadius(4)
    util.Effect("Sparks", eff)

    local max_len = 250

    -- If we throw the thermite onto a roof, it should not clip through it
    local tr = util.QuickTrace(self:GetPos(), Vector(0, 0, 72), self)
    local h = tr.Fraction * 72

    -- If the thermite deploys into a wall, don't spawn duplicates
    local trace_left = util.TraceLine({
        start = self:GetPos() + Vector(0, 0, h),
        endpos = self:GetPos() + Vector(0, 0, h) + self.InitialDir * -max_len,
        mask = MASK_NPCSOLID_BRUSHONLY,
        ignore = {self, hitentity},
    })
    local trace_right = util.TraceLine({
        start = self:GetPos() + Vector(0, 0, h),
        endpos = self:GetPos() + Vector(0, 0, h) + self.InitialDir * max_len,
        mask = MASK_NPCSOLID_BRUSHONLY,
        ignore = {self, hitentity},
    })

    local forward = self.InitialDir:Angle()

    timer.Create("thermite_" .. self:EntIndex(), 0.15, 3, function()
        local r = timer.RepsLeft("thermite_" .. self:EntIndex())
        local i = (3 - r) / 3

        if trace_left.Fraction > i then
            local pos = self:GetPos() + Vector(0, 0, h) + self.InitialDir * -max_len * i
            local t = util.QuickTrace(pos, Vector(0, 0, -h), self)
            local thermite = ents.Create("arccw_apex_thermite")
            thermite:SetPos(t.HitPos + Vector(0, 0, 8))
            thermite:SetAngles(forward)
            thermite.Owner = self.Owner
            thermite.FireTime = self.FireTime
            thermite:Spawn()
            table.insert(self.Thermites, thermite)
        end

        if trace_right.Fraction > i then
            local pos = self:GetPos() + Vector(0, 0, h) + self.InitialDir * max_len * i
            local t = util.QuickTrace(pos, Vector(0, 0, -h), self)
            local thermite = ents.Create("arccw_apex_thermite")
            thermite:SetPos(t.HitPos + Vector(0, 0, 8))
            thermite:SetAngles(forward)
            thermite.Owner = self.Owner
            thermite.FireTime = self.FireTime
            thermite:Spawn()
            table.insert(self.Thermites, thermite)
        end
    end)

    local thermite = ents.Create("arccw_apex_thermite")
    thermite:SetPos(self:GetPos() + Vector(0, 0, 8))
    thermite:SetAngles(forward)
    thermite.Owner = self.Owner
    thermite.FireTime = self.FireTime
    thermite:Spawn()
    table.insert(self.Thermites, thermite)

    timer.Simple(self.FireTime - 1, function()
        if not IsValid(self) then return end
        self.FireSound:ChangeVolume(0, 1)
        for k, v in ipairs(self.Thermites) do SafeRemoveEntity(v) end
    end)

    timer.Simple(self.FireTime, function()
        if not IsValid(self) then return end
        self:Remove()
    end)

end