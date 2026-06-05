TEXT_COLOR = {
  DEFAULT = UIParent:GetFontColor("default"),
  BLUE    = UIParent:GetFontColor("blue"),
  GRAY    = UIParent:GetFontColor("gray"),
}

EDITBOX_INSET = { 5, 5, 5, 5 }
EDITBOX_GUIDE_INSET = { 7, 5, 5, 5 }

---@param editbox Editboxbase|Button
function AttachEditboxBehavior(editbox)
  local textureKeys = {
    enabled  = "editbox_df",
    disabled = "editbox_dis",
  }
  editbox.background = CreateTextureBackground(editbox, TEXTURE_PATH.DEFAULT, textureKeys.enabled)

  function editbox:SetViewOfBackground(enabled)
    local textureKey = enabled and textureKeys.enabled or textureKeys.disabled
    editbox.background:SetTextureInfo(textureKey)

    local color = enabled and TEXT_COLOR.DEFAULT or TEXT_COLOR.GRAY
    self.style:SetColor(unpack(color))
  end

  editbox:SetViewOfBackground(true)

  editbox:SetHandler("OnEnableChanged", editbox.SetViewOfBackground)
end

---@param editbox X2Editbox
function InitEditbox(editbox)
  CommonEditInit(editbox)
  editbox.style:SetAlign(ALIGN_LEFT)
  editbox.style:SetColorByKey("title")
  editbox.guideTextStyle:SetAlign(ALIGN_LEFT)
  editbox:SetInset(unpack(EDITBOX_INSET))
  editbox:SetGuideTextInset(EDITBOX_GUIDE_INSET)
  editbox:UseSelectAllWhenFocused(true)
end

---@param id string
---@param parent OptionalParent
---@return X2Editbox
---@nodiscard
function CreateEditbox(id, parent)
  local editbox
  if parent and type(parent) ~= "string" then
    editbox = parent:CreateChildWidget("x2editbox", id, 0, true)
  else
    editbox = UIParent:CreateWidget("x2editbox", id, parent or "UIParent")
  end

  InitEditbox(editbox)

  return editbox
end

---@param editbox X2Editbox
function AttachCancelableEditboxBehavior(editbox)
  local cancelButton = editbox:CreateChildWidget("button", "cancelButton", 0, true)
  cancelButton:Show(false)
  cancelButton:SetStyle("cancel_search_in_inventory")
  cancelButton:AddAnchor("RIGHT", editbox, "RIGHT", -6, 0)
  editbox.cancelButton = cancelButton

  cancelButton:SetHandler("OnClick", function ()
    editbox:SetText("")
    cancelButton:Show(false)
    editbox:ClearFocus()
  end)

  editbox:SetHandler("OnTextChanged", function (self)
    cancelButton:Show(editbox:GetText() ~= "")

    if type(editbox.OnTextChanged) == "function" then
      editbox:OnTextChanged()
    end
  end)
end

---@param id string
---@param parent OptionalParent
---@return X2Editbox
---@nodiscard
function CreateCancelableEditbox(id, parent)
  local editbox = CreateEditbox(id, parent)
  editbox:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))
  AttachCancelableEditboxBehavior(editbox)
  return editbox
end
