---Creates a window.
---@param id string
---@param parent? "UIParent"|Widget
---@return Window
---@nodiscard
function CreateWindow(id, parent)
  local window = SetViewOfWindow(id, parent)
  window:SetSounds("dialog_common")
  window:SetCloseOnEscape(true)
  window:SetAlphaAnimation(0, 1, .1, .1)
  window:SetStartAnimation(true, true)

  local titleBar = window.titleBar ---@type Window
  titleBar:EnableDrag(true)

  titleBar:SetHandler("OnDragStart", function ()
    window:StartMoving()
  end)

  titleBar:SetHandler("OnDragStop", function ()
    window:StopMovingOrSizing()
    CorrectWidgetScreenPos(window)
  end)

  local closeButton = titleBar.closeButton ---@type Button
  closeButton:SetHandler("OnClick", function ()
    window:Show(false)
  end)

  return window
end
