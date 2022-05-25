AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_star_blade", "VGUI/apex_nade_killicon_arcstar", Color(251, 85, 25, 255))
end

ENT.Type = "anim"
ENT.Base = "arccw_apex_thr_star_arc"
ENT.PrintName = "Blade Star"
ENT.Spawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.TrailColor = Color(125, 0, 0, 250)

ENT.ImpactDamage = {
    [0] = 150,
    [1] = 200,
    [2] = 100,
}

function ENT:Think()
    if CLIENT then return end
    if self.DieTime and self.DieTime < CurTime() then self:Remove() return end
end

function ENT:PhysicsCollide(data, physobj)
    if self.Stuck or self.Armed then return end
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
    util.Effect("cball_explode", effectdata)

    local angles = self:GetAngles()

    self:EmitSound("weapons/grenades/arcstar/Phys_Imp_GrenadeArc_Flesh_3p_1ch_v1_0" .. math.random(1, 3) .. ".wav", 80)

    if tgt:IsWorld() or (IsValid(tgt) and tgt:GetPhysicsObject():IsValid()) then
        timer.Simple(0, function()
            self:SetAngles(angles)
            self:SetPos(data.HitPos)


            if not tgt:IsWorld() and tgt:Health() <= 0 then
                self.CanPickup = true
                self:SetTrigger(true)
                self:UseTriggerBounds(true, 16)
            elseif tgt:IsWorld() or IsValid(tgt) then
                self:GetPhysicsObject():Sleep()
                tr = util.TraceLine({
                    start = data.HitPos,
                    endpos = data.HitPos + data.OurOldVelocity,
                    filter = f,
                    mask = MASK_SHOT
                })
                local ent = tr.Entity
                if tr.HitWorld or IsValid(ent) then
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
                    self.Stuck = true
                    self.AttachToWorld = tgt:IsWorld()
                    if tgt:IsPlayer() or tgt:IsNPC() or tgt:IsNextBot() then
                        self.CanPickup = false
                    else
                        self.CanPickup = true
                        self:SetTrigger(true)
                        self:UseTriggerBounds(true, 16)
                    end
                end
                self.DieTime = CurTime() + 60
            end
        end)
    end
end

function ENT:ApplyAmmo(ply)
    if self.USED then return end
    if engine.ActiveGamemode() == "terrortown" then
        -- Stupid checks mate... but we'll play along unless an override exists
        if not self.IgnoreTTTChecks or ply:HasWeapon("arccw_apex_nade_arcstar") then return end
        local wep = ply:Give("arccw_apex_nade_arcstar")
        wep.Attachments[1].Installed = "apex_star_blade"
        ply:EmitSound("items/Pickups_Ammo_Arrows_V1_1ch_0" .. math.random(1, 4) .. ".wav", nil, 90)
        self.USED = true
        self:Remove()
    else
        self.USED = true
        if not ply:HasWeapon("arccw_apex_nade_arcstar") then
            local wep = ply:Give("arccw_apex_nade_arcstar")
            wep.Attachments[1].Installed = "apex_star_blade"
        else
            local tbl = weapons.Get("arccw_apex_nade_arcstar")
            ply:GiveAmmo(1, tbl.Primary.Ammo, true)
        end
        ply:EmitSound("items/Pickups_Ammo_Arrows_V1_1ch_0" .. math.random(1, 4) .. ".wav")
        self:Remove()
    end
end

function ENT:StartTouch(ply)
    if self.CanPickup and ply:IsPlayer() then
        self:ApplyAmmo(ply)
    end
end

function ENT:Use(ply)
    if self.CanPickup and ply:IsPlayer() then
        self:ApplyAmmo(ply)
    end
end

function ENT:Draw()
    if self:GetParent() ~= LocalPlayer() or LocalPlayer():ShouldDrawLocalPlayer() then self:DrawModel() end
end