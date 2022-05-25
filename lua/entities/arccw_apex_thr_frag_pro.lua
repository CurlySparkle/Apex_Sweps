AddCSLuaFile()

if CLIENT then
    killicon.Add( "arccw_apex_thr_frag_pro", "VGUI/apex_nade_killicon_frag", Color(251, 85, 25, 255))
end
ENT.Type = "anim"
ENT.Base = "arccw_apex_thr_frag"
ENT.PrintName = "Pro Frag Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE

ENT.Model = "models/weapons/w_apex_nade_frag_thrown.mdl"
ENT.FuseTime = 5
ENT.TrailColor = Color(0, 200, 0, 250)