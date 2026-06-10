local POCKETCHEST_FILTER  = {
  {},
  { -- Alchemist's Chest
    iconPath   = "ui/icon/arcustom/alchemist_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.ALCHEMY_OIL,
      ITEM_CATEGORIES.ALCHEMY,
      ITEM_CATEGORIES.ARCHEUM,
      ITEM_CATEGORIES.HERB,
      ITEM_CATEGORIES.SPECIAL_MATERIAL,
    }),
  },
  { -- Animal Breeder's Chest
    iconPath   = "ui/icon/arcustom/animal_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.COOKING_OIL,
      ITEM_CATEGORIES.FEED,
      ITEM_CATEGORIES.LIVESTOCK_PRODUCTS,
      ITEM_CATEGORIES.MEAT,
      ITEM_CATEGORIES.PELT,
      ITEM_CATEGORIES.SEAFOOD,
      ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
      ITEM_CATEGORIES.TEXTILE,
    }),
  },
  { -- Artisan's Chest
    iconPath   = "ui/icon/arcustom/artisan_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.FABRIC,
      ITEM_CATEGORIES.GEM,
      ITEM_CATEGORIES.HARDWOOD,
      ITEM_CATEGORIES.HIDE,
      ITEM_CATEGORIES.LUMBER,
      ITEM_CATEGORIES.METAL,
      ITEM_CATEGORIES.ORE,
      ITEM_CATEGORIES.PELT,
      ITEM_CATEGORIES.PRECIOUS_METAL,
      ITEM_CATEGORIES.RAW_STONE,
      ITEM_CATEGORIES.RUBBER,
      ITEM_CATEGORIES.SPECIAL_MATERIAL,
      ITEM_CATEGORIES.STONE_BRICK,
      ITEM_CATEGORIES.TEXTILE,
    }),
  },
  { -- Farmer's Large Chest
    iconPath   = "ui/icon/arcustom/farmers_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.FLOWER,
      ITEM_CATEGORIES.FRUIT,
      ITEM_CATEGORIES.GRAIN,
      ITEM_CATEGORIES.HERB,
      ITEM_CATEGORIES.LIVESTOCK_PRODUCTS,
      ITEM_CATEGORIES.LIVESTOCK,
      ITEM_CATEGORIES.MEAT,
      ITEM_CATEGORIES.PELT,
      ITEM_CATEGORIES.SAPLINGS,
      ITEM_CATEGORIES.SEAFOOD,
      ITEM_CATEGORIES.SEED,
      ITEM_CATEGORIES.SOIL,
      ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
      ITEM_CATEGORIES.SPECIAL_MATERIAL,
      ITEM_CATEGORIES.SPICE,
      ITEM_CATEGORIES.TEXTILE,
      ITEM_CATEGORIES.VEGETABLE,
    }),
  },
  { -- Machine's Chest
    iconPath   = "ui/icon/arcustom/captain_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.ARMAMENT,
      ITEM_CATEGORIES.BOARDING_EQUIPMENT,
      ITEM_CATEGORIES.FIGUREHEAD,
      ITEM_CATEGORIES.LIGHTING,
      ITEM_CATEGORIES.MACHINE_COMPONENT_SCROLL,
      ITEM_CATEGORIES.MACHINING,
      ITEM_CATEGORIES.MAST,
      ITEM_CATEGORIES.MECHANICAL_COMPONENT_DESIGN_BAG,
      ITEM_CATEGORIES.MECHANICAL_COMPONENTS,
      ITEM_CATEGORIES.MISC_APPARATUS,
      ITEM_CATEGORIES.MUSIC_DISC,
      ITEM_CATEGORIES.NAVIGATION,
      ITEM_CATEGORIES.SAIL,
      ITEM_CATEGORIES.SHIP_COMPONENT_DESIGN,
      ITEM_CATEGORIES.SHIP_DESIGN,
      ITEM_CATEGORIES.SHIP_PROPELLANT,
      ITEM_CATEGORIES.SOUND_EQUIPMENT,
      ITEM_CATEGORIES.STEERING_GEAR,
      ITEM_CATEGORIES.STORAGE,
      ITEM_CATEGORIES.VEHICLE_COMPONENT_DESIGN,
    }),
  },
  { -- Costume Closet
    iconPath   = "ui/icon/icon_item_4627.dds",
    categories = Set({
      ITEM_CATEGORIES.COSMETIC_MATERIALS,
      ITEM_CATEGORIES.COSTUME,
      ITEM_CATEGORIES.DARU_COSTUME,
      ITEM_CATEGORIES.SYNTHESIS_GEAR_1,
      ITEM_CATEGORIES.SYNTHESIS_GEAR_2,
    }),
  },
  { -- Equipment Enhancement Chest
    iconPath   = "ui/icon/arcustom/infusion_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.AWAKENING_MATERIALS,
      ITEM_CATEGORIES.ENCHANCEMENT_MATERIALS,
      ITEM_CATEGORIES.LUNAGEM,
      ITEM_CATEGORIES.LUNASTONE,
      ITEM_CATEGORIES.SYNTHESIS_MATERIALS,
    }),
  },
  { -- Equipment Material Chest
    iconPath   = "ui/icon/icon_item_4999.dds",
    categories = Set({
      ITEM_CATEGORIES.AWAKENING_MATERIALS,
      ITEM_CATEGORIES.SYNTHESIS_MATERIALS,
    }),
  },
  { -- Gear Chest
    iconPath   = "ui/icon/arcustom/gear_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.AXE,
      ITEM_CATEGORIES.BOW,
      ITEM_CATEGORIES.CLOAK,
      ITEM_CATEGORIES.CLOTH_ARMOR,
      ITEM_CATEGORIES.CLUB,
      ITEM_CATEGORIES.DAGGER,
      ITEM_CATEGORIES.EARRING,
      ITEM_CATEGORIES.FARMHAND_EQUIPMENT,
      ITEM_CATEGORIES.FISHING_ROD,
      ITEM_CATEGORIES.FLUTE,
      ITEM_CATEGORIES.GREATAXE,
      ITEM_CATEGORIES.GREATCLUB,
      ITEM_CATEGORIES.GREATSWORD,
      ITEM_CATEGORIES.KATANA,
      ITEM_CATEGORIES.LEATHER_ARMOR,
      ITEM_CATEGORIES.LONGSPEAR,
      ITEM_CATEGORIES.LUTE,
      ITEM_CATEGORIES.NECKLACE,
      ITEM_CATEGORIES.NODACHI,
      ITEM_CATEGORIES.PET_GEAR,
      ITEM_CATEGORIES.PLATE_ARMOR,
      ITEM_CATEGORIES.RIFLE,
      ITEM_CATEGORIES.RING,
      ITEM_CATEGORIES.SCEPTER,
      ITEM_CATEGORIES.SHIELD,
      ITEM_CATEGORIES.SHORTSPEAR,
      ITEM_CATEGORIES.STAFF,
      ITEM_CATEGORIES.SWORD,
      ITEM_CATEGORIES.SYNTHESIS_GEAR_1,
      ITEM_CATEGORIES.SYNTHESIS_GEAR_2,
      ITEM_CATEGORIES.UNDERWATER_EQUIPMENT,
      ITEM_CATEGORIES.UNIDENTIFIED_EQUIPMENT,
    }),
  },
  { -- Instrument Trunk
    iconPath   = "ui/icon/icon_item_4565.dds",
    categories = Set({
      ITEM_CATEGORIES.FLUTE,
      ITEM_CATEGORIES.LUTE,
    }),
  },
  { -- Fisherman's Chest
    iconPath   = "ui/icon/arcustom/fishermans_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.FISHING_ROD,
      ITEM_CATEGORIES.SEAFOOD,
      ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
      ITEM_CATEGORIES.UNDERWATER_EQUIPMENT,
    }),
  },
  { -- Flutter Vessel
    iconPath   = "ui/icon/icon_item_4493.dds",
    categories = Set({
      ITEM_CATEGORIES.GLIDER,
      ITEM_CATEGORIES.MAGITHOPTER,
    }),
  },
  { -- Otherworldly Pet Hotel
    iconPath   = "ui/icon/icon_item_4586.dds",
    categories = Set({
      ITEM_CATEGORIES.BATTLE_PET,
      ITEM_CATEGORIES.PETS,
      ITEM_CATEGORIES.POWERSTONE_PET,
    }),
  },
  { -- Pets & Transport Trunk
    iconPath   = "ui/icon/icon_item_4442.dds",
    categories = Set({
      ITEM_CATEGORIES.SHIP,
      ITEM_CATEGORIES.VEHICLE,
    }),
  },
  { -- Rider's Trunk
    iconPath   = "ui/icon/icon_item_4718.dds",
    categories = Set({
      ITEM_CATEGORIES.GIANT_PET,
      ITEM_CATEGORIES.MARINE_MOUNT,
      ITEM_CATEGORIES.MOUNT,
    }),
  },
  { -- Shard Collector's Chest
    iconPath   = "ui/icon/arcustom/shard_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.SHARD,
    }),
  },
  { -- Adventurer's Chest
    iconPath   = "ui/icon/arcustom/adventurers_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.COIN,
      ITEM_CATEGORIES.COINPURSE,
      ITEM_CATEGORIES.CURRENCY,
      ITEM_CATEGORIES.KEY,
      ITEM_CATEGORIES.MECHANICAL_COMPONENT_DESIGN_BAG,
      ITEM_CATEGORIES.VALUABLE_CRATE,
    }),
  },
  { -- Builder's Chest
    iconPath   = "ui/icon/arcustom/builders_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.BUILDINGS,
    }),
  },
  { -- Design Chest
    iconPath   = "ui/icon/icon_item_4567.dds",
    categories = Set({
      ITEM_CATEGORIES.CREST_AND_DYE_ITEMS,
    }),
  },
  { -- Dream Designer's Chest
    iconPath = "ui/icon/arcustom/dream_designes_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.ART_OBJECT,
      ITEM_CATEGORIES.DREAM_DESIGN,
    }),
  },
  { -- Furniture Chest
    iconPath   = "ui/icon/icon_item_4619.dds",
    categories = Set({
      ITEM_CATEGORIES.FURNITURE,
      ITEM_CATEGORIES.TAXIDERMY,
    }),
  },
  { -- Librarian's Chest
    iconPath   = "ui/icon/arcustom/books_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.BOOK,
    }),
  },
  { -- Music Chest
    iconPath   = "ui/icon/icon_item_4566.dds",
    categories = Set({
      ITEM_CATEGORIES.MUSIC_DISC,
      ITEM_CATEGORIES.SHEET_MUSIC,
    }),
  },
  { -- Traveler Necessities Chest
    iconPath   = "ui/icon/arcustom/buff_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.BOOSTERS,
      ITEM_CATEGORIES.DEFENSE_POTION,
      ITEM_CATEGORIES.DRINK,
      ITEM_CATEGORIES.FOOD,
      ITEM_CATEGORIES.HEALING_POTION,
      ITEM_CATEGORIES.MANA_POTION,
      ITEM_CATEGORIES.POTION,
      ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
    }),
  },
  { -- Treasure Hunter's Chest
    iconPath   = "ui/icon/arcustom/treasure_hunter_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.RELIC,
      ITEM_CATEGORIES.TREASURE_HUNTERS_CONSUMABLES,
      ITEM_CATEGORIES.TREASURE_MAP,
    }),
  },
  { -- Trophy Hunter's Chest
    iconPath = "ui/icon/arcustom/boss_trophy_storage.dds",
    categories = Set({
      ITEM_CATEGORIES.LEGENDARY_TROPHY,
    }),
  },
}

