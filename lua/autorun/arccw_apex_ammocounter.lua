if CLIENT then
    matproxy.Add( {
        name = "ArcCW_AMMO",
        init = function( self, mat, values )
            self.ResultTo = values.resultvar
            self.Prefix = values.prefixstring
        end,
        bind = function( self, mat, ent )
                local Place = self.ResultTo
                local texture

                if LocalPlayer():GetActiveWeapon() then
                    local OurWeapon = LocalPlayer():GetActiveWeapon()
                    if OurWeapon.ArcCW then
                        local KnowYourPlace = string.sub(string.reverse(OurWeapon:Clip1()), Place, Place)

                        if OurWeapon.BottomlessClip == true then
                            KnowYourPlace = string.sub(string.reverse(OurWeapon:Ammo1()), Place, Place)
                        end

                        local digits = string.format( tonumber(KnowYourPlace) or 0 )

                        texture = self.Prefix .. digits
                    end
                end

                if texture then
                    mat:SetTexture( "$basetexture", texture )
                end
        end
    } )
    matproxy.Add( {
        name = "ArcCW_AMMO_BAR",
        init = function( self, mat, values )
            self.ResultTo = values.resultvar
            self.Prefix = values.prefixstring
        end,
        bind = function( self, mat, ent )
                local Place = self.ResultTo
                local texture

                if LocalPlayer():GetActiveWeapon() then
                    local OurWeapon = LocalPlayer():GetActiveWeapon()
                    if OurWeapon.ArcCW then
                        local BarCount = tostring(OurWeapon:Clip1())
                        local suffix = "blah"

                        if OurWeapon:GetMaxClip1() == 16 then --Not the way i would do but, i don't know how to get the equiped att on the current gun
                            suffix = "_lvl1"
                        elseif OurWeapon:GetMaxClip1() == 18 then
                            suffix = "_lvl2"
                        elseif OurWeapon:GetMaxClip1() == 21 then
                            suffix = "_lvl3"
                        else
                            suffix = "_lvl0"
                        end

                        texture = self.Prefix .. BarCount .. suffix

                    end
                end

                if texture then
                    mat:SetTexture( "$basetexture", texture )
                end
        end
    } )

    matproxy.Add( {
        name = "ArcCW_AMMO_BAR_F",
        init = function( self, mat, values )
            self.ResultTo = values.resultvar
            self.Prefix = values.prefixstring
        end,
        bind = function( self, mat, ent )
                local Place = self.ResultTo
                local texture

                if LocalPlayer():GetActiveWeapon() then
                    local OurWeapon = LocalPlayer():GetActiveWeapon()
                    if OurWeapon.ArcCW then
                        local KnowYourPlace = string.sub(string.reverse(OurWeapon:Clip1()), Place, Place)
                        local digits = string.format( tonumber(KnowYourPlace) or 0 )

                        if OurWeapon:Clip1() >= 9 then --Not the way i would do but, i don't know how to get the equiped att on the current gun
                            texture = self.Prefix .. 9
                        else
                            texture = self.Prefix .. digits
                        end

                    end
                end

                if texture then
                    mat:SetTexture( "$basetexture", texture )
                end
        end
    } )
    matproxy.Add( {
        name = "ArcCW_AMMO_LSTAR",
        init = function( self, mat, values )
            self.ResultTo = values.resultvar
            self.Prefix = values.prefixstring
        end,
        bind = function( self, mat, ent )
                local Place = self.ResultTo
                local texture

                if LocalPlayer():GetActiveWeapon() then
                    local OurWeapon = LocalPlayer():GetActiveWeapon()
                    if OurWeapon.ArcCW then
                        local KnowYourPlace = string.sub(string.reverse(OurWeapon:Ammo1()), Place, Place)
                        local digits = string.format( tonumber(KnowYourPlace) or 0 )

                        texture = self.Prefix .. digits
                    end
                end

                if texture then
                    mat:SetTexture( "$basetexture", texture )
                end
        end
    } )
	matproxy.Add({
		name = "ArcCW_AMMO_CAR",
		init = function(self, mat, values)
			self.ResultTo = values.resultvar
			self.Prefix = values.prefixstring
		end,
		bind = function(self, mat, ent)
			local texture 
            if LocalPlayer():GetActiveWeapon() then
                local OurWeapon = LocalPlayer():GetActiveWeapon()
                if OurWeapon.ArcCW then
					local fullmag = OurWeapon:GetMaxClip1()
					local curmag = OurWeapon:Clip1()
					
					if (curmag / fullmag) >= 0.60 then
						texture = self.Prefix .. 3
					elseif (curmag / fullmag) < 0.60 and (curmag / fullmag) > 0.30 then
						texture = self.Prefix .. 2
					elseif (curmag / fullmag) <= 0.30 and (curmag / fullmag) > 0.0 then
						texture = self.Prefix .. 1
					else
						texture = self.Prefix .. 0
					end
					
					if texture then
						mat:SetTexture( "$basetexture", texture )
					end
				end
			end
		end
	})
end

