TEXT_COLOR = {
  DEFAULT = UIParent:GetFontColor("default"),
  BLUE    = UIParent:GetFontColor("blue"),
  GRAY    = UIParent:GetFontColor("gray"),
}

EDITBOX_INSET = { 5, 5, 5, 5 }
EDITBOX_GUIDE_INSET = { 7, 5, 5, 5 }
EDITBOX_MULTILINE_GUIDE_INSET = { 10, 10, 15, 0 }
EDITBOX_WITH_BUTTON_INSET = { 5, 5, 20, 5 }
EDITBOX_WIDTH = 312
EDITBOX_HEIGHT = 26

---@param editbox Editboxbase|Button
function AttachEditboxBehavior(editbox)
  local textureKeys = {
    enabled  = "editbox_df",
    disabled = "editbox_dis",
  }
  editbox.background = CreateBackground(editbox, TEXTURE_PATH.DEFAULT, textureKeys.enabled)

  function editbox:SetViewOfBackground(enabled)
    local textureKey = enabled and textureKeys.enabled or textureKeys.disabled
    editbox.background:SetTextureInfo(textureKey)

    local color = enabled and TEXT_COLOR.DEFAULT or TEXT_COLOR.GRAY
    self.style:SetColor(unpack(color))
  end

  editbox:SetViewOfBackground(true)

  editbox:SetHandler("OnEnableChanged", editbox.SetViewOfBackground)
end

---@param editbox Editboxbase
local function CommonEditInit(editbox)
  editbox.style:SetSnap(true)
  editbox.style:SetShadow(false)
  editbox.guideTextStyle:SetColorByKey("guide_text_in_editbox")
  editbox:SetExtent(EDITBOX_WIDTH, EDITBOX_HEIGHT)
  editbox:SetCursorColorByColorKey("editbox_cursor_default")
  AttachEditboxBehavior(editbox)
end

---@param editbox X2Editbox
function InitEditbox(editbox)
  CommonEditInit(editbox)
  editbox.style:SetAlign(ALIGN_LEFT)
  editbox.style:SetColorByKey("title")
  editbox.guideTextStyle:SetAlign(ALIGN_LEFT)
  editbox:SetInset(unpack(EDITBOX_INSET))
  editbox:SetGuideTextInset(EDITBOX_GUIDE_INSET)
  editbox:UseSelectAllWhenFocused(true)
end

---@param id string
---@param parent OptionalParent
---@return EditboxMultiline
---@nodiscard
function CreateMultilineEditbox(id, parent)
  local multilineEditbox
  if parent and type(parent) ~= "string" then
    multilineEditbox = parent:CreateChildWidget("editboxmultiline", id, 0, true)
  else
    multilineEditbox = UIParent:CreateWidget("editboxmultiline", id, parent or "UIParent")
  end

  CommonEditInit(multilineEditbox)
  multilineEditbox.style:SetAlign(ALIGN_TOP_LEFT)
  multilineEditbox.guideTextStyle:SetAlign(ALIGN_TOP_LEFT)
  multilineEditbox:SetInset(unpack(EDITBOX_MULTILINE_GUIDE_INSET))
  multilineEditbox:SetGuideTextInset(EDITBOX_MULTILINE_GUIDE_INSET)

  return multilineEditbox
end

---@param id string
---@param parent OptionalParent
---@return X2Editbox
---@nodiscard
function CreateEditbox(id, parent)
  local editbox
  if parent and type(parent) ~= "string" then
    editbox = parent:CreateChildWidget("x2editbox", id, 0, true)
  else
    editbox = UIParent:CreateWidget("x2editbox", id, parent or "UIParent")
  end

  InitEditbox(editbox)

  return editbox
end

---@param editbox X2Editbox
function AttachCancelableEditboxBehavior(editbox)
  local cancelButton = editbox:CreateChildWidget("button", "cancelButton", 0, true)
  cancelButton:Show(false)
  cancelButton:SetStyle("cancel_search_in_inventory")
  cancelButton:AddAnchor("RIGHT", editbox, "RIGHT", -6, 0)
  editbox.cancelButton = cancelButton

  cancelButton:SetHandler("OnClick", function ()
    editbox:SetText("")
    cancelButton:Show(false)
    editbox:ClearFocus()
  end)

  editbox:SetHandler("OnTextChanged", function (self)
    cancelButton:Show(editbox:GetText() ~= "")
  end)
end

