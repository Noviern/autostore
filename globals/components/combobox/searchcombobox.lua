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
---@nodiscard
function CreateSearchComboBox(id, parent, initData)
  local combobox = CreateCombobox(id, parent)
  combobox:SetEditable(true)
  combobox.selector:SetMaxTextLength(128)

  OverrideSearchComboboxMethods(combobox, initData and initData.maxVisible)

  return combobox
end
