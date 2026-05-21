local WINDOW = {
  WIDTH   = 350,
  MARGIN  = 20,
  SPACING = 10,
}

---@param radioGroup RadioGroup
---@param value number
---@param text string
---@return RadioItem
---@nodiscard
local function SetViewOfRadioItem(radioGroup, value, text)
  local radioItem = radioGroup:CreateRadioItem(value)
  radioItem:SetExtent(20, 20)

  local checkButton = radioItem.check
  local path        = TEXTURE_PATH.DEFAULT
  local key         = "radio_button"
  local textureData = UIParent:GetTextureData(path, string.format("%s_df", key))

  local background  = checkButton:CreateImageDrawable(path, "background")
  background:SetTextureInfo(key .. "_df")
  background:AddAnchor("TOPLEFT", checkButton, 0, 0)
  background:AddAnchor("BOTTOMRIGHT", checkButton, 0, 0)

  local checkedBackground = checkButton:CreateImageDrawable(path, "background")
  checkedBackground:SetTextureInfo(key .. "_chk_df")
  checkedBackground:AddAnchor("TOPLEFT", checkButton, 0, 0)
  checkedBackground:AddAnchor("BOTTOMRIGHT", checkButton, 0, 0)
  checkButton:SetCheckedBackground(checkedBackground)

  local disabledCheckedBackground = checkButton:CreateImageDrawable(path, "background")
  disabledCheckedBackground:SetTextureInfo(key .. "_chk_dis")
  disabledCheckedBackground:SetColor(0.8, 0.8, 0.8, 1)
  disabledCheckedBackground:AddAnchor("TOPLEFT", checkButton, 0, 0)
  disabledCheckedBackground:AddAnchor("BOTTOMRIGHT", checkButton, 0, 0)
  checkButton:SetDisabledCheckedBackground(disabledCheckedBackground)

  checkButton:SetExtent(textureData.extent[1], textureData.extent[2])
  checkButton:AddAnchor("CENTER", checkButton:GetParent(), -1, 0)

  local textbox = radioItem:CreateChildWidget("textbox", "textbox", 0, true) ---@type Textbox
  textbox.style:SetAlign(ALIGN_LEFT)
  textbox.style:SetEllipsis(true)
  textbox.style:SetColorByKey("default")
  textbox:SetAutoResize(true)
  textbox:SetAutoWordwrap(false)
  textbox:SetHeight(20)
  textbox:AddAnchor("LEFT", radioItem, "RIGHT", WINDOW.SPACING, 0)
  textbox:SetText(text)

  textbox:SetHandler("OnClick", function ()
    radioGroup:Check(value)
  end)

  return radioItem
end