---@param id string
---@param parent OptionalParent
---@return X2Editbox
---@nodiscard
function CreateCancelableEditbox(id, parent)
  local editbox = CreateEditbox(id, parent)
  editbox:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))
  AttachCancelableEditboxBehavior(editbox)
  return editbox
end

---@param editbox X2Editbox
function AttachSearchEditboxBehavior(editbox)
  local searchIcon = editbox:CreateDrawable(TEXTURE_PATH.INVENTORY_DEFAULT, "search_icon", "overlay")
  searchIcon:AddAnchor("RIGHT", editbox, -6, 0)

  local cancelButton = editbox.cancelButton ---@type Button
  editbox:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))

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
end

---@param id string
---@param parent OptionalParent
---@return X2Editbox
---@nodiscard
function CreateSearchEditbox(id, parent)
  local editbox = CreateCancelableEditbox(id, parent)
  AttachSearchEditboxBehavior(editbox)
  return editbox
end

---@class SpinnerData
---@field min number|nil
---@field max number|nil
---@field useMinButton boolean|nil
---@field useMaxButton boolean|nil
---@field onTextChanged OnTextChanged|nil

---@param id string
---@param parent OptionalParent
---@param initData? SpinnerData
---@return EmptyWidget
---@nodiscard
function CreateSpinner(id, parent, initData)
  local frame = parent:CreateChildWidget("emptywidget", id, 0, true)
  local editbox = CreateEditbox("editbox", frame)
  editbox.style:SetAlign(ALIGN_CENTER)
  editbox:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))
  editbox:SetDigit(true)
  editbox:SetDigitEmpty(true)
  editbox:AddAnchor("LEFT", frame, 0, 0)
  editbox:SetText(tostring(initData and initData.min or 0), false)

  local upButton = frame:CreateChildWidget("button", "upButton", 0, false)
  upButton:SetStyle("grid_folder_up_arrow")
  upButton:AddAnchor("RIGHT", editbox, -2, -(upButton:GetHeight() / 2))

  local downButton = frame:CreateChildWidget("button", "downButton", 0, false)
  downButton:SetStyle("grid_folder_down_arrow")
  downButton:AddAnchor("TOP", upButton, "BOTTOM", 0, 1)

  editbox:SetExtent(75, upButton:GetHeight() + downButton:GetHeight() + 8)

  local minButton
  if initData and initData.useMinButton then
    minButton = frame:CreateChildWidget("button", "minButton", 0, false)
    minButton:SetStyle("text_default_small")
    minButton:AddAnchor("LEFT", editbox, "RIGHT", COMMON.SPACING / 2, 0)
    minButton:SetText(X2Locale:LocalizeUiText(COMMON_TEXT, "minimum"))

    minButton:SetHandler("OnClick", function ()
      local min = initData and initData.min or 0
      editbox:SetText(tostring(min))
    end)
  end

  local maxButton
  if initData and initData.useMaxButton then
    maxButton = frame:CreateChildWidget("button", "maxButton", 0, false)
    maxButton:SetStyle("text_default_small")
    maxButton:AddAnchor("LEFT", minButton or editbox, "RIGHT", COMMON.SPACING / 2, 0)
    maxButton:SetText(X2Locale:LocalizeUiText(COMMON_TEXT, "maximum"))

    maxButton:SetHandler("OnClick", function ()
      local max = initData and initData.max or 0
      editbox:SetText(tostring(max))
    end)
  end

  ResizeParentToFixRightWidget(frame, maxButton or minButton or editbox)
  frame:SetHeight(editbox:GetHeight())

  editbox:SetHandler("OnTextChanged", function (self)
    local value = tonumber(editbox:GetText())
    local min   = initData and initData.min or 0
    local max   = initData and initData.max or 0

    if not value or value < min then
      editbox:SetText(tostring(min), false)
    elseif value > max then
      editbox:SetText(tostring(max), false)
    end

    if initData and type(initData.onTextChanged) == "function" then
      initData.onTextChanged(self)
    end
  end)

  upButton:SetHandler("OnClick", function ()
    local newValue = tonumber(editbox:GetText()) or 0
    newValue = newValue + 1
    editbox:SetText(tostring(newValue))
    editbox:ClearFocus()
  end)

  downButton:SetHandler("OnClick", function ()
    local newValue = tonumber(editbox:GetText()) or 0
    newValue = newValue - 1
    editbox:SetText(tostring(newValue))
    editbox:ClearFocus()
  end)

  return frame
end
