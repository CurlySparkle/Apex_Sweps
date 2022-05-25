-- thanks fesiug
--[[]
hook.Add("PopulateWeapons", "ArcCW_Apex", function(pnlContent, tree, node)
    local ApexWeapons = {}
    local ApexWeaponsByType = {}

    for classname, w in pairs(weapons.GetList()) do
        local wep = weapons.Get(w.ClassName)

        if wep.Category == "ArcCW - Apex Legends" then
            ApexWeapons[w.ClassName] = wep
        end
    end

    for classname, weapondata in pairs(ApexWeapons) do
        local pack = weapondata.SpawnmenuType or "_Unknown"

        if pack then
            if not ApexWeaponsByType[pack] then
                ApexWeaponsByType[pack] = {}
            end

            table.insert(ApexWeaponsByType[pack], classname)
        end
    end

    PrintTable(ApexWeaponsByType)

    local ournode = 0
    for _, n in pairs(tree:Root():GetChildNodes()) do
        print(n, n:GetText())
        if n:GetText() ~= "ArcCW - Apex Legends" then continue end
        ournode = n
    end
    if isnumber(ournode) then
        print("epic fail!")
        return
    end

    ournode.DoPopulate = function(self)
        -- If we've already populated it - forget it.
        if (self.PropPanel) then return end
        -- Create the container panel
        self.PropPanel = vgui.Create("ContentContainer", pnlContent)
        self.PropPanel:SetVisible(false)
        self.PropPanel:SetTriggerSpawnlistChange(false)

        for pack, class in SortedPairs(ApexWeaponsByType) do
            local label = vgui.Create("ContentHeader", ournode)
            label:SetText(string.Right(pack, #pack - 1))
            self.PropPanel:Add(label)
            local alphabeticallist = {}

            for _, k in pairs(class) do
                table.insert(alphabeticallist, {
                    ApexWeapons[k],
                    PrintName = ApexWeapons[k].PrintName
                })
            end

            for k, ent in SortedPairsByMemberValue(alphabeticallist, "PrintName") do
                local ent = ent[1]

                CreateApexWeapon(self.PropPanel, {
                    nicename = ent.PrintName or ent.ClassName,
                    spawnname = ent.ClassName,
                    material = ent.IconOverride or "entities/" .. ent.ClassName .. ".png",
                    admin = ent.AdminOnly
                })
            end
        end
    end
end)
]]

function CreateApexWeapon(container, obj)
    if (not obj.material) then return end
    if (not obj.nicename) then return end
    if (not obj.spawnname) then return end
    local icon = vgui.Create("ArcCWApexWepSel", container)
    icon:SetContentType("weapon")
    icon:SetSpawnName(obj.spawnname)
    icon:SetName(obj.nicename, obj.spawnname)
    icon:SetMaterial(obj.material)
    icon:SetAdminOnly(obj.admin)
    icon:SetColor(Color(135, 206, 250, 255))

    icon.DoClick = function()
        RunConsoleCommand("gm_giveswep", obj.spawnname)
        surface.PlaySound("ui/buttonclickrelease.wav")
    end

    icon.DoMiddleClick = function()
        RunConsoleCommand("gm_spawnswep", obj.spawnname)
        surface.PlaySound("ui/buttonclickrelease.wav")
    end

    icon.OpenMenuExtra = function(self, menu)
        menu:AddOption("#spawnmenu.menu.spawn_with_toolgun", function()
            RunConsoleCommand("gmod_tool", "creator")
            RunConsoleCommand("creator_type", "3")
            RunConsoleCommand("creator_name", obj.spawnname)
        end):SetIcon("icon16/brick_add.png")

        if (self:GetIsNPCWeapon()) then
            local opt = menu:AddOption("#spawnmenu.menu.use_as_npc_gun", function()
                RunConsoleCommand("gmod_npcweapon", self:GetSpawnName())
            end)

            if (self:GetSpawnName() == GetConVar("gmod_npcweapon"):GetString()) then
                opt:SetIcon("icon16/monkey_tick.png")
            else
                opt:SetIcon("icon16/monkey.png")
            end
        end
    end

    icon.OpenMenu = DoGenericSpawnmenuRightclickMenu

    if (IsValid(container)) then
        container:Add(icon)
    end

    return icon
end

if CLIENT then
    surface.CreateFont("ArcCWApexWepSel", {
        font = "Bahnschrift",
        size = 36,
        weight = 0,
        blursize = 0,
        antialias = true
    })

    surface.CreateFont("ArcCWApexWepSel_Shadow", {
        font = "Bahnschrift",
        size = 36,
        weight = 0,
        blursize = 10,
        antialias = true
    })

    local PANEL = {}
    local matOverlay_Normal = Material("gui/ContentIcon-normal.png")
    local matOverlay_Hovered = Material("gui/ContentIcon-hovered.png")
    local matOverlay_AdminOnly = Material("icon16/shield.png")
    local matOverlay_NPCWeapon = Material("icon16/monkey.png")
    local matOverlay_NPCWeaponSelected = Material("icon16/monkey_tick.png")
    AccessorFunc(PANEL, "m_Color", "Color")
    AccessorFunc(PANEL, "m_Type", "ContentType")
    AccessorFunc(PANEL, "m_SpawnName", "SpawnName")
    AccessorFunc(PANEL, "m_NPCWeapon", "NPCWeapon")
    AccessorFunc(PANEL, "m_bAdminOnly", "AdminOnly")
    AccessorFunc(PANEL, "m_bIsNPCWeapon", "IsNPCWeapon")

    local function DoGenericSpawnmenuRightclickMenu(self)
        local menu = DermaMenu()

        menu:AddOption("#spawnmenu.menu.copy", function()
            SetClipboardText(self:GetSpawnName())
        end):SetIcon("icon16/page_copy.png")

        if (isfunction(self.OpenMenuExtra)) then
            self:OpenMenuExtra(menu)
        end

        if (not IsValid(self:GetParent()) or not self:GetParent().GetReadOnly or not self:GetParent():GetReadOnly()) then
            menu:AddSpacer()

            menu:AddOption("#spawnmenu.menu.delete", function()
                self:Remove()
                hook.Run("SpawnlistContentChanged")
            end):SetIcon("icon16/bin_closed.png")
        end

        menu:Open()
    end

    function PANEL:Init()
        self:SetPaintBackground(false)
        local sw, sh = self:GetParent():GetParent():GetParent():GetSize()
        self:SetSize(384, 128) -- TODO: get real long n har. nvm
        self:SetText("")
        self:SetDoubleClickingEnabled(false)
        self.Image = self:Add("DImage")
        self.Image:SetPos(3, 3)
        self.Image:SetSize(128 - 6, 128 - 6)
        self.Image:SetVisible(false)
        self.Label2 = self:Add("DLabel")
        self.Label2:SetWidth(384)
        self.Label2:SetTall(40)
        self.Label2:SetFont("ArcCWApexWepSel")
        self.Label2:SetX(self.Label2:GetX() + (128 + 16) + 2)
        self.Label2:SetY(self.Label2:GetY() + (64 - 24) + 2)
        self.Label2:SetTextColor(Color(0, 0, 0, 127))
        self.Label = self:Add("DLabel")
        self.Label:SetWidth(384)
        self.Label:SetTall(40)
        self.Label:SetFont("ArcCWApexWepSel")
        self.Label:SetX(self.Label:GetX() + (128 + 16))
        self.Label:SetY(self.Label:GetY() + (64 - 24))
        self.Label:SetTextColor(color_white)
        self.Border = 0
    end

    function PANEL:SetName(name, spname)
        self:SetTooltip(name .. "\n" .. spname)
        self.Label:SetText(name)
        self.Label2:SetText(name)
        self.m_NiceName = name
    end

    function PANEL:SetMaterial(name)
        self.m_MaterialName = name
        local mat = Material(name)

        -- Look for the old style material
        if (not mat or mat:IsError()) then
            name = name:Replace("entities/", "VGUI/entities/")
            name = name:Replace(".png", "")
            mat = Material(name)
        end

        -- Couldn't find any material.. just return
        if (not mat or mat:IsError()) then
            mat = Material("arccw/hud/arccw_bird.png")
        end

        self.Image:SetMaterial(mat)
    end

    function PANEL:DoRightClick()
        local pCanvas = self:GetSelectionCanvas()
        if (IsValid(pCanvas) and pCanvas:NumSelectedChildren() > 0 and self:IsSelected()) then return hook.Run("SpawnlistOpenGenericMenu", pCanvas) end
        --self:OpenMenu()
    end

    function PANEL:DoClick()
    end

    function PANEL:OpenMenu()
    end

    function PANEL:OnDepressionChanged(b)
    end

    function PANEL:Paint(w, h)
        if (self.Depressed and not self.Dragging) then
            if (self.Border ~= 8) then
                self.Border = 8
                self:OnDepressionChanged(true)
            end
        else
            if (self.Border ~= 0) then
                self.Border = 0
                self:OnDepressionChanged(false)
            end
        end

        surface.SetDrawColor(255, 255, 255, 255)

        if (not dragndrop.IsDragging() and (self:IsHovered() or self.Depressed or self:IsChildHovered())) then
            surface.SetMaterial(Material("entities/uchover.png"))
            surface.DrawTexturedRect(self.Border, self.Border, w, h)
            --surface.SetMaterial( matOverlay_Hovered )
            --self.Label:Hide()
        else
            --surface.SetMaterial( matOverlay_Normal )
            --self.Label:Show()
        end

        render.PushFilterMag(TEXFILTER.ANISOTROPIC)
        render.PushFilterMin(TEXFILTER.ANISOTROPIC)
        self.Image:PaintAt(3 + self.Border, 3 + self.Border, 128 - 8 - self.Border * 2, 128 - 8 - self.Border * 2)
        render.PopFilterMin()
        render.PopFilterMag()

        --surface.DrawTexturedRect( self.Border, self.Border, w-self.Border*2, h-self.Border*2 )
        if (self:GetAdminOnly()) then
            surface.SetMaterial(matOverlay_AdminOnly)
            surface.DrawTexturedRect(self.Border + 8, self.Border + 8, 16, 16)
        end

        -- This whole thing could be more dynamic
        if (self:GetIsNPCWeapon()) then
            surface.SetMaterial(matOverlay_NPCWeapon)

            if (self:GetSpawnName() == GetConVar("gmod_npcweapon"):GetString()) then
                surface.SetMaterial(matOverlay_NPCWeaponSelected)
            end

            surface.DrawTexturedRect(w - self.Border - 24, self.Border + 8, 16, 16)
        end

        self:ScanForNPCWeapons()
    end

    function PANEL:ScanForNPCWeapons()
        if (self.HasScanned) then return end
        self.HasScanned = true

        for _, v in pairs(list.Get("NPCUsableWeapons")) do
            if (v.class == self:GetSpawnName()) then
                self:SetIsNPCWeapon(true)
                break
            end
        end
    end

    function PANEL:PaintOver(w, h)
        self:DrawSelections()
    end

    function PANEL:ToTable(bigtable)
        local tab = {}
        tab.type = self:GetContentType()
        tab.nicename = self.m_NiceName
        tab.material = self.m_MaterialName
        tab.admin = self:GetAdminOnly()
        tab.spawnname = self:GetSpawnName()
        tab.weapon = self:GetNPCWeapon()
        table.insert(bigtable, tab)
    end

    function PANEL:Copy()
        local copy = vgui.Create("ArcCWApexWepSel", self:GetParent())
        copy:SetContentType(self:GetContentType())
        copy:SetSpawnName(self:GetSpawnName())
        copy:SetName(self.m_NiceName, self:GetSpawnName())
        copy:SetMaterial(self.m_MaterialName)
        copy:SetNPCWeapon(self:GetNPCWeapon())
        copy:SetAdminOnly(self:GetAdminOnly())
        copy:CopyBase(self)
        copy.DoClick = self.DoClick
        copy.OpenMenu = self.OpenMenu
        copy.OpenMenuExtra = self.OpenMenuExtra

        return copy
    end

    vgui.Register("ArcCWApexWepSel", PANEL, "DButton")
end