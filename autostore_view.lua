---@param contentFrame EmptyWidget
---@return EmptyWidget
---@nodiscard
local function SetViewOfStorageOptionFrame(contentFrame)
  local storageLocale = locale.addon.storageModule
  local frame = CreateModule(
    "storageOptionFrame",
    contentFrame,
    storageLocale.title,
    storageLocale.tooltip
  )

  local storageOptionContentFrame = frame.contentFrame ---@type EmptyWidget
  local radioGroupFrame = storageOptionContentFrame:CreateChildWidget("radiogroup", "radioGroupFrame", 0, true)
  radioGroupFrame:AddAnchor("TOPLEFT", storageOptionContentFrame, 0, 0)
  radioGroupFrame:AddAnchor("TOPRIGHT", storageOptionContentFrame, 0, 0)

  local storageChestOptionFrame = CreateRadioItemWithTextbox(radioGroupFrame, STORAGE_TYPE.COFFER, storageLocale.coffer)
  storageChestOptionFrame:AddAnchor("TOPLEFT", radioGroupFrame, 0, 0)

  local warehouseOptionFrame = CreateRadioItemWithTextbox(radioGroupFrame, STORAGE_TYPE.BANK, storageLocale.bank)
  warehouseOptionFrame:AddAnchor("TOPLEFT", storageChestOptionFrame, "BOTTOMLEFT", 0, COMMON.SPACING)

  radioGroupFrame:Check(1)

  ResizeParentToFitBottomWidget(radioGroupFrame, warehouseOptionFrame)
  ResizeParentToFitBottomWidget(frame, warehouseOptionFrame, COMMON.MARGIN)

  return frame
end

---@param id string
---@param parent OptionalParent
---@return X2Editbox
---@nodiscard
local function CreateFilterEditbox(id, parent)
  local editbox = CreateCancelableEditbox(id, parent)
  editbox:SetDigit(true)
  editbox:SetDigitEmpty(true)
  editbox:SetDigitMax(150)
  editbox:SetMaxTextLength(3)
  editbox:SetWidth(86)

  return editbox
end

---@param contentFrame EmptyWidget
---@return EmptyWidget
---@nodiscard
local function SetViewOfFilterFrame(contentFrame)
  local filterLocale = locale.addon.filterModule
  local frame = CreateModule(
    "filterFrame",
    contentFrame,
    filterLocale.title,
    filterLocale.tooltip
  )

  local filterContentframe = frame.contentFrame ---@type EmptyWidget

  local onlyTransferExistingCategoriesCheckbutton = CreateCheckButtonWithTextbox(
    "onlyTransferExistingCategoriesCheckbutton",
    filterContentframe,
    filterLocale.onlyTransferExistingCategories
  )
  onlyTransferExistingCategoriesCheckbutton:AddAnchor("TOPLEFT", filterContentframe, 0, 0)

  local resetButton = filterContentframe:CreateChildWidget("button", "resetButton", 0, true)
  resetButton:SetExtent(20, 20)
  SetViewOfButtonBackground(resetButton, BUTTON_TEXTURE_PATH.COMMON_RESET, "reset")
  resetButton:AddAnchor("TOPRIGHT", filterContentframe, 0, 0)

  local resetButtonTooltip = CreateTooltip(contentFrame, resetButton, filterLocale.reset, false)
  resetButtonTooltip:RemoveAllAnchors()
  resetButtonTooltip:AddAnchor("BOTTOM", resetButton, "TOP", 0, 0)

  onlyTransferExistingCategoriesCheckbutton.textbox:AddAnchor("RIGHT", resetButton, "LEFT", -COMMON.SPACING, 0)
  onlyTransferExistingCategoriesCheckbutton.textbox:SetAutoWordwrap(true)

  ---@TODO need to find a way to auto resize the height of the textbox and then anchor to the textbox with spacing instead of the checkbutton
  local onlyTransferExistingItemsCheckbutton = CreateCheckButtonWithTextbox(
    "onlyTransferExistingItemsCheckbutton",
    filterContentframe,
    filterLocale.onlyTransferExistingItems
  )
  onlyTransferExistingItemsCheckbutton:AddAnchor(
    "TOPLEFT", onlyTransferExistingCategoriesCheckbutton, "BOTTOMLEFT", 0, COMMON.SPACING
  )
  onlyTransferExistingItemsCheckbutton.textbox:AddAnchor("RIGHT", filterContentframe, 0, 0)
  onlyTransferExistingItemsCheckbutton.textbox:SetAutoWordwrap(true)

  local transferBoundCheckbutton = CreateCheckButtonWithTextbox(
    "transferBoundCheckbutton",
    filterContentframe,
    filterLocale.transfer
  )
  transferBoundCheckbutton:AddAnchor("TOPLEFT", onlyTransferExistingItemsCheckbutton, "BOTTOMLEFT", 0, COMMON.SPACING)
  transferBoundCheckbutton.textbox:AddAnchor("RIGHT", filterContentframe, 0, 0)
  transferBoundCheckbutton.textbox:SetAutoWordwrap(true)

  local cancelFullInventoryCheckbutton = CreateCheckButtonWithTextbox(
    "cancelFullInventoryCheckbutton",
    filterContentframe,
    filterLocale.autoCancel
  )
  cancelFullInventoryCheckbutton:AddAnchor("TOPLEFT", transferBoundCheckbutton, "BOTTOMLEFT", 0, COMMON.SPACING)
  cancelFullInventoryCheckbutton.textbox:AddAnchor("RIGHT", filterContentframe, 0, 0)
  cancelFullInventoryCheckbutton.textbox:SetAutoWordwrap(true)

  local categoryFilterCombobox = CreateCombobox("categoryFilterCombobox", filterContentframe)
  categoryFilterCombobox:AddAnchor("TOPLEFT", cancelFullInventoryCheckbutton, "BOTTOMLEFT", 0, COMMON.SPACING)
  categoryFilterCombobox:AddAnchor("RIGHT", filterContentframe, 0, 0)
  categoryFilterCombobox:SetDropdownVisibleLimit(15)

  local searchEditbox = CreateSearchEditbox("searchEditbox", filterContentframe)
  searchEditbox:AddAnchor("TOPLEFT", categoryFilterCombobox, "BOTTOMLEFT", 0, COMMON.SPACING)
  searchEditbox:AddAnchor("TOPRIGHT", categoryFilterCombobox, "BOTTOMRIGHT", 0, COMMON.SPACING)
  searchEditbox:SetGuideText(filterLocale.searchGuide)

  local startEditbox = CreateFilterEditbox("startEditbox", filterContentframe)
  startEditbox:AddAnchor("TOPLEFT", searchEditbox, "BOTTOMLEFT", 0, COMMON.SPACING)
  startEditbox:SetGuideText(filterLocale.startSlot)

  local endEditbox = CreateFilterEditbox("endEditbox", filterContentframe)
  endEditbox:AddAnchor("LEFT", startEditbox, "RIGHT", 6, 0)
  endEditbox:SetGuideText(filterLocale.endSlot)

  local cooldownEditbox = CreateFilterEditbox("cooldownEditbox", filterContentframe)
  cooldownEditbox:SetDigitMax(10000)
  cooldownEditbox:SetMaxTextLength(5)
  cooldownEditbox:AddAnchor("LEFT", endEditbox, "RIGHT", 6, 0)
  cooldownEditbox:SetGuideText(filterLocale.cooldown)

  ResizeParentToFitBottomWidget(frame, cooldownEditbox, COMMON.MARGIN)

  return frame
