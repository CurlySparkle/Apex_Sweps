ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Gas Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.Model = "models/weapons/w_apex_nade_nox_thrown.mdl"
ENT.FuseTime = 2
ENT.ArmTime = 0
ENT.FireTime = 30
ENT.ImpactFuse = false

ENT.Armed = false

ENT.NextDamageTick = 0

ENT.Ticks = 0

AddCSLuaFile()

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

        timer.Simple(0.1, function()
            if !IsValid(self) then return end
            self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
        end)
    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        if data.Speed > 75 then
            self:EmitSound(Sound("weapons/grenades/imp_physics_grenade_default_hard_bounce_0" .. math.random(1,8) .. ".wav"))
        elseif data.Speed > 25 then
            self:EmitSound(Sound("weapons/grenades/grenade_bounce_2ch_v2_0" .. math.random(1,3) .. ".wav"))
        end

        if (CurTime() - self.SpawnTime >= self.ArmTime) and self.ImpactFuse then
            self:Detonate()
        end
    end
end

function ENT:Think()
    if !self.SpawnTime then self.SpawnTime = CurTime() end

    if SERVER and CurTime() - self.SpawnTime >= self.FuseTime and !self.Armed then
        self:Detonate()
        self:SetArmed(true)
    end

    if self:GetArmed() then

        if SERVER then
            if self.NextDamageTick > CurTime() then return end

            local dmg = DamageInfo()

            dmg:SetDamage(15)
            dmg:SetDamageType(DMG_NERVEGAS)
            dmg:SetInflictor(self)
            dmg:SetAttacker(self.Owner)

            if !IsValid(self.Owner) then
                dmg:SetAttacker(self)
            end

            for _, i in pairs(ents.FindInSphere(self:GetPos(), 265)) do
                i:TakeDamageInfo(dmg)

                if i:IsPlayer() and i:Alive() and i:GetObserverMode() == OBS_MODE_NONE then
                    local newang = (AngleRand() * 0.05)
                    newang.r = 0
                    i:SetEyeAngles(i:EyeAngles() + newang)
                    i:ScreenFade( SCREENFADE.IN, Color( 150, 175, 0 ), 0.75, 0.25 )
                end
            end

            self.NextDamageTick = CurTime() + 1
        else
            local emitter = ParticleEmitter(self:GetPos())

            if !self:IsValid() or self:WaterLevel() > 2 then return end
            if !IsValid(emitter) then return end

            if self.Ticks % 5 == 0 then
                local fire = emitter:Add("particles/smokey", self:GetPos())
                fire:SetVelocity( VectorRand() * 500 )
                fire:SetGravity( Vector(math.Rand(-100, 100), math.Rand(-100, 100), 100) )
                fire:SetDieTime( math.Rand(3, 5) )
                fire:SetStartAlpha( 5 )
                fire:SetEndAlpha( 0 )
                fire:SetStartSize( 100 )
                fire:SetEndSize( 250 )
                fire:SetRoll( math.Rand(-180, 180) )
                fire:SetRollDelta( math.Rand(-0.2,0.2) )
                fire:SetColor( 0, 155, 0 )
                fire:SetAirResistance( 250 )
                fire:SetPos( self:GetPos() )
                fire:SetLighting( false )
                fire:SetCollide(true)
                fire:SetBounce(0.95)
                fire:SetNextThink( CurTime() + FrameTime() )
                fire:SetThinkFunction( function(pa)
                    if !pa then return end
                    local col1 = Color(100, 175, 0)
                    local col2 = Color(0, 155, 0)
					local col4 = Color(0, 100, 0)

                    local col3 = col1
                    local d = pa:GetLifeTime() / pa:GetDieTime()
                    col3.r = Lerp(d, col1.r, col2.r, col4.r)
                    col3.g = Lerp(d, col1.g, col2.g, col4.g)
                    col3.b = Lerp(d, col1.b, col2.b, col4.b)

                    pa:SetColor(col3.r, col3.g, col3.b)
                    pa:SetNextThink( CurTime() + FrameTime() )
                end )
            end

            emitter:Finish()

            self.Ticks = self.Ticks + 0.5
        end

    end
end

function ENT:OnRemove()
    if !self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:Detonate()
    if !self:IsValid() then return end

    self.Armed = true
    self:EmitSound("weapons/grenades/nox/GasGrenade_Explo_Close_2ch_v1_0" .. math.random(1,3) .. ".wav", 120, 100, 1, CHAN_AUTO)
    self.FireSound = CreateSound(self, "ArcCW_APEX.Nox.Gas_Loop_close")
    self.FireSound:Play()

    self.FireSound:ChangePitch(100, self.FireTime)

    timer.Simple(self.FireTime - 1, function()
        if !IsValid(self) then return end

        self.FireSound:ChangeVolume(0, 1)
    end)

    timer.Simple(self.FireTime, function()
        if !IsValid(self) then return end

        self:Remove()
    end)
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()
    end
end