---@param id string
---@param parent Widget
---@param title string
---@param tooltip string
---@return EmptyWidget
---@nodiscard
function CreateModule(id, parent, title, tooltip)
  local frame = parent:CreateChildWidget("emptywidget", id, 0, true)
  local frameBg = frame:CreateDrawable(TEXTURE_PATH.DEFAULT, "type02_new", "background")
  frameBg:SetTextureColor("default")
  frameBg:AddAnchor("TOPLEFT", frame, 0, 0)
  frameBg:AddAnchor("BOTTOMRIGHT", frame, 0, 0)

  local titleTextbox = frame:CreateChildWidget("textbox", "titleTextbox", 0, true)
  titleTextbox:AddAnchor("TOPLEFT", frame, 0, 0)
  titleTextbox:AddAnchor("TOPRIGHT", frame, 0, 0)
  titleTextbox.style:SetColorByKey("title")
  titleTextbox.style:SetFontSize(FONT_SIZE.LARGE)
  titleTextbox.style:SetAlign(ALIGN_LEFT)
  titleTextbox:SetInset(20, 0, 20, 0)
  titleTextbox:SetHeight(45)
  titleTextbox:SetText(title)

  local guide = titleTextbox:CreateChildWidget("emptywidget", "guide", 0, true)
  local guideBackground = guide:CreateDrawable(TEXTURE_PATH.HUD, "questionmark", "background")
  guideBackground:AddAnchor("CENTER", guide, 0, 0)
  guide:SetExtent(guideBackground:GetExtent())
  guide:AddAnchor("RIGHT", titleTextbox, -WINDOW.MARGIN, 0)

  local tooltipTextbox = frame:CreateChildWidget("textbox", "tooltipTextbox", 0, true)
  tooltipTextbox:AddAnchor("TOPLEFT", titleTextbox, "BOTTOMLEFT", WINDOW.MARGIN, 0)
  tooltipTextbox:SetWidth(frame:GetParent():GetWidth() - 40)
  tooltipTextbox.style:SetAlign(ALIGN_TOP_LEFT)
  tooltipTextbox:SetAutoResize(true)
  tooltipTextbox:SetText(tooltip)
  tooltipTextbox:Show(false)

  local tooltipBackground = tooltipTextbox:CreateDrawable(TEXTURE_PATH.HUD, "tooltip_bg", "background")
  tooltipBackground:AddAnchor("TOPLEFT", tooltipTextbox, -12, -WINDOW.SPACING)
  tooltipBackground:AddAnchor("BOTTOMRIGHT", tooltipTextbox, WINDOW.SPACING, WINDOW.SPACING)

  local titleBg = frame:CreateDrawable(TEXTURE_PATH.DEFAULT, "type02_new_half", "background")
  titleBg:SetTextureColor("default")
  titleBg:AddAnchor("TOPLEFT", titleTextbox, 0, 0)
  titleBg:AddAnchor("BOTTOMRIGHT", titleTextbox, 0, 0)

  local contentFrame = frame:CreateChildWidget("emptywidget", "contentFrame", 0, true)
  contentFrame:AddAnchor("TOPLEFT", titleTextbox, "BOTTOMLEFT", WINDOW.MARGIN, WINDOW.SPACING)
  contentFrame:AddAnchor("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -WINDOW.MARGIN, -WINDOW.MARGIN)

  return frame
end

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

  local titleTextbox = frame.titleTextbox ---@type Textbox

  local storageOptionContentFrame = frame.contentFrame ---@type EmptyWidget
  local radioGroupFrame = storageOptionContentFrame:CreateChildWidget("radiogroup", "radioGroupFrame", 0, true)
  radioGroupFrame:AddAnchor("TOPLEFT", storageOptionContentFrame, 0, 0)
  radioGroupFrame:AddAnchor("TOPRIGHT", storageOptionContentFrame, 0, 0)

  local height = 0

  local storageChestOptionFrame = SetViewOfRadioItem(radioGroupFrame, STORAGE_TYPE.COFFER, storageLocale.coffer)
  storageChestOptionFrame:AddAnchor("TOPLEFT", radioGroupFrame, 0, 0)
  height = height + storageChestOptionFrame:GetHeight()

  local warehouseOptionFrame = SetViewOfRadioItem(radioGroupFrame, STORAGE_TYPE.BANK, storageLocale.bank)
  warehouseOptionFrame:AddAnchor("TOPLEFT", storageChestOptionFrame, "BOTTOMLEFT", 0, WINDOW.SPACING)
  height = height + warehouseOptionFrame:GetHeight() + WINDOW.SPACING

  radioGroupFrame:Check(1)

  radioGroupFrame:SetHeight(height)
  frame:SetHeight(titleTextbox:GetHeight() + WINDOW.SPACING + height + WINDOW.MARGIN)

  return frame
end

---@param editbox X2Editbox
local function AttachCancelableEditboxBehavior(editbox)
  local cancelButton = editbox:CreateChildWidget("button", "cancelButton", 0, true)
  cancelButton:Show(false)
  cancelButton:SetStyle("cancel_search_in_inventory")
  cancelButton:AddAnchor("RIGHT", editbox, "RIGHT", -6, 0)
  editbox.cancelButton = cancelButton

  cancelButton:SetHandler("OnClick", function ()
    editbox:SetText("")
    cancelButton:Show(false)
  end)

  editbox:SetHandler("OnKeyUp", function ()
    cancelButton:Show(editbox:GetText() ~= "")
  end)
end

---@param frame EmptyWidget
---@param id string
---@param text string
---@return X2Editbox
---@nodiscard
local function CreateSlotEditbox(frame, id, text)
  local editbox = CreateEditbox(id, frame)
  editbox:SetDigit(true)
  editbox:SetDigitEmpty(true)
  editbox:SetDigitMax(150)
  editbox:SetMaxTextLength(3)
  editbox:SetWidth(100)
  editbox:SetGuideText(text)

  AttachCancelableEditboxBehavior(editbox)

  return editbox
end

---@param frame EmptyWidget
---@param id string
---@param text string
---@return CheckButton
---@nodiscard
local function SetViewOfCheckbutton(frame, id, text)
  local checkbutton = frame:CreateChildWidget("checkbutton", id, 0, true)
  checkbutton:SetExtent(20, 20)

  local normalBackground = checkbutton:CreateDrawable(TEXTURE_PATH.CHECK_BTN, "btn_df", "background")
  normalBackground:AddAnchor("TOPLEFT", checkbutton, 0, 0)
  normalBackground:AddAnchor("BOTTOMRIGHT", checkbutton, 0, 0)
  checkbutton:SetNormalBackground(normalBackground)

  local highlightBackground = checkbutton:CreateDrawable(TEXTURE_PATH.CHECK_BTN, "btn_ov", "background")
  highlightBackground:AddAnchor("TOPLEFT", checkbutton, 0, 0)
  highlightBackground:AddAnchor("BOTTOMRIGHT", checkbutton, 0, 0)
  checkbutton:SetHighlightBackground(highlightBackground)

  local pushedBackground = checkbutton:CreateDrawable(TEXTURE_PATH.CHECK_BTN, "btn_ov", "background")
  pushedBackground:AddAnchor("TOPLEFT", checkbutton, 0, 0)
  pushedBackground:AddAnchor("BOTTOMRIGHT", checkbutton, 0, 0)
  checkbutton:SetPushedBackground(pushedBackground)

  local disabledBackground = checkbutton:CreateDrawable(TEXTURE_PATH.CHECK_BTN, "btn_dis", "background")
  disabledBackground:AddAnchor("TOPLEFT", checkbutton, 0, 0)
  disabledBackground:AddAnchor("BOTTOMRIGHT", checkbutton, 0, 0)
  checkbutton:SetDisabledBackground(disabledBackground)

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

  local checkbutton = SetViewOfCheckbutton(
    filterContentframe,
    "filterCheckbutton",
    filterLocale.transfer
  )
  checkbutton:AddAnchor("TOPLEFT", filterContentframe, 0, 0)
  height = height + checkbutton:GetHeight()

  local combobox = CreateCombobox("filterCombobox", filterContentframe)
  combobox:AddAnchor("TOPLEFT", checkbutton, "BOTTOMLEFT", 0, WINDOW.SPACING)
  combobox:AddAnchor("RIGHT", filterContentframe, 0, 0)
  combobox:SetDropdownVisibleLimit(15)
  height = height + combobox:GetHeight() + WINDOW.SPACING

  local searchEditbox = CreateEditbox("searchEditbox", filterContentframe)
  searchEditbox:AddAnchor("TOPLEFT", combobox, "BOTTOMLEFT", 0, WINDOW.SPACING)
  searchEditbox:AddAnchor("TOPRIGHT", combobox, "BOTTOMRIGHT", 0, WINDOW.SPACING)
  searchEditbox:SetGuideText(filterLocale.searchGuide)
  height = height + searchEditbox:GetHeight() + WINDOW.SPACING

  local searchIcon = searchEditbox:CreateDrawable(TEXTURE_PATH.INVENTORY_DEFAULT, "search_icon", "overlay")
  searchIcon:AddAnchor("RIGHT", searchEditbox, -6, 0)

  AttachCancelableEditboxBehavior(searchEditbox)

  local cancelButton = searchEditbox.cancelButton ---@type Button
  searchEditbox:SetInset(5, 5, cancelButton:GetWidth() + 6, 5)

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

  local filterStartEditbox = CreateSlotEditbox(filterContentframe, "startEditbox", filterLocale.startSlot)
  filterStartEditbox:AddAnchor("TOP", searchEditbox, "BOTTOM", -55, WINDOW.SPACING)

  local filterEndEditbox = CreateSlotEditbox(filterContentframe, "endEditbox", filterLocale.endSlot)
  filterEndEditbox:AddAnchor("TOP", searchEditbox, "BOTTOM", 55, WINDOW.SPACING)

  height = height + filterEndEditbox:GetHeight() + WINDOW.SPACING

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

---@param id string
---@return Window
---@nodiscard
function SetViewOfAutoStoreWindow(id)
  local window = CreateWindow(id)
  window:SetWidth(WINDOW.WIDTH)
  window:AddAnchor("CENTER", "UIParent", 0, 0) ---@TODO: not sure if center is the best place

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
  local filterCombobox = filterContentFrame.filterCombobox ---@type Combobox
  filterCombobox:SetWidth(filterContentFrame:GetWidth())

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
