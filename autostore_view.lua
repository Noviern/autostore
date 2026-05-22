local WINDOW = {
  WIDTH   = 350,
  MARGIN  = 20,
  SPACING = 10,
}

---@param contentFrame EmptyWidget
---@return EmptyWidget
---@nodiscard
local function SetViewOfStorageOptionFrame(contentFrame)
  local storageLocale = locale.addon.storageModule
  local frame, tooltipFrame = CreateModule(
    "storageOptionFrame",
    contentFrame,
    storageLocale.title,
    storageLocale.tooltip
  )

  local titleTextbox = frame.titleTextbox ---@type Textbox

  local storageOptionContentFrame = frame.contentFrame ---@type EmptyWidget
  local radioGroupFrame = storageOptionContentFrame:CreateChildWidget("radiogroup", "radioGroupFrame", 0, true)
  radioGroupFrame:AddAnchor("TOPLEFT", storageOptionContentFrame, 0, 0)
  radioGroupFrame:AddAnchor("TOPRIGHT", storageOptionContentFrame, 0, 0)

  local height = 0

  local storageChestOptionFrame = CreateRadioItem(radioGroupFrame, STORAGE_TYPE.COFFER, storageLocale.coffer)
  storageChestOptionFrame:AddAnchor("TOPLEFT", radioGroupFrame, 0, 0)
  height = height + storageChestOptionFrame:GetHeight()

  local warehouseOptionFrame = CreateRadioItem(radioGroupFrame, STORAGE_TYPE.BANK, storageLocale.bank)
  warehouseOptionFrame:AddAnchor("TOPLEFT", storageChestOptionFrame, "BOTTOMLEFT", 0, WINDOW.SPACING)
  height = height + warehouseOptionFrame:GetHeight() + WINDOW.SPACING

  radioGroupFrame:Check(1)

  radioGroupFrame:SetHeight(height)
  frame:SetHeight(titleTextbox:GetHeight() + WINDOW.SPACING + height + WINDOW.MARGIN)

  return frame
end

---@param id string
---@param parent OptionalParent
---@param text string
---@return CheckButton
---@nodiscard
local function SetViewOfCheckbutton(id, parent, text)
  local checkbutton
  if parent then
    checkbutton = parent:CreateChildWidget("checkbutton", id, 0, true)
  else
    checkbutton = UIParent:CreateWidget("checkbutton", id, "UIParent")
  end

  checkbutton:SetExtent(20, 20)
  SetViewOfButtonBackground(checkbutton, TEXTURE_PATH.CHECK_BTN, "btn")

  local checkedBackground = checkbutton:CreateDrawable(TEXTURE_PATH.CHECK_BTN, "btn_chk_df", "background")
  checkedBackground:AddAnchor("TOPLEFT", checkbutton, 0, 0)
  checkedBackground:AddAnchor("BOTTOMRIGHT", checkbutton, 0, 0)
  checkbutton:SetCheckedBackground(checkedBackground)

  local disabledCheckedBackground = checkbutton:CreateDrawable(TEXTURE_PATH.CHECK_BTN, "btn_chk_dis", "background")
  disabledCheckedBackground:AddAnchor("TOPLEFT", checkbutton, 0, 0)
  disabledCheckedBackground:AddAnchor("BOTTOMRIGHT", checkbutton, 0, 0)
  checkbutton:SetDisabledCheckedBackground(disabledCheckedBackground)

  local textbox = checkbutton:CreateChildWidget("textbox", "textbox", 0, true)
  textbox:AddAnchor("LEFT", checkbutton, "RIGHT", WINDOW.SPACING, 0)
  textbox:SetAutoResize(true)
  textbox:SetAutoWordwrap(false)
  textbox:SetHeight(20)
  textbox.style:SetColorByKey("default")
  textbox.style:SetAlign(ALIGN_LEFT)
  textbox:SetText(text)

  textbox:SetHandler("OnClick", function ()
    checkbutton:SetChecked(not checkbutton:GetChecked(), true)
  end)

  return checkbutton
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

  local titleTextbox = frame.titleTextbox ---@type Textbox
  local filterContentframe = frame.contentFrame ---@type EmptyWidget

  local height = 0

  local transferBoundCheckbutton = SetViewOfCheckbutton(
    "transferBoundCheckbutton",
    filterContentframe,
    filterLocale.transfer
  )
  transferBoundCheckbutton:AddAnchor("TOPLEFT", filterContentframe, 0, 0)

  local resetButton = filterContentframe:CreateChildWidget("button", "resetButton", 0, true)
  resetButton:SetExtent(20, 20)
  SetViewOfButtonBackground(resetButton, BUTTON_TEXTURE_PATH.COMMON_RESET, "reset")
  resetButton:AddAnchor("TOPRIGHT", filterContentframe, 0, 0)

  height = height + transferBoundCheckbutton:GetHeight()

  local categoryFilterCombobox = CreateCombobox("categoryFilterCombobox", filterContentframe)
  categoryFilterCombobox:AddAnchor("TOPLEFT", transferBoundCheckbutton, "BOTTOMLEFT", 0, WINDOW.SPACING)
  categoryFilterCombobox:AddAnchor("RIGHT", filterContentframe, 0, 0)
  categoryFilterCombobox:SetDropdownVisibleLimit(15)
  height = height + categoryFilterCombobox:GetHeight() + WINDOW.SPACING

  local searchEditbox = CreateEditbox("searchEditbox", filterContentframe)
  AttachCancelableEditboxBehavior(searchEditbox)
  searchEditbox:AddAnchor("TOPLEFT", categoryFilterCombobox, "BOTTOMLEFT", 0, WINDOW.SPACING)
  searchEditbox:AddAnchor("TOPRIGHT", categoryFilterCombobox, "BOTTOMRIGHT", 0, WINDOW.SPACING)
  searchEditbox:SetGuideText(filterLocale.searchGuide)
  height = height + searchEditbox:GetHeight() + WINDOW.SPACING

  local searchIcon = searchEditbox:CreateDrawable(TEXTURE_PATH.INVENTORY_DEFAULT, "search_icon", "overlay")
  searchIcon:AddAnchor("RIGHT", searchEditbox, -6, 0)

  local cancelButton = searchEditbox.cancelButton ---@type Button
  searchEditbox:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))

  cancelButton:SetHandler("OnEnableChanged", function (self, enabled)
    if enabled then
      searchIcon:SetColor(1, 1, 1, 1)
    else
      searchIcon:SetColor(0.4, 0.4, 0.4, .5)
    end
  end)

  cancelButton:SetHandler("OnVisibleChanged", function (self, visible)
    searchIcon:Show(not visible)
  end)

  local startEditbox = CreateCancelableDigitEditbox("startEditbox", filterContentframe)
  startEditbox:SetGuideText(filterLocale.startSlot)
  startEditbox:AddAnchor("TOPLEFT", searchEditbox, "BOTTOMLEFT", 0, WINDOW.SPACING)

  local endEditbox = CreateCancelableDigitEditbox("endEditbox", filterContentframe)
  endEditbox:SetGuideText(filterLocale.endSlot)
  endEditbox:AddAnchor("LEFT", startEditbox, "RIGHT", 6, 0)

  local cooldownEditbox = CreateCancelableDigitEditbox("cooldownEditbox", filterContentframe)
  cooldownEditbox:SetDigitMax(10000)
  cooldownEditbox:SetMaxTextLength(5)
  cooldownEditbox:SetGuideText(filterLocale.cooldown)
  cooldownEditbox:AddAnchor("LEFT", endEditbox, "RIGHT", 6, 0)

  height = height + cooldownEditbox:GetHeight() + WINDOW.SPACING

  frame:SetHeight(titleTextbox:GetHeight() + WINDOW.SPACING + height + WINDOW.MARGIN)

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
  WIDTH = 510,
  OFFSET = 30
}

