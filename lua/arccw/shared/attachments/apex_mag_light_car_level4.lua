att.PrintName = "Light Extended Mag - Level 4"
att.Icon = Material("entities/attach_icons/apex_ext_light_4.png", "mips smooth")
att.Description = "apex.mag.4"
att.Desc_Pros = {"apex.autoreload"}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_car_mags"}

att.SortOrder = 4

att.Override_Ammo = "apex_light"
att.Add_ClipSize = 7

att.Hook_OnHolsterEnd = function (wep)
	local t = "apex_autoreload_" .. wep:EntIndex()
	if timer.Exists(t) then timer.Remove(t) end

	if wep:Clip1() < wep:GetCapacity() + wep:GetChamberSize() then
		timer.Create(t, 5, 1, function()
			if IsValid(wep) and (!IsValid(wep:GetOwner()) or wep:GetOwner():GetActiveWeapon() != wep) then
				wep:RestoreAmmo()
				if IsValid(wep:GetOwner()) and wep:GetOwner():IsPlayer() then
					net.Start("arccw_apex_autoreload")
					net.WriteEntity(wep)
					net.Send(wep:GetOwner())
				end
			end
		end)
	end
end
att.Hook_OnDeploy = function(wep) local t = "apex_autoreload_" .. wep:EntIndex() if timer.Exists(t) then timer.Remove(t) end end

att.AutoReloadMaterial = "entities/ammo_light_reloaded.png"