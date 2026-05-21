if X2Locale:GetLocale() == "zh_cn" then
  locale.addon.title                  = "自动存放"
  locale.addon.storageModule.title    = "存储"
  locale.addon.storageModule.tooltip  = "选择用于存入或取出物品的存储箱。"
  locale.addon.filterModule.title     = "过滤器"
  locale.addon.filterModule.tooltip   =
    "物品可按口袋箱的有效类别进行过滤，并可通过类别或名称进行搜索。设置起始槽位或结束槽位编号，以确定物品传输的开始和结束位置。"
  locale.addon.filterModule.transfer  = "传输绑定物品"
  locale.addon.filterModule.startSlot = "起始：1"
  locale.addon.filterModule.endSlot   = "结束：150"
  locale.addon.inventoryFull          = "|nr;背包或存储已满！|r"
end
