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
att.Slot = {"r301"}

att.Model = "models/weapons/attachments/sight_4.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -1.65),
        Ang = Angle(0, 0, 0),
        Magnification = 1,
		ScrollFunc = ArcCW.SCROLL_NONE,
        IgnoreExtra = false,
        ZoomLevels = 1,
        ZoomSound = "items/player_drop_loot_attachment_2ch_v1_5.wav",
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo4.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 2.5
att.HolosightBone = "holosight"
att.Colorable = false
att.HolosightColor = Color(255, 50, 0)

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)