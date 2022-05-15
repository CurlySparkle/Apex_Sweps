if CLIENT then
    killicon.Add( "arccw_apex_p2020", "VGUI/apex_killicon_p2020", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_p2020")
end

SWEP.ProneMod_DisableTransitions = true

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "P2020"
SWEP.Trivia_Class = "Pistol"
SWEP.Trivia_Desc = "A small calibre pistol known for its reliability."
SWEP.Trivia_Manufacturer = "Lastimosa Armory"

SWEP.Slot = 1

SWEP.UseHands = true

SWEP.CamAttachment = 3

SWEP.ViewModel = "models/weapons/c_apex_p2020.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.WorldModelOffset = {
    pos = Vector(-10.5, 3.5, -2.2),
    ang = Angle(-10, 0, 180),
    scale   =   1,
}

SWEP.MirrorVMWM = true

SWEP.ViewModelFOV = 70


SWEP.Damage = 18
SWEP.DamageMin = 18
SWEP.Range = 10
SWEP.Penetration = 10
SWEP.PhysBulletMuzzleVelocity = 18500 * ArcCW.HUToM

SWEP.Apex_Balance = {
    [0] = {
        -- Apex Legends Settings
        Damage = 18,
        DamageMin = 18,
        Penetration = 10,
    },
    [1] = {
        -- Arcwc Settings
        Damage = 21,
        DamageMin = 21,
        Penetration = 20,
    }
}

SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 2,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
}

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 13

SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 0.225
SWEP.RecoilSide = 0.075
SWEP.RecoilRise = 0.15
SWEP.RecoilPunch = 3.5

SWEP.Delay = 60 / 420 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_pistol"
SWEP.NPCWeight = 100

SWEP.AccuracyMOA = 5
SWEP.HipDispersion = 125 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 75
SWEP.JumpDispersion = 300

SWEP.Primary.Ammo = "apex_light" -- what ammo type the gun uses

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "ArcCW_APEX.P2020.Fire"
SWEP.ShootDrySound = "ArcCW_APEX.Pistol_Dry_F"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.Lunge = true -- Whether to allow the bash/melee to lunge a short distance
SWEP.MeleeSwingSound = "weapons/Pilot_Mvmt_Melee_RightHook_1P_2ch_v1_1.wav"
SWEP.MeleeHitSound = "weapons/Imp_Player_MeleePunch_Default_1ch_v1_1.wav"
SWEP.MeleeHitNPCSound = "weapons/Pilot_Mvmt_Melee_Hit_Flesh_1P_2ch_v1_1.wav"

SWEP.MeleeDamage = 50
SWEP.MeleeRange = 60
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 1
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

SWEP.MuzzleEffect = "muzzle_pistols_l4d"

SWEP.Tracer = "arccw_apex_tracer_pistol" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.ShellModel = "models/shells/shelleject_pistol.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.55
-- SWEP.ShellRotateAngle = Angle(0, 180, 0)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.IronSightStruct = {
    Pos = Vector(0, 0, 0),
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

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

SWEP.CrouchPos = Vector(-4.5, -3, 1.5)
SWEP.CrouchAng = Angle(1.569, 0.88, -50.458)

SWEP.SprintPos = Vector(0, -2, 1)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)
SWEP.BarrelOffsetCrouch = Vector(0, 0, -2)

SWEP.CustomizePos = Vector(0, -2, 1)
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.BarrelLength = 8

SWEP.AttachmentElements = {
    ["sight"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["sight_mounth"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
}
SWEP.GuaranteeLaser = true

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = "apex_sights", -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0),
        },
        InstalledEles = {"sight", "sight_mounth"},
        CorrectivePos = Vector(1.22,0,-0.8),
        CorrectiveAng = Angle(-1.045, -0.682, 1.999)
    },
    {
        PrintName = "Magazine",
        Slot = {"apex_mag_light1"}
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_qdraw", "apex_hopup_hp", "apex_hopup_selfire3"}
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

function SWEP:Hook_TranslateAnimation(anim)
    if anim == "fire_iron" then
        if !self.Attachments[6].Installed then return "fire" end
    elseif anim == "fire_iron_empty" then
        if !self.Attachments[6].Installed then return "fire_empty" end
    end
end

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_empty"] = {
        Source = "idle_empty"
    },
    ["idle_sprint"] = {Source = "sprint", Mult = 0.9},
    ["enter_sprint"] = {Source = "sprint_in", Mult = 1},
    ["exit_sprint"] = {Source = "sprint_out", Mult = 1},
    ["ready"] = {
        Source = "draw_first",
        SoundTable = {
            {p = 100, s = "weapons/p2020/smartpistol_reload_slideback_st_01.wav", t = 15 / 30},
            {p = 100, s = "weapons/p2020/smartpistol_reload_slideforward_st_01.wav", t = 22 / 30}
    },
    },
    ["draw"] = {
        Source = "draw",
    },
    ["draw_empty"] = {
        Source = "draw_empty",
    },
    ["holster"] = {
        Source = "holster",
    },
    ["holster_empty"] = {
        Source = "holster_empty",
    },
    ["idle_iron"] = {
        Source = "iron_idle",
    },
    ["idle_iron_empty"] = {
        Source = "iron_idle_empty",
    },
    ["fire"] = {
        Source = {"fire", "fire2"},
        ShellEjectAt = 0,
    },
    ["fire_empty"] = {
        Source = "fire_empty",
        ShellEjectAt = 0,
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["enter_sight_empty"] = {
        Source = "iron_in_empty",
    },
    ["fire_sight"] = {
        Source = "iron_fire",
        ShellEjectAt = 0,
    },
    ["fire_iron_empty"] = {
        Source = "iron_fire_empty",
        ShellEjectAt = 0,
    },
    ["exit_sight"] = {
        Source = "iron_out",
    },
    ["exit_sight_empty"] = {
        Source = "iron_out_empty",
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
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Pistol_End_V1_2ch_01.wav", t = 0 / 30},
    },
    },
    ["idle_inspect"] = {
        Source = "inspect",
        SoundTable = {
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Pistol_Start_V1_2ch_01.wav", t = 1 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Pistol_Mid_V1_2ch_01.wav", t = 96 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Pistol_Mid_V1_2ch_02.wav", t = 240 / 30},
            {p = 100, s = "weapons/foley/Weapon_Inspect_Foley_Pistol_End_V1_2ch_01.wav", t = 316 / 30}
    },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        SoundTable = {
            {p = 100, s = "weapons/p2020/smartpistol_reload_magout_st_01.wav", t = 9 / 30},
            {p = 100, s = "weapons/p2020/smartpistol_reload_magin_st_01.wav", t = 24 / 30}
    },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        SoundTable = {
            {p = 100, s = "weapons/p2020/smartpistol_reload_magout_st_02.wav", t = 9 / 30},
            {p = 100, s = "weapons/p2020/smartpistol_reload_magin_st_02.wav", t = 24 / 30},
            {p = 100, s = "weapons/p2020/smartpistol_reload_slideforward_st_01.wav", t = 36 / 30}
    },
    },
}