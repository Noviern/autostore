local TOOLTIP_INSET = 10

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
function CreateTooltip(parent, guide, tooltip, autoWrap)
  local tooltipCount = parent.tooltipFrame and #parent.tooltipFrame or 0
  local tooltipFrame = parent:CreateChildWidget("window", "tooltipFrame", tooltipCount + 1, true)
  tooltipFrame:SetUILayer("tooltip")
  tooltipFrame:Show(false)
  tooltipFrame:AddAnchor("TOPRIGHT", guide, "BOTTOMRIGHT", 0, 0)

  local tooltipTextbox = tooltipFrame:CreateChildWidget("textbox", "textbox", 0, true)
  tooltipTextbox.style:SetAlign(ALIGN_TOP_LEFT)
  tooltipTextbox.style:SetColorByKey("soft_brown")
  tooltipTextbox:SetAutoResize(true)

  if autoWrap == false then
    tooltipTextbox:SetAutoWordwrap(autoWrap)
  else
    tooltipFrame:SetWidth(parent:GetWidth() - TOOLTIP_INSET * 4) ---@TODO: the frame needs a width before settext
  end

  tooltipTextbox:AddAnchor("TOPLEFT", tooltipFrame, TOOLTIP_INSET, TOOLTIP_INSET)
  tooltipTextbox:AddAnchor("TOPRIGHT", tooltipFrame, -TOOLTIP_INSET, TOOLTIP_INSET)

  ---Overrides the default Textbox:SetText so that it also sets the frames extents.
  local TextboxSetText = tooltipTextbox.SetText

  function tooltipTextbox:SetText(text)
    TextboxSetText(self, text)

    if autoWrap == false then
      tooltipFrame:SetWidth(tooltipTextbox:GetLongestLineWidth() + TOOLTIP_INSET * 2)
    end

    tooltipFrame:SetHeight(tooltipTextbox:GetHeight() + TOOLTIP_INSET * 2)
  end

  tooltipTextbox:SetText(tooltip)

  local tooltipBackground = tooltipFrame:CreateDrawable(TEXTURE_PATH.HUD, "tooltip_bg", "background")
  tooltipBackground:AddAnchor("TOPLEFT", tooltipFrame, -2, -0)
  tooltipBackground:AddAnchor("BOTTOMRIGHT", tooltipFrame, 0, 0)

  AttachTooltipBehavior(guide, tooltipFrame)

  return tooltipFrame
end
