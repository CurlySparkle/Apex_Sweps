ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Thermite"
ENT.Spawnable = false
ENT.Model = "models/hunter/plates/plate025x025.mdl"
AddCSLuaFile()

function ENT:Initialize()
    if SERVER then
        self:SetModel(self.Model)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
        self:SetNoDraw(true)
        local phys = self:GetPhysicsObject()

        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.SpawnTime = CurTime()

        self.FireTime = self.FireTime or 10
    end

    self.Ticks = 0
end

local fired = {"effects/fire_embers1", "effects/fire_embers2", "effects/fire_embers3"}
local function GetFireParticle()
    return fired[math.random(#fired)]
end


function ENT:PhysicsCollide(data, physobj)
    if SERVER and not self.Stuck and data.HitEntity:GetClass() ~= "arccw_apex_thr_thermite" then
        self.Stuck = true
        timer.Simple(0.01, function() self:SetMoveType(MOVETYPE_NONE) end)
    end
end

function ENT:Think()
    if SERVER then
        if CurTime() > self.SpawnTime + self.FireTime then self:Remove() return end
    else
        local emitter = ParticleEmitter(self:GetPos())
        if not self:IsValid() or self:WaterLevel() > 2 then return end
        if not IsValid(emitter) then return end

        if self.Ticks % 10 == 0 then
            local fire = emitter:Add("effects/fire_cloud" .. math.random(1, 2), self:GetPos())
            fire:SetVelocity(VectorRand() * 50)
            fire:SetGravity(Vector(0, 0, 15))
            fire:SetDieTime(1)
            fire:SetStartAlpha(100)
            fire:SetEndAlpha(0)
            fire:SetStartSize(10)
            fire:SetEndSize(75)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(255, 255, 255)
            fire:SetAirResistance(15)
            fire:SetPos(self:GetPos() + self:GetForward() * math.random(-32, 32))
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0)
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

        if self.Ticks % 2 == 0 then
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

        emitter:Finish()
        self.Ticks = self.Ticks + 1
    end
end

function ENT:Draw()
    self:DrawModel()
    cam.Start3D() -- Start the 3D function so we can draw onto the screen.
    render.SetMaterial(Material("sprites/orangeflare1")) -- Tell render what material we want, in this case the flash from the gravgun
    render.DrawSprite(self:GetPos(), math.random(400, 500), math.random(400, 500), Color(255, 255, 255)) -- Draw the sprite in the middle of the map, at 16x16 in it's original colour with full alpha.
    cam.End3D()
end