---@param combobox Combobox
---@param viewLimit number
local function UpdateDropdownControlVisibility(combobox, viewLimit)
  local dropdown = combobox.dropdown
  local max = dropdown:GetMaxTop()
  local show = max > 0

  dropdown.vslider:SetMinMaxValues(0, max)
  dropdown.vslider:Show(show)

  dropdown.upBtn:Show(show)
  dropdown.downBtn:Show(show)

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
    UpdateDropdownControlVisibility(combobox, limit)
  end

  ---Overrides the default Combobox:Insert so that UpdateDropdownControlVisibility
  ---is called afterwards.
  local ComboboxInsert = combobox.Insert

  function combobox:Insert(...)
    local result = ComboboxInsert(self, ...)
    UpdateDropdownControlVisibility(combobox, viewLimit)
    return result
  end

  ---Overrides the default Dropdown:AppendItem so that UpdateDropdownControlVisibility
  ---is called afterwards.
  local DropdownAppendItem = dropdown.AppendItem

  function dropdown:AppendItem(...)
    local result = DropdownAppendItem(self, ...)
    UpdateDropdownControlVisibility(combobox, viewLimit)
    return result
  end

  ---Overrides the default Dropdown:AppendItemByTable so that UpdateDropdownControlVisibility
  ---is called afterwards.
  local DropdownAppendItemByTable = dropdown.AppendItemByTable

  function dropdown:AppendItemByTable(...)
    local result = DropdownAppendItemByTable(self, ...)
    UpdateDropdownControlVisibility(combobox, viewLimit)
    return result
  end

  ---Overrides the default Dropdown:SetItemTrees so that UpdateDropdownControlVisibility
  ---is called afterwards.
  local DropdownSetItemTrees = dropdown.SetItemTrees

  function dropdown:SetItemTrees(...)
    local result = DropdownSetItemTrees(self, ...)
    UpdateDropdownControlVisibility(combobox, viewLimit)
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

  combobox:SetExtent(312, 26)
  combobox:SetDropdownVisibleLimit(10)

  local dropdown = combobox.dropdown
  local vslider = dropdown.vslider

  vslider:SetHandler("OnSliderChanged", function (self, value)
    dropdown:SetTop(value)
  end)

  dropdown:SetHandler("OnWheelUp", function () vslider:Up(1) end)
  dropdown:SetHandler("OnWheelDown", function () vslider:Down(1) end)

  dropdown.upBtn:SetHandler("OnClick", function () vslider:Up(1) end)
  dropdown.downBtn:SetHandler("OnClick", function () vslider:Down(1) end)

  return combobox
end
