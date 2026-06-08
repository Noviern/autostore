---X2Item:AllGradeTypes()
---X2Item:GradeName(grade)
---X2Item:GradeColor(grade)

local item_grades = {
  { text = X2Locale:LocalizeUiText(COMMON_TEXT, "all"),                 color = "" },
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_uncommon"),  color = "FF77b064" }, -- Grand
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_rare"),      color = "FF558fd7" }, -- Rare
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_acient"),    color = "FFcb72d8" }, -- Arcane
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_heroic"),    color = "FFd78b06" }, -- Heroic
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_unique"),    color = "FFe17853" }, -- Unique
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_artifact"),  color = "FFf95252" }, -- Celestial
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_wonder"),    color = "FFcf7d5d" }, -- Divine
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_epic"),      color = "FF8fa5ca" }, -- Epic
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_legendary"), color = "FFbf7900" }, -- Legendary
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_mythic"),    color = "FFc90b0b" }, -- Mythic
  { text = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_arche"),     color = "FFae98fe" }, -- Eternal
}

---@param index number
---@return RGBAColor
local function GetFontColor(index)
  return index == 1
      and UIParent:GetFontColor("all_in_item_grade_combobox")
      or Hex2Dec(item_grades[index].color)
end

---@param id string
---@param parent OptionalParent
---@return Combobox
function CreateGradeCombobox(id, parent)
  local combobox = CreateCombobox(id, parent)
  local dropdown = combobox.dropdown

  for i = 1, #item_grades do
    dropdown:AppendItemByTable({
      text         = item_grades[i].text,
      value        = i,
      color        = GetFontColor(i),
      disableColor = UIParent:GetFontColor("gray"), ---@TODO should this be extracted to a variable so its not called multiple times?
      useColor     = true,
      enable       = true,
    })
  end

  combobox:SetDropdownVisibleLimit(#item_grades)

  ---@TODO perhaps this would be a default behavior of combobox?
  combobox:SetHandler("OnContentUpdated", function (self, action, index, value)
    if action ~= "ChangedValue" then
      return
    end

    SetButtonFontOneColor(combobox.selectorBtn, GetFontColor(index))
  end)

  dropdown:Select(0)

  return combobox
end
