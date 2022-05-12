att.PrintName = "4x-10x Digital Sniper Threat"
att.Icon = Material("entities/attach_icons/apex_4-10x_dig.png", "mips smooth")
att.Description = "Variable zoom long range scope with thermal highlighting."

att.SortOrder = 2.5

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"sentinel"}

att.Model = "models/weapons/attachments/scope_3.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0.0, 7, -0.56),
        Ang = Angle(0, 0, 0),
        Magnification = 1.5,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 1,
        ZoomSound = "items/player_drop_loot_attachment_2ch_v1_5.wav",
        Thermal = true,
        ThermalHighlightColor = Color(255, 50, 50),
        ThermalFullColor = true,
    },
}

att.Holosight = true
att.HolosightReticle = Material("sights/scope4.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 26
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/attachments/scope_3_hsp.mdl"
att.Colorable = false

att.HolosightBlackbox = true

att.HolosightMagnification = 4
att.HolosightMagnificationMin = 4
att.HolosightMagnificationMax = 8

att.Mult_SightTime = 1.1
att.Mult_SpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.3
att.Mult_Sway = 0.1