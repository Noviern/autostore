local item_grades = {
  { -- All
    text  = X2Locale:LocalizeUiText(COMMON_TEXT, "all"),
    color = UIParent:GetFontColor("all_in_item_grade_combobox"),
  },
  { -- None
    text  = X2Locale:LocalizeUiText(COMMON_TEXT, "none"),
    color = Hex2Dec("FF949293"),
  },
  { -- Basic
    text  = X2Locale:LocalizeUiText(COMMON_TEXT, "equip_item_guide_craft_normal"),
    color = Hex2Dec("FFBA976D"),
  },
  { -- Grand
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_uncommon"),
    color = Hex2Dec("FF77b064"),
  },
  { -- Rare
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_rare"),
    color = Hex2Dec("FF558fd7"),
  },
  { -- Arcane
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_acient"),
    color = Hex2Dec("FFcb72d8"),
  },
  { -- Heroic
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_heroic"),
    color = Hex2Dec("FFd78b06"),
  },
  { -- Unique
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_unique"),
    color = Hex2Dec("FFe17853"),
  },
  { -- Celestial
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_artifact"),
    color = Hex2Dec("FFf95252"),
  },
  { -- Divine
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_wonder"),
    color = Hex2Dec("FFcf7d5d"),
  },
  { -- Epic
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_epic"),
    color = Hex2Dec("FF8fa5ca"),
  },
  { -- Legendary
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_legendary"),
    color = Hex2Dec("FFbf7900"),
  },
  { -- Mythic
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_mythic"),
    color = Hex2Dec("FFc90b0b"),
  },
  { -- Eternal
    text  = X2Locale:LocalizeUiText(ITEM_GRADE, "item_grade_arche"),
    color = Hex2Dec("FFae98fe"),
  },
}

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
      color        = item_grades[i].color,
      disableColor = TEXT_COLOR.GRAY,
      useColor     = true,
      enable       = true,
    })
  end

  combobox:SetDropdownVisibleLimit(#item_grades)
  dropdown:Select(0)

  ---@TODO perhaps this should be a default behavior of combobox?
  combobox:SetHandler("OnContentUpdated", function (self, action, index, value)
    if action ~= "ChangedValue" then
      return
    end

    SetButtonFontOneColor(combobox.selectorBtn, item_grades[index].color)
  end)

  return combobox
end
