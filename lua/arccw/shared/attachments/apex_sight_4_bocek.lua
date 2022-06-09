att.PrintName = "2x HCOG (Bruiser)"
att.Icon = Material("entities/attach_icons/apex_2x.png", "mips smooth")
att.Description = "Magnified holographic optic."

att.SortOrder = 1.15

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights_bocek"}
att.InvAtt = "apex_sight_4"

att.Model = "models/weapons/attachments/bow_sight_3.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -0.6),
        Ang = Angle(0, 0, 0),
        Magnification = 2.15,
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo2.png", "mips")
att.HolosightNoFlare = true
att.HolosightSize = 2
att.HolosightBone = "holosight"
att.Colorable = false
att.HolosightColor = Color(255, 35, 0)

att.Mult_SightTime = 1.05

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)

att.EntityCategory = "ArcCW - Apex Legends (Att.)"
att.EntityIcon = "entities/attach_icons/apex_2x.png"

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_4.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_7.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"