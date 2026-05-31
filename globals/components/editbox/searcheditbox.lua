---@param editbox X2Editbox
function AttachSearchEditboxBehavior(editbox)
  local searchIcon = editbox:CreateDrawable(TEXTURE_PATH.INVENTORY_DEFAULT, "search_icon", "overlay")
  searchIcon:AddAnchor("RIGHT", editbox, -6, 0)

  local cancelButton = editbox.cancelButton ---@type Button
  editbox:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))

  cancelButton:SetHandler("OnEnableChanged", function (self, enabled)
    if enabled then
      searchIcon:SetColor(1, 1, 1, 1)
    else
      searchIcon:SetColor(0.4, 0.4, 0.4, .5)
    end
  end)

  cancelButton:SetHandler("OnVisibleChanged", function (self, visible)
    searchIcon:Show(not visible)
  end)
end

---@param id string
---@param parent OptionalParent
---@return X2Editbox
---@nodiscard
function CreateSearchEditbox(id, parent)
  local editbox = CreateCancelableEditbox(id, parent)
  AttachSearchEditboxBehavior(editbox)
  return editbox
end