---This overrides the default params of X2Bag.GetBagItemInfo so that bagId
---isnt needed to make it more inline with X2Coffer and X2Bank.
local X2BagGetBagItemInfo = X2Bag.GetBagItemInfo

---@diagnostic disable-next-line: duplicate-set-field
function X2Bag:GetBagItemInfo(...)
  return X2BagGetBagItemInfo(self, 1, ...)
end

local Storage = {
  [STORAGE_TYPE.COFFER] = X2Coffer,
  [STORAGE_TYPE.BANK]   = X2Bank
}

---@enum TRANSACTION_TYPE
local TRANSACTION_TYPE = {
  DEPOSIT  = 1,
  WITHDRAW = 2,
}

local MoveToEmptySlot = {
  [TRANSACTION_TYPE.DEPOSIT]  = {
    [STORAGE_TYPE.COFFER] = function (slot) X2Bag:MoveToEmptyCofferSlot(slot) end,
    [STORAGE_TYPE.BANK]   = function (slot) X2Bag:MoveToEmptyBankSlot(slot) end
  },
  [TRANSACTION_TYPE.WITHDRAW] = {
    [STORAGE_TYPE.COFFER] = function (slot) X2Coffer:MoveToEmptyBagSlot(slot) end,
    [STORAGE_TYPE.BANK]   = function (slot) X2Bank:MoveToEmptyBagSlot(slot) end
  },
}

