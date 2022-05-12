att.PrintName = "Hop-up - Select Fire"
att.AbbrevName = "Select Fire"
att.Icon = Material("entities/attach_icons/hopup_apex_selectfire.png", "noclamp smooth")
att.Description = "Gives the weapon an charging firemode. Semi-automatic fire with charge-up time for mid to long-range combat engagements."

att.SortOrder = 1

att.Desc_Pros = {
}
att.AutoStats = true


att.Slot = {"apex_hopup_selfire2"}
att.InvAtt = "apex_hopup_selfire"

att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
        Mult_RPM = 107 / 672,
        Mult_Recoil = 0.85,
        Mult_RecoilSide = 0.85,
		Add_AmmoPerShot = 3,
		Override_Damage = 60,
		Override_DamageMin = 50,
		Override_Tracer = "tfa_apex_tracer_havoc",
		Override_AlwaysPhysBullet = false,
		Override_NeverPhysBullet = true,
    },
    {
        Mode = 0
    }
}


att.EntityCategory = "ArcCW - Apex Legends (Att.)"
att.EntityIcon = "entities/attach_icons/hopup_apex_selectfire.png"

att.Hook_GetShootSound = function(wep, fsound)
    if wep:GetCurrentFiremode().Mode == 1 and fsound == wep.FirstShootSound then return "ArcCW_APEX.Havoc.Fire_Alt" elseif fsound == wep.FirstShootSound then return "ArcCW_APEX.Havoc.Fire_Start" end
end