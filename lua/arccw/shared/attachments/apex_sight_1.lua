att.PrintName = "1x HCOG (Classic)"
att.Icon = Material("entities/attach_icons/apex_1x_hcog.png", "mips smooth")
att.Description = "Close range holographic optic."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights"}

att.Model = "models/weapons/attachments/sight_2.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.05, 9, -0.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.15,
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo3.png", "mips")
att.HolosightNoFlare = true
att.HolosightSize = 3
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightTime = 1.05

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)