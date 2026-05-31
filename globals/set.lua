---@param list table
---@return table
---@nodiscard
function Set(list)
  local set = {}
  for _, v in ipairs(list) do
    set[v] = true
  end
  return set
end
