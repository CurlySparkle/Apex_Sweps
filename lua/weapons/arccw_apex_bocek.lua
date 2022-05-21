if CLIENT then
    killicon.Add( "arccw_apex_bocek", "VGUI/apex_killicon_bocek", Color(251, 85, 25, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/apex_bocek")
end

SWEP.Base = "arccw_apex_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Apex Legends" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Bocek Compound Bow"
SWEP.Trivia_Class = "Compound Bow"
SWEP.Trivia_Desc = "A bow that can be charged to increase damage and arrow velocity.\nShot arrows can be recovered even from dead enemies, conserving ammo."

SWEP.Slot = 3

SWEP.CrouchPos = Vector(-2.5, -8.5, 3)
SWEP.CrouchAng = Angle(-1, -1, 30)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.ActivePos = Vector(0, -2.5, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 250

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_apex_compound_bow.mdl"
SWEP.WorldModel = "models/weapons/c_apex_compound_bow.mdl"
SWEP.MirrorVMWM = false
SWEP.MirrorWorldModel = "models/weapons/c_apex_compound_bow.mdl"
SWEP.WorldModelOffset = {
    pos        =    Vector(-4, 4.5, -5),
    ang        =    Angle(-10, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale   =   1,
}

SWEP.ViewModelFOV = 70

SWEP.Damage = 25
SWEP.DamageMin = 25
SWEP.Range = 200
SWEP.Penetration = 0
SWEP.PhysBulletMuzzleVelocity = 10000 * ArcCW.HUToM
SWEP.PhysTracerProfile = 9

SWEP.Apex_Balance = {
}

-- Handled in code
SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 1, -- 1.25 - 1.75
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 1, -- 0.8 - 0.9
    [HITGROUP_RIGHTLEG] = 1,
}

SWEP.AlwaysPhysBullet = true
SWEP.Tracer = "arccw_apex_tracer_sniper" -- override tracer (hitscan) effect
SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerWidth = 2

SWEP.BottomlessClip = true
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 1
SWEP.MaxRecoilBlowback = 1

SWEP.CanFireUnderwater = true
-- SWEP.PhysBulletMuzzleVelocity = 500

SWEP.Recoil = 0.5
SWEP.RecoilSide = 0.15
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5
SWEP.VisualRecoilMult = 1.25
SWEP.RecoilVMShake = 1

SWEP.Delay = 60 / 90 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.apex.bow"
    }
}

SWEP.AccuracyMOA = 0.5
SWEP.HipDispersion = 150
SWEP.MoveDispersion = 25
SWEP.JumpDispersion = 100

SWEP.Primary.Ammo = "apex_arrow"

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = {"weapons/bocek/fire_charged_1.wav", "weapons/bocek/fire_charged_2.wav", "weapons/bocek/fire_charged_3.wav"}
SWEP.ShootDrySound = "ArcCW_APEX.Bocek.Empty"
SWEP.ShootSoundSilenced = ""
SWEP.DistantShootSound = ""

SWEP.MuzzleEffect = nil
SWEP.MuzzleFlashColor = Color(0,0,0)
SWEP.ShellModel = nil
SWEP.ShellPitch = 65
SWEP.ShellScale = 0.001
SWEP.ShellTime = 0
-- SWEP.ShellRotateAngle = Angle(0, 0, 0)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.CamAttachment = 3

SWEP.BarrelLength = 15

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}


