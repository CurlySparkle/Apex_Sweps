att.PrintName = "6x Sniper Scope"
att.Icon = Material("entities/attach_icons/apex_6x.png", "mips smooth")
att.Description = "Fixed magnification long range scope."

att.SortOrder = 2.5

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"kraber"}

att.Model = "models/weapons/attachments/scope_1.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0.06, 20.5, -0.57),
        Ang = Angle(0, 0, 0),
        Magnification = 2,
    },
}

att.Holosight = true
att.HolosightReticle = Material("sights/scope3.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 22.5
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/attachments/scope_1_hsp.mdl"
att.Colorable = false

att.HolosightBlackbox = true

att.HolosightMagnification = 6

att.Mult_SightTime = 1.1
att.Mult_SpeedMult = 0.9
att.Mult_Sway = 0.1