---@param widget Widget
---@param texturePath string
---@param textureKey string
---@param colorKey string|nil
---@return DrawableDDS
---@nodiscard
function CreateTextureBackground(widget, texturePath, textureKey, colorKey)
  local background = widget:CreateDrawable(texturePath, textureKey, "background")
  background:AddAnchor("TOPLEFT", widget, 0, 0)
  background:AddAnchor("BOTTOMRIGHT", widget, 0, 0)

  if colorKey then
    background:SetTextureColor(colorKey)
  end

  return background
end

---@param widget Widget
---@param texturePath string
---@param colorKey string|nil
---@return IconDrawable
---@nodiscard
function CreateIconBackground(widget, texturePath, colorKey)
  local background = widget:CreateIconDrawable("background")
  background:AddTexture(texturePath)
  background:AddAnchor("TOPLEFT", widget, 0, 0)
  background:AddAnchor("BOTTOMRIGHT", widget, 0, 0)

  if colorKey then
    background:SetTextureColor(colorKey)
  end

  return background
end

---@param widget Widget
---@param r number Red value (min: `0`, max: `1`).
---@param g number Green value (min: `0`, max: `1`).
---@param b number Blue value (min: `0`, max: `1`).
---@param a number Alpha value (min: `0`, max: `1`).
---@return ColorDrawable
---@nodiscard
function CreateColorBackground(widget, r, g, b, a)
  local background = widget:CreateColorDrawable(r, g, b, a, "background")
  background:AddAnchor("TOPLEFT", widget, 0, 0)
  background:AddAnchor("BOTTOMRIGHT", widget, 0, 0)

  return background
end

---@param widget Widget
---@param colorKey DRAWABLE_COLOR_KEY
---@return ColorDrawable
---@nodiscard
function CreateColorKeyBackground(widget, colorKey)
  local background = widget:CreateColorDrawableByKey(colorKey, "background")
  background:AddAnchor("TOPLEFT", widget, 0, 0)
  background:AddAnchor("BOTTOMRIGHT", widget, 0, 0)

  return background
end
