SCROLL_STEP = 40

---@param parent Widget
function SetViewOfScroll(parent)
  local upButton = parent.upBtn ---@type Button
  upButton:AddAnchor("TOPRIGHT", parent, 0, 0)
  upButton:SetExtent(20, 12)
  upButton:SetStyle("slider_scroll_button_up")

  local downButton = parent.downBtn ---@type Button
  downButton:AddAnchor("BOTTOMRIGHT", parent, 0, 0)
  downButton:SetExtent(20, 12)
  downButton:SetStyle("slider_scroll_button_down")

  local vslider = parent.vslider ---@type Slider
  vslider:AddAnchor("TOPLEFT", upButton, "BOTTOMLEFT", 0, 0)
  vslider:AddAnchor("BOTTOMRIGHT", downButton, "TOPRIGHT", 0, 0)

  local vsliderBackground = vslider:CreateDrawable(TEXTURE_PATH.SCROLL, "scroll_frame_bg", "background")
  vsliderBackground:SetTextureColor("default")
  vsliderBackground:AddAnchor("TOPLEFT", vslider, 3, -9)
  vsliderBackground:AddAnchor("BOTTOMRIGHT", vslider, -3, 9)
  vslider.background = vsliderBackground

  local thumb = vslider.thumb
  thumb:SetWidth(20)

  SetViewOfButtonBackground(thumb, TEXTURE_PATH.SCROLL, "thumb")
end

---@param widget Widget
function AttachScroll(widget)
  widget.downBtn       = widget:CreateChildWidget("button", "downBtn", 0, true)
  widget.upBtn         = widget:CreateChildWidget("button", "upBtn", 0, true)
  widget.vslider       = widget:CreateChildWidget("slider", "vslider", 0, true)
  widget.vslider.thumb = widget.vslider:CreateChildWidget("button", "thumb", 0, true)

  widget.vslider:SetThumbButtonWidget(widget.vslider.thumb)

  SetViewOfScroll(widget)
end

---@param frame Widget
function UpdateScrollControlVisibility(frame, max)
  local show     = max > 0
  local colorKey = show and "default" or "disable"

  frame:Enable(show, true)
  frame.vslider.thumb:Show(show)
  frame.vslider.background:SetTextureColor(colorKey)
end

---@param slider Slider
function OverrideSliderMethods(slider)
  ---Overrides the default so that UpdateScrollControlVisibility is also called.
  local SliderSetMinMaxValues = slider.SetMinMaxValues

  function slider:SetMinMaxValues(min, max)
    SliderSetMinMaxValues(self, min, max)
    UpdateScrollControlVisibility(slider:GetParent(), max)
  end

  slider:SetMinMaxValues(0, 0)
end

---@param scrollFrame EmptyWidget
function AttachScrollBehavior(scrollFrame)
  local vslider = scrollFrame.vslider ---@type Slider

  scrollFrame:SetHandler("OnWheelUp", function () vslider:Up(SCROLL_STEP) end)
  scrollFrame:SetHandler("OnWheelDown", function () vslider:Down(SCROLL_STEP) end)

  scrollFrame.upBtn:SetHandler("OnClick", function () vslider:Up(SCROLL_STEP) end)
  scrollFrame.downBtn:SetHandler("OnClick", function () vslider:Down(SCROLL_STEP) end)
end

---@param id string
---@param parent OptionalParent
---@return EmptyWidget
---@nodiscard
function CreateScroll(id, parent)
  local frame
  if parent and type(parent) ~= "string" then
    frame = parent:CreateChildWidget("emptywidget", id, 0, true)
  else
    frame = UIParent:CreateWidget("emptywidget", id, parent or "UIParent")
    parent = frame:GetParent()
  end

  AttachScroll(frame)
  AttachScrollBehavior(frame)

  frame:SetWidth(COMMON.MARGIN)
  frame:AddAnchor("TOPRIGHT", parent, 0, 0)
  frame:AddAnchor("BOTTOMRIGHT", parent, 0, 0)

  OverrideSliderMethods(frame.vslider)

  return frame
end
