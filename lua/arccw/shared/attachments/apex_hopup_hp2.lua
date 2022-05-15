att.PrintName = "Hop-up - Hammerpoint Rounds"
att.AbbrevName = "Hammerpoint Rounds"
att.Icon = Material("entities/attach_icons/hopup_apex_hammerpoint.png", "noclamp smooth")
att.Description = "Weapon damage against non-armored players is increased greatly."

att.SortOrder = 1

att.Desc_Pros = {
}
att.AutoStats = true
att.Slot = {"apex_hopup_hp2"}
att.InvAtt = "apex_hopup_hp"

att.Hook_BulletHit = function(wep, data)
    if IsValid(data.tr.Entity) and data.tr.Entity:IsPlayer() and data.tr.Entity:Armor() <= 0 then
        -- this doesn't do the fancy check apex does, but also hl2 armor is weird and I would prefer to work with a new armor system
        data.damage = data.damage * 1.35
    end
end