if X2Locale:GetLocale() == "zh_cn" then
  locale.addon.title                                       = "自动存放"
  locale.addon.storageModule.title                         = "存储"
  locale.addon.storageModule.tooltip                       =
    "选择当前已打开的存储位置来进行物品存入或取出：\n" ..
    "|bu◆;存储箱（包括口袋箱）|br\n" ..
    "|bu◆;仓库|br\n"
  locale.addon.filterModule.title                          = "过滤器"
  locale.addon.filterModule.tooltip                        =
    "物品可通过以下方式过滤：\n" ..
    "|bu◆;选择口袋箱过滤器|br\n" ..
    "|bu◆;按名称或类别搜索|br\n" ..
    "|bu◆;输入起始或结束槽位索引|br\n\n" ..
    "锁定在原位置的物品不会被转移。\n\n" ..
    "高级搜索：\n" ..
    "否定搜索\n" ..
    "|bu◆;以 (|nc;-|r) 开头可排除搜索内容|br\n\n" ..
    "示例：\n" ..
    "|nc;-水果|r 会排除名称或类别中包含 \"|nc;水果|r\" 的物品\n\n" ..
    "模式：\n" ..
    "|bu◆;(|nc;.|r) 任意字符|br\n" ..
    "|bu◆;(|nc;%a|r) 字母|br\n" ..
    "|bu◆;(|nc;%d|r) 数字|br\n\n" ..
    "模式修饰符\n" ..
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
  locale.addon.filterModule.onlyTransferExistingItems      = "仅转移现有项目"
  locale.addon.filterModule.transfer                       = "传输绑定物品"
  locale.addon.filterModule.autoCancel                     = "库存已满时取消"
  locale.addon.filterModule.pocketChestFilter              = "口袋箱\n过滤器"
  locale.addon.filterModule.startSlot                      = "起始：1"
  locale.addon.filterModule.endSlot                        = "结束：150"
  locale.addon.filterModule.cooldown                       = "200ms"
  locale.addon.inventoryFull                               = "|nr;背包或存储已满！|r"
  locale.addon.autoSortDetected                            = "|nr;检测到自动排序！\n请阅读过滤器 (?) 工具提示。|r"
end
