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

---@param scrollListbox ScrollListbox
function UpdateScrollListboxControlVisibility(scrollListbox)
  local max = scrollListbox:GetMaxTop()
  local show = max > 0

  scrollListbox.vslider:SetMinMaxValues(0, max)
  scrollListbox.vslider:Show(show)

  scrollListbox.upBtn:Show(show)
  scrollListbox.downBtn:Show(show)
end

---@param listbox ScrollListbox
function OverrideScrollListboxMethods(listbox)
  ---Overrides the default so that UpdateScrollListboxControlVisibility is called afterwards.
  local ListboxAppendItem = listbox.AppendItem

  function listbox:AppendItem(...)
    ListboxAppendItem(self, ...)
    UpdateScrollListboxControlVisibility(listbox)
  end

  ---Overrides the default so that UpdateScrollListboxControlVisibility is called afterwards.
  local ListboxAppendItemByTable = listbox.AppendItemByTable

  function listbox:AppendItemByTable(...)
    ListboxAppendItemByTable(self, ...)
    UpdateScrollListboxControlVisibility(listbox)
  end

  ---Overrides the default so that UpdateScrollListboxControlVisibility is called afterwards.
  local ListboxClearItem = listbox.ClearItem

  function listbox:ClearItem()
    ListboxClearItem(self)
    UpdateScrollListboxControlVisibility(listbox)
  end

  ---Overrides the default so that UpdateScrollListboxControlVisibility is called afterwards.
  local ListboxSetItem = listbox.SetItem

  function listbox:SetItem(...)
    ListboxSetItem(self, ...)
    UpdateScrollListboxControlVisibility(listbox)
  end

  ---Overrides the default so that UpdateScrollListboxControlVisibility is called afterwards.
  local ListboxSetItemTrees = listbox.SetItemTrees

  function listbox:SetItemTrees(...)
    local result = ListboxSetItemTrees(self, ...)
    UpdateScrollListboxControlVisibility(listbox)
    return result
  end
end

---@param scrollListbox ScrollListbox
function AttachScrollListboxBehavior(scrollListbox)
  scrollListbox.vslider:SetHandler("OnSliderChanged", function (self, value)
    scrollListbox:SetTop(value)
  end)
end

---@param id string
---@param parent OptionalParent
---@return ScrollListbox
---@nodiscard
function CreateScrollListbox(id, parent)
  local listbox = CreateListbox(id, parent)
  AttachScroll(listbox)
  AttachScrollBehavior(listbox)
  ---@cast listbox ScrollListbox
  OverrideScrollListboxMethods(listbox)
  AttachScrollListboxBehavior(listbox)

  return listbox
end
