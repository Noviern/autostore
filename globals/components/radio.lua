---@param radioGroup RadioGroup
---@param value number
---@param text string
---@return RadioItem
---@nodiscard
function CreateRadioItem(radioGroup, value, text)
  local radioItem = radioGroup:CreateRadioItem(value)
  radioItem:SetExtent(20, 20)

  local path        = TEXTURE_PATH.DEFAULT
  local key         = "radio_button"
  local checkButton = radioItem.check
  SetViewOfCheckButtonBackground(checkButton, path, key)
  local textureData = UIParent:GetTextureData(path, string.format("%s_df", key))

  checkButton:SetExtent(textureData.extent[1], textureData.extent[2])
  checkButton:AddAnchor("CENTER", checkButton:GetParent(), -1, 0)

  local textbox = radioItem:CreateChildWidget("textbox", "textbox", 0, true) ---@type Textbox
  textbox.style:SetAlign(ALIGN_LEFT)
  textbox.style:SetEllipsis(true)
  textbox.style:SetColorByKey("default")
  textbox:SetAutoResize(true)
  textbox:SetAutoWordwrap(false)
  textbox:SetHeight(20)
  textbox:AddAnchor("LEFT", radioItem, "RIGHT", 10, 0)
  textbox:SetText(text)

  textbox:SetHandler("OnClick", function ()
    radioGroup:Check(value)
  end)

  return radioItem
end
