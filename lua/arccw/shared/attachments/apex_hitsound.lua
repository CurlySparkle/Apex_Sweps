AddCSLuaFile()

sound.Add({
    name = "Apex_Hit_Sound",
    channel = CHAN_AUTO,
    level = 100,
    volume = 1,
    pitch = {90, 110},
    sound = "player/flesh_bulletimpact_1p_vs_3p.wav"
})
util.PrecacheSound("Apex_Hit_Sound")
local ApexHitSound = Sound( "Apex_Hit_Sound" )

att.PrintName = "Hit Sounds"
att.Description = "(Adds the Apex hit non armored sounds) You are not suppose to see this..."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "apex_extras2"

att.Hook_BulletHit = function(wep, data)
    if CLIENT then return end

    if data.tr.Hit and data.tr.Entity:IsNPC() then
	    wep.Owner:EmitSound( ApexHitSound )
    elseif data.tr.Entity:IsNextBot() and data.tr.Hit then
	    wep.Owner:EmitSound( ApexHitSound )
	elseif data.tr.Entity:IsPlayer() and data.tr.Hit then
	    wep.Owner:EmitSound( ApexHitSound )
    end
end