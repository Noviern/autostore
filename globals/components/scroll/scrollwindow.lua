---@param frame EmptyWidget
function AttachScrollWindowBehavior(frame)
  local contentFrame = frame.contentFrame ---@type EmptyWidget
  local scrollFrame = frame.scrollFrame ---@type EmptyWidget
  local vslider = scrollFrame.vslider ---@type Slider

  local function ScrollUp()
    vslider:Up(vslider:GetValueStep())
  end

  local function ScrollDown()
    vslider:Down(vslider:GetValueStep())
  end

  contentFrame:SetHandler("OnWheelUp", ScrollUp)
  contentFrame:SetHandler("OnWheelDown", ScrollDown)

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

  local contentFrame = frame:CreateChildWidget("emptywidget", "contentFrame", 0, true)
  contentFrame:EnableScroll(true)
  contentFrame:AddAnchor("TOPLEFT", frame, 0, 0)

  local scrollFrame = CreateScroll("scrollFrame", frame)
  contentFrame:AddAnchor("BOTTOMRIGHT", scrollFrame, "BOTTOMLEFT", 0, 0)

  AttachScrollWindowBehavior(frame)

  return frame
end
