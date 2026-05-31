EDITBOX_MULTILINE_GUIDE_INSET = { 10, 10, 15, 0 }

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
