local ang

EFFECT.ParticleName = "tfa_apex_muzzle_smg"

function EFFECT:Init(data)
    self.WeaponEnt = data:GetEntity()
    if not IsValid(self.WeaponEnt) then return end
    self.Attachment = data:GetAttachment() or 1
    self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)

    if IsValid(self.WeaponEnt.Owner) then
        if self.WeaponEnt.Owner == LocalPlayer() then
            if not self.WeaponEnt:IsFirstPerson() then
                ang = self.WeaponEnt.Owner:EyeAngles()
                ang:Normalize()
                --ang.p = math.max(math.min(ang.p,55),-55)
                self.Forward = ang:Forward()
            else
                self.WeaponEnt = self.WeaponEnt.Owner:GetViewModel()
            end
            --ang.p = math.max(math.min(ang.p,55),-55)
        else
            ang = self.WeaponEnt.Owner:EyeAngles()
            ang:Normalize()
            self.Forward = ang:Forward()
        end
    end

    self.Forward = self.Forward or data:GetNormal()
    self.Angle = self.Forward:Angle()
        
    local dlight = DynamicLight(self.WeaponEnt:EntIndex())
    if (dlight) then
        dlight.pos = self.Position + self.Angle:Up() * 3 + self.Angle:Right() * -2
        dlight.r = 255
        dlight.g = 192
        dlight.b = 64
        dlight.brightness = 5
        dlight.Size = math.Rand(32, 64)
        dlight.Decay = math.Rand(32, 64) / 0.05
        dlight.DieTime = CurTime() + 0.05
    end
    
    self.Right = self.Angle:Right()
    self.vOffset = self.Position
    dir = self.Forward

    ParticleEffectAttach( self.ParticleName, PATTACH_POINT_FOLLOW, self.WeaponEnt, self.Attachment)
end

function EFFECT:Think()
    return false
end

function EFFECT:Render()
end
