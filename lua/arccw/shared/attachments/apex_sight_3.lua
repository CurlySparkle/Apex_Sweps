att.PrintName = "1x Holo"
att.Icon = Material("entities/attach_icons/apex_1x_holo.png", "mips smooth")
att.Description = "Big reflex sight offers clarity."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights"}

att.Model = "models/weapons/attachments/sight_3.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 10, -0.65),
        Ang = Angle(0, 0, 0),
        Magnification = 1,
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo5.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 2.5
att.HolosightBone = "holosight"
att.HolosightNoHSP = true
att.Colorable = false
att.HolosightColor = Color(255, 35, 0)

att.Mult_SightTime = 1.05
att.Mult_Sway = 0.5

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)