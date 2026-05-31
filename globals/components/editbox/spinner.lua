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
