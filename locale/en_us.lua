if locale == nil then
  locale = {}
end

locale.addon = {
  title            = "Auto Store",
  filterModule     = {
    title                          = "Filter",
    tooltip                        =
      "Items locked in their position will not be transfered.\n\n" ..
      "Advanced Search:\n" ..
      "Multiple Queries\n" ..
      "|bu◆;Multiple search queries can be combined using (|nc;;|r) (semicolon) between terms|br\n\n" ..
      "Example:\n" ..
      "|nc;fruit;herb|r includes item names and categories containing |nc;fruit|r or |nc;herb|r\n\n" ..
      "Negation\n" ..
      "|bu◆;Start with (|nc;-|r) (hyphen) to negate the search|br\n\n" ..
      "Example:\n" ..
      "|nc;-fruit|r excludes item names and categories containing \"|nc;fruit|r\"\n\n" ..
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
    onlyTransferExistingCategories = "Only transfer existing categories",
    reset                          = "Reset Filter",
    onlyTransferExistingItems      = "Only transfer existing items",
    transferBound                  = "Transfer bound items",
    autoCancel                     = "Cancel on full inventory",
    pocketChestFilter              = "Pocketchest\nFilter",
    grade                          = X2Locale:LocalizeUiText(AUCTION_TEXT, "item_grade"),
    searchGuide                    = X2Locale:LocalizeUiText(COMMON_TEXT, "search_iteam"),
    startSlot                      = "Start: 1",
    endSlot                        = "End: 150",
    cooldown                       = "200ms",
  },
  inventoryFull    = "|nr;Inventory or storage is full!|r",
  autoSortDetected = "|nr;Auto-Sort detected!\nPlease read filter (?) tooltip.|r",
  transaction      = {
    deposit  = X2Locale:LocalizeUiText(INVEN_TEXT, "deposit"),
    withdraw = X2Locale:LocalizeUiText(INVEN_TEXT, "withdraw"),
    cancel   = X2Locale:LocalizeUiText(COMMON_TEXT, "cancel"),
  },
}
