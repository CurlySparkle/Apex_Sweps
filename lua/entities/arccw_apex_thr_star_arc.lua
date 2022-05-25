AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_star_arc", "VGUI/apex_nade_killicon_arcstar", Color(251, 85, 25, 255))
end

ENT.Type = "anim"
ENT.Base = "arccw_apex_thr"
ENT.PrintName = "Arc Star"
ENT.Spawnable = false
ENT.Model = "models/weapons/w_apex_nade_arcstar_thrown.mdl"
ENT.TrailColor = Color(175, 175, 255, 250)

ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
ENT.Armed = false

ENT.ImpactDamage = {
    [0] = 10,
    [1] = 25,
    [2] = 25,
}

ENT.BlastDamage = {
    [0] = 70,
    [1] = 80,
    [2] = 50,
}

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Stuck")
end

function ENT:InitPhys()
    self:PhysicsInitBox(Vector(-1, -1, -0.25), Vector(1, 1, 0.25))
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
        phys:SetBuoyancyRatio(0)
        phys:AddAngleVelocity(Vector(0, -700, 3000))
        phys:SetDragCoefficient(0.25)
    end
end

function ENT:Initialize()
    if SERVER then
        self:SetModel(self.Model or "models/weapons/w_apex_nade_arcstar_thrown.mdl")
        self:InitPhys()
        self.SpawnTime = CurTime()
        self.Trail = util.SpriteTrail(self, 0, self.TrailColor, false, 2, 0, 0.5, 1, "effects/beam001_white")
        self:SetPhysicsAttacker(self:GetOwner(), 10)
    end
end

function ENT:Think()
    if SERVER and self.Armed and self.DetonateTime < CurTime() then

        local pos = self:GetPos()
        if IsValid(self:GetParent()) then pos = self:GetParent():WorldSpaceCenter() end

        local explode = ents.Create( "info_particle_system" )
        explode:SetKeyValue( "effect_name", "tfa_apex_arcstar_explode" )
        explode:SetOwner( self.Owner )
        explode:SetPos( self:GetPos() )
        explode:Spawn()
        explode:Activate()
        explode:Fire( "start", "", 0 )
        explode:Fire( "kill", "", 30 )

        self:EmitSound("weapons/grenades/arcstar/explo_star_close_2ch_v1_0" .. math.random(1, 3) .. ".wav", 125, 100, 1, CHAN_AUTO)

        local hit = false
        local blastdmg = self.BlastDamage[ArcCW.Apex.GetBalanceMode()]

        for _, ent in pairs(ents.FindInSphere(pos, 300)) do
            if ArcCW.Apex.GrenadeBlacklist[ent:GetClass()] or ent:IsWeapon() or not self:CheckLOS(ent) then continue end
            local distSqr = ent:GetPos():DistToSqr(pos)
            local f = 1
            if distSqr > 4900 then -- 70 * 70
                f = Lerp((distSqr - 4900) / (90000 - 4900), 1, 0.25)
            end
            local dmginfo = DamageInfo()
            dmginfo:SetDamageType(DMG_SHOCK)
            dmginfo:SetAttacker(self:GetOwner())
            dmginfo:SetDamage(blastdmg * f)
            dmginfo:SetDamageForce((ent:WorldSpaceCenter() - pos):GetNormalized() * 9001 * f)
            dmginfo:SetInflictor(self)
            ent:TakeDamageInfo(dmginfo)

            if ent:IsPlayer() then
                ArcCW.Apex.ArcSlow(ent, 5 * f)
            end
            if not hit and IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() and ent ~= self:GetOwner() and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then
                hit = true
                net.Start("arccw_apex_hit")
                    net.WriteBool(false)
                net.Send(self:GetOwner())
            end
        end

        self:Remove()
    elseif CLIENT and self:GetStuck() and not self.StuckTime then
        self.StuckTime = CurTime()
        local emitter = ParticleEmitter(self:GetPos())
        if not IsValid(emitter) then return end
        local fire = emitter:Add("effects/bluemuzzle", self:GetPos())
        fire:SetDieTime(2.75)
        fire:SetStartAlpha(100)
        fire:SetEndAlpha(100)
        fire:SetStartSize(10)
        fire:SetEndSize(10)
        fire:SetRoll(math.Rand(-180, 180))
        fire:SetRollDelta(math.Rand(-0.2, 0.2))
        fire:SetColor(125, 160, 125)
        fire:SetAirResistance(25)
        fire:SetPos(self:GetPos() - self:GetForward() * 16)
        fire:SetLighting(false)
        fire:SetCollide(false)
        fire:SetNextThink(CurTime() + FrameTime())
        fire:SetThinkFunction(function(pa)
            if not IsValid(self) then return end
            local s = Lerp((CurTime() - self.StuckTime) / 2.5, 0.25, 1) ^ 2
            pa:SetPos(self:GetPos() - self:GetForward() * 16)
            pa:SetStartSize(s * 90 * math.Rand(0.9, 1.1))
            pa:SetEndSize(s * 90 * math.Rand(0.9, 1.1))
            local a = math.Rand(85, 115)
            pa:SetStartAlpha(a)
            pa:SetEndAlpha(a)
            pa:SetNextThink(CurTime() + FrameTime())
        end)
        emitter:Finish()
    end
