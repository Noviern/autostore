if X2Locale:GetLocale() == "ru" then
  locale.addon.title                  = "Авто-хранилище"
  locale.addon.storageModule.title    = "Хранилище"
  locale.addon.storageModule.tooltip  =
    "Выберите сундук хранения, из которого предметы будут помещаться или извлекаться."
  locale.addon.filterModule.title     = "Фильтр"
  locale.addon.filterModule.tooltip   =
    "Предметы можно фильтровать по допустимым категориям для карманных сундуков, а также искать " ..
    "по категории или названию. Установите номер начального или конечного слота, чтобы определить, " ..
    "где должно начинаться и заканчиваться перемещение предметов."
  locale.addon.filterModule.transfer  = "Перемещать привязанные предметы"
  locale.addon.filterModule.startSlot = "Начало: 1"
  locale.addon.filterModule.endSlot   = "Конец: 150"
  locale.addon.inventoryFull          = "|nr;Инвентарь или хранилище заполнено!|r"
end
