---@param dropdown ScrollListbox
function DropdownHasItems(dropdown)
  return dropdown:GetViewItemCount() > 0 and dropdown:ItemCount() > 0
end

---@param combobox Combobox
local function UpdateComboboxToggleVisibility(combobox)
  combobox.toggle:Show(DropdownHasItems(combobox.dropdown))
end

---@param combobox Combobox
local function OverrideComboboxMethods(combobox)
  local dropdown = combobox.dropdown

  ---Overrides the default so that it also sets the width of the dropdown.
  local ComboboxSetExtent = combobox.SetExtent

  function combobox:SetExtent(width, height)
    ComboboxSetExtent(self, width, height)
    dropdown:SetWidth(width)
  end

  ---Overrides the default so that it also sets the width of the dropdown.
  local ComboboxSetWidth = combobox.SetWidth

  function combobox:SetWidth(width)
    ComboboxSetWidth(self, width)
    dropdown:SetWidth(width)
  end

  ---Overrides the default so that it also sets the width of the dropdown.
  local ComboboxAddAnchor = combobox.AddAnchor

  function combobox:AddAnchor(...)
    ComboboxAddAnchor(self, ...)
    dropdown:SetWidth(self:GetWidth())
  end

  ---Overrides the default so that it also sets the extent of the dropdown and
  ---UpdateScrollListboxControlVisibility and UpdateComboboxToggleVisibility are
  ---called afterwards.
  local ComboboxSetDropdownVisibleLimit = combobox.SetDropdownVisibleLimit

  function combobox:SetDropdownVisibleLimit(limit)
    ComboboxSetDropdownVisibleLimit(self, limit)

    local selectorButton = self.selectorBtn
    local width          = selectorButton:GetWidth()
    local height         = EDITBOX_WITH_BUTTON_INSET[2] + limit * 23 + EDITBOX_WITH_BUTTON_INSET[4]

    ---Bug: SetHeight has no effect on the height of a dropdown.
    -- dropdown:SetHeight(height)
    dropdown:SetExtent(width, height)
    UpdateScrollListboxControlVisibility(dropdown)
    UpdateComboboxToggleVisibility(self)
  end

  ---Overrides the default so that UpdateScrollListboxControlVisibility and
  ---UpdateComboboxToggleVisibility are called afterwards.
  local ComboboxInsert = combobox.Insert

  function combobox:Insert(...)
    ComboboxInsert(self, ...)
    UpdateScrollListboxControlVisibility(dropdown)
    UpdateComboboxToggleVisibility(self)
  end

  ---Overrides the default so that UpdateComboboxToggleVisibility is called afterwards.
  local DropdownAppendItem = dropdown.AppendItem

  function dropdown:AppendItem(...)
    DropdownAppendItem(self, ...)
    UpdateComboboxToggleVisibility(combobox)
  end

  ---Overrides the default so that UpdateComboboxToggleVisibility is called afterwards.
  local DropdownAppendItemByTable = dropdown.AppendItemByTable

  function dropdown:AppendItemByTable(...)
    DropdownAppendItemByTable(self, ...)
    UpdateComboboxToggleVisibility(combobox)
  end

  ---Overrides the default so that UpdateComboboxToggleVisibility is called afterwards.
  local DropdownClearItem = dropdown.ClearItem

  function dropdown:ClearItem()
    DropdownClearItem(self)
    UpdateComboboxToggleVisibility(combobox)
  end

  ---Overrides the default so that UpdateComboboxToggleVisibility is called afterwards.
  local DropdownSetItem = dropdown.SetItem

  function dropdown:SetItem(...)
    DropdownSetItem(self, ...)
    UpdateComboboxToggleVisibility(combobox)
  end

  ---Overrides the default so that UpdateComboboxToggleVisibility is called afterwards.
  local DropdownSetItemTrees = dropdown.SetItemTrees

  function dropdown:SetItemTrees(...)
    local result = DropdownSetItemTrees(self, ...)
    UpdateComboboxToggleVisibility(combobox)
    return result
  end
end

---@TODO: Bug: Slider/Thumb can not be clicked unless dropdown is in focus from either clicking upBtn/downBtn.
---@param combobox Combobox
function AttachComboboxBehavior(combobox)
  local dropdown = combobox.dropdown

  dropdown:SetHandler("OnShow", function ()
    dropdown:Show(DropdownHasItems(combobox.dropdown))
  end)
end

---@param id string
---@param parent OptionalParent
---@return Combobox
---@nodiscard
function CreateCombobox(id, parent)
  local combobox = SetViewOfCombobox(id, parent)
  OverrideComboboxMethods(combobox)
  combobox:SetExtent(EDITBOX_WIDTH, EDITBOX_HEIGHT)
  combobox:SetDropdownVisibleLimit(10)

  AttachComboboxBehavior(combobox)

  return combobox
end
