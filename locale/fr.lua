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
    "Note : L'utilisation de l'Auto-Tri ne met pas à jour les indices de slot. " ..
    "Cela peut entraîner un transfert visuel des objets dans le mauvais ordre. " ..
    "Pour corriger cela, fermez et rouvrez l'emplacement de stockage."
  locale.addon.filterModule.transfer  = "Transférer les objets liés"
  locale.addon.filterModule.startSlot = "Début : 1"
  locale.addon.filterModule.endSlot   = "Fin : 150"
  locale.addon.filterModule.cooldown  = "200 ms"
  locale.addon.inventoryFull          = "|nr;Inventaire ou stockage plein !|r"
  locale.addon.autoSortDetected       = "|nr;Auto-Tri détecté !|r"
end
