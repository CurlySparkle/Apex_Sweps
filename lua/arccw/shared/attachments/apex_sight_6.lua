att.PrintName = "2x-4x Variable AOG"
att.Icon = Material("entities/attach_icons/apex_2-4x.png", "mips smooth")
att.Description = "Mid-range AOG."

att.SortOrder = 0.75

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_optic"}

att.Model = "models/weapons/attachments/sight_6.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -0.4),
        Ang = Angle(0, 0, 0),
        Magnification = 3,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 1,
        ZoomSound = "items/player_drop_loot_attachment_2ch_v1_5.wav",
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo4_old.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 3
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/attachments/sight_6_hsp.mdl"
att.Colorable = false
att.HolosightColor = Color(255, 35, 0)

att.Mult_SightTime = 0.95
att.Mult_Sway = 0.5

att.HolosightMagnification = 2
att.HolosightMagnificationMin = 2
att.HolosightMagnificationMax = 4

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)