SWEP.IronSightStruct = {
    Pos = Vector(0, 3, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
        Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0 , 0, 0)

SWEP.AttachmentElements = {
    ["weapon_sights"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },
    ["skin"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
}

SWEP.GuaranteeLaser = true
SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"apex_sights_bocek"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ja_ads_attachment", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 0, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, 0),
            wpos = Vector(14, 0.5, -7.4),
            wang = Angle(-10, 0, 185)
        },
        InstalledEles = {"weapon_sights"},
        CorrectivePos = Vector(2.65, 0, -2.67),
        CorrectiveAng = Angle(0, 2.248, 40.304),
        ExtraSightDist = 20
    },
    {
        PrintName = "Hop-up",
        Slot = {"apex_hopup_shatter5", "apex_hopup_selfire8"},
    },
    {
        PrintName = "Hop-up",
        Slot = {},
    },
    {
        PrintName = "Skin",
        Slot = {"skin_apex"},
        DefaultAttName = "Default",
        FreeSlot = true
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_empty"] = {
        Source = "idle_empty",
    },
    ["idle_sprint"] = {
        Source = "sprint",
    },
    ["enter_sprint"] = {
        Source = "sprint_in",
		Mult = 0.4,
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
    },
    ["idle_sprint_empty"] = {
        Source = "sprint_empty",
    },
    ["enter_sprint_empty"] = {
        Source = "sprint_in_empty",
		Mult = 0.4,
    },
    ["exit_sprint_empty"] = {
        Source = "sprint_out_empty",
    },
    ["ready"] = {
        Source = "draw_first",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        SoundTable = {
            {s = "weapons/bocek/Weapons_Bow_Drawfirst_WpnFoley_Pt1_V1_2ch_01.wav", t = 0 / 30},
            {s = "weapons/bocek/Weapons_Bow_Drawfirst_WpnFoley_Pt2_V1_2ch_01.wav", t = 20 / 30},
            {s = "weapons/bocek/Weapons_Bow_Drawfirst_WpnFoley_Pt3_V1_2ch_01.wav", t = 35 / 30},
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1,
    },
    ["holster"] = {
        Source = "holster",
        Mult = 1,
    },
    ["draw_empty"] = {
        Source = "draw_empty",
    },
    ["holster_empty"] = {
        Source = "holster_empty",
    },

    ["enter_sight_empty"] = {
        Source = "iron_in_empty",
    },
    ["exit_sight_empty"] = {
        Source = "iron_out_empty",
    },
    ["idle_sight_empty"] = {
        Source = "iron_idle_empty",
    },
    ["enter_sight"] = {
        Source = "iron_in",
    },
    ["exit_sight"] = {
        Source = "iron_out",
    },
    ["idle_sight"] = {
        Source = "iron_idle",
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
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.9,
    },
    ["idle_inspect"] = {
        Source = "inspect",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        SoundTable = {
            {p = 100, s = "weapons/bocek/Weapons_Bow_inspect_GearFoley_Pt1_V1_2ch_01.wav", t = 0 / 30},
            {p = 100, s = "weapons/bocek/Weapons_Bow_inspect_GearFoley_Pt2_V1_2ch_01.wav", t = 35 / 30},

            {p = 100, s = "weapons/bocek/Weapons_Bow_inspect_WpnFoley_Pt2_V1_2ch_01.wav", t = 10 / 30},
            {p = 100, s = "weapons/bocek/Weapons_Bow_inspect_WpnFoley_Pt3_V1_2ch_01.wav", t = 142 / 30},
            {p = 100, s = "weapons/bocek/Weapons_Bow_inspect_WpnFoley_Pt4_V1_2ch_01.wav", t = 183 / 30},
            {p = 100, s = "weapons/bocek/Weapons_Bow_inspect_WpnFoley_Pt5_V1_2ch_01.wav", t = 230 / 30},
            {p = 100, s = "weapons/bocek/Weapons_Bow_inspect_WpnFoley_Pt6_V1_2ch_01.wav", t = 300 / 30},
            {p = 100, s = "weapons/bocek/Weapons_Bow_inspect_WpnFoley_Pt7_V1_2ch_01.wav", t = 385 / 30},
            {p = 100, s = "weapons/bocek/Weapons_Bow_inspect_WpnFoley_Pt8_V1_2ch_01.wav", t = 425 / 30},
    },
    },
    ["enter_inspect_empty"] = {
        Source = "inspect_in_empty",
    },
    ["exit_inspect_empty"] = {
        Source = "inspect_out_empty",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.9,
    },
    ["idle_inspect_empty"] = {
        Source = "inspect_empty",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.6,
        SoundTable = {
        },
    },
    ["trigger"] = {
        Source = "fire_windup_full",
        MinProgress = 0.05,
        SoundTable = {
            {s = "ArcCW_APEX.Bocek.Charge", t = 0 / 30},
            {s = "weapons/bocek/Apex_Weapon_Bow_Draw_ChargeComplete_v5_01.wav", t = 17 / 30},
        },
    },
    ["trigger_sight"] = {
        Source = "iron_fire_windup_full",
        MinProgress = 0.05,
        SoundTable = {
            {s = "ArcCW_APEX.Bocek.Charge", t = 0 / 30},
            {s = "weapons/bocek/Apex_Weapon_Bow_Draw_ChargeComplete_v5_02.wav", t = 17 / 30},
        },
    },
    ["enter_sight_trigger"] = {
        Source = "iron_in_charge",
    },
    ["idle_sight_trigger"] = {
        Source = "iron_idle_charge",
    },
    ["exit_sight_trigger"] = {
        Source = "iron_out_charge",
    },
    ["untrigger"] = {
        Source = "fire_winddown",
    },
    ["untrigger_sight"] = {
        Source = "iron_fire_winddown",
    },
    -- ["idle_trigger"] = {
        -- Source = "fire_windup_loop"
    -- },
    -- ["idle_sight_trigger"] = {
        -- Source = "iron_fire_windup_loop"
    -- },
    ["fire"] = {
        Source = "fire",
    },
    ["fire_empty"] = {
        Source = "fire_empty",
    },
    ["fire_sight"] = {
        Source = "iron_fire",
    },
    ["fire_sight_empty"] = {
        Source = "iron_fire_empty",
    },
    ["fire_rapid"] = {
        Source = "fire_1",
        Mult = 1 / 2.5,
    },
    ["fire_sight_rapid"] = {
        Source = "iron_fire_1",
        Mult = 1 / 2.5,
    },
}

