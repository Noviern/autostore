if X2Locale:GetLocale() == "fr" then
  locale.addon.title                  = "Auto Stockage"
  locale.addon.storageModule.title    = "Stockage"
  locale.addon.storageModule.tooltip  =
    "Sélectionnez un emplacement de stockage actuellement ouvert pour y déposer ou en retirer des objets :\n" ..
    "|bu◆;Coffre de stockage (inclut les coffres de poche)|br\n" ..
    "|bu◆;Entrepôt|br\n"
  locale.addon.filterModule.title     = "Filtre"
  locale.addon.filterModule.tooltip   =
    "Les objets peuvent être filtrés par :\n" ..
    "|bu◆;Sélection d'un filtre Coffre de poche|br\n" ..
    "|bu◆;Recherche par nom ou catégorie|br\n" ..
    "|bu◆;Entrée d'un index de slot de début ou de fin|br\n\n" ..
    "Les objets verrouillés dans leur position ne seront pas transférés.\n\n" ..
    "Recherche avancée :\n" ..
    "Motifs\n" ..
    "|bu◆;(|nc;.|r) Tout caractère|br\n" ..
    "|bu◆;(|nc;%a|r) Lettres|br\n" ..
    "|bu◆;(|nc;%d|r) Chiffres|br\n\n" ..
    "Modificateurs de motif\n" ..
    "|bu◆;(|nc;+|r) 1 ou plus|br\n" ..
    "|bu◆;(|nc;*|r) 0 ou plus|br\n" ..
    "|bu◆;(|nc;-|r) Correspondance la plus courte|br\n" ..
    "|bu◆;(|nc;?|r) Facultatif|br\n\n" ..
    "Exemple :\n" ..
    "Carte au trésor avec les clés W et S : \n" ..
    "W .+ S\n\n" ..
    "Note : L'utilisation de l'Auto-Tri ne met pas à jour les indices de slot. " ..
    "Cela peut entraîner un transfert visuel des objets dans le mauvais ordre. " ..
    "Pour corriger cela, fermez et rouvrez l'emplacement de stockage."
  locale.addon.filterModule.transfer  = "Transférer les objets liés"
  locale.addon.filterModule.reset     = "Réinitialiser le filtre"
  locale.addon.filterModule.startSlot = "Début : 1"
  locale.addon.filterModule.endSlot   = "Fin : 150"
  locale.addon.filterModule.cooldown  = "200 ms"
  locale.addon.inventoryFull          = "|nr;Inventaire ou stockage plein !|r"
  locale.addon.autoSortDetected       = "|nr;Auto-Tri détecté !|r"
  locale.addon.pocketChest            = { -- https://wiki.archerage.to/ru-fr/db/items/
    adventurersChest          = "Adventurer's Chest",
    alchemistsChest           = "Alchemist's Chest",
    animalBreedersChest       = "Animal Breeder's Chest",
    artisansChest             = "Artisan's Chest",
    buildersChest             = "Builder's Chest",
    costumeCloset             = "Placard à costumes",
    designChest               = "Coffre design",
    dreamDesignersChest       = "Dream Designer's Chest",
    equipmentEnhancementChest = "Equipment Enhancement Chest",
    equipmentMaterialChest    = "Coffre de matériel d'équipement",
    farmersLargeChest         = "Farmer's Large Chest",
    fishermansChest           = "Fisherman's Chest",
    flutterVessel             = "Vaisseau voletant",
    furnitureChest            = "Coffre de décorations",
    gearChest                 = "Gear Chest",
    instrumentTrunk           = "Coffre à instruments",
    librariansChest           = "Librarian's Chest",
    machinesChest             = "Machine's Chest",
    musicChest                = "Coffre à musique",
    otherworldlyPetHotel      = "Hôtel pour familier de l'autre dimension",
    petsAndTransportTrunk     = "Coffre de familiers et transport",
    ridersTrunk               = "Coffre de cavalier",
    shardCollectorsChest      = "Shard Collector's Chest",
    travelerNecessitiesChest  = "Traveler Necessities Chest",
    treasureHuntersChest      = "Treasure Hunter's Chest",
    trophyHuntersChest        = "Trophy Hunter's Chest",
  }
end
