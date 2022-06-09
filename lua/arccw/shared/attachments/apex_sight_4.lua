att.PrintName = "2x HCOG (Bruiser)"
att.Icon = Material("entities/attach_icons/apex_2x.png", "mips smooth")
att.Description = "Magnified holographic optic."

att.SortOrder = 0.5

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
        Pos = Vector(0, 7.8, -0.35),
        Ang = Angle(0, 0, 0),
        Magnification = 1.75,
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo2.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 3
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/attachments/sight_1_hsp.mdl"
att.Colorable = false
-- att.HolosightColor = Color(255, 35, 0)

att.Mult_SightTime = 1.05

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)

att.EntityCategory = "ArcCW - Apex Legends (Att.)"
att.EntityIcon = "entities/attach_icons/apex_2x.png"

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_4.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_7.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"