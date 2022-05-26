AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_frag_arc", "VGUI/apex_nade_killicon_frag", Color(251, 85, 25, 255))
end
ENT.Type = "anim"
ENT.Base = "arccw_apex_thr_frag"
ENT.PrintName = "Firebomb"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.Model = "models/weapons/w_apex_nade_frag_thrown.mdl"
ENT.Skin = 1
ENT.FuseTime = 4
ENT.FireTime = 12
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
    local damaged = {}
    local toclear = table.Copy(self.Damaged)
    for i, ent in ipairs(self.Thermites) do
        if not IsValid(ent) then table.remove(self.Thermites, i) continue end
        local o = ent:GetPos() + Vector(0, 0, 16)
        for k, v in pairs(ents.FindInSphere(o, 72)) do
            if not damaged[v] and not ArcCW.Apex.GrenadeBlacklist[v:GetClass()] and not v:IsWeapon() and self:CheckLOS(v, o) then -- As it turns out, this will ignite ALL weapons on a player's inventory
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
        dmg:SetDamageType(ArcCW.Apex.FireDirectDamage[v:GetClass()] and DMG_DIRECT or DMG_BURN)
        dmg:SetDamage(math.floor(4 + self.Damaged[v:EntIndex()] * 1.5))
        dmg:SetInflictor(IsValid(self) and self or o)
        dmg:SetAttacker(o)
        dmg:SetDamageForce(Vector(0, 0, 0))
        v:TakeDamageInfo(dmg)

        if v:IsNPC() or (v:IsPlayer() and v:Alive()) or v:IsNextBot() then
            if not hit and IsValid(self:GetOwner()) and v ~= self:GetOwner() and v:Health() > 0 then
                hit = true
                net.Start("arccw_apex_hit")
                    net.WriteBool(false)
                net.Send(self:GetOwner())
            end
            if timer.Exists("thermite_burn_" .. v:EntIndex()) then timer.Remove("thermite_burn_" .. v:EntIndex()) end
            timer.Create("thermite_burn_" .. v:EntIndex(), 0.5, 8, function()
                if not IsValid(v) or (v:IsPlayer() and not v:Alive()) then
                    timer.Remove("thermite_burn_" .. v:EntIndex())
                    return
                end
                local d = DamageInfo()
                d:SetDamageType(ArcCW.Apex.FireDirectDamage[v:GetClass()] and DMG_DIRECT or DMG_BURN)
                d:SetDamage(5)
                d:SetInflictor(IsValid(self) and self or o)
                d:SetAttacker(o)
                d:SetDamageForce(Vector(0, 0, 0))
                v:TakeDamageInfo(d)
                if IsValid(self) and IsValid(self:GetOwner()) and v ~= self:GetOwner() and v:Health() > 0 then
                    net.Start("arccw_apex_hit")
                        net.WriteBool(false)
                    net.Send(self:GetOwner())
                end
            end)
        elseif not v:IsOnFire() then
            v:Ignite(5)
        end
    end
    for e, _ in pairs(toclear) do
        self.Damaged[e] = 0
    end
    self.NextDamageTick = CurTime() + 0.15
end

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
        util.Effect("Sparks", eff)
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