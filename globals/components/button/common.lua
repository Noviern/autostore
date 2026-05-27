---@param button Button
---@param texturePath string
---@param textureKey string
function SetViewOfButtonBackground(button, texturePath, textureKey)
  button.normalBackground = CreateBackground(button, texturePath, textureKey .. "_df")
  button:SetNormalBackground(button.normalBackground)

  button.highlightBackground = CreateBackground(button, texturePath, textureKey .. "_ov")
  button:SetHighlightBackground(button.highlightBackground)

  button.pushedBackground = CreateBackground(button, texturePath, textureKey .. "_on")
  button:SetPushedBackground(button.pushedBackground)

  button.disabledBackground = CreateBackground(button, texturePath, textureKey .. "_dis")
  button:SetDisabledBackground(button.disabledBackground)
end

---@param button Button
---@param text string
---@return Textbox
---@nodiscard
function CreateButtonTextbox(button, text)
  local textbox = button:CreateChildWidget("textbox", "textbox", 0, true)
  textbox.style:SetAlign(ALIGN_LEFT)
  textbox.style:SetColorByKey("default")
  textbox.style:SetEllipsis(true)
  textbox:SetAutoResize(true)
  textbox:SetAutoWordwrap(false)
  textbox:SetHeight(20)
  textbox:AddAnchor("LEFT", button, "RIGHT", COMMON.SPACING, 0)
  textbox:SetText(text)

  return textbox
end
