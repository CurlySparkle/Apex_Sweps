att.PrintName = "6x Sniper Scope"
att.Icon = Material("entities/attach_icons/apex_6x.png", "mips smooth")
att.Description = "Fixed magnification long range scope."

att.SortOrder = 2.5

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"apex_scope_chargerifle"}
att.InvAtt = "apex_scope_1"

att.Model = "models/weapons/attachments/scope_1.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 1, -0.56),
        Ang = Angle(0, 0, 0),
        Magnification = 1.5,
    },
}

att.Holosight = true
att.HolosightReticle = Material("sights/scope3.png", "mips")
att.HolosightNoFlare = true
att.HolosightSize = 18
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/attachments/scope_1_hsp.mdl"
att.Colorable = false

att.HolosightBlackbox = true

att.HolosightMagnification = 6

att.Mult_SightTime = 1.1
att.Mult_SpeedMult = 0.9
att.Mult_Sway = 0.1

att.EntityCategory = "ArcCW - Apex Legends (Att.)"
att.EntityIcon = "entities/attach_icons/apex_6x.png"

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_5.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_5.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"