end

function ENT:PhysicsCollide(data, physobj)
    if self:GetStuck() or self.Armed then return end
    self.Armed = true

    local tgt = data.HitEntity

    local f = {self}
    table.Add(f, tgt:GetChildren())

    local tr = util.TraceLine({
        start = data.HitPos,
        endpos = data.HitPos + data.OurOldVelocity,
        filter = f,
        mask = MASK_SHOT
    })
    local hs = tr.Entity == tgt and tr.HitGroup == HITGROUP_HEAD
    local dmginfo = DamageInfo()
    dmginfo:SetDamageType(DMG_NEVERGIB + DMG_CRUSH)
    dmginfo:SetDamage(self.ImpactDamage[ArcCW.Apex.GetBalanceMode()])
    if hs then dmginfo:ScaleDamage(2) end
    dmginfo:SetAttacker(self:GetOwner())
    dmginfo:SetInflictor(self)
    tgt:TakeDamageInfo(dmginfo)

    if IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() and (tgt:IsPlayer() or tgt:IsNPC() or tgt:IsNextBot()) then
        net.Start("arccw_apex_hit")
            net.WriteBool(hs)
        net.Send(self:GetOwner())
    end

    local effectdata = EffectData()
    effectdata:SetOrigin(data.HitPos)
    effectdata:SetNormal(data.HitNormal)
    effectdata:SetRadius(32)
    util.Effect("cball_bounce", effectdata)

    local angles = data.OurOldVelocity:GetNormalized():Angle()

    self:EmitSound("weapons/grenades/arcstar/Phys_Imp_GrenadeArc_Flesh_3p_1ch_v1_0" .. math.random(1, 3) .. ".wav", 80)
    self:EmitSound("weapons/grenades/arcstar/Wpn_ArcStar_3P_Warning_StaticWindup_1ch_01.wav")

    if tgt:IsWorld() or (IsValid(tgt) and tgt:GetPhysicsObject():IsValid()) then
        timer.Simple(0, function()
            self:SetAngles(angles)
            self:SetPos(data.HitPos)
            self:GetPhysicsObject():Sleep()

            if tgt:IsWorld() or IsValid(tgt) then
                tr = util.TraceLine({
                    start = data.HitPos,
                    endpos = data.HitPos + data.OurOldVelocity,
                    filter = f,
                    mask = MASK_SHOT
                })
                local ent = tr.Entity
                if ent:IsWorld() or IsValid(ent) then
                    local bone = ent:TranslatePhysBoneToBone(tr.PhysicsBone) or ent:GetHitBoxBone(tr.HitBox, ent:GetHitboxSet())
                    local matrix = tgt:GetBoneMatrix(bone or 0)
                    self:SetSolid(SOLID_NONE)
                    self:SetMoveType(MOVETYPE_NONE)
                    self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
                    if ent == tgt and bone and matrix then
                        local pos = matrix:GetTranslation()
                        local ang = matrix:GetAngles()
                        self:FollowBone(tgt, bone)
                        local n_pos, n_ang = WorldToLocal(tr.HitPos, tr.Normal:Angle(), pos, ang)
                        self:SetLocalPos(n_pos)
                        self:SetLocalAngles(n_ang)
                        self:GetParent():DontDeleteOnRemove(self)
                    elseif not tgt:IsWorld() then
                        self:SetParent(tgt)
                        self:GetParent():DontDeleteOnRemove(self)
                    end
                    self:SetStuck(true)
                    self.AttachToWorld = tgt:IsWorld()
                end
            end
        end)
    end

    self.DetonateTime = CurTime() + 2.5
end

-- draws over world
--[[]
local glow = Material("effects/blueblackflash")
function ENT:Draw()
    self:DrawModel()
    if self:GetStuck() then
        self.StuckTime = self.StuckTime or CurTime()
        local s = 0.25
        if CurTime() - self.StuckTime > 2 then
            s = s + Lerp((CurTime() - self.StuckTime - 2) / 0.5, 0, 1) ^ 2
        else
            s = s + Lerp((CurTime() - self.StuckTime) / 2.5, 1, 0) ^ 2
        end
        cam.Start3D()
            render.SetMaterial(glow)
            render.DrawSprite(self:GetPos() + self:GetForward() * 16, s * math.Rand(150, 200), s * math.Rand(150, 200), Color(255, 255, 255, 75))
        cam.End3D()
    end
end
]]