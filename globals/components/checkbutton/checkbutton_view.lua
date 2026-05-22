---@param checkbutton CheckButton
---@param texturePath string
function SetViewOfCheckButtonBackground(checkbutton, texturePath, textureKey)
  checkbutton.normalBackground = CreateBackground(checkbutton, texturePath, textureKey .. "_df")
  checkbutton:SetNormalBackground(checkbutton.normalBackground)

  checkbutton.highlightBackground = CreateBackground(checkbutton, texturePath, textureKey .. "_ov")
  checkbutton:SetHighlightBackground(checkbutton.highlightBackground)

  checkbutton.pushedBackground = CreateBackground(checkbutton, texturePath, textureKey .. "_ov")
  checkbutton:SetPushedBackground(checkbutton.pushedBackground)

  checkbutton.disabledBackground = CreateBackground(checkbutton, texturePath, textureKey .. "_dis")
  checkbutton:SetDisabledBackground(checkbutton.disabledBackground)

  checkbutton.checkedBackground = CreateBackground(checkbutton, texturePath, textureKey .. "_chk_df")
  checkbutton:SetCheckedBackground(checkbutton.checkedBackground)

  checkbutton.disabledCheckedBackground = CreateBackground(checkbutton, texturePath, textureKey .. "_chk_dis")
  checkbutton:SetDisabledCheckedBackground(checkbutton.disabledCheckedBackground)
end
