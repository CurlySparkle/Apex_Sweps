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
        self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
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
    if SERVER and not self.Stuck then
        self:SetMoveType(MOVETYPE_NONE)
    end
end

function ENT:Think()
    if SERVER then
        if CurTime() > self.SpawnTime + self.FireTime then self:Remove() return end
    else
        local emitter = ParticleEmitter(self:GetPos())
        if not self:IsValid() or self:WaterLevel() > 2 then return end
        if not IsValid(emitter) then return end

        if self.Ticks % 5 == 0 then
            local fire = emitter:Add(GetFireParticle(), self:GetPos())
            fire:SetVelocity((VectorRand() * 5) + (self:GetAngles():Up() * 100))
            fire:SetGravity(Vector(0, 0, 100))
            fire:SetDieTime(math.Rand(0.25, 0.5))
            fire:SetStartAlpha(255)
            fire:SetEndAlpha(0)
            fire:SetStartSize(50)
            fire:SetEndSize(120)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(255, 255, 255)
            fire:SetAirResistance(150)
            fire:SetPos(self:GetPos())
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0.75)
            fire:SetNextThink(CurTime() + FrameTime())

            --[[]
            fire:SetThinkFunction(function(pa)
                if not pa then return end
                local col1 = Color(255, 135, 0)
                local col2 = Color(255, 255, 255)
                local col3 = col1
                local d = pa:GetLifeTime() / pa:GetDieTime()
                col3.r = Lerp(d, col1.r, col2.r)
                col3.g = Lerp(d, col1.g, col2.g)
                col3.b = Lerp(d, col1.b, col2.b)
                pa:SetColor(col3.r, col3.g, col3.b)
                pa:SetNextThink(CurTime() + FrameTime())
            end)
            ]]
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
            fire:SetPos(self:GetPos())
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0.8)
            fire.Ticks = 0
        end

        --[[]
        self.NextFlareTime = self.NextFlareTime or CurTime()

        if self.NextFlareTime <= CurTime() then
            self.NextFlareTime = CurTime() + math.Rand(0.1, 0.5)
            local fire = emitter:Add("sprites/orangeflare1", self:GetPos())
            fire:SetVelocity(VectorRand() * 750)
            fire:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), -2000))
            fire:SetDieTime(math.Rand(1, 2))
            fire:SetStartAlpha(255)
            fire:SetEndAlpha(0)
            fire:SetStartSize(50)
            fire:SetEndSize(0)
            fire:SetRoll(math.Rand(-180, 180))
            fire:SetRollDelta(math.Rand(-0.2, 0.2))
            fire:SetColor(255, 255, 255)
            fire:SetAirResistance(50)
            fire:SetPos(self:GetPos())
            fire:SetLighting(false)
            fire:SetCollide(true)
            fire:SetBounce(0.8)
            fire.Ticks = 0
            fire:SetNextThink(CurTime() + FrameTime())

            fire:SetThinkFunction(function(pa)
                if not pa then return end
                local aemitter = ParticleEmitter(pa:GetPos())
                local d = pa:GetLifeTime() / pa:GetDieTime()
                if not IsValid(aemitter) then return end

                if pa.Ticks % 5 == 0 then
                    local afire = aemitter:Add("particles/smokey", pa:GetPos())
                    afire:SetVelocity(VectorRand() * 5)
                    afire:SetGravity(Vector(0, 0, 1500))
                    afire:SetDieTime(math.Rand(0.25, 0.5) * d)
                    afire:SetStartAlpha(255)
                    afire:SetEndAlpha(0)
                    afire:SetStartSize(5 * d)
                    afire:SetEndSize(20)
                    afire:SetRoll(math.Rand(-180, 180))
                    afire:SetRollDelta(math.Rand(-0.2, 0.2))
                    afire:SetColor(255, 255, 255)
                    afire:SetAirResistance(150)
                    afire:SetPos(pa:GetPos())
                    afire:SetLighting(false)
                    afire:SetCollide(true)
                    afire:SetBounce(0.9)
                    afire:SetNextThink(CurTime() + FrameTime())

                    afire:SetThinkFunction(function(apa)
                        if not apa then return end
                        local col1 = Color(255, 135, 0)
                        local col2 = Color(255, 255, 255)
                        local col3 = col1
                        local d = apa:GetLifeTime() / apa:GetDieTime()
                        col3.r = Lerp(d, col1.r, col2.r)
                        col3.g = Lerp(d, col1.g, col2.g)
                        col3.b = Lerp(d, col1.b, col2.b)
                        apa:SetColor(col3.r, col3.g, col3.b)
                        apa:SetNextThink(CurTime() + FrameTime())
                    end)
                end

                aemitter:Finish()
                pa.Ticks = pa.Ticks + 1
                pa:SetNextThink(CurTime() + FrameTime())
            end)
        end
        ]]

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