att.PrintName = "1x HCOG (Classic)"
att.Icon = Material("entities/attach_icons/apex_1x_hcog.png", "mips smooth")
att.Description = "Close range holographic optic."

att.SortOrder = 0.5

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_sights_bocek"}
att.InvAtt = "apex_sight_1"

att.Model = "models/weapons/attachments/bow_sight_3.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -0.65),
        Ang = Angle(0, 0, 0),
        Magnification = 1.15,
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo3.png", "mips")
att.HolosightNoFlare = true
att.HolosightSize = 3
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightTime = 1.05

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_4.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_7.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"