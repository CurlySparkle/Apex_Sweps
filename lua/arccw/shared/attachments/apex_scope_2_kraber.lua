att.PrintName = "4x-8x Variable Sniper Scope"
att.Icon = Material("entities/attach_icons/apex_4-8x.png", "mips smooth")
att.Description = "Variable zoom medium-long range scope."

att.SortOrder = 2.5

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"kraber"}
att.InvAtt = "apex_scope_2"

att.Model = "models/weapons/attachments/scope_2.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0.06, 22, -0.6),
        Ang = Angle(0, 0, 0),
        Magnification = 1,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 1,
        ZoomSound = "items/player_drop_loot_attachment_2ch_v1_5.wav",
    },
}

att.Holosight = true
att.HolosightReticle = Material("sights/scope3_v2.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 22
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/attachments/scope_2_hsp.mdl"
att.Colorable = false

att.HolosightBlackbox = true

att.HolosightMagnification = 4
att.HolosightMagnificationMin = 4
att.HolosightMagnificationMax = 8

att.Mult_SightTime = 1.5
att.Mult_SpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.5
att.Mult_Sway = 0.1

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_5.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_5.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"