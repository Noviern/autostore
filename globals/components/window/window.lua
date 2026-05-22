---@param id string
---@param parent OptionalParent
---@param title string
---@return Window
---@nodiscard
function CreateWindow(id, parent, title)
  local window = SetViewOfWindow(id, parent, title)
  window:SetSounds("dialog_common")
  window:SetCloseOnEscape(true)
  window:SetAlphaAnimation(0, 1, .1, .1)
  window:SetStartAnimation(true, true)

  window:SetHandler("OnScale", function (self)
    CorrectWidgetScreenPos(window)
  end)

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
