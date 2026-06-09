ICON_SIZE     = 42
ICON_GAP_SIZE = 2

---@class IconGroupData
---@field columns number
---@field rows number
---@field iconSize number|nil
---@field gapSize number|nil

---@param id string
---@param parent OptionalParent
---@param initData IconGroupData
---@return EmptyWidget
---@nodiscard
function CreateIconGroup(id, parent, initData)
  local frame
  if parent and type(parent) ~= "string" then
    frame = parent:CreateChildWidget("emptywidget", id, 0, true)
  else
    frame = UIParent:CreateWidget("emptywidget", id, parent or "UIParent")
  end

  initData.iconSize = initData.iconSize or ICON_SIZE
  initData.gapSize = initData.gapSize or ICON_GAP_SIZE

  frame.background = CreateTextureBackground(frame, TEXTURE_PATH.DEFAULT, "editbox_df")
  frame:SetExtent(
    initData.iconSize * initData.columns + COMMON.SPACING * 2,
    initData.iconSize * initData.rows + COMMON.SPACING * 2
  )

  local listCtrl = frame:CreateChildWidget("listctrl", "listCtrl", 0, true)
  listCtrl:AddAnchor("TOPLEFT", frame, COMMON.SPACING, COMMON.SPACING)
  listCtrl:AddAnchor("BOTTOMRIGHT", frame, -COMMON.SPACING, -COMMON.SPACING)
  listCtrl:SetHeaderColumnHeight(0)

  for _ = 1, initData.columns do
    listCtrl:InsertColumn(initData.iconSize, LCCIT_BUTTON)
  end

  listCtrl:InsertRows(initData.rows, false)

  for row = 1, initData.rows do
    local rowButtons = listCtrl.items[row].subItems

    for _, button in ipairs(rowButtons) do
      ---@cast button Button
      button.background = CreateTextureBackground(button, TEXTURE_PATH.HUD, "action_slot_default_bg", "dimmed")
      button.background:AddAnchor("TOPLEFT", button, initData.gapSize, initData.gapSize)
      button.background:AddAnchor("BOTTOMRIGHT", button, -initData.gapSize, -initData.gapSize)
    end
  end

  return frame
end
