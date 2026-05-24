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
