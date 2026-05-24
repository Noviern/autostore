---@param radioGroup RadioGroup
---@param value number
---@return RadioItem
---@nodiscard
function CreateRadioItem(radioGroup, value)
  local radioItem = radioGroup:CreateRadioItem(value)
  radioItem:SetExtent(20, 20)

  local path        = TEXTURE_PATH.DEFAULT
  local key         = "radio_button"
  local checkButton = radioItem.check
  SetViewOfCheckButtonBackground(checkButton, path, key)
  local textureData = UIParent:GetTextureData(path, string.format("%s_df", key))

  checkButton:SetExtent(textureData.extent[1], textureData.extent[2])
  checkButton:AddAnchor("CENTER", checkButton:GetParent(), -1, 0)

  return radioItem
end

---@param radioGroup RadioGroup
---@param value number
---@param text string
---@return RadioItem
---@nodiscard
function CreateRadioItemWithTextbox(radioGroup, value, text)
  local radioItem = CreateRadioItem(radioGroup, value)
  local textbox   = CreateButtonTextbox(radioItem.check, text)

  textbox:SetHandler("OnClick", function ()
    radioGroup:Check(value)
  end)

  return radioItem
end
