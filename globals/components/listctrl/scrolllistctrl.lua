---@param frame EmptyWidget
function AttachScrollListCtrlBehavior(frame)
  local scrollFrame = frame.scrollFrame
  local vslider = scrollFrame.vslider

  frame:SetHandler("OnWheelUp", function () vslider:Up(1) end)
  frame:SetHandler("OnWheelDown", function () vslider:Down(1) end)

  scrollFrame.upBtn:SetHandler("OnClick", function () vslider:Up(1) end)
  scrollFrame.downBtn:SetHandler("OnClick", function () vslider:Down(1) end)

  vslider:SetHandler("OnSliderChanged", function (self, value)
    ADDON:ChatLog("value " .. tostring(value))
    local listCtrl = frame.listCtrl ---@type ListCtrl
    local selected = listCtrl:GetSelectedIdx() - 1 - 1
    ADDON:ChatLog("selected " .. tostring(selected))

    listCtrl:Select(selected, false)

    if type(frame.OnSliderChanged) == "function" then
      frame:OnSliderChanged(value)
    end
  end)
end

---@TODO:
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

  scrollFrame.vslider:SetMinMaxValues(0, 10) ---@TODO:

  AttachScrollListCtrlBehavior(frame)

  return frame, listCtrl
end
