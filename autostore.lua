---This overrides the default params of X2Bag.GetBagItemInfo so that badId
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
  }
}

local function AttachTooltipBehavior(frame)
  local guide   = frame.titleTextbox.guide ---@type EmptyWidget
  local tooltip = frame.tooltipTextbox ---@type Textbox

  guide:SetHandler("OnEnter", function ()
    tooltip:Show(true)
    tooltip:Raise()
  end)

  guide:SetHandler("OnLeave", function ()
    tooltip:Show(false)
  end)
end

---@return Window
---@nodiscard
local function CreateAutoStoreWindow(id)
  local window = SetViewOfAutoStoreWindow(id)
  window:SetUILayer("system")

  local contentFrame            = window.contentFrame

  local storageOption           = {
    frame = contentFrame.storageOptionFrame ---@type EmptyWidget
  }

  storageOption.contentframe    = storageOption.frame.contentFrame ---@type EmptyWidget
  storageOption.radioGroupFrame = storageOption.contentframe.radioGroupFrame ---@type RadioGroup

  local filter                  = {
    frame = contentFrame.filterFrame, ---@type EmptyWidget
  }

  filter.contentFrame           = filter.frame.contentFrame ---@type EmptyWidget
  filter.checkbutton            = filter.contentFrame.filterCheckbutton ---@type CheckButton
  filter.combobox               = filter.contentFrame.filterCombobox ---@type Combobox
  filter.searchEditbox          = filter.contentFrame.searchEditbox ---@type X2Editbox
  filter.startEditbox           = filter.contentFrame.startEditbox ---@type X2Editbox
  filter.endEditbox             = filter.contentFrame.endEditbox ---@type X2Editbox

  local filterKeys              = {}

  for key, _ in pairs(locale.addon.filter) do
    table.insert(filterKeys, key)
    table.sort(filterKeys)
  end

  table.insert(filterKeys, 1, locale.addon.filterAll)

  for k, v in ipairs(filterKeys) do
    filter.combobox.dropdown:AppendItem(v, k)
  end

  filter.combobox.dropdown:Select(0)

  local progressTextbox      = contentFrame.progressTextbox ---@type Textbox

  local transaction          = {
    frame = contentFrame.transactionFrame ---@type EmptyWidget
  }

  transaction.depositButton  = transaction.frame.depositButton ---@type Button
  transaction.withdrawButton = transaction.frame.withdrawButton ---@type Button
  transaction.cancelButton   = transaction.frame.cancelButton ---@type Button

  ---@param enable boolean
  function window:EnableAutoStore(enable)
    storageOption.radioGroupFrame:Enable(enable, true)
    filter.contentFrame:Enable(enable, true)
    transaction.depositButton:Enable(enable)
    transaction.withdrawButton:Enable(enable)
    transaction.cancelButton:Enable(not enable)
  end

  function window:StopTransaction()
    window:ReleaseHandler("OnUpdate")
    window:EnableAutoStore(true)
    window:SetWindowModal(false)
  end

  ---@param type TRANSACTION_TYPE
  function window:StartTransaction(type)
    window:EnableAutoStore(false)
    window:SetWindowModal(true)

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

    local transferBoundItems     = filter.checkbutton:GetChecked()

    local selectedCategoryFilter = filter.combobox.selectorBtn:GetText()

    local categoryFilter
    if selectedCategoryFilter ~= locale.addon.filterAll then
      categoryFilter = locale.addon.filter[selectedCategoryFilter]
    end

    local search = filter.searchEditbox:GetText():lower()

    local function itemMatchesFilter(itemInfo)
      if not itemInfo then return false end

      local name     = itemInfo.name:lower()
      local category = itemInfo.category:lower()

      return (transferBoundItems or itemInfo.soul_bound ~= 1)
        and (not categoryFilter or categoryFilter[itemInfo.category])
        and (string.match(name, search) or string.match(category, search))
        and itemInfo.item_impl ~= "bag"
        and not itemInfo.pinned
    end

    local cooldown           = 200
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
        window:StopTransaction()
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

      local foundNextMatch = false

      for i = source.currentSlot, source.endSlot do
        local itemInfo = source.storage:GetBagItemInfo(i)

        if itemMatchesFilter(itemInfo) then
          foundNextMatch = true
          attemptedMove  = true

          MoveToEmptySlot[type][option](i)

          progressTextbox:SetText(string.format("%d - %d (x%d) - %d\n%s",
            source.startSlot, i, attemptFailedCount, source.endSlot, itemInfo.name
          ))

          source.currentSlot = i + 1
          timePassed = 0
          break
        end
      end

      if not foundNextMatch then
        source.currentSlot = source.endSlot + 1
        timePassed = cooldown
      end
    end)
  end

  AttachTooltipBehavior(storageOption.frame)
  AttachTooltipBehavior(filter.frame)

  transaction.depositButton:SetHandler("OnClick", function ()
    window:StartTransaction(TRANSACTION_TYPE.DEPOSIT)
  end)

  transaction.withdrawButton:SetHandler("OnClick", function ()
    window:StartTransaction(TRANSACTION_TYPE.WITHDRAW)
  end)

  transaction.cancelButton:SetHandler("OnClick", function ()
    progressTextbox:SetText("")
    window:StopTransaction()
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

local function CreateAutoStoreButton()
  local frame = UIParent:CreateWidget("window", "bagWatcher", "UIParent")
  frame:SetUILayer("hud")
  frame:Show(true)

  local button = frame:CreateChildWidget("button", "autoStoreButton", 0, true)
  button:SetStyle("deposit_withdrawal")
  button:AddAnchor("CENTER", frame, 0, 0)
  frame:SetExtent(button:GetWidth(), button:GetHeight())

  local isHiding = false

  frame:SetHandler("OnUpdate", function ()
    local x, y, w, h, isVisible = ADDON:GetContentMainScriptPosVis(UIC_BAG)

    if isVisible then
      frame:AddAnchor("TOPLEFT", "UIParent", x + 20, y + h - 97)
      isHiding = false
    elseif not isHiding then
      frame:AddAnchor("TOPLEFT", "UIParent", "BOTTOMRIGHT", 100, 100)
      isHiding = true
    end
  end)

  button:SetHandler("OnClick", function ()
    ToggleAutoStoreWindow()
  end)
end

CreateAutoStoreButton()
