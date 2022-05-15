AddCSLuaFile()

sound.Add({
    name = "Apex_Hit_Headshot",
    channel = CHAN_AUTO,
    level = 100,
    volume = 1,
    pitch = {80, 110},
    sound = "player/player_hitbeep_headshotrapid_human_1p_vs_3p.wav"
})
util.PrecacheSound("Apex_Hit_Headshot")
local ApexHeadshotSound = Sound( "Apex_Hit_Headshot" )

att.PrintName = "Headshot Sounds"
att.Description = "(Adds the Apex headshot sounds) You are not suppose to see this..."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "apex_extras"
att.Free = true
att.Hook_BulletHit = function(wep, data)
    if CLIENT then return end

    if data.tr.HitGroup == HITGROUP_HEAD and data.tr.Entity:IsNPC() then
        wep.Owner:EmitSound( ApexHeadshotSound )
        -- wep.Owner:EmitSound("player/player_hitbeep_headshotrapid_human_1p_vs_3p.wav", 100, 100, 1, CHAN_AUTO)
    elseif data.tr.Entity:IsNextBot() and data.tr.HitGroup == HITGROUP_HEAD then
        wep.Owner:EmitSound( ApexHeadshotSound )
    elseif data.tr.Entity:IsPlayer() and data.tr.HitGroup == HITGROUP_HEAD then
        wep.Owner:EmitSound( ApexHeadshotSound )
    end
end