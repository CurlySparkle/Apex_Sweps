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

ENT.NextDamageTick = 0

ENT.Ticks = 0

sound.Add( {
    name = "ArcCW_APEX.Nox.Gas_Loop_close",
    channel = CHAN_WEAPON + 6,
    volume = 1.0,
    level = 100,
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
    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        self:Detonate()
    end
end

function ENT:Think()
    if not self.SpawnTime then self.SpawnTime = CurTime() end

    if self:GetArmed() then

        if SERVER then
            if self.NextDamageTick > CurTime() then return end
            local damaged = {}
            local toclear = table.Copy(self.Damaged)
            for k, v in pairs(ents.FindInSphere(self:GetPos(), 512)) do
                if not damaged[v] and not ArcCW.Apex.GrenadeBlacklist[v:GetClass()] and not v:IsWeapon() then
                    damaged[v] = true
                    if toclear[v:EntIndex()] then toclear[v:EntIndex()] = nil end
                end
            end

            local hit = false
            for v, i in pairs(damaged) do
                self.Damaged[v:EntIndex()] = (self.Damaged[v:EntIndex()] or 0) + 0.5
                local o = self.Owner
                local dmg = DamageInfo()
                dmg:SetDamageType(DMG_NERVEGAS)
                dmg:SetDamage(math.floor(4.5 + self.Damaged[v:EntIndex()]))
                dmg:SetInflictor(IsValid(self) and self or o)
                dmg:SetAttacker(o)
                dmg:SetDamageForce(Vector(0, 0, 0))
                v:TakeDamageInfo(dmg)
                if not hit and (v:IsNPC() or (v:IsPlayer() and v:Alive()) or v:IsNextBot()) and IsValid(self:GetOwner()) and v ~= self:GetOwner() and v:Health() > 0 then
                    hit = true
                    net.Start("arccw_apex_hit")
                        net.WriteBool(false)
                    net.Send(self:GetOwner())
                end
            end
            for e, _ in pairs(toclear) do
                self.Damaged[e] = 0
            end
            self.NextDamageTick = CurTime() + 1
        else
            local emitter = ParticleEmitter(self:GetPos())

            if not self:IsValid() or self:WaterLevel() > 2 then return end
            if not IsValid(emitter) then return end

            if self.Ticks % 3 == 0 then
                local fire = emitter:Add("particles/smokey", self:GetPos())
                fire:SetVelocity( VectorRand() * 128 + Vector(0, 0, 96))
                fire:SetGravity( Vector(math.Rand(-100, 100), math.Rand(-100, 100), -5) )
                fire:SetDieTime( math.Rand(5, 8) )
                fire:SetStartAlpha( 100 )
                fire:SetEndAlpha( 0 )
                fire:SetStartSize( 100 )
                fire:SetEndSize( 250 )
                fire:SetRoll( math.Rand(-180, 180) )
                fire:SetRollDelta( math.Rand(-0.2,0.2) )
                fire:SetColor(175, 175, 100)
                fire:SetAirResistance( 128 )
                fire:SetPos( self:GetPos() + Vector(math.Rand(-256, 256), math.Rand(-256, 256), 0))
                fire:SetLighting( false )
                fire:SetCollide(true)
                fire:SetBounce(0.95)
            end

            emitter:Finish()

            self.Ticks = self.Ticks + 0.5
        end

    elseif CLIENT then
        local vel = self:GetVelocity():Length()

        local emitter = ParticleEmitter(self:GetPos())

        if not self:IsValid() or self:WaterLevel() > 2 then return end
        if not IsValid(emitter) then return end

        self.NextFlareTime = self.NextFlareTime or CurTime()
        if self.NextFlareTime <= CurTime() then
            self.NextFlareTime = CurTime() + 0.025 / math.Clamp(vel / 1000, 0.1, 3)
            local fire = emitter:Add("particle/smokestack", self:GetPos())
            fire:SetVelocity(VectorRand() * 25)
            fire:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), -50))
            fire:SetDieTime(math.Rand(1, 2))
            fire:SetStartAlpha(100)
            fire:SetEndAlpha(0)
            fire:SetStartSize(10)
            fire:SetEndSize(50)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(155, 175, 100)
            fire:SetAirResistance(50)
            fire:SetPos(self:GetPos())
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0.8)
        end

        emitter:Finish()
    end
end

function ENT:OnRemove()
    if not self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:Detonate()
    if not self:IsValid() or self.Armed then return end

    self:EmitSound("weapons/grenades/nox/GasGrenade_WarningSizzle_1ch_v1_01.wav", 90)
    self.Armed = true

    timer.Simple(1, function()
        if IsValid(self) then self:SetArmed(true) end
        self:EmitSound("weapons/grenades/nox/GasGrenade_Explo_Close_2ch_v1_0" .. math.random(1,3) .. ".wav", 120, 100, 1, CHAN_AUTO)
        self.FireSound = CreateSound(self, "ArcCW_APEX.Nox.Gas_Loop_close")
        self.FireSound:Play()
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