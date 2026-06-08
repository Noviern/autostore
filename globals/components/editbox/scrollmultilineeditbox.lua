---@param inputStateTextbox Textbox
---@param editbox Editboxbase
function SetInputStateText(inputStateTextbox, editbox)
  inputStateTextbox:SetAutoResize(true)

  local textLength
  if type(editbox.GetTextLength) == "function" then
    textLength = editbox:GetTextLength()
  else
    textLength = #editbox:GetText()
  end

  local maxTextLength = editbox:MaxTextLength()

  if textLength >= maxTextLength then
    inputStateTextbox:SetText("|cFFFF0000" .. textLength .. "/" .. maxTextLength)
  else
    inputStateTextbox:SetText(textLength .. "/" .. maxTextLength)
  end
end

---@param frame Widget
---@param editbox Editboxbase
function AttachInputStateTextbox(frame, editbox)
  local inputStateTextbox = frame:CreateChildWidget("textbox", "inputStateTextbox", 0, true)
  inputStateTextbox.style:SetAlign(ALIGN_LEFT)
  inputStateTextbox.style:SetColorByKey("default")
  inputStateTextbox:SetAutoResize(true)
  inputStateTextbox:SetAutoWordwrap(false)
  inputStateTextbox:SetHeight(20)
  inputStateTextbox:AddAnchor("TOPRIGHT", frame, "BOTTOMRIGHT", 0, COMMON.SPACING)

  SetInputStateText(inputStateTextbox, editbox)
end

---@param frame EmptyWidget
local function AttachScrollMultilineEditboxBehavior(frame)
  local contentFrame      = frame.contentFrame ---@type EmptyWidget
  local inputStateTextbox = frame.inputStateTextbox ---@type Textbox
  local multilineEditbox  = contentFrame.multilineEditbox ---@type EditboxMultiline

  local lineHeight        = multilineEditbox:GetLineHeight() + 1
  local extraLineHeight   = lineHeight + 1

  local vslider           = frame.scrollFrame.vslider ---@type Slider
  vslider:SetValueStep(lineHeight)
  vslider:SetPageStep(lineHeight)


  ---@FIXME: i can create 5 lines, create a 6th and the scroll updates, remove the 6th and scroll doesnt update until i delete 5
  multilineEditbox:SetHandler("OnTextChanged", function (self)
    ---@TODO 1 is line space and not sure what other 1 is for
    local trueTextHeight = multilineEditbox:GetTextHeight() + 1 + 1
    local viewportHeight = contentFrame:GetHeight()

    -- ADDON:ChatLog("trueTextHeight " .. trueTextHeight)
    -- ADDON:ChatLog("viewportHeight " .. viewportHeight)

    if trueTextHeight <= viewportHeight then
      vslider:SetMinMaxValues(0, 0)
    end

    SetInputStateText(inputStateTextbox, multilineEditbox)
  end)

  multilineEditbox:SetHandler("OnCursorMoved", function ()
    local _, max         = vslider:GetMinMaxValues()
    local cursor         = multilineEditbox:GetCursorPosY() / UIParent:GetUIScale()
    local viewportHeight = contentFrame:GetHeight()

    if cursor >= viewportHeight + vslider:GetValue() - lineHeight then
      local newValue = cursor - viewportHeight + extraLineHeight
      if newValue > max then
        vslider:SetMinMaxValues(0, newValue)
      end

      vslider:SetValue(newValue, true)
    elseif cursor + 1 < vslider:GetValue() then
      vslider:SetValue(cursor, true)
    end
  end)
end

---@param multilineEditbox EditboxMultiline
local function OverrideMultilineEditboxMethods(multilineEditbox)
  ---Overrides the default so that the maximum height of the multilineEditbox is
  ---updated as well as updates the inputStateTextbox is also updated to reflect
  ---the new maximum length.
  local MultilineEditboxSetMaxTextLength = multilineEditbox.SetMaxTextLength

  function multilineEditbox:SetMaxTextLength(...)
    MultilineEditboxSetMaxTextLength(self, ...)

    local contentFrame = self:GetParent() ---@cast contentFrame EmptyWidget
    local frame = contentFrame:GetParent() ---@cast frame EmptyWidget
    local inputStateTextbox = frame.inputStateTextbox ---@type Textbox
    local lineHeight = self:GetLineHeight() + 1

    self:SetHeight(lineHeight * ((self:MaxTextLength() - 1) / 2 + 1))
    SetInputStateText(inputStateTextbox, self)
  end

  multilineEditbox:SetMaxTextLength(128)
end

---@param id string
---@param parent OptionalParent
---@return EmptyWidget
---@return EditboxMultiline
---@nodiscard
function CreateScrollMultilineEditbox(id, parent)
  local frame = CreateScrollWindow(id, parent)
  frame.background = CreateTextureBackground(frame, TEXTURE_PATH.DEFAULT, "editbox_df")

  local contentFrame = frame.contentFrame ---@type EmptyWidget
  contentFrame:AddAnchor("TOPLEFT", frame, COMMON.SPACING, COMMON.SPACING)
  contentFrame:AddAnchor("BOTTOMRIGHT", frame.scrollFrame, "BOTTOMLEFT", -COMMON.SPACING, 0)

  local scrollFrame = frame.scrollFrame ---@type EmptyWidget
  scrollFrame:AddAnchor("TOPRIGHT", frame, -COMMON.SPACING, COMMON.SPACING)
  scrollFrame:AddAnchor("BOTTOMRIGHT", frame, -COMMON.SPACING, -COMMON.SPACING)

  local multilineEditbox = CreateMultilineEditbox("multilineEditbox", frame.contentFrame)
  multilineEditbox.background:SetVisible(false)
  multilineEditbox:SetInset(0, 0, COMMON.SPACING, 0)
  multilineEditbox:AddAnchor("TOPLEFT", contentFrame, 0, 0)
  multilineEditbox:AddAnchor("TOPRIGHT", contentFrame, 0, 0)

  AttachInputStateTextbox(frame, multilineEditbox)
  AttachScrollMultilineEditboxBehavior(frame)

  OverrideMultilineEditboxMethods(multilineEditbox)

  return frame, multilineEditbox
end
