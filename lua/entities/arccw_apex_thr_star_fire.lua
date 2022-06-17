AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_star_fire", "VGUI/apex_nade_killicon_arcstar", Color(251, 85, 25, 255))
end

ENT.Type = "anim"
ENT.Base = "arccw_apex_thr_star_arc"
ENT.PrintName = "Firestar"
ENT.Spawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.TrailColor = Color(255, 125, 0, 150)

ENT.ImpactDamage = {
    [0] = 10,
    [1] = 10,
    [2] = 10,
}

ENT.FireTime = 8
ENT.Ticks = 0

ENT.Damaged = {}

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Stuck")
    self:NetworkVar("Bool", 1, "Burning")
end

local fired = {"effects/fire_embers1", "effects/fire_embers2", "effects/fire_embers3"}
local function GetFireParticle()
    return fired[math.random(#fired)]
end

function ENT:Think()

    if CLIENT then
        self:ThinkEffect()
        return
    end

    if not self:GetBurning() or (self.NextDamageTick or 0) > CurTime() then return end

    local damaged = {}
    local toclear = table.Copy(self.Damaged)
    local pos = self:GetPos() + Vector(0, 0, 8)
    for k, v in pairs(ents.FindInSphere(pos, 96)) do
        if not damaged[v] and ArcCW.Apex.ValidNadeTarget(v) and self:CheckLOS(v, pos) then -- As it turns out, this will ignite ALL weapons on a player's inventory
            damaged[v] = true
            if toclear[v:EntIndex()] then toclear[v:EntIndex()] = nil end
        end
    end

    local hit = false
    for v, i in pairs(damaged) do
        self.Damaged[v:EntIndex()] = (self.Damaged[v:EntIndex()] or 0) + 1
        local o = self.Owner
        local dmg = DamageInfo()
        dmg:SetDamageType(ArcCW.Apex.FireDirectDamage[v:GetClass()] and DMG_DIRECT or DMG_BURN)
        dmg:SetDamage(math.min(20, 4 + self.Damaged[v:EntIndex()] * 3))
        dmg:SetInflictor(IsValid(self) and self or o)
        dmg:SetAttacker(o)
        v:TakeDamageInfo(dmg)

        if v:IsNPC() or (v:IsPlayer() and v:Alive()) or v:IsNextBot() then
            if not hit and IsValid(self:GetOwner()) and v ~= self:GetOwner() and v:Health() > 0 then
                hit = true
                net.Start("arccw_apex_hit")
                    net.WriteBool(false)
                net.Send(self:GetOwner())
            end
        elseif not v:IsOnFire() then
            v:Ignite(5)
        end
    end
    for e, _ in pairs(toclear) do
        self.Damaged[e] = 0
    end

    self.NextDamageTick = CurTime() + 0.1
end

function ENT:ThinkEffect()
    if not self:IsValid() or self:WaterLevel() > 2 then return end
    local emitter = ParticleEmitter(self:GetPos())
    if not IsValid(emitter) then return end

    if not self:GetBurning() then
        self.NextFlareTime = self.NextFlareTime or CurTime()

        if self.NextFlareTime <= CurTime() then
            self.NextFlareTime = CurTime() + 0.025 / math.Clamp(self:GetVelocity():Length() / 1500, 1, 3)
            local fire = emitter:Add("particle/smokestack", self:GetPos())
            fire:SetVelocity(VectorRand() * 25)
            fire:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), -50))
            fire:SetDieTime(math.Rand(0.75, 1))
            fire:SetStartAlpha(125)
            fire:SetEndAlpha(0)
            fire:SetStartSize(7)
            fire:SetEndSize(35)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(125, 125, 125)
            fire:SetAirResistance(50)
            fire:SetPos(self:GetPos())
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0.8)
        end
    else
        if self.Ticks % 5 == 0 then
            local fire = emitter:Add("effects/fire_cloud" .. math.random(1, 2), self:GetPos())
            fire:SetVelocity(VectorRand() * 50)
            fire:SetGravity(Vector(0, 0, 15))
            fire:SetDieTime(1.5)
            fire:SetStartAlpha(75)
            fire:SetEndAlpha(0)
            fire:SetStartSize(12)
            fire:SetEndSize(75)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(255, 255, 255)
            fire:SetAirResistance(15)
            local v = VectorRand() * 24
            v.z = 4
            fire:SetPos(self:GetPos() + v)
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0.25)
        end

        if self.Ticks % 5 == 0 then
            local fire = emitter:Add(GetFireParticle(), self:GetPos())
            fire:SetVelocity(self:GetAngles():Forward() * math.Rand(-100, 100) + VectorRand() * 50 + (self:GetAngles():Up() * 50))
            fire:SetGravity(Vector(0, 0, 100))
            fire:SetDieTime(math.Rand(0.25, 0.5))
            fire:SetStartAlpha(255)
            fire:SetEndAlpha(0)
            fire:SetStartSize(10)
            fire:SetEndSize(75)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(255, 255, 255)
            fire:SetAirResistance(15)
            fire:SetPos(self:GetPos() + VectorRand() * 16)
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0.5)
        end

        if self.Ticks % 1 == 0 then
            local fire = emitter:Add("effects/spark", self:GetPos())
            fire:SetVelocity(VectorRand() * 250 + Vector(0, 0, 250))
            fire:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), -1000))
            fire:SetDieTime(math.Rand(0.5, 1))
            fire:SetStartAlpha(255)
            fire:SetEndAlpha(0)
            fire:SetStartSize(5)
            fire:SetEndSize(0)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(255, 135, 0)
            fire:SetAirResistance(50)
            fire:SetPos(self:GetPos() + VectorRand() * 32)
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0.8)
            fire.Ticks = 0
        end
    end

    emitter:Finish()
    self.Ticks = self.Ticks + 1
