---@param id string
---@param parent OptionalParent
---@param title string
---@param tooltip? string
---@param autoWrap? boolean
---@return EmptyWidget frame, Window|nil tooltipFrame
---@nodiscard
function CreateModule(id, parent, title, tooltip, autoWrap)
  local frame
  if parent and type(parent) ~= "string" then
    frame = parent:CreateChildWidget("emptywidget", id, 0, true)
  else
    frame = UIParent:CreateWidget("emptywidget", id, "UIParent")
    parent = frame:GetParent()
  end

  frame.background = CreateTextureBackground(frame, TEXTURE_PATH.DEFAULT, "type02_new")
  frame.background:SetTextureColor("default")

  local titleTextbox = frame:CreateChildWidget("textbox", "titleTextbox", 0, true)
  titleTextbox.style:SetColorByKey("title")
  titleTextbox.style:SetFontSize(FONT_SIZE.LARGE)
  titleTextbox.style:SetAlign(ALIGN_LEFT)
  titleTextbox.style:SetEllipsis(true)
  titleTextbox:SetAutoWordwrap(false)
  titleTextbox:SetHeight(45)
  titleTextbox:SetInset(COMMON.MARGIN, 0, COMMON.MARGIN, 0)
  titleTextbox:AddAnchor("TOPLEFT", frame, 0, 0)
  titleTextbox:AddAnchor("TOPRIGHT", frame, 0, 0)
  titleTextbox:SetText(title)

  local tooltipFrame
  if tooltip then
    local guide = titleTextbox:CreateChildWidget("emptywidget", "guide", 0, true)
    guide.background = CreateTextureBackground(guide, TEXTURE_PATH.HUD, "questionmark")
    guide:SetExtent(20, 20)
    guide:AddAnchor("RIGHT", titleTextbox, -COMMON.MARGIN, 0)

    tooltipFrame = CreateTooltip(parent, guide, tooltip, autoWrap)
  end

  titleTextbox.background = CreateTextureBackground(titleTextbox, TEXTURE_PATH.DEFAULT, "type02_new_half")
  titleTextbox.background:SetTextureColor("default")

  local contentFrame = frame:CreateChildWidget("emptywidget", "contentFrame", 0, true)
  contentFrame:AddAnchor("TOPLEFT", titleTextbox, "BOTTOMLEFT", COMMON.MARGIN, COMMON.SPACING)
  contentFrame:AddAnchor("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -COMMON.MARGIN, -COMMON.MARGIN)

  return frame, tooltipFrame
end
