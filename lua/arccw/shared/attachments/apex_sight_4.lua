att.PrintName = "2x HCOG (Bruiser)"
att.Icon = Material("entities/attach_icons/apex_1x_hcog.png", "mips smooth")
att.Description = "Magnified holographic optic."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights"}

att.Model = "models/weapons/attachments/sight_1.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -0.35),
        Ang = Angle(0, 0, 0),
        Magnification = 2,
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo2.png", "mips")
att.HolosightNoFlare = true
att.HolosightSize = 3
att.HolosightBone = "holosight"
att.Colorable = false
att.HolosightColor = Color(255, 35, 0)

att.Mult_SightTime = 1.05

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)