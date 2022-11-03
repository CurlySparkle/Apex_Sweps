local cvec_r = Vector()

matproxy.Add({
	name = "ACWReticleColor",
	init = function(self, mat, values)
		self.ResultTo = values.resultvar
	end,
	bind = function(self, mat, ent)
		local owner

		if (IsValid(ent)) then
			owner = ent:GetOwner()

			if not IsValid(owner) then
				owner = ent:GetParent()
			end

			if IsValid(owner) and owner:IsWeapon() then
				owner = owner:GetOwner() or owner:GetOwner()
			end

			if not (IsValid(owner) and owner:IsPlayer()) then
				owner = GetViewEntity()
			end
		else
			owner = GetViewEntity()
		end

		if (not IsValid(owner) or not owner:IsPlayer()) then return end
		local red
		local green
		local blue
		
		red = GetConVar("arccw_scope_r"):GetInt() or 128
		green = GetConVar("arccw_scope_g"):GetInt() or 255
		blue = GetConVar("arccw_scope_b"):GetInt() or 128

		cvec_r.x = red / 255
		cvec_r.y = green / 255
		cvec_r.z = blue / 255
		mat:SetVector(self.ResultTo, cvec_r)
	end
})