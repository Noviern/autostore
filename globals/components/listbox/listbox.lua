---@param listbox Listbox
function InitListbox(listbox)
  listbox.itemStyle:SetAlign(ALIGN_LEFT)
  listbox:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))
  listbox:SetOveredItemColor(0, 0.5, 1, 0.2)
  listbox:SetSelectedItemColor(0, 0.3, 0.5, 0.3)
  listbox:SetDefaultItemTextColor(unpack(TEXT_COLOR.DEFAULT))
  listbox:SetOveredItemTextColor(unpack(TEXT_COLOR.BLUE))
  listbox:SetSelectedItemTextColor(unpack(TEXT_COLOR.BLUE))
  listbox:SetDisableItemTextColor(unpack(TEXT_COLOR.GRAY))
end

---@param id string
---@param parent OptionalParent
---@return Listbox
---@nodiscard
function CreateListbox(id, parent)
  local listbox
  if parent and type(parent) ~= "string" then
    listbox = parent:CreateChildWidget("listbox", id, 0, true)
  else
    listbox = UIParent:CreateWidget("listbox", id, parent or "UIParent")
  end

  InitListbox(listbox)

  return listbox
end
