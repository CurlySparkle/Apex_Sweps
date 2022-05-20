if CLIENT then
    killicon.Add( "arccw_apex_wingman", "VGUI/apex_killicon_wingman", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_wingman")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Wingman"
SWEP.Trivia_Class = "Revolver"
SWEP.Trivia_Desc = "Powerful revolver with an equally powerful kick."
SWEP.Trivia_Manufacturer = "Brockhaurd Manufacturing"
SWEP.Slot = 1

SWEP.UseHands = true
SWEP.AutoReload = false

SWEP.CamAttachment = 3

SWEP.ViewModel = "models/weapons/c_apex_wingman.mdl"
SWEP.WorldModel = "models/weapons/c_apex_wingman.mdl"
SWEP.MirrorVMWM = false
SWEP.WorldModelOffset = {
    pos        =    Vector(-10.5, 3.5, -2.5),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 45
SWEP.DamageMin = 45
SWEP.Range = 75
SWEP.RangeMin = 25

SWEP.Penetration = 8
SWEP.PhysBulletMuzzleVelocity = 18000 * ArcCW.HUToM
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 6

SWEP.Apex_Balance = {
    [1] = {
        Damage = 55,
        DamageMin = 35,
    },
    [2] = {
        Damage = 30, -- Roughly equivalent to TTT deagle but fires faster (156/100 rpm)
        DamageMin = 30,
    },
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 2.15,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
}

SWEP.Recoil = 2
SWEP.RecoilSide = 1.25
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5

SWEP.Delay = 60 / 156 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.dact"
    }
}

SWEP.NPCWeaponType = "weapon_357"
SWEP.NPCWeight = 100

SWEP.AccuracyMOA = 5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50

SWEP.Primary.Ammo = "apex_heavy" -- what ammo type the gun uses

SWEP.ShootVol = 160 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "ArcCW_APEX.Wingman.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Pistol_Dry_A"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""


SWEP.MuzzleEffect = "tfa_apex_muzzle_smg"

SWEP.Tracer = "arccw_apex_tracer_pistol" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = nil -- which attachment to put the case effect on

SWEP.IronSightStruct = {
    Pos = Vector(0, -1, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "revolver"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER

SWEP.CrouchPos = Vector(-4.5, -3, 1.5)
SWEP.CrouchAng = Angle(1.569, 0.88, -50.458)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.BarrelLength = 5

SWEP.BulletBones = false

SWEP.RevolverReload = true
SWEP.GuaranteeLaser = true

SWEP.AttachmentElements = {
    ["wingman_sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
}
SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(5, 1, -4.5),
            wang = Angle(-8, 0, 185)
        },
        InstalledEles = {"wingman_sight"},
        CorrectivePos = Vector(1.25,0,-0.78),
        CorrectiveAng = Angle(-1.296, 0, 2.681)
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_heavy1"}
    },
    {
        PrintName = "Hopup",
        Slot = {"apex_hopup_skull", "apex_hopup_qdraw", "apex_hopup_loader"}
    },
    {
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
    },
    {
        PrintName = "Extras",
        Installed = "apex_hitsound_headshot",
        Slot = {"apex_extras"}
    },
    {
        PrintName = "Extras 2",
        Installed = "apex_hitsound",
        Slot = {"apex_extras2"}
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.9},
    ["enter_sprint"] = {Source = "sprint_in", Mult = 1},
    ["exit_sprint"] = {Source = "sprint_out", Mult = 1},
    ["ready"] = {
        Source = "draw_first",
    },
    ["draw"] = {
        Source = "draw",
    },
    ["holster"] = {
        Source = "holster",
    },
    ["idle_iron"] = {
        Source = "iron_idle",
    },
    ["fire"] = {
        Source = {"fire", "fire2"},
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["fire_sight"] = {
        Source = "iron_fire",
    },
    ["exit_sight"] = {
        Source = "iron_out",
    },
    ["bash"] = {
        Source = {"melee"},
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        LHIKEaseOut = 0.4,
    },
    ["enter_inspect"] = {
        Source = "inspect_in",
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
    },
    ["idle_inspect"] = {
        Source = "inspect",
        SoundTable = {
            {p = 100, s = "weapons/wingman/Weapon_Wingman_Inspect_Part1_Fr01_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/wingman/Weapon_Wingman_Inspect_Part2_Fr27_V1_2ch_01.wav", t = 27 / 30},
            {p = 100, s = "weapons/wingman/Weapon_Wingman_Inspect_Part3_Fr79_V1_2ch_01.wav", t = 79 / 30},
            {p = 100, s = "weapons/wingman/Weapon_Wingman_Inspect_Part4_Fr132_V1_2ch_01.wav", t = 132 / 30},
            {p = 100, s = "weapons/wingman/Weapon_Wingman_Inspect_End_Fr160_V1_2ch_01.wav", t = 160 / 30}
    },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_REVOLVER,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.4,
        LHIKEaseOut = 0.2,
        MinProgress = 60 / 40
    },
    -- ["reload_empty"] = {
        -- Source = "reload_empty",
        -- TPAnim = ACT_HL2MP_GESTURE_RELOAD_REVOLVER,
        -- LHIK = true,
        -- LHIKIn = 0.2,
        -- LHIKOut = 0.5,
        -- LHIKEaseOut = 0.2,
        -- MinProgress = 97/40
    -- },
}

sound.Add({
    name = "Apex_Draw_Pistol",
    channel = 16,
    volume = 1.0,
    sound = "weapons/wpn_pistol_draw_lr_v1_1.wav"
})

sound.Add({
    name = "Apex_Holster_Pistol",
    channel = 16,
    volume = 1.0,
    sound = "weapons/wpn_pistol_holster_lr_v1_1.wav"
})

sound.Add({
    name = "Wingman.Draw",
    channel = 16,
    volume = 1.0,
    sound = "weapons/wingman/Weapon_Wingman_FirstPullout_V1_2ch.wav"
})

sound.Add({
    name = "Wingman.reload1",
    channel = 16,
    volume = 1.0,
    sound = "weapons/wingman/wpn_wingman_reload_open_fr7_2ch_v1_01.wav"
})

sound.Add({
    name = "Wingman.reload2",
    channel = 16,
    volume = 1.0,
    sound = "weapons/wingman/wpn_wingman_reload_eject_fr21_2ch_v1_01.wav"
})

sound.Add({
    name = "Wingman.reload3",
    channel = 16,
    volume = 1.0,
    sound = "weapons/wingman/wpn_wingman_reload_insertmag_fr47_2ch_v1_01.wav"
})

sound.Add({
    name = "Wingman.reload4",
    channel = 16,
    volume = 1.0,
    sound = "weapons/wingman/wpn_wingman_reload_close_fr60_2ch_v1_01.wav"
})

sound.Add({
    name = "Wingman.reload5",
    channel = 16,
    volume = 1.0,
    sound = "weapons/wingman/wpn_wingman_reload_handgrab_fr66_2ch_v1_01.wav"
})

SWEP.TTTWeaponType = "weapon_zm_revolver"
SWEP.TTTWeight = 100