TEXT_COLOR = {
  DEFAULT = UIParent:GetFontColor("default"),
  BLUE    = UIParent:GetFontColor("blue"),
  GRAY    = UIParent:GetFontColor("gray"),
}

local prefix = "|c"

---@param value string
---@return boolean
local function CheckValidColorString(value)
  local firstIndex, lastIndex, matchedStr = value:find("^(%x%x%x%x%x%x%x%x)$")
  return firstIndex and lastIndex and matchedStr
end

---@param hexColor string
---@return RGBAColor
function Hex2Dec(hexColor)
  local valid = CheckValidColorString(hexColor)
  if not valid then
    return { 1, 0, 0, 1 }
  end

  local _, closeIdx = hexColor:find(prefix)
  if closeIdx ~= nil then
    hexColor = hexColor:sub(closeIdx + 1)
  end

  return {
    tonumber(hexColor:sub(3, 4), 16) / 255,
    tonumber(hexColor:sub(5, 6), 16) / 255,
    tonumber(hexColor:sub(7, 8), 16) / 255,
    tonumber(hexColor:sub(1, 2), 16) / 255,
  }
end
