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
    costumeCloset             = "Карманный гардероб",
    furnitureChest            = "Хранилище мебели",
    alchemistsChest           = "Сундук алхимика",
    otherworldlyPetHotel      = "Карманная коллекция боевых питомцев",
    ridersTrunk               = "Карманная коллекция питомцев",
    shardCollectorsChest      = "Сундук собирателя фрагментов",
    flutterVessel             = "Хранилище глайдеров",
    petsAndTransportTrunk     = "Большое хранилище для транспорта",
    adventurersChest          = "Вместительный сундук авантюриста",
    buildersChest             = "Вместительный сундук строителя",
    equipmentEnhancementChest = "Карманное хранилище мастера",
    farmersLargeChest         = "Вместительный сундук земледельца",
    gearChest                 = "Карманное хранилище обмундирования",
    librariansChest           = "Карманное хранилище книг",
    machinesChest             = "Сундук инженера",
    animalBreedersChest       = "Вместительный сундук животновода",
    artisansChest             = "Вместительный сундук ремесленника",
    travelerNecessitiesChest  = "Карманный схрон странника",
    treasureHuntersChest      = "Сундук охотника за сокровищами",
    trophyHuntersChest        = "Сундук легендарного охотника",
    designChest               = "Сундук для эскизов",
    instrumentTrunk           = "Сундук для инструментов",
    musicChest                = "Шкатулка для нот",
    fishermansChest           = "Вместительный сундук рыбака",
    dreamDesignersChest       = "Сундук творца",
  }
end
