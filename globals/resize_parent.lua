---@param parent Widget
---@param bottomWidget Widget
---@param bottomMargin? number
function ResizeParentToFitBottomWidget(parent, bottomWidget, bottomMargin)
  bottomMargin    = bottomMargin or 0
  local _, y1     = parent:GetOffset()
  local _, y2     = bottomWidget:GetOffset()
  local h         = bottomWidget:GetHeight()
  local minHeight = parent:GetHeight()
  local newHeight = y2 - y1 + h + bottomMargin
  local height    = math.max(minHeight, newHeight)

  parent:SetHeight(height)
end
