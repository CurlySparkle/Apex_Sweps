att.PrintName = "2x HCOG (Bruiser)"
att.Icon = Material("entities/attach_icons/apex_2x.png", "mips smooth")
att.Description = "Big reflex sight offers clarity."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"r301"}
att.InvAtt = "apex_sight_4"

att.Model = "models/weapons/attachments/sight_1.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 7.8, -1.3),
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
-- att.HolosightColor = Color(255, 45, 0)

att.Mult_SightTime = 1.05

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_4.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_7.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"