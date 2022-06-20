if SERVER then return end
//{

local function genOrderedTbl(str, min, max)
	if not min then min = 1 end
	if not max then
		max = min
		min = 1
	end
	local tbl = {}
	for i = min, max do
		table.insert(tbl, str:format(i))
	end
	return tbl
end

local soundData = {
    name        = "Apex_Ads_In_Shotgun",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_shotgun_ads_in_lr_v2_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_Out_Shotgun",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_shotgun_ads_out_lr_v2_%i.wav", 5)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_In_Sniper",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_sniper_ads_in_lr_v2_%i.wav", 2)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_Out_Sniper",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_sniper_ads_out_lr_v2_%i.wav", 2)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_In_SMG",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_smg_ads_in_lr_v1_%i.wav", 1)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_Out_SMG",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_smg_ads_out_lr_v1_%i.wav", 1)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_In_Wingman",
    channel     = CHAN_USER_BASE+1,
    volume      = 0.1,
    soundlevel  = 100,
    pitch       = {95, 105},
    sound       = genOrderedTbl("weapons/wingman/Mech_Wingman_ADS_In_v1_2ch_%i.ogg", 6)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_Out_Pistols",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_pistol_ads_out_lr_v1_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_In_Pistols",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_pistol_ads_in_lr_v1_%i.wav", 2)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_Out_Pistol",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_pistol_ads_out_lr_v1_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_In_Pistol",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_pistol_ads_in_lr_v1_%i.wav", 2)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_In_Sniper",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_rifle_ads_in_lr_v1_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_Out_Sniper",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_rifle_ads_out_lr_v1_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_In_Rifle",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_rifle_ads_in_lr_v1_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Ads_Out_Rifle",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_rifle_ads_out_lr_v1_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Draw_Pistol",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_pistol_draw_lr_v1_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Holster_Pistol",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_pistol_holster_lr_v1_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Draw_Rifle",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_rifle_draw_lr_v1_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Holster_Rifle",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_rifle_holster_lr_v1_%i.wav", 3)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Draw_SMG",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_smg_draw_lr_v1_%i.wav", 1)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Holster_SMG",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_smg_holster_lr_v1_%i.wav", 1)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Draw_Sniper",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_sniper_draw_lr_v1_%i.wav", 2)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Holster_Shotgun",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_sniper_holster_lr_v1_%i.wav", 2)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Draw_Shotgun",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_sniper_draw_lr_v1_%i.wav", 2)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Holster_Sniper",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("weapons/wpn_sniper_holster_lr_v1_%i.wav", 2)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Mod_Attach",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("items/player_pickup_loot_attachment_2ch_v1_%i.wav", 7)
}
sound.Add(soundData)

local soundData = {
    name        = "Apex_Mod_Detach",
    channel     = CHAN_USER_BASE+1,
    volume      = 1,
    soundlevel  = 100,
    pitch       = {90, 110},
    sound       = genOrderedTbl("items/player_drop_loot_attachment_2ch_v1_%i.wav", 7)
}
sound.Add(soundData)
//}