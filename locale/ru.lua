if X2Locale:GetLocale() == "ru" then
  locale.addon.title                                 = "Авто-хранилище"
  locale.addon.storageModule.title                   = "Хранилище"
  locale.addon.storageModule.tooltip                 =
    "Выберите место хранения, которое сейчас открыто, для пополнения или изъятия предметов :\n" ..
    "|bu◆;Сундук хранения (включая карманные сундуки)|br\n" ..
    "|bu◆;Склад|br\n"
  locale.addon.filterModule.title                    = "Фильтр"
  locale.addon.filterModule.tooltip                  =
    "Предметы можно фильтровать по :\n" ..
    "|bu◆;Выбору фильтра карманного сундука|br\n" ..
    "|bu◆;Поиску по названию или категории|br\n" ..
    "|bu◆;Вводу индекса начального или конечного слота|br\n\n" ..
    "Предметы, заблокированные в своей позиции, не будут перемещены.\n\n" ..
    "Расширенный поиск:\n" ..
    "Шаблоны\n" ..
    "|bu◆;(|nc;.|r) Любой символ|br\n" ..
    "|bu◆;(|nc;%a|r) Буквы|br\n" ..
    "|bu◆;(|nc;%d|r) Цифры|br\n\n" ..
    "Модификаторы шаблонов\n" ..
    "|bu◆;(|nc;+|r) 1 или более|br\n" ..
    "|bu◆;(|nc;*|r) 0 или более|br\n" ..
    "|bu◆;(|nc;-|r) Кратчайшее совпадение|br\n" ..
    "|bu◆;(|nc;?|r) Необязательно|br\n\n" ..
    "Пример:\n" ..
    "Карта сокровищ с ключами W и S: \n" ..
    "W .+ S\n\n" ..
    "Примечание: Использование Авто-сортировки не обновляет индексы слотов. " ..
    "Из-за этого предметы могут визуально перемещаться в неправильном порядке. " ..
    "Чтобы исправить, закройте и снова откройте окно хранилища."
  locale.addon.filterModule.onlyTransferExisting     = "Переносить только существующие элементы"
  locale.addon.filterModule.transfer                 = "Перемещать привязанные предметы"
  locale.addon.filterModule.autoCancel               = "Отменить при полном инвентаре"
  locale.addon.filterModule.reset                    = "Сбросить фильтр"
  locale.addon.filterModule.startSlot                = "Начало: 1"
  locale.addon.filterModule.endSlot                  = "Конец: 150"
  locale.addon.filterModule.cooldown                 = "200 мс"
  locale.addon.inventoryFull                         = "|nr;Инвентарь или хранилище заполнено!|r"
  locale.addon.autoSortDetected                      = "|nr;Обнаружена авто-сортировка!\nПожалуйста, прочтите подсказку фильтра (?).|r"
  -- https://wiki.archerage.to/ru-ru/db/items/
  locale.addon.pocketChest.adventurersChest          = "Вместительный сундук авантюриста"
  locale.addon.pocketChest.alchemistsChest           = "Сундук алхимика"
  locale.addon.pocketChest.animalBreedersChest       = "Вместительный сундук животновода"
  locale.addon.pocketChest.artisansChest             = "Вместительный сундук ремесленника"
  locale.addon.pocketChest.buildersChest             = "Вместительный сундук строителя"
  locale.addon.pocketChest.costumeCloset             = "Карманный гардероб"
  locale.addon.pocketChest.designChest               = "Сундук для эскизов"
  locale.addon.pocketChest.dreamDesignersChest       = "Сундук творца"
  locale.addon.pocketChest.equipmentEnhancementChest = "Карманное хранилище мастера"
  locale.addon.pocketChest.equipmentMaterialChest    = "Ящик для материалов"
  locale.addon.pocketChest.farmersLargeChest         = "Вместительный сундук земледельца"
  locale.addon.pocketChest.fishermansChest           = "Вместительный сундук рыбака"
  locale.addon.pocketChest.flutterVessel             = "Хранилище глайдеров"
  locale.addon.pocketChest.furnitureChest            = "Хранилище мебели"
  locale.addon.pocketChest.gearChest                 = "Карманное хранилище обмундирования"
  locale.addon.pocketChest.instrumentTrunk           = "Сундук для инструментов"
  locale.addon.pocketChest.librariansChest           = "Карманное хранилище книг"
  locale.addon.pocketChest.machinesChest             = "Сундук инженера"
  locale.addon.pocketChest.musicChest                = "Шкатулка для нот"
  locale.addon.pocketChest.otherworldlyPetHotel      = "Карманная коллекция боевых питомцев"
  locale.addon.pocketChest.petsAndTransportTrunk     = "Большое хранилище для транспорта"
  locale.addon.pocketChest.ridersTrunk               = "Карманная коллекция питомцев"
  locale.addon.pocketChest.shardCollectorsChest      = "Сундук собирателя фрагментов"
  locale.addon.pocketChest.travelerNecessitiesChest  = "Карманный схрон странника"
  locale.addon.pocketChest.treasureHuntersChest      = "Сундук охотника за сокровищами"
  locale.addon.pocketChest.trophyHuntersChest        = "Сундук легендарного охотника"
end