---@param text string
---@param pattern string
---@return boolean
local function SafeMatch(text, pattern)
  local ok, result = pcall(string.match, text, pattern)
  return ok and result ~= nil
end

---@param itemInfo ItemInfo
---@return string
local function BuildSextantPosition(itemInfo)
  return string.format(
    "%s %d %d %d %s %d %d %d",
    itemInfo.longitudeDir, itemInfo.longitudeDeg, itemInfo.longitudeMin, itemInfo.longitudeSec,
    itemInfo.latitudeDir, itemInfo.latitudeDeg, itemInfo.latitudeMin, itemInfo.latitudeSec
  ):lower()
end

---@param id string
---@return Window
---@nodiscard
local function CreateAutoStoreWindow(id)
  local window = SetViewOfAutoStoreWindow(id)
  local contentFrame = window.contentFrame
  local filter = {
    frame = contentFrame.filterFrame, ---@type EmptyWidget
  }

  filter.contentFrame = filter.frame.contentFrame ---@type EmptyWidget
  filter.onlyTransferExistingCategoriesCheckbutton = filter.contentFrame
    .onlyTransferExistingCategoriesCheckbutton ---@type CheckButton
  filter.onlyTransferExistingItemsCheckbutton = filter.contentFrame
    .onlyTransferExistingItemsCheckbutton ---@type CheckButton
  filter.transferBoundCheckbutton = filter.contentFrame.transferBoundCheckbutton ---@type CheckButton
  filter.cancelFullInventoryCheckbutton = filter.contentFrame.cancelFullInventoryCheckbutton ---@type CheckButton
  filter.resetButton = filter.contentFrame.resetButton ---@type Button
  filter.iconButton = filter.contentFrame.iconButtonFrame.iconButton ---@type Button
  filter.iconGroupFrame = contentFrame.iconGroupFrame ---@type EmptyWidget
  filter.iconGroup = filter.iconGroupFrame.listCtrl ---@type ListCtrl
  filter.searchEditbox = filter.contentFrame.searchEditbox ---@type X2Editbox
  filter.startEditbox = filter.contentFrame.startEditbox ---@type X2Editbox
  filter.endEditbox = filter.contentFrame.endEditbox ---@type X2Editbox
  filter.cooldownEditbox = filter.contentFrame.cooldownEditbox ---@type X2Editbox

  local selectedCategoryFilter
  local currentIcon = 1
  for row = 1, ICON_FRAME_DATA.rows do
    local rowButtons = filter.iconGroup.items[row].subItems

    for _, button in ipairs(rowButtons) do
      ---@cast button Button
      local pocketChest = POCKETCHEST_FILTER[currentIcon]
      if pocketChest then
        if pocketChest.iconPath then
          button.background = CreateIconBackground(button, pocketChest.iconPath)
          button.background:AddAnchor("TOPLEFT", button, 2, 2)
          button.background:AddAnchor("BOTTOMRIGHT", button, -2, -2)
        end

        local iconIndex = currentIcon
        button:SetHandler("OnClick", function ()
          filter.iconButton.icon:ClearAllTextures()
          if pocketChest.iconPath then
            filter.iconButton.icon:AddTexture(pocketChest.iconPath)
          end
          filter.iconGroupFrame:Show(not filter.iconGroupFrame:IsVisible())
          selectedCategoryFilter = iconIndex
        end)
      else
        button:Show(false)
      end
      currentIcon = currentIcon + 1
    end
  end

  local progressTextbox      = contentFrame.progressTextbox ---@type Textbox

  local transaction          = {
    frame = contentFrame.transactionFrame ---@type EmptyWidget
  }

  transaction.depositButton  = transaction.frame.depositButton ---@type Button
  transaction.withdrawButton = transaction.frame.withdrawButton ---@type Button
  transaction.cancelButton   = transaction.frame.cancelButton ---@type Button

  local storageType

  ---@param type STORAGE_TYPE
  function window:SetStorageType(type)
    if storageType == type then
      return
    end

    storageType = type

    local enable = type ~= STORAGE_TYPE.NONE
    transaction.depositButton:Enable(enable)
    transaction.withdrawButton:Enable(enable)
  end

  window:SetStorageType(STORAGE_TYPE.NONE)

  ---@param enable boolean
  local function EnableAutoStore(enable)
    window:SetWindowModal(not enable)
    filter.contentFrame:Enable(enable, true)
    transaction.depositButton:Enable(enable)
    transaction.withdrawButton:Enable(enable)
    transaction.cancelButton:Enable(not enable)

    window:SetUILayer(enable and "normal" or "system")
    window:Raise()
  end

  local function StopTransaction()
    window:ReleaseHandler("OnUpdate")
    EnableAutoStore(true)
    progressTextbox:SetText("")
  end

  ---@param type TRANSACTION_TYPE
  local function StartTransaction(type)
    if storageType == STORAGE_TYPE.NONE then
      return
    end

    EnableAutoStore(false)

    local source = {}
    local target = {}

    if type == TRANSACTION_TYPE.WITHDRAW then
      source.storage = Storage[storageType]
      target.storage = X2Bag
    elseif type == TRANSACTION_TYPE.DEPOSIT then
      source.storage = X2Bag
      target.storage = Storage[storageType]
    end

    local onlyTransferExistingCategories = filter.onlyTransferExistingCategoriesCheckbutton:GetChecked()
    local onlyTransferExistingItems      = filter.onlyTransferExistingItemsCheckbutton:GetChecked()

    local existingCategoriesFilter       = {}
    local existingItemFilter             = {}
    if onlyTransferExistingCategories or onlyTransferExistingItems then
      for i = 1, target.storage:Capacity() do
        local itemInfo = target.storage:GetBagItemInfo(i)

        if itemInfo then
          if onlyTransferExistingCategories
            and not existingCategoriesFilter[itemInfo.category_id]
          then
            existingCategoriesFilter[itemInfo.category_id] = true
          end

          if onlyTransferExistingItems
            and not existingItemFilter[itemInfo.itemType]
          then
            existingItemFilter[itemInfo.itemType] = true
          end
        end
      end
    end

    local transferBoundItems  = filter.transferBoundCheckbutton:GetChecked()
    local cancelFullInventory = filter.cancelFullInventoryCheckbutton:GetChecked()

    local categoryFilter
    if selectedCategoryFilter ~= 1 then
      categoryFilter = POCKETCHEST_FILTER[selectedCategoryFilter].categories
    end

    source.startSlot    = tonumber(filter.startEditbox:GetText()) or 1
    source.currentSlot  = source.startSlot
    source.endSlot      = tonumber(filter.endEditbox:GetText()) or source.storage:Capacity()

    local search        = filter.searchEditbox:GetText():lower()

    local searchQueries = {}
    for searchQuery in search:gmatch("[^;]+") do
      searchQuery = searchQuery:match("^%s*(.-)%s*$")

      if searchQuery ~= "" then
        table.insert(searchQueries, searchQuery)
      end
    end

    ---@param itemInfo ItemInfo
    ---@return boolean
    local function ItemMatchesFilter(itemInfo)
      if itemInfo.item_impl == "bag" then
        return false
      end

      if itemInfo.pinned then
        return false
      end

      if onlyTransferExistingCategories
        and (
          next(existingCategoriesFilter) == nil
          or not existingCategoriesFilter[itemInfo.category_id]
        )
      then
        return false
      end

      if onlyTransferExistingItems and (
          next(existingItemFilter) == nil
          or not existingItemFilter[itemInfo.itemType]
        )
      then
        return false
      end

      if itemInfo.soul_bound == 1
        and not transferBoundItems
      then
        return false
      end

      if categoryFilter
        and not categoryFilter[itemInfo.category_id]
      then
        return false
      end

      if #searchQueries == 0 then
        return true
      end

      local category        = itemInfo.category:lower()
      local name            = itemInfo.name:lower()
      local matchedPositive = false

      for _, searchQuery in ipairs(searchQueries) do
        if searchQuery:sub(1, 1) == "-" then
          local searchTerm = searchQuery:sub(2)

          if SafeMatch(category, searchTerm)
            or SafeMatch(name, searchTerm)
          then
            return false
          else
            matchedPositive = true
          end
        elseif (
            itemInfo.category_id == ITEM_CATEGORIES.TREASURE_MAP
            and SafeMatch(BuildSextantPosition(itemInfo), searchQuery)
          )
          or SafeMatch(category, searchQuery)
          or SafeMatch(name, searchQuery)
        then
          matchedPositive = true
        end
      end

      return matchedPositive
    end

    local userCooldown       = tonumber(filter.cooldownEditbox:GetText()) or 0
    local minimumCooldown    = 200
    local cooldown           = userCooldown > minimumCooldown and userCooldown or minimumCooldown
    local timePassed         = cooldown
    local attemptedMove      = false
    local attemptedMoveItem
    local attemptFailedCount = 0
    local maxFailedAttempts  = 3

    window:SetHandler("OnUpdate", function (self, frameTime)
      timePassed = timePassed + frameTime

      if storageType == STORAGE_TYPE.NONE then
        StopTransaction()
        window:SetStorageType(STORAGE_TYPE.NONE)
        return
      end

      if timePassed < cooldown then
        return
      end

      if source.currentSlot > source.endSlot then
        StopTransaction()
        return
      end

      if cancelFullInventory then
        local targetEmptySlot = target.storage:Capacity() - target.storage:CountItems()

        if targetEmptySlot <= 0 then
          StopTransaction()
          progressTextbox:SetText(locale.addon.inventoryFull)
          return
        end
      end

      if attemptedMove then
        local checkItemInfo = source.storage:GetBagItemInfo(source.currentSlot)

        if checkItemInfo
          and checkItemInfo.itemType == attemptedMoveItem.itemType
          and attemptFailedCount < maxFailedAttempts
        then
          if checkItemInfo.stack == attemptedMoveItem.stack then
            attemptFailedCount = attemptFailedCount + 1
          else
            attemptFailedCount = 0
            attemptedMove = false
          end
        else
          attemptFailedCount = 0
          attemptedMove = false
          source.currentSlot = source.currentSlot + 1
        end
      end

      for i = source.currentSlot, source.endSlot do
        local itemInfo = source.storage:GetBagItemInfo(i)

        if itemInfo
          and ItemMatchesFilter(itemInfo)
        then
          MoveToEmptySlot[type][storageType](i)

          progressTextbox:SetText(string.format(
            "%d - %d (x%d) - %d\n%s",
            source.startSlot, i, attemptFailedCount, source.endSlot, itemInfo.name
          ))

          timePassed         = 0
          source.currentSlot = i
          attemptedMove      = true
          attemptedMoveItem  = itemInfo
          return
        end
      end

      source.currentSlot = source.endSlot + 1
      timePassed = cooldown
    end)
  end

  window:SetHandler("OnEvent", function (self, event, ...)
    progressTextbox:SetText(locale.addon.autoSortDetected)
  end)

  window:RegisterEvent("BAG_TAB_SORTED")
  window:RegisterEvent("COFFER_TAB_SORTED")
  window:RegisterEvent("BANK_TAB_SORTED")

  window:SetHandler("OnHide", StopTransaction)

  function ResetFilter()
    filter.onlyTransferExistingCategoriesCheckbutton:SetChecked(false)
    filter.onlyTransferExistingItemsCheckbutton:SetChecked(false)
    filter.transferBoundCheckbutton:SetChecked(true)
    filter.cancelFullInventoryCheckbutton:SetChecked(true)
    selectedCategoryFilter = 1
    filter.iconButton.icon:ClearAllTextures()
    filter.searchEditbox:SetText("")
    filter.startEditbox:SetText("")
    filter.endEditbox:SetText("")
    filter.cooldownEditbox:SetText("")
  end

  filter.resetButton:SetHandler("OnClick", ResetFilter)

  ResetFilter()

  filter.iconButton:SetHandler("OnClick", function (self, mouseButton, doubleClick, keyModifier)
    filter.iconGroupFrame:Show(not filter.iconGroupFrame:IsVisible())
    filter.iconGroupFrame:Raise()
  end)

  transaction.depositButton:SetHandler("OnClick", function ()
    StartTransaction(TRANSACTION_TYPE.DEPOSIT)
  end)

  transaction.withdrawButton:SetHandler("OnClick", function ()
    StartTransaction(TRANSACTION_TYPE.WITHDRAW)
  end)

  transaction.cancelButton:SetHandler("OnClick", StopTransaction)

  return window
