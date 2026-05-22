---@param combobox Combobox
---@param viewLimit number
local function UpdateComboboxControlVisibility(combobox, viewLimit)
  local showToggle = viewLimit > 0
  combobox.toggle:Show(showToggle)
end

---Overrides some methods on the Combobox Widget.
---@param combobox Combobox
local function OverrideComboboxMethods(combobox)
  local dropdown = combobox.dropdown

  ---Overrides the default Combobox:SetExtent so that it also sets the width of
  ---the dropdown.
  local ComboboxSetExtent = combobox.SetExtent

  function combobox:SetExtent(width, height)
    ComboboxSetExtent(self, width, height)
    dropdown:SetWidth(width)
  end

  ---Overrides the default Combobox:SetWidth so that it also sets the width of
  ---the dropdown.
  local ComboboxSetWidth = combobox.SetWidth

  function combobox:SetWidth(width)
    ComboboxSetWidth(self, width)
    dropdown:SetWidth(width)
  end

  ---Overrides the default Combobox:AddAnchor so that it also sets the width of
  ---the dropdown.
  local ComboboxAddAnchor = combobox.AddAnchor

  function combobox:AddAnchor(...)
    ComboboxAddAnchor(self, ...)
    dropdown:SetWidth(self:GetWidth())
  end

  ---Overrides the default Combobox:SetDropdownVisibleLimit so that it also sets
  ---the extent of the dropdown.
  local ComboboxSetDropdownVisibleLimit = combobox.SetDropdownVisibleLimit
  local viewLimit = 0

  function combobox:SetDropdownVisibleLimit(limit)
    ComboboxSetDropdownVisibleLimit(self, limit)
    viewLimit = limit

    local selectorButton = combobox.selectorBtn
    local width = selectorButton:GetWidth()
    local height = EDITBOX_WITH_BUTTON_INSET[2] + limit * 23 + EDITBOX_WITH_BUTTON_INSET[4]

    ---Bug: SetHeight has no effect on the height of a dropdown.
    -- dropdown:SetHeight(height)
    dropdown:SetExtent(width, height)
    UpdateScrollListboxControlVisibility(dropdown)
    UpdateComboboxControlVisibility(combobox, limit)
  end

  ---Overrides the default Combobox:Insert so that UpdateComboboxControlVisibility
  ---is called afterwards.
  local ComboboxInsert = combobox.Insert

  function combobox:Insert(...)
    local result = ComboboxInsert(self, ...)
    UpdateComboboxControlVisibility(combobox, viewLimit)
    return result
  end

  ---Overrides the default Dropdown:AppendItem so that UpdateComboboxControlVisibility
  ---is called afterwards.
  local DropdownAppendItem = dropdown.AppendItem

  function dropdown:AppendItem(...)
    local result = DropdownAppendItem(self, ...)
    UpdateComboboxControlVisibility(combobox, viewLimit)
    return result
  end

  ---Overrides the default Dropdown:AppendItemByTable so that UpdateComboboxControlVisibility
  ---is called afterwards.
  local DropdownAppendItemByTable = dropdown.AppendItemByTable

  function dropdown:AppendItemByTable(...)
    local result = DropdownAppendItemByTable(self, ...)
    UpdateComboboxControlVisibility(combobox, viewLimit)
    return result
  end

  ---Overrides the default Dropdown:SetItem so that UpdateComboboxControlVisibility
  ---is called afterwards.
  local DropdownSetItem = dropdown.SetItem

  function dropdown:SetItem(...)
    local result = DropdownSetItem(self, ...)
    UpdateComboboxControlVisibility(combobox, viewLimit)
    return result
  end

  ---Overrides the default Dropdown:SetItemTrees so that UpdateComboboxControlVisibility
  ---is called afterwards.
  local DropdownSetItemTrees = dropdown.SetItemTrees

  function dropdown:SetItemTrees(...)
    local result = DropdownSetItemTrees(self, ...)
    UpdateComboboxControlVisibility(combobox, viewLimit)
    return result
  end
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

  return combobox
end
