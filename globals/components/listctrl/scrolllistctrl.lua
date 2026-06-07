---@param frame EmptyWidget
function AttachScrollListCtrlBehavior(frame)
  local scrollFrame = frame.scrollFrame
  local vslider = scrollFrame.vslider

  local function ScrollUp()
    vslider:Up(vslider:GetValueStep())
  end

  local function ScrollDown()
    vslider:Down(vslider:GetValueStep())
  end

  frame:SetHandler("OnWheelUp", ScrollUp)
  frame:SetHandler("OnWheelDown", ScrollDown)

  scrollFrame.upBtn:SetHandler("OnClick", ScrollUp)
  scrollFrame.downBtn:SetHandler("OnClick", ScrollDown)

  vslider:SetHandler("OnSliderChanged", function (self, value)
    local listCtrl = frame.listCtrl ---@type ListCtrl
    local selected = listCtrl:GetSelectedIdx() - 1 - 1

    listCtrl:Select(selected, false)

    if type(frame.OnSliderChanged) == "function" then
      frame:OnSliderChanged(value)
    end
  end)
end

---@param id string
---@param parent OptionalParent
---@return EmptyWidget
---@return ListCtrl
---@nodiscard
function CreateScrollListCtrl(id, parent)
  local frame
  if parent and type(parent) ~= "string" then
    frame = parent:CreateChildWidget("emptywidget", id, 0, true)
  else
    frame = UIParent:CreateWidget("emptywidget", id, parent or "UIParent")
  end

  local listCtrl    = CreateListCtrl("listCtrl", frame)
  local scrollFrame = CreateScroll("scrollFrame", frame)
  listCtrl:AddAnchor("TOPLEFT", frame, 0, 0)
  listCtrl:AddAnchor("BOTTOMRIGHT", scrollFrame, "BOTTOMLEFT", 0, 0)

  scrollFrame.vslider:SetMinMaxValues(0, 10) ---@TODO Remove this.

  AttachScrollListCtrlBehavior(frame)

  return frame, listCtrl
end
