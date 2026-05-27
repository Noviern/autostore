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
    title       = "Filter",
    tooltip     =
      "Items can be filtered by:\n" ..
      "|bu◆;Selecting a Pocket Chest filter|br\n" ..
      "|bu◆;Searcing by name or category|br\n" ..
      "|bu◆;Entering a start or end slot index|br\n\n" ..
      "Items locked in their position will not be transfered.\n\n" ..
      "Note: Using Auto-Sort does not update the slot indices. " ..
      "This can cause items to be visually transfered in the incorrect order. " ..
      "To fix this, close and reopen the storage location.",
    transfer    = "Transfer bound items",
    reset       = "Reset Filter",
    searchGuide = X2Locale:LocalizeUiText(COMMON_TEXT, "search_iteam"),
    startSlot   = "Start: 1",
    endSlot     = "End: 150",
    cooldown    = "200ms",
  },
  inventoryFull    = "|nr;Inventory or storage is full!|r",
  autoSortDetected = "|nr;Auto-Sort detected!|r",
  transaction      = {
    deposit  = X2Locale:LocalizeUiText(INVEN_TEXT, "deposit"),
    withdraw = X2Locale:LocalizeUiText(INVEN_TEXT, "withdraw"),
    cancel   = X2Locale:LocalizeUiText(COMMON_TEXT, "cancel"),
  },
  filterAll        = X2Locale:LocalizeUiText(COMMON_TEXT, "all"),
  pocketChest      = {
    costumeCloset             = "Costume Closet",
    furnitureChest            = "Furniture Chest",
    alchemistsChest           = "Alchemist's Chest",
    otherworldlyPetHotel      = "Otherworldly Pet Hotel",
    ridersTrunk               = "Rider's Trunk",
    shardCollectorsChest      = "Shard Collector's Chest",
    flutterVessel             = "Flutter Vessel",
    petsAndTransportTrunk     = "Pets & Transport Trunk",
    adventurersChest          = "Adventurer's Chest",
    buildersChest             = "Builder's Chest",
    equipmentEnhancementChest = "Equipment Enhancement Chest",
    farmersLargeChest         = "Farmer's Large Chest",
    gearChest                 = "Gear Chest",
    librariansChest           = "Librarian's Chest",
    machinesChest             = "Machine's Chest",
    animalBreedersChest       = "Animal Breeder's Chest",
    artisansChest             = "Artisan's Chest",
    travelerNecessitiesChest  = "Traveler Necessities Chest",
    treasureHuntersChest      = "Treasure Hunter's Chest",
    trophyHuntersChest        = "Trophy Hunter's Chest",
    designChest               = "Design Chest",
    instrumentTrunk           = "Instrument Trunk",
    musicChest                = "Music Chest",
    fishermansChest           = "Fisherman's Chest",
    dreamDesignersChest       = "Dream Designer's Chest",
  }
}
