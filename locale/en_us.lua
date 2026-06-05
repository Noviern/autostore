if locale == nil then
  locale = {}
end

locale.addon = {
  title            = "Auto Store",
  storageModule    = {
    title   = "Storage",
    tooltip =
      "Select a storage location that is currently open to deposit or withdraw items from:\n" ..
      "|bu◆;Storage Chest (includes pocket chests)|br\n" ..
      "|bu◆;Warehouse|br\n",
    coffer  = X2Locale:LocalizeUiText(WINDOW_TITLE_TEXT, "coffer"),
    bank    = X2Locale:LocalizeUiText(WINDOW_TITLE_TEXT, "bank"),
  },
  filterModule     = {
    title                = "Filter",
    tooltip              =
      "Items can be filtered by:\n" ..
      "|bu◆;Selecting a Pocket Chest filter|br\n" ..
      "|bu◆;Searcing by name or category|br\n" ..
      "|bu◆;Entering a start or end slot index|br\n\n" ..
      "Items locked in their position will not be transfered.\n\n" ..
      "Advanced Search:\n" ..
      "Patterns\n" ..
      "|bu◆;(|nc;.|r) Any character|br\n" ..
      "|bu◆;(|nc;%a|r) Letters|br\n" ..
      "|bu◆;(|nc;%d|r) Digits|br\n\n" ..
      "Pattern Modifiers\n" ..
      "|bu◆;(|nc;+|r) 1 or more|br\n" ..
      "|bu◆;(|nc;*|r) 0 or more|br\n" ..
      "|bu◆;(|nc;-|r) Shortest match|br\n" ..
      "|bu◆;(|nc;?|r) Optional|br\n\n" ..
      "Example:\n" ..
      "Treasure map with W and S keys: \n" ..
      "W .+ S\n\n" ..
      "Note: Using Auto-Sort does not update the slot indices. " ..
      "This can cause items to be visually transfered in the incorrect order. " ..
      "To fix this, close and reopen the storage location.",
    onlyTransferExisting = "Only transfer existing items",
    transfer             = "Transfer bound items",
    autoCancel           = "Cancel on full inventory",
    reset                = "Reset Filter",
    searchGuide          = X2Locale:LocalizeUiText(COMMON_TEXT, "search_iteam"),
    startSlot            = "Start: 1",
    endSlot              = "End: 150",
    cooldown             = "200ms",
  },
  inventoryFull    = "|nr;Inventory or storage is full!|r",
  autoSortDetected = "|nr;Auto-Sort detected!\nPlease read filter (?) tooltip.|r",
  transaction      = {
    deposit  = X2Locale:LocalizeUiText(INVEN_TEXT, "deposit"),
    withdraw = X2Locale:LocalizeUiText(INVEN_TEXT, "withdraw"),
    cancel   = X2Locale:LocalizeUiText(COMMON_TEXT, "cancel"),
  },
  filterAll        = X2Locale:LocalizeUiText(COMMON_TEXT, "all"),
  pocketChest      = {
    adventurersChest          = "Adventurer's Chest",
    alchemistsChest           = "Alchemist's Chest",
    animalBreedersChest       = "Animal Breeder's Chest",
    artisansChest             = "Artisan's Chest",
    buildersChest             = "Builder's Chest",
    costumeCloset             = "Costume Closet",
    designChest               = "Design Chest",
    dreamDesignersChest       = "Dream Designer's Chest",
    equipmentEnhancementChest = "Equipment Enhancement Chest",
    equipmentMaterialChest    = "Equipment Material Chest",
    farmersLargeChest         = "Farmer's Large Chest",
    fishermansChest           = "Fisherman's Chest",
    flutterVessel             = "Flutter Vessel",
    furnitureChest            = "Furniture Chest",
    gearChest                 = "Gear Chest",
    instrumentTrunk           = "Instrument Trunk",
    librariansChest           = "Librarian's Chest",
    machinesChest             = "Machine's Chest",
    musicChest                = "Music Chest",
    otherworldlyPetHotel      = "Otherworldly Pet Hotel",
    petsAndTransportTrunk     = "Pets & Transport Trunk",
    ridersTrunk               = "Rider's Trunk",
    shardCollectorsChest      = "Shard Collector's Chest",
    travelerNecessitiesChest  = "Traveler Necessities Chest",
    treasureHuntersChest      = "Treasure Hunter's Chest",
    trophyHuntersChest        = "Trophy Hunter's Chest",
  }
}
