---Sets the view of the window.
---@param id string
---@param parent? "UIParent"|Widget
---@return Window
function SetViewOfWindow(id, parent)
  local window = UIParent:CreateWidget("window", id, parent or "UIParent")
  window:SetExtent(280, 180)
  window:AddAnchor("CENTER", parent or "UIParent", 0, 0)

  local bg = window:CreateDrawable(TEXTURE_PATH.DEFAULT, "main_bg", "background")
  bg:AddAnchor("TOPLEFT", window, -5, -5)
  bg:AddAnchor("BOTTOMRIGHT", window, 5, 5)

  local deco = window:CreateDrawable(TEXTURE_PATH.DEFAULT, "main_bg_deco", "background")
  deco:AddAnchor("TOPLEFT", window, 0, -5)
  deco:AddAnchor("TOPRIGHT", window, 0, -5)

  local titleBar = window:CreateChildWidget("window", "titleBar", 0, true)
  titleBar.titleStyle:SetAlign(ALIGN_CENTER)
  titleBar.titleStyle:SetSnap(true)
  titleBar.titleStyle:SetFont(FONT_PATH.SUB, FONT_SIZE.XLARGE)
  titleBar.titleStyle:SetColorByKey("title")
  titleBar:SetHeight(45)
  titleBar:AddAnchor("TOPLEFT", window, 0, 0)
  titleBar:AddAnchor("TOPRIGHT", window, 0, 0)

  local closeButton = titleBar:CreateChildWidget("button", "closeButton", 0, true)
  closeButton:SetStyle("btn_close_default")
  closeButton:AddAnchor("TOPRIGHT", closeButton:GetParent(), 3, -3)

  local contentFrame = window:CreateChildWidget("emptywidget", "contentFrame", 0, true)
  contentFrame:AddAnchor("TOPLEFT", titleBar, "BOTTOMLEFT", 20, 0)
  contentFrame:AddAnchor("BOTTOMRIGHT", window, "BOTTOMRIGHT", -20, -20)

  return window
end
