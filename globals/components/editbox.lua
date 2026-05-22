TEXT_COLOR = {
  DEFAULT = UIParent:GetFontColor("default"),
  BLUE    = UIParent:GetFontColor("blue"),
  GRAY    = UIParent:GetFontColor("gray"),
}

EDITBOX_INSET = { 5, 5, 5, 5 }
EDITBOX_GUIDE_INSET = { 7, 5, 5, 5 }
EDITBOX_MULTILINE_GUIDE_INSET = { 10, 10, 15, 0 }
EDITBOX_WITH_BUTTON_INSET = { 5, 5, 20, 5 }
EDITBOX_WIDTH = 312
EDITBOX_HEIGHT = 26

---@param editbox Editboxbase|Button
function AttachEditboxBehavior(editbox)
  local textureKeys = {
    enabled  = "editbox_df",
    disabled = "editbox_dis",
  }
  editbox.background = CreateBackground(editbox, TEXTURE_PATH.DEFAULT, textureKeys.enabled)

  function editbox:SetViewOfBackground(enabled)
    local textureKey = enabled and textureKeys.enabled or textureKeys.disabled
    editbox.background:SetTextureInfo(textureKey)

    local color = enabled and TEXT_COLOR.DEFAULT or TEXT_COLOR.GRAY
    self.style:SetColor(unpack(color))
  end

  editbox:SetViewOfBackground(true)

  editbox:SetHandler("OnEnableChanged", editbox.SetViewOfBackground)
end

---@param editbox Editboxbase
local function CommonEditInit(editbox)
  editbox.style:SetSnap(true)
  editbox.style:SetShadow(false)
  editbox.guideTextStyle:SetColorByKey("guide_text_in_editbox")
  editbox:SetExtent(EDITBOX_WIDTH, EDITBOX_HEIGHT)
  editbox:SetCursorColorByColorKey("editbox_cursor_default")
  AttachEditboxBehavior(editbox)
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
---@return EditboxMultiline
---@nodiscard
function CreateMultilineEditbox(id, parent)
  local multilineEditbox
  if parent and type(parent) ~= "string" then
    multilineEditbox = parent:CreateChildWidget("editboxmultiline", id, 0, true)
  else
    multilineEditbox = UIParent:CreateWidget("editboxmultiline", id, parent or "UIParent")
  end

  CommonEditInit(multilineEditbox)
  multilineEditbox.style:SetAlign(ALIGN_TOP_LEFT)
  multilineEditbox.guideTextStyle:SetAlign(ALIGN_TOP_LEFT)
  multilineEditbox:SetInset(unpack(EDITBOX_MULTILINE_GUIDE_INSET))
  multilineEditbox:SetGuideTextInset(EDITBOX_MULTILINE_GUIDE_INSET)

  return multilineEditbox
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
  end)

  editbox:SetHandler("OnTextChanged", function (self)
    cancelButton:Show(editbox:GetText() ~= "")
  end)
end

---@param id string
---@param parent OptionalParent
---@return X2Editbox
---@nodiscard
function CreateCancelableEditbox(id, parent)
  local editbox = CreateEditbox(id, parent)
  AttachCancelableEditboxBehavior(editbox)
  return editbox
end
