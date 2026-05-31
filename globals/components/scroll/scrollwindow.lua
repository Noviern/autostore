---@param frame EmptyWidget
function AttachScrollWindowBehavior(frame)
  local contentFrame = frame.contentFrame ---@type EmptyWidget
  local scrollFrame = frame.scrollFrame ---@type EmptyWidget
  local vslider = scrollFrame.vslider ---@type Slider

  contentFrame:SetHandler("OnWheelUp", function () vslider:Up(SCROLL_STEP) end)
  contentFrame:SetHandler("OnWheelDown", function () vslider:Down(SCROLL_STEP) end)

  vslider:SetHandler("OnSliderChanged", function (self, value)
    contentFrame:ChangeChildAnchorByScrollValue("vert", value)
  end)
end

---@param id string
---@param parent OptionalParent
---@return EmptyWidget
---@nodiscard
function CreateScrollWindow(id, parent)
  local frame
  if parent and type(parent) ~= "string" then
    frame = parent:CreateChildWidget("emptywidget", id, 0, true)
  else
    frame = UIParent:CreateWidget("emptywidget", id, parent or "UIParent")
    parent = frame:GetParent()
  end

  frame:AddAnchor("TOPLEFT", parent, 0, 0)
  frame:AddAnchor("BOTTOMRIGHT", parent, 0, 0)

  local contentFrame = frame:CreateChildWidget("emptywidget", "contentFrame", 0, true)
  contentFrame:EnableScroll(true)
  contentFrame:AddAnchor("TOPLEFT", frame, 0, 0)

  local scrollFrame = CreateScroll("scrollFrame", frame)
  contentFrame:AddAnchor("BOTTOMRIGHT", scrollFrame, "BOTTOMLEFT", 0, 0)

  AttachScrollWindowBehavior(frame)

  return frame
end
