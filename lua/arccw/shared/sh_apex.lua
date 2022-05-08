CreateConVar("arccw_apex_bal", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Tweaks the balancing for the Apex Legends Weapons. See the options page under Options > ArcCW > Apex Settings for more information.", 0, 1)

ArcCW.ADSReload = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    local delta = wep:GetSightDelta()
    local coolilove = math.cos(delta * (math.pi / 2))
    vm:SetPoseParameter( "sights", Lerp(coolilove, 0, 1) ) -- thanks fesiug
end