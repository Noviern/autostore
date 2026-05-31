EDITBOX_WIDTH = 312
EDITBOX_HEIGHT = 26
EDITBOX_WITH_BUTTON_INSET = { 5, 5, 20, 5 }

---@param editbox Editboxbase
function CommonEditInit(editbox)
  editbox.style:SetSnap(true)
  editbox.style:SetShadow(false)
  editbox.guideTextStyle:SetColorByKey("guide_text_in_editbox")
  editbox:SetExtent(EDITBOX_WIDTH, EDITBOX_HEIGHT)
  editbox:SetCursorColorByColorKey("editbox_cursor_default")
  AttachEditboxBehavior(editbox)
end
