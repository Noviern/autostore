---@param widget Widget
---@param texturePath string
---@param textureKey string
---@return DrawableDDS
---@nodiscard
function CreateBackground(widget, texturePath, textureKey)
  local background = widget:CreateDrawable(texturePath, textureKey, "background")
  background:AddAnchor("TOPLEFT", widget, 0, 0)
  background:AddAnchor("BOTTOMRIGHT", widget, 0, 0)

  return background
end