for i = 1, 5 do
    SWEP.Animations["fire_" .. i] = {
        Source = "fire_" .. i
    }
    SWEP.Animations["fire_empty_" .. i] = {
        Source = "fire_" .. i .. "_empty"
    }
    SWEP.Animations["fire_sight_" .. i] = {
        Source = "iron_fire_" .. i
    }
    SWEP.Animations["fire_sight_empty_" .. i] = {
        Source = "iron_fire_" .. i .. "_empty"
    }
end

SWEP.TTTWeaponType = "weapon_zm_rifle"
SWEP.TTTWeight = 50

SWEP.HeatCapacity = 25
SWEP.HeatDissipation = 10
SWEP.HeatDelayTime = 0.5
SWEP.TriggerDelay = true
SWEP.TriggerCharge = true

local function chargefraction(wep, a, b)
    if not wep:GetBuff_Override("Override_TriggerDelay", wep.TriggerDelay) then return a or 0 end
    return Lerp((CurTime() - wep.LastTriggerTime - 0.05) / 0.5, a or 0, b or 1)
end

SWEP.M_Hook_Mult_Damage = function(wep, data)
    data.mult = data.mult * chargefraction(wep, 1, wep:GetBuff_Override("Override_Num", wep.Num) > 1 and 2.2 or 3)
end
SWEP.M_Hook_Mult_DamageMin = function(wep, data)
    data.mult = data.mult * chargefraction(wep, 1, wep:GetBuff_Override("Override_Num", wep.Num) > 1 and 2.2 or 3)
end
SWEP.M_Hook_Mult_PhysBulletMuzzleVelocity = function(wep, data)
    data.mult = data.mult * chargefraction(wep, 1, wep:GetBuff_Override("Override_Num", wep.Num) > 1 and 1.6 or 2.8)
end

SWEP.Hook_SelectFireAnimation = function(wep, anim)
    if wep:GetCurrentFiremode().Mode == 2 and wep.Animations[anim .. "_rapid"] then return anim .. "_rapid" end
    local i = math.Round(chargefraction(wep, 1, 5))
    if wep.Animations[anim .. "_" .. i] then return anim .. "_" .. i end
end

SWEP.Hook_GetShootSound = function(wep, sound)
    if chargefraction(wep) < 1 then
        return "weapons/bocek/fire_uncharged_" .. math.random(1, 3) .. ".wav"
    end
end

SWEP.TriggerPullWhenEmpty = false

if engine.ActiveGamemode() == "terrortown" then
    SWEP.ForceDefaultAmmo = 32
end
--[[]
SWEP.Hook_PreReload = function(wep)
    if ((game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and true)) and wep:GetTriggerDelta() > 0 then
        local anim = wep:SelectAnimation("untrigger")
        if anim then
            wep:PlayAnimation(anim, wep:GetBuff_Mult("Mult_TriggerDelayTime"), true, 0)
        end
        wep.LastTriggerTime = 0
        wep.LastTriggerDuration = 0
        wep:GetBuff_Hook("Hook_OnTriggerRelease")
        wep:SetNextPrimaryFire(CurTime() + 0.15)
    end
    return true
end
]]

SWEP.Hook_BulletHit = function(wep, data)
    local ent = data.tr.Entity

    if wep:GetBuff("Num") == 1 and not data.ArrowMade then
        data.ArrowMade = true
        local arrow = ents.Create("arccw_apex_arrowpickup")
        arrow:SetPos(data.tr.HitPos)
        arrow:SetAngles(data.tr.Normal:Angle())
        arrow:Spawn()
        arrow:GetPhysicsObject():Sleep()

        if ent:IsWorld() or IsValid(ent) then
            arrow:SetSolid(SOLID_NONE)
            arrow:SetMoveType(MOVETYPE_NONE)
            arrow:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

            local f = {arrow}
            table.Add(f, ent:GetChildren())

            local bone = ent:TranslatePhysBoneToBone(data.tr.PhysicsBone) or ent:GetHitBoxBone(data.tr.HitBox, ent:GetHitboxSet())
            local matrix = ent:GetBoneMatrix(bone or 0)
            if bone and matrix then
                local pos = matrix:GetTranslation()
                local ang = matrix:GetAngles()
                arrow:FollowBone(ent, bone)
                local n_pos, n_ang = WorldToLocal(data.tr.HitPos, data.tr.Normal:Angle(), pos, ang)
                arrow:SetLocalPos(n_pos)
                arrow:SetLocalAngles(n_ang)
                debugoverlay.Cross(pos, 8, 5, Color(255, 0, 255), true)
                arrow.CanPickup = false
            elseif not ent:IsWorld() then
                arrow:SetParent(ent)
            else
                arrow.AttachToWorld = true
            end
        end
    end
end

hook.Add("EntityRemoved", "ArcCW_Apex", function(ent)
    if CLIENT then return end
    for k, v in pairs(ent:GetChildren()) do
        if v:GetClass() == "arccw_apex_arrowpickup" then
            v:SetParent(NULL)
            v:InitPhys()
            v.CanPickup = true
        end
    end
end)