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
  filter           = {
    ["Costume Closet"] = {
      ["Costume"] = true,
      ["Daru Costume"] = true,
      ["Cosmetic Materials"] = true,

      ["Synthesis Gear"] = true,
    },

    ["Furniture Chest"] = {
      ["Furniture"] = true,
      ["Taxidermy"] = true,
    },

    ["Alchemist's Chest"] = {
      ["Archeum"] = true,
      ["Alchemy"] = true,
      ["Alchemy Oil"] = true,

      ["Special Material"] = true,
      ["Herb"] = true,
    },

    ["Otherworldly Pet Hotel"] = {
      ["Battle Pet"] = true,
      ["Pets"] = true,
      ["Powerstone Pet"] = true,
    },

    ["Rider's Trunk"] = {
      ["Mount"] = true,
      ["Giant Pet"] = true,
    },

    ["Shard Collector's Chest"] = {
      ["Shard"] = true,
    },

    ["Flutter Vessel"] = {
      ["Glider"] = true,
      ["Magithopter"] = true,
    },

    ["Pets & Transport Trunk"] = {
      ["Ship"] = true,
      ["Vehicle"] = true,
    },

    ["Adventurer's Chest"] = {
      ["Coinpurse"] = true,
      ["Valuable Crate"] = true,
      ["Key"] = true,
      ["Coin"] = true,
      ["Currency"] = true,

      ["Mechanical Component Design Bag"] = true,
    },

    ["Builder's Chest"] = {
      ["Buildings"] = true,
    },

    ["Equipment Enhancement Chest"] = {
      ["Synthesis Materials"] = true,
      ["Awakening Materials"] = true,
      ["Enchancement Materials"] = true,
      ["Lunagem"] = true,
      ["Lunastone"] = true,
    },

    ["Farmer's Large Chest"] = {
      ["Fruit"] = true,
      ["Vegetable"] = true,
      ["Spice"] = true,
      ["Flower"] = true,
      ["Grain"] = true,
      ["Seed"] = true,
      ["Textile"] = true,
      ["Livestock"] = true,
      ["Saplings"] = true,
      ["Soil"] = true,

      ["Special Consumables"] = true,
      ["Seafood"] = true,
      ["Livestock products"] = true,
      ["Meat"] = true,
      ["Pelt"] = true,
      ["Herb"] = true,
      ["Special Material"] = true,
    },

    ["Gear Chest"] = {
      ["Unidentified Equipment"] = true,
      ["Farmhand Equipment"] = true,
      ["Pet Gear"] = true,
      ["Leather Armor"] = true,
      ["Cloth Armor"] = true,
      ["Plate Armor"] = true,
      ["Cloak"] = true,
      ["Dagger"] = true,
      ["Sword"] = true,
      ["Katana"] = true,
      ["Shortspear"] = true,
      ["Axe"] = true,
      ["Club"] = true,
      ["Scepter"] = true,
      ["Greatsword"] = true,
      ["Nodachi"] = true,
      ["Longspear"] = true,
      ["Greataxe"] = true,
      ["Greatclub"] = true,
      ["Staff"] = true,
      ["Shield"] = true,
      ["Earring"] = true,
      ["Necklace"] = true,
      ["Ring"] = true,
      ["Flute"] = true,
      ["Lute"] = true,
      ["Bow"] = true,
      ["Rifle"] = true,

      ["Underwater Equipment"] = true,
      ["Fishing Rod"] = true,
      ["Synthesis Gear"] = true,
    },

    ["Librarian's Chest"] = {
      ["Book"] = true,
    },

    ["Machine's Chest"] = {
      ["Mast"] = true,
      ["Ship Propellant"] = true,
      ["Ship Design"] = true,
      ["Ship Component Design"] = true,
      ["Machine Component Scroll"] = true,
      ["Vehicle Component Design"] = true,
      ["Misc. Apparatus"] = true,
      ["Machining"] = true,
      ["Armament"] = true,
      ["Sound Equipment"] = true,
      ["Sail"] = true,
      ["Storage"] = true,
      ["Navigation"] = true,
      ["Boarding Equipment"] = true,
      ["Steering Gear"] = true,
      ["Mechanical Components"] = true,
      ["Figurehead"] = true,
      ["Lighting"] = true,

      ["Music Disc"] = true,
      ["Mechanical Component Design Bag"] = true,
    },

    ["Animal Breeder's Chest"] = {
      ["Cooking Oil"] = true,
      ["Feed"] = true,

      ["Pelt"] = true,
      ["Textile"] = true,
      ["Meat"] = true,
      ["Seafood"] = true,
      ["Livestock products"] = true,
      ["Special Consumables"] = true,
    },

    ["Artisan's Chest"] = {
      ["Metal"] = true,
      ["Lumber"] = true,
      ["Stone Brick"] = true,
      ["Hide"] = true,
      ["Fabric"] = true,
      ["Ore"] = true,
      ["Hardwood"] = true,
      ["Raw Stone"] = true,
      ["Precious Metal"] = true,
      ["Gem"] = true,
      ["Rubber"] = true,

      ["Textile"] = true,
      ["Pelt"] = true,
      ["Special Material"] = true,
    },

    ["Traveler's Necessities Chest"] = {
      ["Food"] = true,
      ["Potion"] = true,
      ["Drink"] = true,
      ["Mana Potion"] = true,
      ["Defense Potion"] = true,
      ["Healing Potion"] = true,
      ["Boosters"] = true,

      ["Special Consumables"] = true,
    },

    ["Treasure Hunter's Chest"] = {
      ["Treasure Map"] = true,
      ["Relic"] = true,
      ["Treasure Hunter's Consumables"] = true,
    },

    ["Trophy Hunter's Chest"] = {
      ["Legendary Trophy"] = true,
    },

    ["Design Chest"] = {
      ["Crest and Dye Items"] = true,
    },

    ["Instrument Trunk"] = {
      ["Flute"] = true,
      ["Lute"] = true,
    },

    ["Music Chest"] = {
      ["Sheet Music"] = true,

      ["Music Disc"] = true,
    },

    ["Fisherman's Chest"] = {

      ["Underwater Equipment"] = true,
      ["Fishing Rod"] = true,
      ["Seafood"] = true,
      ["Special Consumables"] = true,
    },

    ["Dream Designer's Chest"] = {
      ["Dream Design"] = true,
      ["Art Object"] = true,
    },

    -- [""] = {
    --   [""] = true,
    -- },
  }
}

-- function X2Locale:GetLocale()
-- return "fr"
-- return "ru"
-- return "zh_cn"
-- end
