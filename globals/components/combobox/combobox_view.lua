---@param id string
---@param parent OptionalParent
---@return Combobox
---@nodiscard
function SetViewOfCombobox(id, parent)
  local combobox
  if parent then
    combobox = parent:CreateChildWidget("combobox", id, 0, true)
  else
    combobox = UIParent:CreateWidget("combobox", id, "UIParent")
  end

  InitEditbox(combobox.selector)
  combobox.selector:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))

  local selectorButton = combobox.selectorBtn
  selectorButton.style:SetAlign(ALIGN_LEFT)
  selectorButton.style:SetEllipsis(true)
  selectorButton:SetTextColor(unpack(TEXT_COLOR.DEFAULT))
  selectorButton:SetHighlightTextColor(unpack(TEXT_COLOR.DEFAULT))
  selectorButton:SetPushedTextColor(unpack(TEXT_COLOR.DEFAULT))
  selectorButton:SetDisabledTextColor(unpack(TEXT_COLOR.GRAY))
  selectorButton:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))
  AttachEditboxBehavior(selectorButton)

  local toggle = combobox.toggle
  toggle:AddAnchor("RIGHT", selectorButton, -2, 2)
  toggle:SetStyle("grid_folder_down_arrow")

  local dropdown = combobox.dropdown
  dropdown.itemStyle:SetAlign(ALIGN_LEFT)
  dropdown:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))
  dropdown:SetOveredItemColor(0, 0.5, 1, 0.2)
  dropdown:SetSelectedItemColor(0, 0.3, 0.5, 0.3)
  dropdown:SetDefaultItemTextColor(unpack(TEXT_COLOR.DEFAULT))
  dropdown:SetOveredItemTextColor(unpack(TEXT_COLOR.BLUE))
  dropdown:SetSelectedItemTextColor(unpack(TEXT_COLOR.BLUE))
  dropdown:SetDisableItemTextColor(unpack(TEXT_COLOR.GRAY))

  dropdown.background = CreateBackground(dropdown, TEXTURE_PATH.DEFAULT, "editbox_df")

  local upButton = dropdown.upBtn
  upButton:AddAnchor("TOPRIGHT", dropdown, -4, 8)
  upButton:SetExtent(20, 12)
  upButton:SetStyle("slider_scroll_button_up")

  local downButton = dropdown.downBtn
  downButton:AddAnchor("BOTTOMRIGHT", dropdown, -4, -8)
  downButton:SetExtent(20, 12)
  downButton:SetStyle("slider_scroll_button_down")

  local vslider = dropdown.vslider
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

  return combobox
end
