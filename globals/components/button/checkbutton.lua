---@param checkButton CheckButton
---@param texturePath string
function SetViewOfCheckButtonBackground(checkButton, texturePath, textureKey)
  SetViewOfButtonBackground(checkButton, texturePath, textureKey)

  checkButton.checkedBackground = CreateTextureBackground(checkButton, texturePath, textureKey .. "_chk_df")
  checkButton:SetCheckedBackground(checkButton.checkedBackground)

  checkButton.disabledCheckedBackground = CreateTextureBackground(checkButton, texturePath, textureKey .. "_chk_dis")
  checkButton:SetDisabledCheckedBackground(checkButton.disabledCheckedBackground)
end

---@param id string
---@param parent OptionalParent
---@return CheckButton
---@nodiscard
function CreateCheckButton(id, parent)
  local checkButton
  if parent then
    checkButton = parent:CreateChildWidget("checkbutton", id, 0, true)
  else
    checkButton = UIParent:CreateWidget("checkbutton", id, "UIParent")
  end

  checkButton:SetExtent(20, 20)

  SetViewOfCheckButtonBackground(checkButton, TEXTURE_PATH.CHECK_BTN, "btn")

  return checkButton
end

---@param id string
---@param parent OptionalParent
---@param text string
---@return CheckButton
---@nodiscard
function CreateCheckButtonWithTextbox(id, parent, text)
  local checkButton = CreateCheckButton(id, parent)
  local textbox     = CreateButtonTextbox(checkButton, text)

  textbox:SetHandler("OnClick", function ()
    checkButton:SetChecked(not checkButton:GetChecked(), true)
  end)

  return checkButton
end
