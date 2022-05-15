att.PrintName = "1x HCOG (Classic)"
att.Icon = Material("entities/attach_icons/apex_1x_hcog.png", "mips smooth")
att.Description = "reflex sight which offers clarity."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"r301"}
att.InvAtt = "apex_sight_1"

att.Model = "models/weapons/attachments/sight_2.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 10, -1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1,
        ScrollFunc = ArcCW.SCROLL_NONE,
        Thermal = true,
        ThermalHighlightColor = Color(255, 255, 0),
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo3.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 4
att.HolosightBone = "holosight"
att.HolosightNoHSP = true
att.Colorable = false
att.HolosightColor = Color(255, 25, 0)

att.Mult_SightTime = 1.05

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)