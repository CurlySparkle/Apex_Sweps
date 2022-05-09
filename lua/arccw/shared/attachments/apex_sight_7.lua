att.PrintName = "1x Digital Threat"
att.Icon = Material("entities/attach_icons/apex_1x_dig.png", "mips smooth")
att.Description = "Close-range optic with threat highlighting."

att.SortOrder = 0.75

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights","r301"}

att.Model = "models/weapons/attachments/sight_7.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 9, -0.2),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
        IgnoreExtra = false,
        Thermal = true,
        ThermalScopeColor = Color(0, 255, 0),
        ThermalHighlightColor = Color(255, 0, 0),
    },
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo8.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 2.5
att.HolosightBone = "holosight"
-- att.HolosightPiece = "models/weapons/attachments/sight_6_hsp.mdl"
att.Colorable = false
-- att.HolosightColor = Color(255, 35, 0)

att.Mult_SightTime = 0.95
att.Mult_Sway = 0.5

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)
