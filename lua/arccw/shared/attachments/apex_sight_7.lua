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
        Magnification = 1.2,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 1,
        ZoomSound = "items/player_drop_loot_attachment_2ch_v1_5.wav",
        Thermal = true,
        ThermalHighlightColor = Color(255, 50, 50),
        ThermalFullColor = true,
    },
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo8.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 2.5
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/attachments/sight_7_hsp.mdl"
att.Colorable = false
-- att.HolosightColor = Color(255, 35, 0)

att.HolosightBlackbox = false

att.HolosightMagnification = 1
att.HolosightMagnificationMin = 1
att.HolosightMagnificationMax = 1

att.Mult_SightTime = 0.95
att.Mult_Sway = 0.5

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)