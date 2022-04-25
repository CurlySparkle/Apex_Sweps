att.PrintName = "3x HCOG (Ranger)"
att.Icon = Material("entities/attach_icons/apex_3x.png", "mips smooth")
att.Description = "holographic sight."

att.SortOrder = 0.75

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights"}

att.Model = "models/weapons/attachments/sight_5.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 7, -0.1),
        Ang = Angle(0, 0, 0),
        Magnification = 3,
        ScrollFunc = ArcCW.SCROLL_NONE,
		Thermal = true,
        ThermalHighlightColor = Color(255, 255, 0),		
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 9.5
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightTime = 0.95
att.Mult_Sway = 0.5
att.Mult_SightsDispersion = 1

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)
