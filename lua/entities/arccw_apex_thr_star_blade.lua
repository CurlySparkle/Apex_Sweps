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
ENT.DragCoefficient = 0.15
ENT.ImpactDamage = {
    [0] = 150,
    [1] = 200,
    [2] = 100,
}
ENT.Hits = 0

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
    -- TTT assumes DMG_SLASH is the knife and applies lots of DNA. Don't.
    dmginfo:SetDamageType(engine.ActiveGamemode() == "terrortown" and DMG_GENERIC or DMG_SLASH)
    if string.find(tgt:GetClass(), "breakable") then dmginfo:SetDamageType(DMG_CRUSH) end
    dmginfo:SetDamage(self.ImpactDamage[ArcCW.Apex.GetBalanceMode()])
    if hs then
        dmginfo:ScaleDamage(2)
    elseif tr.Entity == tgt and (tr.HitGroup == HITGROUP_LEFTLEG or tr.HitGroup == HITGROUP_RIGHTLEG) then
        dmginfo:ScaleDamage(0.5)
    end
    if self.Hits > 1 then
        dmginfo:ScaleDamage(1 / (self.Hits - 1))
    end
    dmginfo:SetAttacker(self:GetOwner())
    dmginfo:SetInflictor(self)
    dmginfo:SetDamageForce(data.OurOldVelocity * 3)
    dmginfo:SetDamagePosition(data.HitPos)
    tgt:TakeDamageInfo(dmginfo)

    if IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() and (tgt:IsPlayer() or tgt:IsNPC() or tgt:IsNextBot()) then
        net.Start("arccw_apex_hit")
            net.WriteBool(hs)
        net.Send(self:GetOwner())
    end

    local angles = data.OurOldVelocity:GetNormalized():Angle()
    local oldvel = data.OurOldVelocity

    self:EmitSound("weapons/grenades/arcstar/Phys_Imp_GrenadeArc_Flesh_3p_1ch_v1_0" .. math.random(1, 3) .. ".wav", 80)

    if tgt:IsWorld() or (IsValid(tgt) and tgt:GetPhysicsObject():IsValid()) then
        timer.Simple(0, function()
            self:SetAngles(angles)
            self:SetPos(data.HitPos)

            if (IsValid(tgt) and (tgt:IsNPC() or tgt:IsPlayer() or tgt:IsNextBot()) and tgt:Health() <= 0) or (not tgt:IsWorld() and not IsValid(tgt)) or string.find(tgt:GetClass(), "breakable") then
                -- Pierce straight through the target!
                self.Hits = self.Hits + 1
                self:GetPhysicsObject():SetVelocityInstantaneous(oldvel)
                self.Armed = false
            elseif tgt:IsWorld() or IsValid(tgt) then
                if IsValid(self.Trail) then SafeRemoveEntityDelayed(self.Trail, 1.5) end

                local effectdata = EffectData()
                effectdata:SetOrigin(data.HitPos)
                effectdata:SetNormal(data.HitNormal)
                effectdata:SetRadius(32)
                util.Effect("cball_explode", effectdata)

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
        if ply:HasWeapon("arccw_apex_nade_arcstar") then return end
        local wep = ply:Give("arccw_apex_nade_arcstar")
        wep.Attachments[1].Installed = "apex_star_blade"
        wep:AdjustAtts()
        wep:NetworkWeapon(ply)
        ply:EmitSound("weapons/grenades/arcstar/Wpn_Firestar_Draw_2ch_v2_0" .. math.random(1, 3) .. ".wav", 70, 110, 0.7)
        self.USED = true
        self:Remove()
    else
        self.USED = true
        if not ply:HasWeapon("arccw_apex_nade_arcstar") then
            local wep = ply:Give("arccw_apex_nade_arcstar")
            wep.Attachments[1].Installed = "apex_star_blade"
            wep:AdjustAtts()
            wep:NetworkWeapon(ply)
        else
            local tbl = weapons.Get("arccw_apex_nade_arcstar")
            ply:GiveAmmo(1, tbl.Primary.Ammo, true)
        end
        ply:EmitSound("weapons/grenades/arcstar/Wpn_Firestar_Draw_2ch_v2_0" .. math.random(1, 3) .. ".wav", 70, 110, 0.7)
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