TOOLTIP_INSET = { 10, 10, 10, 10 }

---@param widget Widget
---@param tooltipFrame Window
local function AttachTooltipBehavior(widget, tooltipFrame)
  widget:SetHandler("OnEnter", function ()
    tooltipFrame:Show(true)
    tooltipFrame:Raise()
  end)

  widget:SetHandler("OnLeave", function ()
    tooltipFrame:Show(false)
  end)
end

---@param parent Widget
---@param guide Widget
---@param tooltip string
---@param autoWrap? boolean
---@return Window
---@nodiscard
function CreateTooltip(parent, guide, tooltip, autoWrap)
  local tooltipCount = parent.tooltipFrame and #parent.tooltipFrame or 0
  local frame = parent:CreateChildWidget("window", "tooltipFrame", tooltipCount + 1, true)
  frame:SetUILayer("tooltip")
  frame:Show(false)
  frame:AddAnchor("TOPRIGHT", guide, "BOTTOMRIGHT", 0, 0)

  local gametooltip = frame:CreateChildWidget("gametooltip", "gametooltip", 0, true)
  gametooltip.style:SetAlign(ALIGN_TOP_LEFT)
  gametooltip.style:SetColorByKey("soft_brown")
  gametooltip:SetInset(unpack(TOOLTIP_INSET))

  autoWrap = autoWrap ~= false
  local align = ALIGN_CENTER

  gametooltip:SetAutoWordwrap(autoWrap)
  if autoWrap then
    frame:SetWidth(parent:GetWidth() - COMMON.MARGIN * 2)
    align = ALIGN_TOP_LEFT
  end

  gametooltip:AddAnchor("TOPLEFT", frame, 0, 0)
  gametooltip:AddAnchor("TOPRIGHT", frame, 0, 0)

  ---Overrides the default Textbox:SetText so that it also sets the frames extents.
  local GameTooltipAddLine = gametooltip.AddLine

  function gametooltip:AddLine(...)
    GameTooltipAddLine(self, ...)

    if not autoWrap then
      frame:SetWidth(gametooltip.style:GetTextWidth(tooltip) + TOOLTIP_INSET[1] + TOOLTIP_INSET[3])
    end

    frame:SetHeight(gametooltip:GetHeight())
  end

  gametooltip:AddLine(tooltip, FONT_PATH.DEFAULT, FONT_SIZE.DEFAULT, "left", align, 0)

  local background = frame:CreateDrawable(TEXTURE_PATH.HUD, "tooltip_bg", "background")
  background:AddAnchor("TOPLEFT", frame, -2, 0)
  background:AddAnchor("BOTTOMRIGHT", frame, 0, 0)

  AttachTooltipBehavior(guide, frame)

  return frame
end
