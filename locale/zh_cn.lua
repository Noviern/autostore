if X2Locale:GetLocale() == "zh_cn" then
  locale.addon.title                                       = "自动存放"
  locale.addon.filterModule.title                          = "过滤器"
  locale.addon.filterModule.tooltip                        =
    "锁定在原位置的物品不会被转移。\n\n" ..
    "高级搜索：\n" ..
    "多重查询\n" ..
    "|bu◆;多个搜索条件可用 (|nc;;|r) （分号）分隔|br\n\n" ..
    "示例：\n" ..
    "|nc;水果;草药|r 会包含名称或类别中含有 |nc;水果|r 或 |nc;草药|r 的物品\n\n" ..
    "否定搜索\n" ..
    "|bu◆;以 (|nc;-|r) （连字符）开头可排除搜索|br\n\n" ..
    "示例：\n" ..
    "|nc;-水果|r 会排除名称或类别中包含 \"|nc;水果|r\" 的物品\n\n" ..
    "模式：\n" ..
    "|bu◆;(|nc;.|r) 任意字符|br\n" ..
    "|bu◆;(|nc;%a|r) 字母|br\n" ..
    "|bu◆;(|nc;%d|r) 数字|br\n\n" ..
    "模式修饰符：\n" ..
    "|bu◆;(|nc;+|r) 1次或多次|br\n" ..
    "|bu◆;(|nc;*|r) 0次或多次|br\n" ..
    "|bu◆;(|nc;-|r) 最短匹配|br\n" ..
    "|bu◆;(|nc;?|r) 可选|br\n\n" ..
    "示例：\n" ..
    "带有 W 和 S 键的藏宝图：\n" ..
    "W .+ S\n\n" ..
    "注意：使用自动排序不会更新槽位索引。" ..
    "这可能导致物品在视觉上以错误顺序转移。" ..
    "要解决此问题，请关闭并重新打开存储界面。"
  locale.addon.filterModule.onlyTransferExistingCategories = "仅传输已存在的类别"
  locale.addon.filterModule.reset                          = "重置过滤器"
  locale.addon.filterModule.onlyTransferExistingItems      = "仅传输已存在的物品"
  locale.addon.filterModule.transfer                       = "传输绑定物品"
  locale.addon.filterModule.autoCancel                     = "背包满时取消"
  locale.addon.filterModule.pocketChestFilter              = "口袋箱\n过滤器"
  locale.addon.filterModule.startSlot                      = "起始：1"
  locale.addon.filterModule.endSlot                        = "结束：150"
  locale.addon.filterModule.cooldown                       = "200ms"
  locale.addon.inventoryFull                               = "|nr;背包或存储已满！|r"
  locale.addon.autoSortDetected                            = "|nr;检测到自动排序！\n请阅读过滤器（?）提示。|r"
end
