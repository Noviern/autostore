---@param widget Widget
function AttachScrollBehavior(widget)
  local vslider = widget.vslider

  widget:SetHandler("OnWheelUp", function () vslider:Up(1) end)
  widget:SetHandler("OnWheelDown", function () vslider:Down(1) end)

  widget.upBtn:SetHandler("OnClick", function () vslider:Up(1) end)
  widget.downBtn:SetHandler("OnClick", function () vslider:Down(1) end)
end

---@param parent Widget
function SetViewOffScroll(parent)
  local upButton = parent.upBtn
  upButton:AddAnchor("TOPRIGHT", parent, -4, 8)
  upButton:SetExtent(20, 12)
  upButton:SetStyle("slider_scroll_button_up")

  local downButton = parent.downBtn
  downButton:AddAnchor("BOTTOMRIGHT", parent, -4, -8)
  downButton:SetExtent(20, 12)
  downButton:SetStyle("slider_scroll_button_down")

  local vslider = parent.vslider
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

  SetViewOffScroll(widget)
end
