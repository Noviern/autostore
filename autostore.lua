local ITEM_CATEGORIES = {
  OTHER                           = 1,
  SHIP                            = 4,
  BUILDINGS                       = 6,
  FURNITURE                       = 7,
  SAPLINGS                        = 8,
  COSTUME                         = 10,
  POTION                          = 12,
  FOOD                            = 13,
  CONTRAPTION                     = 14,
  SIEGE_GEAR                      = 15,
  PAPER                           = 17,
  BOOK                            = 18,
  LUNASTONE                       = 20,
  LIVESTOCK                       = 21,
  METAL                           = 23,
  LUMBER                          = 24,
  STONE_BRICK                     = 25,
  HIDE                            = 26,
  FABRIC                          = 27,
  MACHINING                       = 28,
  GLASS                           = 30,
  RUBBER                          = 31,
  ARCHEUM                         = 32,
  DYE                             = 33,
  CRAFTING_MATERIAL               = 34,
  COOKING_OIL                     = 36,
  SPICES                          = 37,
  ORE                             = 38,
  HARDWOOD                        = 39,
  RAW_STONE                       = 40,
  PELT                            = 41,
  TEXTILE                         = 42,
  COMPONENT                       = 43,
  EVIDENCE                        = 44,
  MEAT                            = 45,
  SEAFOOD                         = 46,
  GRAIN                           = 47,
  VEGETABLE                       = 48,
  FRUIT                           = 49,
  SEED                            = 51,
  SPICE                           = 52,
  HERB                            = 53,
  FLOWER                          = 55,
  SOIL                            = 56,
  PRECIOUS_METAL                  = 58,
  GEM                             = 59,
  ALCHEMY                         = 62,
  QUEST_ITEM                      = 64,
  DESIGN                          = 65,
  DAGGER                          = 69,
  SWORD                           = 70,
  KATANA                          = 72,
  AXE                             = 73,
  CLUB                            = 74,
  SCEPTER                         = 75,
  SHORTSPEAR                      = 76,
  BOW                             = 77,
  THROWING_WEAPON                 = 78,
  SHIELD                          = 79,
  LUTE                            = 80,
  FLUTE                           = 81,
  DRUM                            = 82,
  CLOTH_ARMOR                     = 83,
  LEATHER_ARMOR                   = 84,
  PLATE_ARMOR                     = 85,
  NECKLACE                        = 86,
  RING                            = 87,
  ACCESSORY                       = 88,
  OUTDOOR_DECOR                   = 89,
  INDOOR_DECOR                    = 90,
  MOUNT                           = 92,
  VEHICLE                         = 93,
  CRATE                           = 94,
  BATTLE_PET                      = 95,
  DRINK                           = 97,
  SUNDRIES                        = 99,
  KEY                             = 106,
  ADVENTURE                       = 107,
  PET_GEAR                        = 108,
  MARINE_MOUNT                    = 109,
  MANA_POTION                     = 113,
  DEFENSE_POTION                  = 114,
  REGEN_POTION                    = 115,
  HEALING_POTION                  = 116,
  TOY                             = 117,
  GLIDER                          = 118,
  MATERIAL                        = 119,
  TALISMAN                        = 120,
  CLOAK                           = 121,
  TRADE_PACK                      = 122,
  EARRING                         = 125,
  RELIC                           = 126,
  GREATSWORD                      = 127,
  NODACHI                         = 128,
  GREATAXE                        = 129,
  GREATCLUB                       = 130,
  STAFF                           = 131,
  LONGSPEAR                       = 132,
  SPECIALTY                       = 133,
  COIN                            = 138,
  SIEGE_STRONGHOLD                = 140,
  TOKEN                           = 141,
  EXPLOSIVE                       = 143,
  FISHING_ROD                     = 145,
  TAXIDERMY                       = 146,
  FISH_PRINT                      = 147,
  SHEET_MUSIC                     = 148,
  CREST_AND_DYE_ITEMS             = 150,
  LUNAGEM                         = 152,
  UNIDENTIFIED                    = 153,
  PLUSHIE_ACCESSORY               = 156,
  ARMAMENT                        = 157,
  STEERING_GEAR                   = 158,
  MAST                            = 159,
  SAIL                            = 160,
  LIGHTING                        = 161,
  BOARDING_EQUIPMENT              = 162,
  NAVIGATION                      = 164,
  MISC_APPARATUS                  = 165,
  FIGUREHEAD                      = 166,
  STORAGE                         = 167,
  SOUND_EQUIPMENT                 = 169,
  SHIP_PROPELLANT                 = 170,
  HOUSEPETS                       = 171,
  CLOAK_SYNTHESIS_MATERIALS       = 172,
  SYNTHESIS_GEAR_1                = 173,
  THEATRICAL_TECHNIQUES           = 174,
  MAGITHOPTER                     = 175,
  GIANT_PET                       = 176,
  PETS                            = 191,
  CARGO                           = 195,
  SPECIAL_SHIP_COMPONENT          = 196,
  POWERSTONE_PET                  = 197,
  SYNTHESIS_MATERIALS             = 199,
  AWAKENING_MATERIALS             = 200,
  STORAGE_CHEST                   = 201,
  RIFLE                           = 203,
  FARMHAND_EQUIPMENT              = 204,
  MECHANICAL_COMPONENTS           = 206,
  DARU_COSTUME                    = 207,
  BOOSTERS                        = 9000002,
  SPECIAL_MATERIAL                = 9000003,
  LIVESTOCK_PRODUCTS              = 9000004,
  SHIP_DESIGN                     = 9000005,
  MACHINE_COMPONENT_SCROLL        = 9000006,
  SHIP_COMPONENT_DESIGN           = 9000007,
  SHARD                           = 9000008,
  MUSIC_DISC                      = 9000009,
  ENCHANCEMENT_MATERIALS          = 9000010,
  VEHICLE_COMPONENT_DESIGN        = 9000011,
  FEED                            = 9000013,
  UNIDENTIFIED_EQUIPMENT          = 9000014,
  ALCHEMY_OIL                     = 9000015,
  MECHANICAL_COMPONENT_DESIGN_BAG = 9000016,
  COINPURSE                       = 9000017,
  VALUABLE_CRATE                  = 9000018,
  CURRENCY                        = 9000019,
  SYNTHESIS_GEAR_2                = 9000020,
  SPECIAL_CONSUMABLES             = 9000021,
  TREASURE_MAP                    = 9000022,
  TREASURE_HUNTERS_CONSUMABLES    = 9000023,
  UNDERWATER_EQUIPMENT            = 9000024,
  LEGENDARY_TROPHY                = 9000025,
  DREAM_DESIGN                    = 9000026,
  ART_OBJECT                      = 9000027,
  COSMETIC_MATERIALS              = 9000028,
}
local pocketChestLocale = locale.addon.pocketChest
local POCKET_CHEST_FILTER = {
  [pocketChestLocale.adventurersChest] = {
    [ITEM_CATEGORIES.COINPURSE]                       = true,
    [ITEM_CATEGORIES.VALUABLE_CRATE]                  = true,
    [ITEM_CATEGORIES.KEY]                             = true,
    [ITEM_CATEGORIES.COIN]                            = true,
    [ITEM_CATEGORIES.CURRENCY]                        = true,
    [ITEM_CATEGORIES.MECHANICAL_COMPONENT_DESIGN_BAG] = true,
  },

  [pocketChestLocale.alchemistsChest] = {
    [ITEM_CATEGORIES.ARCHEUM]          = true,
    [ITEM_CATEGORIES.ALCHEMY]          = true,
    [ITEM_CATEGORIES.ALCHEMY_OIL]      = true,
    [ITEM_CATEGORIES.SPECIAL_MATERIAL] = true,
    [ITEM_CATEGORIES.HERB]             = true,
  },

  [pocketChestLocale.animalBreedersChest] = {
    [ITEM_CATEGORIES.COOKING_OIL]         = true,
    [ITEM_CATEGORIES.FEED]                = true,
    [ITEM_CATEGORIES.PELT]                = true,
    [ITEM_CATEGORIES.TEXTILE]             = true,
    [ITEM_CATEGORIES.MEAT]                = true,
    [ITEM_CATEGORIES.SEAFOOD]             = true,
    [ITEM_CATEGORIES.LIVESTOCK_PRODUCTS]  = true,
    [ITEM_CATEGORIES.SPECIAL_CONSUMABLES] = true,
  },

  [pocketChestLocale.artisansChest] = {
    [ITEM_CATEGORIES.METAL]            = true,
    [ITEM_CATEGORIES.LUMBER]           = true,
    [ITEM_CATEGORIES.STONE_BRICK]      = true,
    [ITEM_CATEGORIES.HIDE]             = true,
    [ITEM_CATEGORIES.FABRIC]           = true,
    [ITEM_CATEGORIES.ORE]              = true,
    [ITEM_CATEGORIES.HARDWOOD]         = true,
    [ITEM_CATEGORIES.RAW_STONE]        = true,
    [ITEM_CATEGORIES.PRECIOUS_METAL]   = true,
    [ITEM_CATEGORIES.GEM]              = true,
    [ITEM_CATEGORIES.RUBBER]           = true,
    [ITEM_CATEGORIES.TEXTILE]          = true,
    [ITEM_CATEGORIES.PELT]             = true,
    [ITEM_CATEGORIES.SPECIAL_MATERIAL] = true,
  },

  [pocketChestLocale.buildersChest] = {
    [ITEM_CATEGORIES.BUILDINGS] = true,
  },

  [pocketChestLocale.costumeCloset] = {
    [ITEM_CATEGORIES.COSTUME]            = true,
    [ITEM_CATEGORIES.DARU_COSTUME]       = true,
    [ITEM_CATEGORIES.COSMETIC_MATERIALS] = true,
    [ITEM_CATEGORIES.SYNTHESIS_GEAR_1]   = true,
    [ITEM_CATEGORIES.SYNTHESIS_GEAR_2]   = true,
  },

  [pocketChestLocale.designChest] = {
    [ITEM_CATEGORIES.CREST_AND_DYE_ITEMS] = true,
  },

  [pocketChestLocale.dreamDesignersChest] = {
    [ITEM_CATEGORIES.DREAM_DESIGN] = true,
    [ITEM_CATEGORIES.ART_OBJECT]   = true,
  },

  [pocketChestLocale.equipmentEnhancementChest] = {
    [ITEM_CATEGORIES.SYNTHESIS_MATERIALS]    = true,
    [ITEM_CATEGORIES.AWAKENING_MATERIALS]    = true,
    [ITEM_CATEGORIES.ENCHANCEMENT_MATERIALS] = true,
    [ITEM_CATEGORIES.LUNAGEM]                = true,
    [ITEM_CATEGORIES.LUNASTONE]              = true,
  },

  [pocketChestLocale.equipmentMaterialChest] = {
    [ITEM_CATEGORIES.SYNTHESIS_MATERIALS] = true,
    [ITEM_CATEGORIES.AWAKENING_MATERIALS] = true,
  },

  [pocketChestLocale.farmersLargeChest] = {
    [ITEM_CATEGORIES.FRUIT]               = true,
    [ITEM_CATEGORIES.VEGETABLE]           = true,
    [ITEM_CATEGORIES.SPICE]               = true,
    [ITEM_CATEGORIES.FLOWER]              = true,
    [ITEM_CATEGORIES.GRAIN]               = true,
    [ITEM_CATEGORIES.SEED]                = true,
    [ITEM_CATEGORIES.TEXTILE]             = true,
    [ITEM_CATEGORIES.LIVESTOCK]           = true,
    [ITEM_CATEGORIES.SAPLINGS]            = true,
    [ITEM_CATEGORIES.SOIL]                = true,
    [ITEM_CATEGORIES.SPECIAL_CONSUMABLES] = true,
    [ITEM_CATEGORIES.SEAFOOD]             = true,
    [ITEM_CATEGORIES.LIVESTOCK_PRODUCTS]  = true,
    [ITEM_CATEGORIES.MEAT]                = true,
    [ITEM_CATEGORIES.PELT]                = true,
    [ITEM_CATEGORIES.HERB]                = true,
    [ITEM_CATEGORIES.SPECIAL_MATERIAL]    = true,
  },

  [pocketChestLocale.fishermansChest] = {
    [ITEM_CATEGORIES.UNDERWATER_EQUIPMENT] = true,
    [ITEM_CATEGORIES.FISHING_ROD]          = true,
    [ITEM_CATEGORIES.SEAFOOD]              = true,
    [ITEM_CATEGORIES.SPECIAL_CONSUMABLES]  = true,
  },

  [pocketChestLocale.flutterVessel] = {
    [ITEM_CATEGORIES.GLIDER]      = true,
    [ITEM_CATEGORIES.MAGITHOPTER] = true,
  },

  [pocketChestLocale.furnitureChest] = {
    [ITEM_CATEGORIES.FURNITURE] = true,
    [ITEM_CATEGORIES.TAXIDERMY] = true,
  },

  [pocketChestLocale.gearChest] = {
    [ITEM_CATEGORIES.UNIDENTIFIED_EQUIPMENT] = true,
    [ITEM_CATEGORIES.FARMHAND_EQUIPMENT]     = true,
    [ITEM_CATEGORIES.PET_GEAR]               = true,
    [ITEM_CATEGORIES.LEATHER_ARMOR]          = true,
    [ITEM_CATEGORIES.CLOTH_ARMOR]            = true,
    [ITEM_CATEGORIES.PLATE_ARMOR]            = true,
    [ITEM_CATEGORIES.CLOAK]                  = true,
    [ITEM_CATEGORIES.DAGGER]                 = true,
    [ITEM_CATEGORIES.SWORD]                  = true,
    [ITEM_CATEGORIES.KATANA]                 = true,
    [ITEM_CATEGORIES.SHORTSPEAR]             = true,
    [ITEM_CATEGORIES.AXE]                    = true,
    [ITEM_CATEGORIES.CLUB]                   = true,
    [ITEM_CATEGORIES.SCEPTER]                = true,
    [ITEM_CATEGORIES.GREATSWORD]             = true,
    [ITEM_CATEGORIES.NODACHI]                = true,
    [ITEM_CATEGORIES.LONGSPEAR]              = true,
    [ITEM_CATEGORIES.GREATAXE]               = true,
    [ITEM_CATEGORIES.GREATCLUB]              = true,
    [ITEM_CATEGORIES.STAFF]                  = true,
    [ITEM_CATEGORIES.SHIELD]                 = true,
    [ITEM_CATEGORIES.EARRING]                = true,
    [ITEM_CATEGORIES.NECKLACE]               = true,
    [ITEM_CATEGORIES.RING]                   = true,
    [ITEM_CATEGORIES.FLUTE]                  = true,
    [ITEM_CATEGORIES.LUTE]                   = true,
    [ITEM_CATEGORIES.BOW]                    = true,
    [ITEM_CATEGORIES.RIFLE]                  = true,
    [ITEM_CATEGORIES.UNDERWATER_EQUIPMENT]   = true,
    [ITEM_CATEGORIES.FISHING_ROD]            = true,
    [ITEM_CATEGORIES.SYNTHESIS_GEAR_1]       = true,
    [ITEM_CATEGORIES.SYNTHESIS_GEAR_2]       = true,
  },

  [pocketChestLocale.instrumentTrunk] = {
    [ITEM_CATEGORIES.FLUTE] = true,
    [ITEM_CATEGORIES.LUTE]  = true,
  },

  [pocketChestLocale.librariansChest] = {
    [ITEM_CATEGORIES.BOOK] = true,
  },

  [pocketChestLocale.machinesChest] = {
    [ITEM_CATEGORIES.MAST]                            = true,
    [ITEM_CATEGORIES.SHIP_PROPELLANT]                 = true,
    [ITEM_CATEGORIES.SHIP_DESIGN]                     = true,
    [ITEM_CATEGORIES.SHIP_COMPONENT_DESIGN]           = true,
    [ITEM_CATEGORIES.MACHINE_COMPONENT_SCROLL]        = true,
    [ITEM_CATEGORIES.VEHICLE_COMPONENT_DESIGN]        = true,
    [ITEM_CATEGORIES.MISC_APPARATUS]                  = true,
    [ITEM_CATEGORIES.MACHINING]                       = true,
    [ITEM_CATEGORIES.ARMAMENT]                        = true,
    [ITEM_CATEGORIES.SOUND_EQUIPMENT]                 = true,
    [ITEM_CATEGORIES.SAIL]                            = true,
    [ITEM_CATEGORIES.STORAGE]                         = true,
    [ITEM_CATEGORIES.NAVIGATION]                      = true,
    [ITEM_CATEGORIES.BOARDING_EQUIPMENT]              = true,
    [ITEM_CATEGORIES.STEERING_GEAR]                   = true,
    [ITEM_CATEGORIES.MECHANICAL_COMPONENTS]           = true,
    [ITEM_CATEGORIES.FIGUREHEAD]                      = true,
    [ITEM_CATEGORIES.LIGHTING]                        = true,
    [ITEM_CATEGORIES.MUSIC_DISC]                      = true,
    [ITEM_CATEGORIES.MECHANICAL_COMPONENT_DESIGN_BAG] = true,
  },

  [pocketChestLocale.musicChest] = {
    [ITEM_CATEGORIES.SHEET_MUSIC] = true,
    [ITEM_CATEGORIES.MUSIC_DISC]  = true,
  },

  [pocketChestLocale.otherworldlyPetHotel] = {
    [ITEM_CATEGORIES.BATTLE_PET]     = true,
    [ITEM_CATEGORIES.PETS]           = true,
    [ITEM_CATEGORIES.POWERSTONE_PET] = true,
  },

  [pocketChestLocale.petsAndTransportTrunk] = {
    [ITEM_CATEGORIES.SHIP]    = true,
    [ITEM_CATEGORIES.VEHICLE] = true,
  },

  [pocketChestLocale.ridersTrunk] = {
    [ITEM_CATEGORIES.MOUNT]     = true,
    [ITEM_CATEGORIES.GIANT_PET] = true,
  },

  [pocketChestLocale.shardCollectorsChest] = {
    [ITEM_CATEGORIES.SHARD] = true,
  },

  [pocketChestLocale.travelerNecessitiesChest] = {
    [ITEM_CATEGORIES.FOOD]                = true,
    [ITEM_CATEGORIES.POTION]              = true,
    [ITEM_CATEGORIES.DRINK]               = true,
    [ITEM_CATEGORIES.MANA_POTION]         = true,
    [ITEM_CATEGORIES.DEFENSE_POTION]      = true,
    [ITEM_CATEGORIES.HEALING_POTION]      = true,
    [ITEM_CATEGORIES.BOOSTERS]            = true,
    [ITEM_CATEGORIES.SPECIAL_CONSUMABLES] = true,
  },

  [pocketChestLocale.treasureHuntersChest] = {
    [ITEM_CATEGORIES.TREASURE_MAP]                 = true,
    [ITEM_CATEGORIES.RELIC]                        = true,
    [ITEM_CATEGORIES.TREASURE_HUNTERS_CONSUMABLES] = true,
  },

  [pocketChestLocale.trophyHuntersChest] = {
    [ITEM_CATEGORIES.LEGENDARY_TROPHY] = true,
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
    storageOption.contentframe:Enable(enable, true)
    filter.contentFrame:Enable(enable, true)
    transaction.depositButton:Enable(enable)
    transaction.withdrawButton:Enable(enable)
    transaction.cancelButton:Enable(not enable)
  end

  local function StopTransaction()
    window:ReleaseHandler("OnUpdate")
    window:SetWindowModal(false)
    EnableAutoStore(true)
  end

  ---@param type TRANSACTION_TYPE
  local function StartTransaction(type)
    window:SetWindowModal(true)
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
      local name     = itemInfo.name:lower()
      local category = itemInfo.category:lower()

      return (transferBoundItems or itemInfo.soul_bound ~= 1)
        and (not categoryFilter or categoryFilter[itemInfo.category_id])
        and (
          (
            itemInfo.category_id == ITEM_CATEGORIES.TREASURE_MAP
            and SafeMatch(BuildSextantPosition(itemInfo), search)
          )
          or SafeMatch(name, search)
          or SafeMatch(category, search)
        )
        and itemInfo.item_impl ~= "bag"
        and not itemInfo.pinned
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
