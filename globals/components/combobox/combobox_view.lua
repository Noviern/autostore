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
  selectorButton:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))
  selectorButton:SetTextColor(unpack(TEXT_COLOR.DEFAULT))
  selectorButton:SetHighlightTextColor(unpack(TEXT_COLOR.DEFAULT))
  selectorButton:SetPushedTextColor(unpack(TEXT_COLOR.DEFAULT))
  selectorButton:SetDisabledTextColor(unpack(TEXT_COLOR.GRAY))
  AttachEditboxBehavior(selectorButton)

  local toggle = combobox.toggle
  toggle:AddAnchor("RIGHT", selectorButton, -2, 2)
  toggle:SetStyle("grid_folder_down_arrow")

  local dropdown = combobox.dropdown
  InitListbox(dropdown)
  SetViewOffScroll(dropdown)
  AttachScrollBehavior(dropdown)
  OverrideScrollListboxMethods(dropdown)
  AttachScrollListboxBehavior(dropdown)

  dropdown.background = CreateBackground(dropdown, TEXTURE_PATH.DEFAULT, "editbox_df")

  return combobox
end
