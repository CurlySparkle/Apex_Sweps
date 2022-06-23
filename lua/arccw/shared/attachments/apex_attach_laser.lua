att.PrintName = "Tac Laser"
att.Icon = Material("entities/attach_icons/apex_pump_3.png", "mips")
att.Description = "Red laser pointer. Improves hip-fire accuracy. Comes with a flashlight option as well"
att.Desc_Pros = {
}
att.Desc_Cons = {
    "con.beam"
}
att.AutoStats = true
att.Slot = {"apex_attach_specials"}

att.Model = "models/weapons/attachments/pistol_laser_sight.mdl"

att.Laser = true
att.LaserStrength = 1
att.LaserBone = "laser"

att.ColorOptionsTable = {Color(235, 0, 0)}

att.ModelScale = Vector(1, 1, 1)
att.ModelOffset = Vector(0, 0, 0)

att.ToggleStats = {
    {
        PrintName = "Laser",
        AutoStatName = "On",
        Laser = true,
		LaserColor = Color(255, 0, 0),
		Mult_Recoil = 0.85,
		Mult_SightTime = 0.9,
		KeepBaseIrons = true,
	},

    {
        PrintName = "Flashlight",
        AutoStatName = "On",
		Laser = false,
		Flashlight = true,
		FlashlightFOV = 70,
		FlashlightFarZ = 512,
		FlashlightNearZ = 1,
		Mult_Recoil = 0.8,
		Mult_SightTime = 0.95,		
		FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR,
		FlashlightColor = Color(255, 255, 255),
		FlashlightTexture = "effects/flashlight001",
		FlashlightBrightness = 1.5,
		FlashlightBone = "laser",
	},
	
    {
        PrintName = "Laser/Flashlight",
        AutoStatName = "On",
		Flashlight = true,
		FlashlightFOV = 70,
		FlashlightFarZ = 512,
		FlashlightNearZ = 1,
		Mult_Recoil = 0.8,
		Mult_SightTime = 0.95,		
		FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR,
		FlashlightColor = Color(255, 255, 255),
        Laser = true,
		LaserColor = Color(255, 0, 0),
		FlashlightTexture = "effects/flashlight001",
		FlashlightBrightness = 1.5,
		FlashlightBone = "laser",
	},	

    {
        PrintName = "Off",
        Laser = false,
        Mult_HipDispersion = 1,
    }
}