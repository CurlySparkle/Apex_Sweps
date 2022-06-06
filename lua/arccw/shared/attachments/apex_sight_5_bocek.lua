att.PrintName = "3x HCOG (Ranger)"
att.Icon = Material("entities/attach_icons/apex_3x.png", "mips smooth")
att.Description = "Mid-range holographic optic."

att.SortOrder = 1.5

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights_bocek"}
att.InvAtt = "apex_sight_5"

att.Model = "models/weapons/attachments/bow_sight_2.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 5, -0.65),
        Ang = Angle(0, 0, 0),
        Magnification = 3,
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo_bow.png", "mips")
att.HolosightNoFlare = true
att.HolosightSize = 3
att.HolosightBone = "holosight"
-- att.Colorable = true

att.Mult_SightTime = 0.95
att.Mult_Sway = 0.3
att.Mult_SightsDispersion = 1

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)

att.EntityCategory = "ArcCW - Apex Legends (Att.)"
att.EntityIcon = "entities/attach_icons/apex_3x.png"

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_4.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_7.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"
