AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_frag_arc", "VGUI/apex_nade_killicon_frag", Color(251, 85, 25, 255))
end
ENT.Type = "anim"
ENT.Base = "arccw_apex_thr_frag"
ENT.PrintName = "Arc Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.Model = "models/weapons/w_apex_nade_frag_thrown.mdl"
ENT.Skin = 2
ENT.FuseTime = 2
ENT.TrailColor = Color(200, 200, 200, 250)

ENT.BlastDamage = {
    [0] = 80,
    [1] = 150,
    [2] = 50,
}

function ENT:Detonate()
    if SERVER then
        local explode = ents.Create( "info_particle_system" )
        explode:SetKeyValue( "effect_name", "tfa_apex_arcstar_explode" )
        explode:SetOwner( self.Owner )
        explode:SetPos( self:GetPos() )
        explode:Spawn()
        explode:Activate()
        explode:Fire( "start", "", 0 )
        explode:Fire( "kill", "", 30 )

        self:EmitSound("weapons/grenades/arcstar/explo_star_close_2ch_v1_0" .. math.random(1, 3) .. ".wav", 125, 90, 1, CHAN_AUTO)

        local hit = false
        local blastdmg = self.BlastDamage[ArcCW.Apex.GetBalanceMode()]
        local pos = self:GetPos()

        for _, ent in pairs(ents.FindInSphere(pos, 350)) do
            if not ArcCW.Apex.ValidNadeTarget(ent) or not self:CheckLOS(ent) then continue end
            local distSqr = ent:GetPos():DistToSqr(pos)
            local f = 1
            if distSqr > 9216 then -- 96 * 96
                f = Lerp((distSqr - 9216) / (122500 - 9216), 1, 0.25)
            end
            local dmginfo = DamageInfo()
            dmginfo:SetDamageType(DMG_SHOCK)
            dmginfo:SetAttacker(self:GetOwner())
            dmginfo:SetDamage(blastdmg * f)
            dmginfo:SetDamageForce((ent:WorldSpaceCenter() - pos):GetNormalized() * 9001 * f)
            dmginfo:SetInflictor(self)
            ent:TakeDamageInfo(dmginfo)

            if ent:IsPlayer() then
                ArcCW.Apex.ArcSlow(ent, 7.5 * f)
            end
            if not hit and IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() and ent ~= self:GetOwner() and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then
                hit = true
                net.Start("arccw_apex_hit")
                    net.WriteBool(false)
                net.Send(self:GetOwner())
            end
        end

        self:Remove()
    end
end

function ENT:DrawTranslucent()
    self:Draw()
end

function ENT:Draw()
    self:DrawModel()
end