---@param id string
---@return Window
---@nodiscard
function SetViewOfAutoStoreWindow(id)
  local window = CreateWindow(id)
  window:Show(true)
  window:Show(false) ---Fixes a anchoring bug.
  window:SetWidth(WINDOW.WIDTH)
  window:AddAnchor("RIGHT", -INVENTORY.OFFSET - INVENTORY.WIDTH - WINDOW.MARGIN, 0)

  local titleBar = window.titleBar ---@type Window
  titleBar:SetTitleText(locale.addon.title)

  local contentFrame = window.contentFrame ---@type EmptyWidget

  local storageOptionFrame = SetViewOfStorageOptionFrame(contentFrame)
  storageOptionFrame:AddAnchor("TOPLEFT", contentFrame, 0, 0)
  storageOptionFrame:AddAnchor("TOPRIGHT", contentFrame, 0, 0)

  local filterFrame = SetViewOfFilterFrame(contentFrame)
  filterFrame:AddAnchor("TOPLEFT", storageOptionFrame, "BOTTOMLEFT", 0, WINDOW.SPACING)
  filterFrame:AddAnchor("TOPRIGHT", storageOptionFrame, "BOTTOMRIGHT", 0, WINDOW.SPACING)

  local filterContentFrame = filterFrame.contentFrame
  local categoryFilterCombobox = filterContentFrame.categoryFilterCombobox ---@type Combobox
  categoryFilterCombobox:SetWidth(filterContentFrame:GetWidth())

  local progressTextbox = contentFrame:CreateChildWidget("textbox", "progressTextbox", 0, true)
  progressTextbox.style:SetEllipsis(true)
  progressTextbox.style:SetColorByKey("default")
  progressTextbox.style:SetFontSize(FONT_SIZE.DEFAULT)
  progressTextbox:SetAutoWordwrap(false)
  progressTextbox:SetHeight(FONT_SIZE.DEFAULT * 2 + WINDOW.SPACING)
  progressTextbox:AddAnchor("TOPLEFT", filterFrame, "BOTTOMLEFT", 0, WINDOW.SPACING)
  progressTextbox:AddAnchor("TOPRIGHT", filterFrame, "BOTTOMRIGHT", 0, WINDOW.SPACING)

  local transactionFrame = SetViewOfTransactionFrame(contentFrame)
  transactionFrame:AddAnchor("TOPLEFT", progressTextbox, "BOTTOMLEFT", 0, WINDOW.SPACING)
  transactionFrame:AddAnchor("TOPRIGHT", progressTextbox, "BOTTOMRIGHT", 0, WINDOW.SPACING)

  local _, y1     = window:GetOffset()
  local _, y2     = transactionFrame:GetOffset()
  local h         = transactionFrame:GetHeight()
  local minHeight = window:GetHeight()
  local newHeight = y2 - y1 + h + WINDOW.MARGIN
  local height    = math.max(minHeight, newHeight)

  window:SetHeight(height)

  return window
end