end

---@param contentFrame EmptyWidget
---@return EmptyWidget
---@nodiscard
local function SetViewOfTransactionFrame(contentFrame)
  local transactionLocale = locale.addon.transaction
  local frame = contentFrame:CreateChildWidget("emptywidget", "transactionFrame", 0, true)

  local depositButton = frame:CreateChildWidget("button", "depositButton", 0, true)
  depositButton:SetStyle("text_default")
  depositButton:SetText(transactionLocale.deposit)

  local withdrawButton = frame:CreateChildWidget("button", "withdrawButton", 0, true)
  withdrawButton:SetStyle("text_default")
  withdrawButton:SetText(transactionLocale.withdraw)

  local cancelButton = frame:CreateChildWidget("button", "cancelButton", 0, true)
  cancelButton:SetStyle("text_default")
  cancelButton:SetText(transactionLocale.cancel)
  cancelButton:Enable(false)

  withdrawButton:AddAnchor("CENTER", frame, 0, 0)
  depositButton:AddAnchor("RIGHT", withdrawButton, "LEFT", -2, 0)
  cancelButton:AddAnchor("LEFT", withdrawButton, "RIGHT", 2, 0)

  frame:SetHeight(depositButton:GetHeight())

  return frame
end

local INVENTORY = {
  WIDTH  = 510,
  OFFSET = 30
}

---@param id string
---@return Window
---@nodiscard
function SetViewOfAutoStoreWindow(id)
  local window = CreateWindow(id, nil, locale.addon.title)
  window:Show(true)
  window:Show(false) ---Fixes a anchoring bug.
  window:SetWidth(350)
  window:AddAnchor("RIGHT", -INVENTORY.OFFSET - INVENTORY.WIDTH - COMMON.MARGIN, 0)

  local contentFrame = window.contentFrame ---@type EmptyWidget

  local storageOptionFrame = SetViewOfStorageOptionFrame(contentFrame)
  storageOptionFrame:AddAnchor("TOPLEFT", contentFrame, 0, 0)
  storageOptionFrame:AddAnchor("TOPRIGHT", contentFrame, 0, 0)

  local filterFrame = SetViewOfFilterFrame(contentFrame)
  filterFrame:AddAnchor("TOPLEFT", storageOptionFrame, "BOTTOMLEFT", 0, COMMON.SPACING)
  filterFrame:AddAnchor("TOPRIGHT", storageOptionFrame, "BOTTOMRIGHT", 0, COMMON.SPACING)

  local filterContentFrame = filterFrame.contentFrame
  local categoryFilterCombobox = filterContentFrame.categoryFilterCombobox ---@type Combobox
  categoryFilterCombobox:SetWidth(filterContentFrame:GetWidth())

  local progressTextbox = contentFrame:CreateChildWidget("textbox", "progressTextbox", 0, true)
  progressTextbox.style:SetEllipsis(true)
  progressTextbox.style:SetColorByKey("default")
  progressTextbox.style:SetFontSize(FONT_SIZE.DEFAULT)
  progressTextbox:SetAutoWordwrap(false)
  progressTextbox:SetHeight(FONT_SIZE.DEFAULT * 2 + COMMON.SPACING)
  progressTextbox:AddAnchor("TOPLEFT", filterFrame, "BOTTOMLEFT", 0, COMMON.SPACING)
  progressTextbox:AddAnchor("TOPRIGHT", filterFrame, "BOTTOMRIGHT", 0, COMMON.SPACING)

  local transactionFrame = SetViewOfTransactionFrame(contentFrame)
  transactionFrame:AddAnchor("TOPLEFT", progressTextbox, "BOTTOMLEFT", 0, COMMON.SPACING)
  transactionFrame:AddAnchor("TOPRIGHT", progressTextbox, "BOTTOMRIGHT", 0, COMMON.SPACING)

  ResizeParentToFitBottomWidget(window, transactionFrame, COMMON.MARGIN)

  return window
end
