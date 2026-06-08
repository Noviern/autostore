local function CheckValidColorString(value)
  if type(value) ~= "string" then
    return false
  end
  local firstIndex, lastIndex, matchedStr = string.find(value, "^(%x%x%x%x%x%x%x%x)$")
  if firstIndex == nil or lastIndex == nil or matchedStr == nil then
    return false
  end
  return true
end

local prefix = "|c"
function ConvertColor(value)
  if value == nil or type(value) ~= "number" then
    return 0
  end
  return value / 255
end

function Hex2Dec(stringValue)
  local valid = CheckValidColorString(stringValue)
  if not valid then
    return {
      1,
      0,
      0,
      1
    }
  end
  local colors = {}
  local _, closeIdx = string.find(stringValue, prefix)
  if closeIdx ~= nil then
    stringValue = string.sub(stringValue, closeIdx + 1)
  end
  colors[1] = string.sub(stringValue, 3, 4)
  colors[2] = string.sub(stringValue, 5, 6)
  colors[3] = string.sub(stringValue, 7, 8)
  colors[4] = string.sub(stringValue, 1, 2)
  for i = 1, #colors do
    colors[i] = tonumber(string.format("0x" .. colors[i]))
    colors[i] = ConvertColor(colors[i])
  end
  return colors
end
