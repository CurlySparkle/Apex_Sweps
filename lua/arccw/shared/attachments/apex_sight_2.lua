att.PrintName = "1x-2x Variable Holo"
att.Icon = Material("entities/attach_icons/apex_1-2x.png", "mips smooth")
att.Description = "Big reflex sight offers clarity."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights"}

att.Model = "models/weapons/attachments/sight_4.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -0.65),
        Ang = Angle(0, 0, 0),
        Magnification = 2,
		ScrollFunc = ArcCW.SCROLL_ZOOM,
        IgnoreExtra = true,
        ZoomLevels = 1,
        ZoomSound = "items/player_drop_loot_attachment_2ch_v1_5.wav",
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo4.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 3
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/attachments/sight_4_hsp.mdl"
att.Colorable = false
att.HolosightColor = Color(255, 0, 0)

att.HolosightMagnification = 1
att.HolosightMagnificationMin = 1
att.HolosightMagnificationMax = 2

att.Mult_Sway = 0.5

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)