att.PrintName = "6x-10x Variable Sniper Scope"
att.Icon = Material("entities/attach_icons/apex_6x_kraber.png", "mips smooth")
att.Description = "Variable magnification long range scope.\nLens and Design especifically made for the Kraber, and because of that, other weapons can't be fitted with it."
att.Free = true
att.Spawnable = false

att.SortOrder = 2.5

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"kraber"}
att.InvAtt = "apex_scope_1"

att.Model = "models/weapons/attachments/scope_1.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0.06, 20.5, -0.57),
        Ang = Angle(0, 0, 0),
        Magnification = 2,
		ScrollFunc = ArcCW.SCROLL_ZOOM,
		ZoomLevels = 1,
		ZoomSound = "items/player_drop_loot_attachment_2ch_v1_5.wav",
    },
}

att.Holosight = true
att.HolosightReticle = Material("sights/scope3.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 22.5
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/attachments/scope_1_hsp.mdl"
att.Colorable = false

att.HolosightBlackbox = true

att.HolosightMagnification = 6
att.HolosightMagnificationMin = 6
att.HolosightMagnificationMax = 10

att.Mult_SightTime = 1.1
att.Mult_SpeedMult = 0.9
att.Mult_Sway = 0.1

att.AttachSound = "items/player_drop_loot_attachment_2ch_v1_5.wav"
att.DetachSound = "items/player_drop_loot_attachment_2ch_v1_5.wav"
att.ToggleSound = "items/UI_Menu_Survival_Accept_2ch_v14_01.wav"