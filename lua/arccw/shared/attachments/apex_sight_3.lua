att.PrintName = "1x Holo"
att.Icon = Material("entities/attach_icons/apex_1x_holo.png", "mips smooth")
att.Description = "Small holographic optic."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights"}

att.Model = "models/weapons/attachments/sight_3.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -0.65),
        Ang = Angle(0, 0, 0),
        Magnification = 1.15,
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo5.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 3
att.HolosightBone = "holosight"
att.HolosightNoHSP = true
att.Colorable = false
-- att.HolosightColor = Color(255, 35, 0)

att.Mult_SightTime = 1.05
att.Mult_Sway = 0.5

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)

att.EntityCategory = "ArcCW - Apex Legends (Att.)"
att.EntityIcon = "entities/attach_icons/apex_1x_holo.png"

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_5.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_5.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"