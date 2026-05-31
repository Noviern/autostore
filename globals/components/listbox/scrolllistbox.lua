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
  local vslider = scrollListbox.vslider

  scrollListbox:SetHandler("OnWheelUp", function () vslider:Up(1) end)
  scrollListbox:SetHandler("OnWheelDown", function () vslider:Down(1) end)

  scrollListbox.upBtn:SetHandler("OnClick", function () vslider:Up(1) end)
  scrollListbox.downBtn:SetHandler("OnClick", function () vslider:Down(1) end)

  vslider:SetHandler("OnSliderChanged", function (self, value)
    scrollListbox:SetTop(value)
  end)
end

---@param listbox Listbox
function CommonScrollListboxInit(listbox)
  AttachScroll(listbox)
  ---@cast listbox ScrollListbox
  OverrideScrollListboxMethods(listbox)
  AttachScrollListboxBehavior(listbox)
end

---@param listbox Listbox
function InitScrollListbox(listbox)
  InitListbox(listbox)
  CommonScrollListboxInit(listbox)
end

---@param id string
---@param parent OptionalParent
---@return ScrollListbox
---@nodiscard
function CreateScrollListbox(id, parent)
  local listbox = CreateListbox(id, parent)
  CommonScrollListboxInit(listbox)
  ---@cast listbox ScrollListbox

  return listbox
end
