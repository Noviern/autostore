TEXT_COLOR = {
  DEFAULT = UIParent:GetFontColor("default"),
  BLUE    = UIParent:GetFontColor("blue"),
  GRAY    = UIParent:GetFontColor("gray"),
}

EDITBOX_INSET = { 5, 5, 5, 5 }
EDITBOX_GUIDE_INSET = { 7, 5, 5, 5 }
EDITBOX_MULTILINE_GUIDE_INSET = { 10, 10, 15, 0 }

---@param editbox Editboxbase|Button
function AttachEditboxBehavior(editbox)
  local textureKeys = {
    enabled  = "editbox_df",
    disabled = "editbox_dis",
  }
  local background = editbox:CreateDrawable(TEXTURE_PATH.DEFAULT, textureKeys.enabled, "background")
  background:AddAnchor("TOPLEFT", editbox, 0, 0)
  background:AddAnchor("BOTTOMRIGHT", editbox, 0, 0)
  editbox.background = background

  function editbox:SetViewOfBackground(enabled)
    local textureKey = enabled and textureKeys.enabled or textureKeys.disabled
    background:SetTextureInfo(textureKey)

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
  editbox:SetHeight(26)
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

---Creates a Multiline Editbox.
---@param id string
---@param parent? "UIParent"|Widget
---@return EditboxMultiline
---@nodiscard
function CreateMultilineEditbox(id, parent)
  local multilineEditbox
  if parent then
    multilineEditbox = parent:CreateChildWidget("editboxmultiline", id, 0, true)
  else
    multilineEditbox = UIParent:CreateWidget("editboxmultiline", id, "UIParent")
  end

  CommonEditInit(multilineEditbox)
  multilineEditbox.style:SetAlign(ALIGN_TOP_LEFT)
  multilineEditbox.guideTextStyle:SetAlign(ALIGN_TOP_LEFT)
  multilineEditbox:SetInset(unpack(EDITBOX_MULTILINE_GUIDE_INSET))
  multilineEditbox:SetGuideTextInset(EDITBOX_MULTILINE_GUIDE_INSET)

  return multilineEditbox
end

---Creates a Editbox.
---@param id string
---@param parent? "UIParent"|Widget
---@return X2Editbox
---@nodiscard
function CreateEditbox(id, parent)
  local editbox
  if parent then
    editbox = parent:CreateChildWidget("x2editbox", id, 0, true)
  else
    editbox = UIParent:CreateWidget("x2editbox", id, "UIParent")
  end

  InitEditbox(editbox)

  return editbox
end
