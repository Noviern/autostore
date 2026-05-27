---@param combobox Combobox
local function UpdateComboboxToggleVisibility(combobox)
  combobox.toggle:Show(combobox.dropdown:GetViewItemCount() > 0 and combobox.dropdown:ItemCount() > 0)
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

---@param combobox Combobox
---@param maxVisible? number
local function OverrideSearchComboboxMethods(combobox, maxVisible)
  local dropdown = combobox.dropdown
  local selector = combobox.selector

  ---@type ItemTree[]
  local searchableDatas = {}

  ---Overrides the default so that searchableData is updated.
  local ComboboxInsert = combobox.Insert

  function combobox:Insert(datas)
    ComboboxInsert(self, datas)

    for _, data in ipairs(datas) do
      table.insert(searchableDatas, data)
    end
  end

  ---Overrides the default so that searchableData is updated.
  local DropdownAppendItem = dropdown.AppendItem

  function dropdown:AppendItem(key, value, ...)
    DropdownAppendItem(self, key, value, ...)
    local rgba = { ... }
    table.insert(searchableDatas, {
      text         = key,
      value        = value,
      subColor     = rgba,
      defaultColor = rgba,
      selectColor  = rgba,
      overColor    = rgba,
      disableColor = rgba,
      color        = rgba,
      useColor     = #rgba > 0
    })
  end

  ---Overrides the default so that searchableData is updated.
  local DropdownAppendItemByTable = dropdown.AppendItemByTable

  function dropdown:AppendItemByTable(data)
    DropdownAppendItemByTable(self, data)
    table.insert(searchableDatas, data)
  end

  ---Overrides the default so that searchableData is updated.
  local DropdownClearItem = dropdown.ClearItem

  function dropdown:ClearItem()
    DropdownClearItem(self)
    searchableDatas = {}
  end

  ---Overrides the default so that searchableData is updated.
  local DropdownSetItem = dropdown.SetItem

  function dropdown:SetItem(idx, name, value, ...)
    DropdownSetItem(self, idx, name, value, ...)
    local rgba = { ... }
    table.insert(searchableDatas, {
      text         = name,
      value        = value,
      subColor     = rgba,
      defaultColor = rgba,
      selectColor  = rgba,
      overColor    = rgba,
      disableColor = rgba,
      color        = rgba,
      useColor     = #rgba > 0
    })
  end

  ---Overrides the default so that searchableData is updated.
  local DropdownSetItemTrees = dropdown.SetItemTrees

  function dropdown:SetItemTrees(treeTable)
    local result = DropdownSetItemTrees(self, treeTable)
    searchableDatas = treeTable
    return result
  end

  combobox:SetDropdownVisibleLimit(maxVisible or dropdown:GetViewItemCount())

  ---@param text string
  local function Search(text)
    DropdownClearItem(dropdown)

    local searchText = text or ""
    local datas = {}
    for _, data in ipairs(searchableDatas) do
      if data.text:lower():match(searchText:lower()) then
        table.insert(datas, data)
      end
    end

    ComboboxInsert(combobox, datas)

    local appended = dropdown:ItemCount()
    maxVisible     = maxVisible or dropdown:GetViewItemCount()

    combobox:SetDropdownVisibleLimit(math.min(appended, maxVisible))
  end

  selector:SetHandler("OnAcceptFocus", function ()
    dropdown:Show(dropdown:GetViewItemCount() > 0 and dropdown:ItemCount() > 0)
  end)

  selector:SetHandler("OnTextChanged", function ()
    Search(selector:GetText())
    dropdown:Show(dropdown:GetViewItemCount() > 0 and dropdown:ItemCount() > 0)
  end)
end

---@class SearchComboBoxData
---@field maxVisible number|nil

---@param id string
---@param parent OptionalParent
---@param initData? SearchComboBoxData
---@return Combobox
function CreateSearchComboBox(id, parent, initData)
  local combobox = CreateCombobox(id, parent)
  combobox:SetEditable(true)
  combobox.selector:SetMaxTextLength(128)

  OverrideSearchComboboxMethods(combobox, initData and initData.maxVisible)

  return combobox
end
