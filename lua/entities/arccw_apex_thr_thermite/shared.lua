AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Incendiary Grenade"
ENT.Spawnable = false
ENT.Model = "models/weapons/w_apex_nade_thermite_thrown.mdl"

ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
ENT.Armed = false
ENT.Thermites = {}

ENT.FireTime = 10

function ENT:Initialize()
    if SERVER then
        self:SetModel(self.Model)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:PhysicsInit(SOLID_VPHYSICS)
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

function ENT:Think()
    if not self.Armed or (self.NextDamageTick or 0) > CurTime() then return end
    for k, v in pairs(ents.FindInSphere(self:GetPos(), 64)) do
        if v:GetClass() ~= "arccw_apex_thermite" and v:GetClass() ~= "arccw_apex_thr_thermite" then
            local o = self.Owner
            local dmg = DamageInfo()
            dmg:SetDamageType(DMG_BURN)
            dmg:SetDamage(4)
            dmg:SetInflictor(self or 0)
            dmg:SetAttacker(o)
            dmg:SetDamageForce(Vector(0, 0, 0))
            v:TakeDamageInfo(dmg)
            if v:IsNPC() or v:IsPlayer() or v:IsNextBot() then
                if timer.Exists("thermite_burn_" .. v:EntIndex()) then timer.Remove("thermite_burn_" .. v:EntIndex()) end
                timer.Create("thermite_burn_" .. v:EntIndex(), 0.5, 5, function()
                    if not IsValid(v) or (v:IsPlayer() and not v:Alive()) then return end
                    local d = DamageInfo()
                    d:SetDamageType(DMG_BURN)
                    d:SetDamage(5)
                    d:SetInflictor(self)
                    d:SetAttacker(o)
                    d:SetDamageForce(Vector(0, 0, 0))
                    v:TakeDamageInfo(d)
                end)
            end
        end
    end
    self.NextDamageTick = CurTime() + 0.2
    self.ArcCW_Killable = false
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        self:Detonate()
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
    for i, ent in ipairs(self.Thermites) do
        if not IsValid(ent) then table.remove(self.Thermites, i) continue end
        for k, v in pairs(ents.FindInSphere(self:GetPos(), 64)) do
            if v:GetClass() ~= "arccw_apex_thermite" and v:GetClass() ~= "arccw_apex_thr_thermite" then
                damaged[v] = (damaged[v] or 0) + 1
            end
        end
    end
    for v, i in pairs(damaged) do
        local o = self.Owner
        local dmg = DamageInfo()
        dmg:SetDamageType(DMG_BURN)
        dmg:SetDamage(4) -- 4 * i
        dmg:SetInflictor(self or o)
        dmg:SetAttacker(o)
        dmg:SetDamageForce(Vector(0, 0, 0))
        v:TakeDamageInfo(dmg)
        if v:IsNPC() or v:IsPlayer() or v:IsNextBot() then
            if timer.Exists("thermite_burn_" .. v:EntIndex()) then timer.Remove("thermite_burn_" .. v:EntIndex()) end
            timer.Create("thermite_burn_" .. v:EntIndex(), 0.5, 5, function()
                if not IsValid(v) or (v:IsPlayer() and not v:Alive()) then return end
                local d = DamageInfo()
                d:SetDamageType(DMG_BURN)
                d:SetDamage(5)
                d:SetInflictor(self or o)
                d:SetAttacker(o)
                d:SetDamageForce(Vector(0, 0, 0))
                v:TakeDamageInfo(d)
            end)
        end
        damaged[v] = true
    end
    self.NextDamageTick = CurTime() + 0.2
end

function ENT:Detonate()
    if not self:IsValid() or self.Armed then return end
    self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_Explo_Close_2ch_v1_0" .. math.random(1, 3) .. ".wav")
    self.Armed = true
    self.FireSound = CreateSound(self, "weapons/grenades/thermite/Wpn_ThermiteGrenade_ExploBurn_Close_2ch_v2_04.wav")
    self.FireSound:Play()
    self.ArcCW_Killable = false

    self:SetMoveType(MOVETYPE_NONE)
    self:SetNoDraw(true)

    timer.Simple(self.FireTime - 1, function()
        if not IsValid(self) then return end
        self.FireSound:ChangeVolume(0, 1)
    end)

    timer.Simple(self.FireTime, function()
        if not IsValid(self) then return end
        self:Remove()
    end)

    local max_len = 250

    -- If we throw the thermite onto a roof, it should not clip through it
    local tr = util.QuickTrace(self:GetPos(), Vector(0, 0, 72), self)
    local h = tr.Fraction * 72

    -- If the thermite deploys into a wall, don't spawn duplicates
    local trace_left = util.TraceLine({
        start = self:GetPos() + Vector(0, 0, h),
        endpos = self:GetPos() + Vector(0, 0, h) + self.InitialDir * -max_len,
        mask = MASK_SHOT_HULL,
    })
    local trace_right = util.TraceLine({
        start = self:GetPos() + Vector(0, 0, h),
        endpos = self:GetPos() + Vector(0, 0, h) + self.InitialDir * max_len,
        mask = MASK_SHOT_HULL,
    })

    timer.Create("thermite_" .. self:EntIndex(), 0.1, 3, function()
        local r = timer.RepsLeft("thermite_" .. self:EntIndex())
        local i = (3 - r) / 3
        if trace_left.Fraction > i then
            local pos = self:GetPos() + Vector(0, 0, h) + self.InitialDir * -max_len * i
            local t = util.QuickTrace(pos, Vector(0, 0, -h), self)
            local thermite = ents.Create("arccw_apex_thermite")
            thermite:SetPos(t.HitPos + Vector(0, 0, 8))
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
            thermite.Owner = self.Owner
            thermite.FireTime = self.FireTime
            thermite:Spawn()
            table.insert(self.Thermites, thermite)
        end
    end)

    local thermite = ents.Create("arccw_apex_thermite")
    thermite:SetPos(self:GetPos() + Vector(0, 0, 12))
    thermite.Owner = self.Owner
    thermite.FireTime = self.FireTime
    thermite:Spawn()

end

function ENT:DrawTranslucent()
    self:Draw()
end