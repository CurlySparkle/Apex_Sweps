att.PrintName = "4x-10x Digital Sniper Threat"
att.Icon = Material("entities/attach_icons/apex_4-10x_dig.png", "mips smooth")
att.Description = "Scope for extremely large range (Can also spot enemies)"

att.SortOrder = 2.5

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_scope_snipers"}

att.Model = "models/weapons/attachments/scope_3.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0.02, 10, -0.53),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
		ScrollFunc = ArcCW.SCROLL_ZOOM,
        IgnoreExtra = true,
        ZoomLevels = 1,
        ZoomSound = "items/player_drop_loot_attachment_2ch_v1_5.wav",
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
att.Mult_Sway = 0.1