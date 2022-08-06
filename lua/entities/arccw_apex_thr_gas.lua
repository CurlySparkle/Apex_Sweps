AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_gas", "VGUI/apex_nade_killicon_nox", Color(251, 85, 25, 255))
end

ENT.Type = "anim"
ENT.Base = "arccw_apex_thr"
ENT.PrintName = "Gas Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.Model = "models/weapons/w_apex_nade_nox_thrown.mdl"
ENT.Damaged = {}
ENT.Armed = false
ENT.FireTime = 30

ENT.BalFireTime = {
    [0] = 30,
    [1] = 30,
    [2] = 20
}

ENT.GasRadius = {
    [0] = 512,
    [1] = 512,
    [2] = 350,
}

ENT.NextDamageTick = 0

ENT.Ticks = 0

sound.Add( {
    name = "ArcCW_APEX.Nox.Gas_Loop_close",
    channel = CHAN_WEAPON + 6,
    volume = 1.0,
    level = 75,
    pitch = {95, 105},
    sound = {
        "^weapons/grenades/nox/GasGrenade_GasCloud_Loop_Close_Short_2ch_v1_01.wav",
        "^weapons/grenades/nox/GasGrenade_GasCloud_Loop_Close_Short_2ch_v1_02.wav",
    }
} )
util.PrecacheSound("ArcCW_APEX.Nox.Gas_Loop_close")

function ENT:SetupDataTables()
    self:NetworkVar( "Bool", 0, "Armed" )

    if SERVER then
        self:SetArmed(false)
    end
end

function ENT:Initialize()
    if SERVER then
        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:DrawShadow( true )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.SpawnTime = CurTime()
        self.FireTime = self.BalFireTime[ArcCW.Apex.GetBalanceMode()]
    end

    table.insert(ArcCW.Apex.NoxSources, self)
end

function ENT:PhysicsCollide(data, physobj)
    local tgt = data.HitEntity
    local dmginfo = DamageInfo()
    dmginfo:SetDamageType(DMG_GENERIC)
    dmginfo:SetDamage(10)
    dmginfo:SetAttacker(self:GetOwner())
    dmginfo:SetInflictor(self)
    dmginfo:SetDamageForce(data.OurOldVelocity * 0.5)
    tgt:TakeDamageInfo(dmginfo)
    if IsValid(self:GetOwner()) and  (tgt:IsNPC() or tgt:IsPlayer() or tgt:IsNextBot()) and self:GetOwner():IsPlayer() then
        net.Start("arccw_apex_hit")
            net.WriteBool(false)
        net.Send(self:GetOwner())
    end
    if (IsValid(tgt) and (tgt:IsNPC() or tgt:IsPlayer() or tgt:IsNextBot()) and tgt:Health() <= 0) or (not tgt:IsWorld() and not IsValid(tgt)) or string.find(tgt:GetClass(), "breakable") then
        local pos, ang, vel = self:GetPos(), self:GetAngles(), data.OurOldVelocity
        timer.Simple(0, function()
            if IsValid(self) then
                self:SetAngles(ang)
                self:SetPos(pos)
                self:GetPhysicsObject():SetVelocityInstantaneous(vel)
            end
        end)
    else
        local tr = util.TraceLine({
            start = self:GetPos(),
            endpos = self:GetPos() - Vector(0, 0, 16),
            filter = self,
            mask = MASK_SOLID,
        })
        if tr.Hit then
            self:Detonate()
        elseif data.Speed > 75 then
            self:EmitSound("weapons/grenades/imp_physics_grenade_default_hard_bounce_0" .. math.random(1, 8) .. ".wav")
        elseif data.Speed > 25 then
            self:EmitSound("weapons/grenades/grenade_bounce_2ch_v2_0" .. math.random(1, 3) .. ".wav")
        end
    end
end

function ENT:Think()
    if not self.SpawnTime then self.SpawnTime = CurTime() end
    if SERVER then return end

    local emitter = ParticleEmitter(self:GetPos())
    if not IsValid(emitter) then return end

    local r = self.GasRadius[ArcCW.Apex.GetBalanceMode()]

    if self:GetArmed() then
        if not self.Bursted then
            self.Bursted = true

            for i = 1, 75 do
                local fire = emitter:Add("particle/smokestack", self:GetPos())
                fire:SetVelocity(ArcCW.Apex.CircleRandVector(r * 2) + Vector(0, 0, math.Rand(32, 64)))
                fire:SetGravity(Vector(0, 0, 0))
                fire:SetDieTime(math.Rand(10, 15))
                fire:SetStartAlpha(100)
                fire:SetEndAlpha(0)
                fire:SetStartSize(100)
                fire:SetEndSize(250)
                fire:SetRoll(math.Rand(-180, 180))
                fire:SetRollDelta(math.Rand(-0.5, 0.5))
                fire:SetColor(175, 175, 100)
                fire:SetAirResistance(96)
                fire:SetPos(self:GetPos())
                fire:SetLighting(false)
                fire:SetCollide(false)
                fire:SetBounce(0.95)
            end
        end
        if self.Ticks % 3 == 0 then
            local fire = emitter:Add("particle/smokestack", self:GetPos())
            fire:SetVelocity(ArcCW.Apex.CircleRandVector(r * 1.25))
            fire:SetGravity(Vector(0, 0, 0))
            fire:SetDieTime(math.Rand(3, 5))
            fire:SetStartAlpha(100)
            fire:SetEndAlpha(0)
            fire:SetStartSize(100)
            fire:SetEndSize(300)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(175, 175, 100)
            fire:SetAirResistance(64)
            fire:SetPos(self:GetPos())
            fire:SetLighting(false)
            fire:SetCollide(false)
            fire:SetBounce(0.95)
        end
        self.Ticks = self.Ticks + 0.5
    else
        local vel = self:GetVelocity():Length()

        self.NextFlareTime = self.NextFlareTime or CurTime()
        if self.NextFlareTime <= CurTime() then
            local fire = emitter:Add("particle/smokestack", self:GetPos())

            if self:GetNoDraw() then -- about to detonate
                self.NextFlareTime = CurTime() + 0.025
                fire:SetDieTime(math.Rand(0.75, 1))
                fire:SetVelocity(VectorRand() * 256 + Vector(0, 0, -128))
                fire:SetEndSize(150)
            else
                self.NextFlareTime = CurTime() + 0.025 / math.Clamp(vel / 1000, 0.1, 3)
                fire:SetDieTime(math.Rand(1, 2))
                fire:SetVelocity(VectorRand() * 25)
                fire:SetEndSize(50)
            end

            fire:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), -50))

            fire:SetStartAlpha(100)
            fire:SetEndAlpha(0)
            fire:SetStartSize(10)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(175, 175, 100)
            fire:SetAirResistance(50)
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0.8)
            fire:SetPos(self:GetPos())
        end
    end

    emitter:Finish()
end

function ENT:OnRemove()
    if not self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:Detonate()
    if not self:IsValid() or self.Armed then return end

    self:EmitSound("weapons/grenades/nox/GasGrenade_WarningSizzle_1ch_v1_01.ogg", 90)
    self.Armed = true

    timer.Simple(1, function()
        if not IsValid(self) then return end
        self:SetArmed(true)
        self:EmitSound("weapons/grenades/nox/GasGrenade_Explo_Close_2ch_v1_0" .. math.random(1,3) .. ".ogg", 100, 100, 1, CHAN_AUTO)
        self.FireSound = CreateSound(self, "ArcCW_APEX.Nox.Gas_Loop_close")
        self.FireSound:PlayEx(1, 95)
    end)

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
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()
    end
end