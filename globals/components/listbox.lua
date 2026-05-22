---@param listbox Listbox
function InitListbox(listbox)
  listbox.itemStyle:SetAlign(ALIGN_LEFT)
  listbox:SetInset(unpack(EDITBOX_WITH_BUTTON_INSET))
  listbox:SetOveredItemColor(0, 0.5, 1, 0.2)
  listbox:SetSelectedItemColor(0, 0.3, 0.5, 0.3)
  listbox:SetDefaultItemTextColor(unpack(TEXT_COLOR.DEFAULT))
  listbox:SetOveredItemTextColor(unpack(TEXT_COLOR.BLUE))
  listbox:SetSelectedItemTextColor(unpack(TEXT_COLOR.BLUE))
  listbox:SetDisableItemTextColor(unpack(TEXT_COLOR.GRAY))
end

---@param id string
---@param parent OptionalParent
---@return Listbox
---@nodiscard
function CreateListbox(id, parent)
  local listbox
  if parent and type(parent) ~= "string" then
    listbox = parent:CreateChildWidget("listbox", id, 0, true)
  else
    listbox = UIParent:CreateWidget("listbox", id, parent or "UIParent")
  end

  InitListbox(listbox)

  return listbox
end

---@param listbox ScrollListbox
function InitScrollListbox(listbox)
  local upButton = listbox.upBtn
  upButton:AddAnchor("TOPRIGHT", listbox, -4, 8)
  upButton:SetExtent(20, 12)
  upButton:SetStyle("slider_scroll_button_up")

  local downButton = listbox.downBtn
  downButton:AddAnchor("BOTTOMRIGHT", listbox, -4, -8)
  downButton:SetExtent(20, 12)
  downButton:SetStyle("slider_scroll_button_down")

  local vslider = listbox.vslider
  vslider:AddAnchor("TOPLEFT", upButton, "BOTTOMLEFT", 0, 0)
  vslider:AddAnchor("BOTTOMRIGHT", downButton, "TOPRIGHT", 0, 0)

  local vsliderBackground = vslider:CreateDrawable(TEXTURE_PATH.SCROLL, "scroll_frame_bg", "background")
  vsliderBackground:SetTextureColor("default")
  vsliderBackground:AddAnchor("TOPLEFT", vslider, 3, -9)
  vsliderBackground:AddAnchor("BOTTOMRIGHT", vslider, -3, 9)
  vslider.background = vsliderBackground

  local thumb = vslider.thumb
  thumb:SetWidth(20)

  SetViewOfButtonBackground(thumb, TEXTURE_PATH.SCROLL, "thumb")
end

---@param scrollListbox ScrollListbox
function UpdateScrollListboxControlVisibility(scrollListbox)
  local max = scrollListbox:GetMaxTop()
  local show = max > 0

  scrollListbox.vslider:SetMinMaxValues(0, max)
  scrollListbox.vslider:Show(show)

  scrollListbox.upBtn:Show(show)
  scrollListbox.downBtn:Show(show)
end

---@param listbox Listbox
---@return ScrollListbox
function CreateScrollForListbox(listbox)
  listbox.downBtn = listbox:CreateChildWidget("button", "downBtn", 0, true)
  listbox.upBtn = listbox:CreateChildWidget("button", "upBtn", 0, true)
  listbox.vslider = listbox:CreateChildWidget("slider", "vslider", 0, true)
  listbox.vslider.thumb = listbox.vslider:CreateChildWidget("button", "thumb", 0, true)

  listbox.vslider:SetThumbButtonWidget(listbox.vslider.thumb)

  ---@cast listbox ScrollListbox
  InitScrollListbox(listbox)

  return listbox
end

---@param listbox ScrollListbox
function OverrideScrollListboxMethods(listbox)
  ---Overrides the default Dropdown:AppendItem so that UpdateScrollListboxControlVisibility
  ---is called afterwards.
  local DropdownAppendItem = listbox.AppendItem

  function listbox:AppendItem(...)
    local result = DropdownAppendItem(self, ...)
    UpdateScrollListboxControlVisibility(listbox)
    return result
  end

  ---Overrides the default Dropdown:AppendItemByTable so that UpdateScrollListboxControlVisibility
  ---is called afterwards.
  local DropdownAppendItemByTable = listbox.AppendItemByTable

  function listbox:AppendItemByTable(...)
    local result = DropdownAppendItemByTable(self, ...)
    UpdateScrollListboxControlVisibility(listbox)
    return result
  end

  ---Overrides the default Dropdown:SetItem so that UpdateScrollListboxControlVisibility
  ---is called afterwards.
  local DropdownSetItem = listbox.SetItem

  function listbox:SetItem(...)
    local result = DropdownSetItem(self, ...)
    UpdateScrollListboxControlVisibility(listbox)
    return result
  end

  ---Overrides the default Dropdown:SetItemTrees so that UpdateScrollListboxControlVisibility
  ---is called afterwards.
  local DropdownSetItemTrees = listbox.SetItemTrees

  function listbox:SetItemTrees(...)
    local result = DropdownSetItemTrees(self, ...)
    UpdateScrollListboxControlVisibility(listbox)
    return result
  end
end

---@param scrollListbox ScrollListbox
function AttachScrollListboxBehavior(scrollListbox)
  local vslider = scrollListbox.vslider

  vslider:SetHandler("OnSliderChanged", function (self, value)
    scrollListbox:SetTop(value)
  end)

  scrollListbox:SetHandler("OnWheelUp", function () vslider:Up(1) end)
  scrollListbox:SetHandler("OnWheelDown", function () vslider:Down(1) end)

  scrollListbox.upBtn:SetHandler("OnClick", function () vslider:Up(1) end)
  scrollListbox.downBtn:SetHandler("OnClick", function () vslider:Down(1) end)
end

---@param id string
---@param parent OptionalParent
---@return ScrollListbox
---@nodiscard
function CreateScrollListbox(id, parent)
  local listbox = CreateListbox(id, parent)
  local scrollListbox = CreateScrollForListbox(listbox)
  OverrideScrollListboxMethods(scrollListbox)
  AttachScrollListboxBehavior(scrollListbox)

  return scrollListbox
end
