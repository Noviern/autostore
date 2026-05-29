if X2Locale:GetLocale() == "ru" then
  locale.addon.title                  = "Авто-хранилище"
  locale.addon.storageModule.title    = "Хранилище"
  locale.addon.storageModule.tooltip  =
    "Выберите место хранения, которое сейчас открыто, для пополнения или изъятия предметов :\n" ..
    "|bu◆;Сундук хранения (включая карманные сундуки)|br\n" ..
    "|bu◆;Склад|br\n"
  locale.addon.filterModule.title     = "Фильтр"
  locale.addon.filterModule.tooltip   =
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
  locale.addon.filterModule.transfer  = "Перемещать привязанные предметы"
  locale.addon.filterModule.reset     = "Сбросить фильтр"
  locale.addon.filterModule.startSlot = "Начало: 1"
  locale.addon.filterModule.endSlot   = "Конец: 150"
  locale.addon.filterModule.cooldown  = "200 мс"
  locale.addon.inventoryFull          = "|nr;Инвентарь или хранилище заполнено!|r"
  locale.addon.autoSortDetected       = "|nr;Обнаружена авто-сортировка!|r"
  locale.addon.pocketChest            = { -- https://wiki.archerage.to/ru-ru/db/items/
    adventurersChest          = "Вместительный сундук авантюриста",
    alchemistsChest           = "Сундук алхимика",
    animalBreedersChest       = "Вместительный сундук животновода",
    artisansChest             = "Вместительный сундук ремесленника",
    buildersChest             = "Вместительный сундук строителя",
    costumeCloset             = "Карманный гардероб",
    designChest               = "Сундук для эскизов",
    dreamDesignersChest       = "Сундук творца",
    equipmentEnhancementChest = "Карманное хранилище мастера",
    equipmentMaterialChest    = "Ящик для материалов",
    farmersLargeChest         = "Вместительный сундук земледельца",
    fishermansChest           = "Вместительный сундук рыбака",
    flutterVessel             = "Хранилище глайдеров",
    furnitureChest            = "Хранилище мебели",
    gearChest                 = "Карманное хранилище обмундирования",
    instrumentTrunk           = "Сундук для инструментов",
    librariansChest           = "Карманное хранилище книг",
    machinesChest             = "Сундук инженера",
    musicChest                = "Шкатулка для нот",
    otherworldlyPetHotel      = "Карманная коллекция боевых питомцев",
    petsAndTransportTrunk     = "Большое хранилище для транспорта",
    ridersTrunk               = "Карманная коллекция питомцев",
    shardCollectorsChest      = "Сундук собирателя фрагментов",
    travelerNecessitiesChest  = "Карманный схрон странника",
    treasureHuntersChest      = "Сундук охотника за сокровищами",
    trophyHuntersChest        = "Сундук легендарного охотника",
  }
end
