---@param parent Widget
---@param bottomWidget Widget
---@param bottomMargin? number
function ResizeParentToFitBottomWidget(parent, bottomWidget, bottomMargin)
  bottomMargin                 = bottomMargin or 0
  local _, parentOffsetY       = parent:GetOffset()
  local _, bottomWidgetOffsetY = bottomWidget:GetOffset()
  local bottomWidgetHeight     = bottomWidget:GetHeight()
  local minHeight              = parent:GetHeight()
  local newHeight              = bottomWidgetOffsetY + bottomWidgetHeight - parentOffsetY + bottomMargin
  local height                 = math.max(minHeight, newHeight)

  parent:SetHeight(height)
end

---@param parent Widget
---@param rightWidget Widget
---@param rightMargin? number
function ResizeParentToFixRightWidget(parent, rightWidget, rightMargin)
  rightMargin              = rightMargin or 0
  local parentOffsetX      = parent:GetOffset()
  local rightWidgetOffsetX = rightWidget:GetOffset()
  local rightWidgetWidth   = rightWidget:GetWidth()
  local minWidth           = parent:GetWidth()
  local newWidth           = rightWidgetOffsetX + rightWidgetWidth - parentOffsetX + rightMargin
  local width              = math.max(minWidth, newWidth)

  parent:SetWidth(width)
end
