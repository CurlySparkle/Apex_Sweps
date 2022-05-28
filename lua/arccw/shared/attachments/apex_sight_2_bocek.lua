att.PrintName = "1x-2x Variable Holo"
att.Icon = Material("entities/attach_icons/apex_1-2x.png", "mips smooth")
att.Description = "Big reflex sight offers clarity."

att.SortOrder = 1.25

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights_bocek"}
att.InvAtt = "apex_sight_2"

att.Model = "models/weapons/attachments/bow_sight_1.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -0.65),
        Ang = Angle(0, 0, 0),
        Magnification = 1.15,
        ScrollFunc = ArcCW.SCROLL_NONE,
        ZoomLevels = 1,
        ZoomSound = "items/player_drop_loot_attachment_2ch_v1_5.wav",
    },
    {
        Pos = Vector(0, 8, -0.62),
        Ang = Angle(0, 0, 0),
        Magnification = 2.15,		
        HolosightBone = "holosight",
        HolosightData = {
            Holosight = true,
            HolosightReticle =  Material("sights/holo6_bow.png", "mips smooth"),
            HolosightNoFlare = true,
            HolosightSize = 1.3,
            HolosightPiece = "models/weapons/attachments/sight_4_hsp.mdl",
            Colorable = false,
			HolosightColor = Color(255, 25, 0),
            HolosightNoHSP = true
        },	
    },
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo5_bow.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 1.5
att.HolosightBone = "holosight"
att.HolosightNoHSP = true
att.HolosightPiece = "models/weapons/attachments/sight_4_hsp.mdl"
att.Colorable = false
att.HolosightColor = Color(255, 25, 0)

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_5.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_5.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"