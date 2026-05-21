if X2Locale:GetLocale() == "fr" then
  locale.addon.title                  = "Auto Stockage"
  locale.addon.storageModule.title    = "Stockage"
  locale.addon.storageModule.tooltip  =
    "Sélectionnez le coffre de stockage depuis lequel les objets seront déposés ou retirés."
  locale.addon.filterModule.title     = "Filtre"
  locale.addon.filterModule.tooltip   =
    "Les objets peuvent être filtrés par les catégories valides pour les coffres de poche et peuvent être " ..
    "recherchés par catégorie ou nom. Définissez un numéro de slot de début ou de fin pour déterminer " ..
    "où le transfert d'objets doit commencer et se terminer."
  locale.addon.filterModule.transfer  = "Transférer les objets liés"
  locale.addon.filterModule.startSlot = "Début : 1"
  locale.addon.filterModule.endSlot   = "Fin : 150"
  locale.addon.inventoryFull          = "|nr;Inventaire ou stockage plein !|r"
end
