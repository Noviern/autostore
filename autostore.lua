local pocketChestLocale = locale.addon.pocketChest
local POCKET_CHEST_FILTER = {
  [pocketChestLocale.adventurersChest] = Set({
    ITEM_CATEGORIES.COIN,
    ITEM_CATEGORIES.COINPURSE,
    ITEM_CATEGORIES.CURRENCY,
    ITEM_CATEGORIES.KEY,
    ITEM_CATEGORIES.MECHANICAL_COMPONENT_DESIGN_BAG,
    ITEM_CATEGORIES.VALUABLE_CRATE,
  }),

  [pocketChestLocale.alchemistsChest] = Set({
    ITEM_CATEGORIES.ALCHEMY_OIL,
    ITEM_CATEGORIES.ALCHEMY,
    ITEM_CATEGORIES.ARCHEUM,
    ITEM_CATEGORIES.HERB,
    ITEM_CATEGORIES.SPECIAL_MATERIAL,
  }),

  [pocketChestLocale.animalBreedersChest] = Set({
    ITEM_CATEGORIES.COOKING_OIL,
    ITEM_CATEGORIES.FEED,
    ITEM_CATEGORIES.LIVESTOCK_PRODUCTS,
    ITEM_CATEGORIES.MEAT,
    ITEM_CATEGORIES.PELT,
    ITEM_CATEGORIES.SEAFOOD,
    ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
    ITEM_CATEGORIES.TEXTILE,
  }),

  [pocketChestLocale.artisansChest] = Set({
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

  [pocketChestLocale.buildersChest] = Set({
    ITEM_CATEGORIES.BUILDINGS,
  }),

  [pocketChestLocale.costumeCloset] = Set({
    ITEM_CATEGORIES.COSMETIC_MATERIALS,
    ITEM_CATEGORIES.COSTUME,
    ITEM_CATEGORIES.DARU_COSTUME,
    ITEM_CATEGORIES.SYNTHESIS_GEAR_1,
    ITEM_CATEGORIES.SYNTHESIS_GEAR_2,
  }),

  [pocketChestLocale.designChest] = Set({
    ITEM_CATEGORIES.CREST_AND_DYE_ITEMS,
  }),

  [pocketChestLocale.dreamDesignersChest] = Set({
    ITEM_CATEGORIES.ART_OBJECT,
    ITEM_CATEGORIES.DREAM_DESIGN,
  }),

  [pocketChestLocale.equipmentEnhancementChest] = Set({
    ITEM_CATEGORIES.AWAKENING_MATERIALS,
    ITEM_CATEGORIES.ENCHANCEMENT_MATERIALS,
    ITEM_CATEGORIES.LUNAGEM,
    ITEM_CATEGORIES.LUNASTONE,
    ITEM_CATEGORIES.SYNTHESIS_MATERIALS,
  }),

  [pocketChestLocale.equipmentMaterialChest] = Set({
    ITEM_CATEGORIES.AWAKENING_MATERIALS,
    ITEM_CATEGORIES.SYNTHESIS_MATERIALS,
  }),

  [pocketChestLocale.farmersLargeChest] = Set({
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

  [pocketChestLocale.fishermansChest] = Set({
    ITEM_CATEGORIES.FISHING_ROD,
    ITEM_CATEGORIES.SEAFOOD,
    ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
    ITEM_CATEGORIES.UNDERWATER_EQUIPMENT,
  }),

  [pocketChestLocale.flutterVessel] = Set({
    ITEM_CATEGORIES.GLIDER,
    ITEM_CATEGORIES.MAGITHOPTER,
  }),

  [pocketChestLocale.furnitureChest] = Set({
    ITEM_CATEGORIES.FURNITURE,
    ITEM_CATEGORIES.TAXIDERMY,
  }),

  [pocketChestLocale.gearChest] = Set({
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

  [pocketChestLocale.instrumentTrunk] = Set({
    ITEM_CATEGORIES.FLUTE,
    ITEM_CATEGORIES.LUTE,
  }),

  [pocketChestLocale.librariansChest] = Set({
    ITEM_CATEGORIES.BOOK,
  }),

  [pocketChestLocale.machinesChest] = Set({
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

  [pocketChestLocale.musicChest] = Set({
    ITEM_CATEGORIES.MUSIC_DISC,
    ITEM_CATEGORIES.SHEET_MUSIC,
  }),

  [pocketChestLocale.otherworldlyPetHotel] = Set({
    ITEM_CATEGORIES.BATTLE_PET,
    ITEM_CATEGORIES.PETS,
    ITEM_CATEGORIES.POWERSTONE_PET,
  }),

  [pocketChestLocale.petsAndTransportTrunk] = Set({
    ITEM_CATEGORIES.SHIP,
    ITEM_CATEGORIES.VEHICLE,
  }),

  [pocketChestLocale.ridersTrunk] = Set({
    ITEM_CATEGORIES.GIANT_PET,
    ITEM_CATEGORIES.MARINE_MOUNT,
    ITEM_CATEGORIES.MOUNT,
  }),

  [pocketChestLocale.shardCollectorsChest] = Set({
    ITEM_CATEGORIES.SHARD,
  }),

  [pocketChestLocale.travelerNecessitiesChest] = Set({
    ITEM_CATEGORIES.BOOSTERS,
    ITEM_CATEGORIES.DEFENSE_POTION,
    ITEM_CATEGORIES.DRINK,
    ITEM_CATEGORIES.FOOD,
    ITEM_CATEGORIES.HEALING_POTION,
    ITEM_CATEGORIES.MANA_POTION,
    ITEM_CATEGORIES.POTION,
    ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
  }),

  [pocketChestLocale.treasureHuntersChest] = Set({
    ITEM_CATEGORIES.RELIC,
    ITEM_CATEGORIES.TREASURE_HUNTERS_CONSUMABLES,
    ITEM_CATEGORIES.TREASURE_MAP,
  }),

  [pocketChestLocale.trophyHuntersChest] = Set({
    ITEM_CATEGORIES.LEGENDARY_TROPHY,
  }),
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
  return ok and result
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
  window:SetUILayer("system")

  local contentFrame                               = window.contentFrame

  local storageOption                              = {
    frame = contentFrame.storageOptionFrame ---@type EmptyWidget
  }

  storageOption.contentframe                       = storageOption.frame.contentFrame ---@type EmptyWidget
  storageOption.radioGroupFrame                    = storageOption.contentframe.radioGroupFrame ---@type RadioGroup

  local filter                                     = {
    frame = contentFrame.filterFrame, ---@type EmptyWidget
  }

  filter.contentFrame                              = filter.frame.contentFrame ---@type EmptyWidget
  filter.onlyTransferExistingCategoriesCheckbutton = filter.contentFrame
    .onlyTransferExistingCategoriesCheckbutton ---@type CheckButton
  filter.onlyTransferExistingItemsCheckbutton      = filter.contentFrame
    .onlyTransferExistingItemsCheckbutton ---@type CheckButton
  filter.transferBoundCheckbutton                  = filter.contentFrame.transferBoundCheckbutton ---@type CheckButton
  filter.cancelFullInventoryCheckbutton            = filter.contentFrame
    .cancelFullInventoryCheckbutton ---@type CheckButton
  filter.resetButton                               = filter.contentFrame.resetButton ---@type Button
  filter.categoryFilterCombobox                    = filter.contentFrame.categoryFilterCombobox ---@type Combobox
  filter.searchEditbox                             = filter.contentFrame.searchEditbox ---@type X2Editbox
  filter.startEditbox                              = filter.contentFrame.startEditbox ---@type X2Editbox
  filter.endEditbox                                = filter.contentFrame.endEditbox ---@type X2Editbox
  filter.cooldownEditbox                           = filter.contentFrame.cooldownEditbox ---@type X2Editbox

  local filterKeys                                 = {}

  for _, key in pairs(locale.addon.pocketChest) do
    table.insert(filterKeys, key)
    table.sort(filterKeys)
  end

  table.insert(filterKeys, 1, locale.addon.filterAll)

  for k, v in ipairs(filterKeys) do
    filter.categoryFilterCombobox.dropdown:AppendItem(v, k)
  end

  local progressTextbox      = contentFrame.progressTextbox ---@type Textbox

  local transaction          = {
    frame = contentFrame.transactionFrame ---@type EmptyWidget
  }

  transaction.depositButton  = transaction.frame.depositButton ---@type Button
  transaction.withdrawButton = transaction.frame.withdrawButton ---@type Button
  transaction.cancelButton   = transaction.frame.cancelButton ---@type Button

  ---@param enable boolean
  local function EnableAutoStore(enable)
    window:SetWindowModal(not enable)
    storageOption.contentframe:Enable(enable, true)
    filter.contentFrame:Enable(enable, true)
    transaction.depositButton:Enable(enable)
    transaction.withdrawButton:Enable(enable)
    transaction.cancelButton:Enable(not enable)
  end

  local function StopTransaction()
    window:ReleaseHandler("OnUpdate")
    EnableAutoStore(true)
    progressTextbox:SetText("")
  end

  ---@param type TRANSACTION_TYPE
  local function StartTransaction(type)
    EnableAutoStore(false)

    local option = storageOption.radioGroupFrame:GetChecked()

    local source = {}
    local target = {}

    if type == TRANSACTION_TYPE.WITHDRAW then
      source.storage = Storage[option]
      target.storage = X2Bag
    elseif type == TRANSACTION_TYPE.DEPOSIT then
      source.storage = X2Bag
      target.storage = Storage[option]
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

    local transferBoundItems     = filter.transferBoundCheckbutton:GetChecked()
    local cancelFullInventory    = filter.cancelFullInventoryCheckbutton:GetChecked()
    local selectedCategoryFilter = filter.categoryFilterCombobox.selectorBtn:GetText()

    local categoryFilter
    if selectedCategoryFilter ~= locale.addon.filterAll then
      categoryFilter = POCKET_CHEST_FILTER[selectedCategoryFilter]
    end

    source.startSlot   = tonumber(filter.startEditbox:GetText()) or 1
    source.currentSlot = source.startSlot
    source.endSlot     = tonumber(filter.endEditbox:GetText()) or source.storage:Capacity()

    local search       = filter.searchEditbox:GetText():lower()

    ---@param itemInfo ItemInfo
    ---@return boolean
    local function ItemMatchesFilter(itemInfo)
      if itemInfo.item_impl == "bag" then
        return false
      end

      if itemInfo.pinned then
        return false
      end

      if next(existingCategoriesFilter)
        and not existingCategoriesFilter[itemInfo.category_id]
      then
        return false
      end

      if next(existingItemFilter)
        and not existingItemFilter[itemInfo.itemType]
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

      if itemInfo.category_id == ITEM_CATEGORIES.TREASURE_MAP
        and SafeMatch(BuildSextantPosition(itemInfo), search)
      then
        return true
      end

      local category = itemInfo.category:lower()
      local name     = itemInfo.name:lower()

      if search:sub(1, 1) == "-" then
        local searchTerm = search:sub(2)

        return SafeMatch(category, searchTerm) ~= searchTerm
          and SafeMatch(name, searchTerm) ~= searchTerm
      end

      if SafeMatch(category, search) then
        return true
      end

      if SafeMatch(name, search) then
        return true
      end

      return false
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
          MoveToEmptySlot[type][option](i)

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

  window:SetHandler("OnEvent", function ()
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
    filter.categoryFilterCombobox.dropdown:Select(0)
    filter.searchEditbox:SetText("")
    filter.startEditbox:SetText("")
    filter.endEditbox:SetText("")
    filter.cooldownEditbox:SetText("")
  end

  filter.resetButton:SetHandler("OnClick", ResetFilter)

  ResetFilter()

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

  frame:SetHandler("OnUpdate", function ()
    local x, y, w, h, isVisible = ADDON:GetContentMainScriptPosVis(UIC_BAG)

    if isVisible then
      frame:AddAnchor("TOPLEFT", "UIParent", x + BUTTON_OFFSET[1], y + h - BUTTON_OFFSET[2])
      isHiding = false
    elseif not isHiding then
      frame:AddAnchor("TOPLEFT", "UIParent", "BOTTOMRIGHT", 100, 100)
      isHiding = true
      if autoStoreWindow ~= nil and autoStoreWindow:IsVisible() and not isVisible then
        autoStoreWindow:Show(isVisible)
      end
    end
  end)

  button:SetHandler("OnClick", function ()
    ToggleAutoStoreWindow()
  end)
end

CreateAutoStoreButton()
