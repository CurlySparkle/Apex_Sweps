att.PrintName = "1x HCOG (Classic)"
att.Icon = Material("entities/attach_icons/apex_1x_hcog.png", "mips smooth")
att.Description = "Close range holographic optic."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"r301"}
att.InvAtt = "apex_sight_1"

att.Model = "models/weapons/attachments/sight_2.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -1.3),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
    }
}

att.Holosight = true
att.HolosightReticle = Material("sights/holo3.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 3
att.HolosightBone = "holosight"
att.HolosightNoHSP = true
att.Colorable = false
-- att.HolosightColor = Color(255, 25, 0)

att.Mult_SightTime = 1.05

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_4.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_7.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"