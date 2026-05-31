local pocketChestLocale = locale.addon.pocketChest
local POCKET_CHEST_FILTER = {
  [pocketChestLocale.adventurersChest] = Set({
    ITEM_CATEGORIES.COINPURSE,
    ITEM_CATEGORIES.VALUABLE_CRATE,
    ITEM_CATEGORIES.KEY,
    ITEM_CATEGORIES.COIN,
    ITEM_CATEGORIES.CURRENCY,
    ITEM_CATEGORIES.MECHANICAL_COMPONENT_DESIGN_BAG,
  }),

  [pocketChestLocale.alchemistsChest] = Set({
    ITEM_CATEGORIES.ARCHEUM,
    ITEM_CATEGORIES.ALCHEMY,
    ITEM_CATEGORIES.ALCHEMY_OIL,
    ITEM_CATEGORIES.SPECIAL_MATERIAL,
    ITEM_CATEGORIES.HERB,
  }),

  [pocketChestLocale.animalBreedersChest] = Set({
    ITEM_CATEGORIES.COOKING_OIL,
    ITEM_CATEGORIES.FEED,
    ITEM_CATEGORIES.PELT,
    ITEM_CATEGORIES.TEXTILE,
    ITEM_CATEGORIES.MEAT,
    ITEM_CATEGORIES.SEAFOOD,
    ITEM_CATEGORIES.LIVESTOCK_PRODUCTS,
    ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
  }),

  [pocketChestLocale.artisansChest] = Set({
    ITEM_CATEGORIES.METAL,
    ITEM_CATEGORIES.LUMBER,
    ITEM_CATEGORIES.STONE_BRICK,
    ITEM_CATEGORIES.HIDE,
    ITEM_CATEGORIES.FABRIC,
    ITEM_CATEGORIES.ORE,
    ITEM_CATEGORIES.HARDWOOD,
    ITEM_CATEGORIES.RAW_STONE,
    ITEM_CATEGORIES.PRECIOUS_METAL,
    ITEM_CATEGORIES.GEM,
    ITEM_CATEGORIES.RUBBER,
    ITEM_CATEGORIES.TEXTILE,
    ITEM_CATEGORIES.PELT,
    ITEM_CATEGORIES.SPECIAL_MATERIAL,
  }),

  [pocketChestLocale.buildersChest] = Set({
    ITEM_CATEGORIES.BUILDINGS,
  }),

  [pocketChestLocale.costumeCloset] = Set({
    ITEM_CATEGORIES.COSTUME,
    ITEM_CATEGORIES.DARU_COSTUME,
    ITEM_CATEGORIES.COSMETIC_MATERIALS,
    ITEM_CATEGORIES.SYNTHESIS_GEAR_1,
    ITEM_CATEGORIES.SYNTHESIS_GEAR_2,
  }),

  [pocketChestLocale.designChest] = Set({
    ITEM_CATEGORIES.CREST_AND_DYE_ITEMS,
  }),

  [pocketChestLocale.dreamDesignersChest] = Set({
    ITEM_CATEGORIES.DREAM_DESIGN,
    ITEM_CATEGORIES.ART_OBJECT,
  }),

  [pocketChestLocale.equipmentEnhancementChest] = Set({
    ITEM_CATEGORIES.SYNTHESIS_MATERIALS,
    ITEM_CATEGORIES.AWAKENING_MATERIALS,
    ITEM_CATEGORIES.ENCHANCEMENT_MATERIALS,
    ITEM_CATEGORIES.LUNAGEM,
    ITEM_CATEGORIES.LUNASTONE,
  }),

  [pocketChestLocale.equipmentMaterialChest] = Set({
    ITEM_CATEGORIES.SYNTHESIS_MATERIALS,
    ITEM_CATEGORIES.AWAKENING_MATERIALS,
  }),

  [pocketChestLocale.farmersLargeChest] = Set({
    ITEM_CATEGORIES.FRUIT,
    ITEM_CATEGORIES.VEGETABLE,
    ITEM_CATEGORIES.SPICE,
    ITEM_CATEGORIES.FLOWER,
    ITEM_CATEGORIES.GRAIN,
    ITEM_CATEGORIES.SEED,
    ITEM_CATEGORIES.TEXTILE,
    ITEM_CATEGORIES.LIVESTOCK,
    ITEM_CATEGORIES.SAPLINGS,
    ITEM_CATEGORIES.SOIL,
    ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
    ITEM_CATEGORIES.SEAFOOD,
    ITEM_CATEGORIES.LIVESTOCK_PRODUCTS,
    ITEM_CATEGORIES.MEAT,
    ITEM_CATEGORIES.PELT,
    ITEM_CATEGORIES.HERB,
    ITEM_CATEGORIES.SPECIAL_MATERIAL,
  }),

  [pocketChestLocale.fishermansChest] = Set({
    ITEM_CATEGORIES.UNDERWATER_EQUIPMENT,
    ITEM_CATEGORIES.FISHING_ROD,
    ITEM_CATEGORIES.SEAFOOD,
    ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
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
    ITEM_CATEGORIES.UNIDENTIFIED_EQUIPMENT,
    ITEM_CATEGORIES.FARMHAND_EQUIPMENT,
    ITEM_CATEGORIES.PET_GEAR,
    ITEM_CATEGORIES.LEATHER_ARMOR,
    ITEM_CATEGORIES.CLOTH_ARMOR,
    ITEM_CATEGORIES.PLATE_ARMOR,
    ITEM_CATEGORIES.CLOAK,
    ITEM_CATEGORIES.DAGGER,
    ITEM_CATEGORIES.SWORD,
    ITEM_CATEGORIES.KATANA,
    ITEM_CATEGORIES.SHORTSPEAR,
    ITEM_CATEGORIES.AXE,
    ITEM_CATEGORIES.CLUB,
    ITEM_CATEGORIES.SCEPTER,
    ITEM_CATEGORIES.GREATSWORD,
    ITEM_CATEGORIES.NODACHI,
    ITEM_CATEGORIES.LONGSPEAR,
    ITEM_CATEGORIES.GREATAXE,
    ITEM_CATEGORIES.GREATCLUB,
    ITEM_CATEGORIES.STAFF,
    ITEM_CATEGORIES.SHIELD,
    ITEM_CATEGORIES.EARRING,
    ITEM_CATEGORIES.NECKLACE,
    ITEM_CATEGORIES.RING,
    ITEM_CATEGORIES.FLUTE,
    ITEM_CATEGORIES.LUTE,
    ITEM_CATEGORIES.BOW,
    ITEM_CATEGORIES.RIFLE,
    ITEM_CATEGORIES.UNDERWATER_EQUIPMENT,
    ITEM_CATEGORIES.FISHING_ROD,
    ITEM_CATEGORIES.SYNTHESIS_GEAR_1,
    ITEM_CATEGORIES.SYNTHESIS_GEAR_2,
  }),

  [pocketChestLocale.instrumentTrunk] = Set({
    ITEM_CATEGORIES.FLUTE,
    ITEM_CATEGORIES.LUTE,
  }),

  [pocketChestLocale.librariansChest] = Set({
    ITEM_CATEGORIES.BOOK,
  }),

  [pocketChestLocale.machinesChest] = Set({
    ITEM_CATEGORIES.MAST,
    ITEM_CATEGORIES.SHIP_PROPELLANT,
    ITEM_CATEGORIES.SHIP_DESIGN,
    ITEM_CATEGORIES.SHIP_COMPONENT_DESIGN,
    ITEM_CATEGORIES.MACHINE_COMPONENT_SCROLL,
    ITEM_CATEGORIES.VEHICLE_COMPONENT_DESIGN,
    ITEM_CATEGORIES.MISC_APPARATUS,
    ITEM_CATEGORIES.MACHINING,
    ITEM_CATEGORIES.ARMAMENT,
    ITEM_CATEGORIES.SOUND_EQUIPMENT,
    ITEM_CATEGORIES.SAIL,
    ITEM_CATEGORIES.STORAGE,
    ITEM_CATEGORIES.NAVIGATION,
    ITEM_CATEGORIES.BOARDING_EQUIPMENT,
    ITEM_CATEGORIES.STEERING_GEAR,
    ITEM_CATEGORIES.MECHANICAL_COMPONENTS,
    ITEM_CATEGORIES.FIGUREHEAD,
    ITEM_CATEGORIES.LIGHTING,
    ITEM_CATEGORIES.MUSIC_DISC,
    ITEM_CATEGORIES.MECHANICAL_COMPONENT_DESIGN_BAG,
  }),

  [pocketChestLocale.musicChest] = Set({
    ITEM_CATEGORIES.SHEET_MUSIC,
    ITEM_CATEGORIES.MUSIC_DISC,
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
    ITEM_CATEGORIES.MOUNT,
    ITEM_CATEGORIES.GIANT_PET,
  }),

  [pocketChestLocale.shardCollectorsChest] = Set({
    ITEM_CATEGORIES.SHARD,
  }),

  [pocketChestLocale.travelerNecessitiesChest] = Set({
    ITEM_CATEGORIES.FOOD,
    ITEM_CATEGORIES.POTION,
    ITEM_CATEGORIES.DRINK,
    ITEM_CATEGORIES.MANA_POTION,
    ITEM_CATEGORIES.DEFENSE_POTION,
    ITEM_CATEGORIES.HEALING_POTION,
    ITEM_CATEGORIES.BOOSTERS,
    ITEM_CATEGORIES.SPECIAL_CONSUMABLES,
  }),

  [pocketChestLocale.treasureHuntersChest] = Set({
    ITEM_CATEGORIES.TREASURE_MAP,
    ITEM_CATEGORIES.RELIC,
    ITEM_CATEGORIES.TREASURE_HUNTERS_CONSUMABLES,
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

  local contentFrame              = window.contentFrame

  local storageOption             = {
    frame = contentFrame.storageOptionFrame ---@type EmptyWidget
  }

  storageOption.contentframe      = storageOption.frame.contentFrame ---@type EmptyWidget
  storageOption.radioGroupFrame   = storageOption.contentframe.radioGroupFrame ---@type RadioGroup

  local filter                    = {
    frame = contentFrame.filterFrame, ---@type EmptyWidget
  }

  filter.contentFrame             = filter.frame.contentFrame ---@type EmptyWidget
  filter.transferBoundCheckbutton = filter.contentFrame.transferBoundCheckbutton ---@type CheckButton
  filter.resetButton              = filter.contentFrame.resetButton ---@type Button
  filter.categoryFilterCombobox   = filter.contentFrame.categoryFilterCombobox ---@type Combobox
  filter.searchEditbox            = filter.contentFrame.searchEditbox ---@type X2Editbox
  filter.startEditbox             = filter.contentFrame.startEditbox ---@type X2Editbox
  filter.endEditbox               = filter.contentFrame.endEditbox ---@type X2Editbox
  filter.cooldownEditbox          = filter.contentFrame.cooldownEditbox ---@type X2Editbox

  filter.resetButton:SetHandler("OnClick", function ()
    filter.transferBoundCheckbutton:SetChecked(false)
    filter.categoryFilterCombobox.dropdown:Select(0)
    filter.searchEditbox:SetText("")
    filter.startEditbox:SetText("")
    filter.endEditbox:SetText("")
    filter.cooldownEditbox:SetText("")
  end)

  local filterKeys = {}

  for _, key in pairs(locale.addon.pocketChest) do
    table.insert(filterKeys, key)
    table.sort(filterKeys)
  end

  table.insert(filterKeys, 1, locale.addon.filterAll)

  for k, v in ipairs(filterKeys) do
    filter.categoryFilterCombobox.dropdown:AppendItem(v, k)
  end

  filter.categoryFilterCombobox.dropdown:Select(0)

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

    source.startSlot             = tonumber(filter.startEditbox:GetText()) or 1
    source.currentSlot           = source.startSlot
    source.endSlot               = tonumber(filter.endEditbox:GetText()) or source.storage:Capacity()

    local transferBoundItems     = filter.transferBoundCheckbutton:GetChecked()
    local selectedCategoryFilter = filter.categoryFilterCombobox.selectorBtn:GetText()

    local categoryFilter
    if selectedCategoryFilter ~= locale.addon.filterAll then
      categoryFilter = POCKET_CHEST_FILTER[selectedCategoryFilter]
    end

    local search = filter.searchEditbox:GetText():lower()

    ---@param itemInfo ItemInfo
    ---@return boolean
    local function ItemMatchesFilter(itemInfo)
      if itemInfo.item_impl == "bag" then
        return false
      end

      if itemInfo.pinned then
        return false
      end

      if itemInfo.soul_bound == 1 and not transferBoundItems then
        return false
      end

      if categoryFilter and not categoryFilter[itemInfo.category_id] then
        return false
      end

      if itemInfo.category_id == ITEM_CATEGORIES.TREASURE_MAP
        and SafeMatch(BuildSextantPosition(itemInfo), search) then
        return true
      end

      local name     = itemInfo.name:lower()
      local category = itemInfo.category:lower()

      if SafeMatch(name, search) then
        return true
      end

      if SafeMatch(category, search) then
        return true
      end

      return false
    end

    local userCooldown       = tonumber(filter.cooldownEditbox:GetText()) or 0
    local minimumCooldown    = 200
    local cooldown           = userCooldown > minimumCooldown and userCooldown or minimumCooldown
    local timePassed         = cooldown
    local attemptedMove      = false
    local attemptFailedCount = 0
    local maxFailedAttempts  = 3

    window:SetHandler("OnUpdate", function (self, frameTime)
      timePassed = timePassed + frameTime

      if timePassed < cooldown then
        return
      end

      local targetEmptySlot = target.storage:Capacity() - target.storage:CountItems()

      if source.currentSlot > source.endSlot or targetEmptySlot <= 0 then
        progressTextbox:SetText(targetEmptySlot <= 0 and locale.addon.inventoryFull or "")
        StopTransaction()
        return
      end

      if attemptedMove then
        local checkItemInfo = source.storage:GetBagItemInfo(source.currentSlot - 1)

        if checkItemInfo and attemptFailedCount < maxFailedAttempts then
          attemptFailedCount = attemptFailedCount + 1
          source.currentSlot = source.currentSlot - 1
        else
          attemptFailedCount = 0
        end

        attemptedMove = false
      end

      local foundMatch     = false
      local foundNextMatch = false

      for i = source.currentSlot, source.endSlot do
        local itemInfo = source.storage:GetBagItemInfo(i)

        if itemInfo and ItemMatchesFilter(itemInfo) then
          if not foundMatch then
            foundMatch    = true
            attemptedMove = true

            MoveToEmptySlot[type][option](i)

            progressTextbox:SetText(string.format("%d - %d (x%d) - %d\n%s",
              source.startSlot, i, attemptFailedCount, source.endSlot, itemInfo.name
            ))

            timePassed = 0
          elseif not foundNextMatch then
            foundNextMatch     = true
            source.currentSlot = i
            break
          end
        end
      end

      if not foundNextMatch then
        source.currentSlot = source.endSlot + 1
        timePassed = cooldown
      end
    end)
  end

  window:SetHandler("OnEvent", function ()
    progressTextbox:SetText(locale.addon.autoSortDetected)
  end)

  window:RegisterEvent("BAG_TAB_SORTED")
  window:RegisterEvent("COFFER_TAB_SORTED")
  window:RegisterEvent("BANK_TAB_SORTED")

  transaction.depositButton:SetHandler("OnClick", function ()
    StartTransaction(TRANSACTION_TYPE.DEPOSIT)
  end)

  transaction.withdrawButton:SetHandler("OnClick", function ()
    StartTransaction(TRANSACTION_TYPE.WITHDRAW)
  end)

  transaction.cancelButton:SetHandler("OnClick", function ()
    progressTextbox:SetText("")
    StopTransaction()
  end)

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
