---@param button Button
---@param texturePath string
---@param textureKey string
function SetViewOfButtonBackground(button, texturePath, textureKey)
  button.normalBackground = CreateBackground(button, texturePath, textureKey .. "_df")
  button:SetNormalBackground(button.normalBackground)

  button.highlightBackground= CreateBackground(button, texturePath, textureKey .. "_ov")
  button:SetHighlightBackground(button.highlightBackground)

  button.pushedBackground = CreateBackground(button, texturePath, textureKey .. "_ov")
  button:SetPushedBackground(button.pushedBackground)

  button.disabledBackground = CreateBackground(button, texturePath, textureKey .. "_dis")
  button:SetDisabledBackground(button.disabledBackground)
end
