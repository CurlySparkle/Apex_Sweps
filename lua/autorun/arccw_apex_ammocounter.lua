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

                        if OurWeapon:Clip1() > 21 then
                            BarCount = 21
                        end

                        texture = self.Prefix .. BarCount
                        
                        print(texture)
                    end
                end

                if texture then
                    mat:SetTexture( "$basetexture", texture )
                end
        end
    } )
end