end

function ENT:Arm(data)
    self:SetBurning(true)

    self.FireSound = CreateSound(self, "weapons/grenades/thermite/Wpn_ThermiteGrenade_ExploBurn_Close_2ch_v2_04.ogg")
    self.FireSound:PlayEx(1, 80)
    self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_ExploBurn_Dist_2ch_v1_0" .. math.random(1, 6) .. ".ogg", 120, 110, 0.5)

    self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_Explo_Close_2ch_v1_0" .. math.random(1, 3) .. ".ogg", 80, 110)
    self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_Explo_Dist_2ch_v1_0" .. math.random(1, 3) .. ".ogg", 120, 110, 0.5)

    local effectdata = EffectData()
    effectdata:SetOrigin(data.HitPos)
    effectdata:SetNormal(data.HitNormal)
    effectdata:SetRadius(32)
    util.Effect("cball_explode", effectdata)

    timer.Simple(self.FireTime - 1, function()
        if not IsValid(self) then return end
        self.FireSound:Stop()
        self:EmitSound("weapons/grenades/thermite/Wpn_ThermiteGrenade_ExploBurn_Close_End_2ch_v2_0" .. math.random(4, 8) .. ".ogg", 95, 110)
    end)

    timer.Simple(self.FireTime, function()
        if not IsValid(self) then return end
        self:Remove()
    end)

    local hit = false
    for _, ent in pairs(ents.FindInSphere(self:GetPos(), 96)) do
        if not ArcCW.Apex.ValidNadeTarget(ent) or not self:CheckLOS(ent) then continue end
        dmginfo = DamageInfo()
        dmginfo:SetDamageType(ArcCW.Apex.FireDirectDamage[ent:GetClass()] and DMG_DIRECT or DMG_BURN)
        dmginfo:SetAttacker(self:GetOwner())
        dmginfo:SetDamage(25)
        dmginfo:SetInflictor(self)
        ent:TakeDamageInfo(dmginfo)

        if not hit and IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() and ent ~= self:GetOwner() and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then
            hit = true
            net.Start("arccw_apex_hit")
                net.WriteBool(false)
            net.Send(self:GetOwner())
        end
    end
end