for _, id in pairs(API) do
  ADDON:ImportAPI(id)
end

for _, id in pairs(OBJECT) do
  ADDON:ImportObject(id)
end
