---@param id string
---@param parent OptionalParent
---@return ListCtrl
---@nodiscard
function CreateListCtrl(id, parent)
  local listCtrl
  if parent and type(parent) ~= "string" then
    listCtrl = parent:CreateChildWidget("listctrl", id, 0, true)
  else
    listCtrl = UIParent:CreateWidget("listctrl", id, parent or "UIParent")
  end

  local overedImage = listCtrl:CreateOveredImage()
  overedImage:SetTexture(TEXTURE_PATH.TAB_LIST)
  overedImage:SetTextureInfo("enchant_info_bg", "listctrl_overed_default")

  local selectedImage = listCtrl:CreateSelectedImage()
  selectedImage:SetTexture(TEXTURE_PATH.TAB_LIST)
  selectedImage:SetTextureInfo("enchant_info_bg", "listctrl_selected_default")

  return listCtrl
end
