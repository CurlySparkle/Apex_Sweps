
-- Copyright (c) 2018-2020 TFA Base Devs

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

function EFFECT:Init(data)
	self.WeaponEnt = data:GetEntity()
	if not IsValid(self.WeaponEnt) then return end
	self.WeaponEntOG = self.WeaponEnt
	self.Attachment = data:GetAttachment()
	self.Dir = data:GetNormal()
	local owent = self.WeaponEnt:GetOwner()

	if not IsValid(owent) then
		owent = self.WeaponEnt:GetParent()
	end

	if IsValid(owent) and owent:IsPlayer() then
		if owent ~= LocalPlayer() or owent:ShouldDrawLocalPlayer() then
			self.WeaponEnt = owent:GetActiveWeapon()
			if not IsValid(self.WeaponEnt) then return end
		else
			self.WeaponEnt = owent:GetViewModel()
			local theirweapon = owent:GetActiveWeapon()

			if IsValid(theirweapon) and theirweapon.ViewModelFlip or theirweapon.ViewModelFlipped then
				self.Flipped = true
			end

			if not IsValid(self.WeaponEnt) then return end
		end
	end

	if IsValid(self.WeaponEntOG) and self.WeaponEntOG.ShellAttachment then
		self.Attachment = self.WeaponEnt:LookupAttachment(self.WeaponEntOG.ShellAttachment)

		if not self.Attachment or self.Attachment <= 0 then
			self.Attachment = 2
		end

		if self.WeaponEntOG:GetStat("Akimbo") then
			self.Attachment = 4 - (game.SinglePlayer() and self.WeaponEntOG:GetNW2Int("AnimCycle", 1) or self.WeaponEntOG.AnimCycle)
		end

		if self.WeaponEntOG.ShellAttachmentRaw then
			self.Attachment = self.WeaponEntOG.ShellAttachmentRaw
		end
	end

	local angpos = self.WeaponEnt:GetAttachment(self.Attachment)

	if not angpos or not angpos.Pos then
		angpos = {
			Pos = vector_origin,
			Ang = angle_zero
		}
	end

	if self.Flipped then
		local tmpang = (self.Dir or angpos.Ang:Forward()):Angle()
		local localang = self.WeaponEnt:WorldToLocalAngles(tmpang)
		localang.y = localang.y + 180
		localang = self.WeaponEnt:LocalToWorldAngles(localang)
		--localang:RotateAroundAxis(localang:Up(),180)
		--tmpang:RotateAroundAxis(tmpang:Up(),180)
		self.Dir = localang:Forward()
	end

	-- Keep the start and end Pos - we're going to interpolate between them
	self.Pos = self:GetTracerShootPos(angpos.Pos, self.WeaponEnt, self.Attachment)
	self.Norm = angpos.Ang:Forward() --angpos.Ang:Forward()
	--print(self.Norm)
	self.Magnitude = data:GetMagnitude()
	self.Scale = data:GetScale()
	local fx = EffectData()
	fx:SetOrigin(self.Pos)
	fx:SetStart(self.Pos)
	fx:SetEntity(self.WeaponEnt)
	fx:SetAttachment(self.Attachment)
	fx:SetNormal(self.Norm)
	fx:SetAngles(self.Norm:Angle())
	fx:SetScale(self.Scale)
	fx:SetMagnitude(self.Magnitude)
	local se = (self.WeaponEntOG.LuaShellEffect or self.WeaponEntOG.Blowback_Shell_Effect) or "ShellEject"
	util.Effect(se, fx)
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end