if X2Locale:GetLocale() == "ru" then
  locale.addon.title                                       = "Авто-хранилище"
  locale.addon.filterModule.title                          = "Фильтр"
  locale.addon.filterModule.tooltip                        =
    "Предметы, заблокированные в своей позиции, не будут перемещены.\n\n" ..
    "Расширенный поиск :\n" ..
    "Несколько запросов\n" ..
    "|bu◆;Несколько поисковых запросов можно объединить с помощью (|nc;;|r) (точка с запятой)|br\n\n" ..
    "Пример :\n" ..
    "|nc;фрукт;трава|r включает названия и категории, содержащие |nc;фрукт|r или |nc;трава|r\n\n" ..
    "Отрицание\n" ..
    "|bu◆;Начните с (|nc;-|r) (дефис) для исключения|br\n\n" ..
    "Пример :\n" ..
    "|nc;-фрукт|r исключает названия и категории, содержащие \"|nc;фрукт|r\"\n\n" ..
    "Шаблоны :\n" ..
    "|bu◆;(|nc;.|r) Любой символ|br\n" ..
    "|bu◆;(|nc;%a|r) Буквы|br\n" ..
    "|bu◆;(|nc;%d|r) Цифры|br\n\n" ..
    "Модификаторы шаблонов\n" ..
    "|bu◆;(|nc;+|r) 1 или более|br\n" ..
    "|bu◆;(|nc;*|r) 0 или более|br\n" ..
    "|bu◆;(|nc;-|r) Кратчайшее совпадение|br\n" ..
    "|bu◆;(|nc;?|r) Необязательный|br\n\n" ..
    "Пример :\n" ..
    "Карта сокровищ с клавишами W и S :\n" ..
    "W .+ S\n\n" ..
    "Примечание: Использование Авто-сортировки не обновляет индексы слотов. " ..
    "Из-за этого предметы могут визуально перемещаться в неправильном порядке. " ..
    "Чтобы исправить, закройте и снова откройте окно хранилища."
  locale.addon.filterModule.onlyTransferExistingCategories = "Переносить только существующие категории"
  locale.addon.filterModule.reset                          = "Сбросить фильтр"
  locale.addon.filterModule.onlyTransferExistingItems      = "Переносить только существующие предметы"
  locale.addon.filterModule.transfer                       = "Перемещать привязанные предметы"
  locale.addon.filterModule.autoCancel                     = "Отменить при полном инвентаре"
  locale.addon.filterModule.pocketChestFilter              = "Фильтр карманного\nсундука"
  locale.addon.filterModule.startSlot                      = "Начало: 1"
  locale.addon.filterModule.endSlot                        = "Конец: 150"
  locale.addon.filterModule.cooldown                       = "200мс"
  locale.addon.inventoryFull                               = "|nr;Инвентарь или хранилище заполнено!|r"
  locale.addon.autoSortDetected                            = "|nr;Обнаружена авто-сортировка!\nПрочитайте подсказку фильтра (?).|r"
end