end

local autoStoreWindow

local function ToggleAutoStoreWindow()
  if autoStoreWindow == nil then
    autoStoreWindow = CreateAutoStoreWindow("autoStoreWindow")
  end

  autoStoreWindow:Show(not autoStoreWindow:IsVisible())
end

local BUTTON_OFFSET = { 20, 97 }

local function CreateAutoStoreButton()
  local frame = UIParent:CreateWidget("window", "bagWatcher", "UIParent")
  frame:SetUILayer("hud")
  frame:Show(true)

  local button = frame:CreateChildWidget("button", "autoStoreButton", 0, true)
  button:SetStyle("deposit_withdrawal")
  button:AddAnchor("CENTER", frame, 0, 0)
  frame:SetExtent(button:GetWidth(), button:GetHeight())

  local tooltipFrame = CreateTooltip(frame, button, locale.addon.title, false)
  tooltipFrame:RemoveAllAnchors()
  tooltipFrame:AddAnchor("BOTTOM", button, "TOP", 0, 0)

  local isHiding = false
  local cooldown = 500
  local timePassed = cooldown

  frame:SetHandler("OnUpdate", function (self, frameTime)
    local x, y, w, h, isVisible = ADDON:GetContentMainScriptPosVis(UIC_BAG)
    timePassed = timePassed + frameTime

    if isVisible then
      frame:AddAnchor("TOPLEFT", "UIParent", x + BUTTON_OFFSET[1], y + h - BUTTON_OFFSET[2])
      isHiding = false

      if timePassed < cooldown then
        return
      end

      timePassed = 0

      if autoStoreWindow ~= nil then
        local _, _, _, _, cofferWidgetIsVisible = ADDON:GetContentMainScriptPosVis(UIC_COFFER)
        local _, _, _, _, bankWidgetIsVisible = ADDON:GetContentMainScriptPosVis(UIC_BANK)

        if cofferWidgetIsVisible then
          autoStoreWindow:SetStorageType(STORAGE_TYPE.COFFER)
        elseif bankWidgetIsVisible then
          autoStoreWindow:SetStorageType(STORAGE_TYPE.BANK)
        else
          autoStoreWindow:SetStorageType(STORAGE_TYPE.NONE)
        end
      end
    elseif not isHiding then
      frame:AddAnchor("TOPLEFT", "UIParent", "BOTTOMRIGHT", 100, 100)
      isHiding = true
      if autoStoreWindow ~= nil and autoStoreWindow:IsVisible() and not isVisible then
        autoStoreWindow:Show(isVisible)
      end
    end
  end)

  ---Fixes a bug where interacting with a house item while a chest was open
  ---would cause the chest to become unusable.
  frame:SetHandler("OnEvent", function (self, event, ...)
    if event == "NPC_INTERACTION_END" then
      local _, _, _, _, cofferWidgetIsVisible = ADDON:GetContentMainScriptPosVis(UIC_COFFER)
      local _, _, _, _, bankWidgetIsVisible = ADDON:GetContentMainScriptPosVis(UIC_BANK)

      if cofferWidgetIsVisible then
        ADDON:ShowContent(UIC_COFFER, false)
      elseif bankWidgetIsVisible then
        ADDON:ShowContent(UIC_BANK, false)
      end
    end
  end)

  frame:RegisterEvent("NPC_INTERACTION_END")

  button:SetHandler("OnClick", function ()
    ToggleAutoStoreWindow()
  end)
end

CreateAutoStoreButton()
