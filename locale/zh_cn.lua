if X2Locale:GetLocale() == "zh_cn" then
  locale.addon.title                  = "自动存放"
  locale.addon.storageModule.title    = "存储"
  locale.addon.storageModule.tooltip  =
    "选择当前已打开的存储位置来进行物品存入或取出：\n" ..
    "|bu◆;存储箱（包括口袋箱）|br\n" ..
    "|bu◆;仓库|br\n"
  locale.addon.filterModule.title     = "过滤器"
  locale.addon.filterModule.tooltip   =
    "物品可通过以下方式过滤：\n" ..
    "|bu◆;选择口袋箱过滤器|br\n" ..
    "|bu◆;按名称或类别搜索|br\n" ..
    "|bu◆;输入起始或结束槽位索引|br\n\n" ..
    "锁定在原位置的物品不会被转移。\n\n" ..
    "高级搜索：\n" ..
    "匹配模式\n" ..
    "|bu◆;(|nc;.|r) 任意字符|br\n" ..
    "|bu◆;(|nc;%a|r) 字母|br\n" ..
    "|bu◆;(|nc;%d|r) 数字|br\n\n" ..
    "模式修饰符\n" ..
    "|bu◆;(|nc;+|r) 1个或多个|br\n" ..
    "|bu◆;(|nc;*|r) 0个或多个|br\n" ..
    "|bu◆;(|nc;-|r) 最短匹配|br\n" ..
    "|bu◆;(|nc;?|r) 可选|br\n\n" ..
    "示例：\n" ..
    "包含 W 和 S 键的藏宝图： \n" ..
    "W .+ S\n\n" ..
    "注意：使用自动排序不会更新槽位索引。" ..
    "这可能导致物品在视觉上以错误顺序转移。" ..
    "要解决此问题，请关闭并重新打开存储界面。"
  locale.addon.filterModule.transfer  = "传输绑定物品"
  locale.addon.filterModule.reset     = "重置过滤器"
  locale.addon.filterModule.startSlot = "起始：1"
  locale.addon.filterModule.endSlot   = "结束：150"
  locale.addon.filterModule.cooldown  = "200ms"
  locale.addon.inventoryFull          = "|nr;背包或存储已满！|r"
  locale.addon.autoSortDetected       = "|nr;检测到自动排序！\n请阅读过滤器 (?) 工具提示。|r"
  -- https://wiki.archerage.to/ru-cn/db/items/
  locale.addon.pocketChest.adventurersChest          = "冒险者专用保管箱"
  locale.addon.pocketChest.alchemistsChest           = "炼金师专用保管箱"
  locale.addon.pocketChest.animalBreedersChest       = "大型动物饲养员专用保管箱"
  locale.addon.pocketChest.artisansChest             = "工匠专用保管箱"
  locale.addon.pocketChest.buildersChest             = "建筑师专用保管箱"
  locale.addon.pocketChest.costumeCloset             = "时装专用保管箱"
  locale.addon.pocketChest.designChest               = "梦幻染料专用保管箱"
  locale.addon.pocketChest.dreamDesignersChest       = "梦境图画专用保管箱"
  locale.addon.pocketChest.equipmentEnhancementChest = "合成和觉醒材料专用保管箱"
  locale.addon.pocketChest.equipmentMaterialChest    = "合成和觉醒材料专用保管箱"
  locale.addon.pocketChest.farmersLargeChest         = "大型农夫专用保管箱"
  locale.addon.pocketChest.fishermansChest           = "渔夫专用保管箱"
  locale.addon.pocketChest.flutterVessel             = "滑翔翼专用保管箱"
  locale.addon.pocketChest.furnitureChest            = "家具专用保管箱"
  locale.addon.pocketChest.gearChest                 = "装备专用保管箱"
  locale.addon.pocketChest.instrumentTrunk           = "乐器专用保管箱"
  locale.addon.pocketChest.librariansChest           = "图书馆管理员专用保管箱"
  locale.addon.pocketChest.machinesChest             = "机械专用保管箱"
  locale.addon.pocketChest.musicChest                = "乐谱专用保管箱"
  locale.addon.pocketChest.otherworldlyPetHotel      = "战宠专用保管箱"
  locale.addon.pocketChest.petsAndTransportTrunk     = "载具专用保管箱"
  locale.addon.pocketChest.ridersTrunk               = "骑宠专用保管箱"
  locale.addon.pocketChest.shardCollectorsChest      = "碎片物品专用保管箱"
  locale.addon.pocketChest.travelerNecessitiesChest  = "旅行必需品专用保管箱"
  locale.addon.pocketChest.treasureHuntersChest      = "宝藏猎人专用保管箱"
  locale.addon.pocketChest.trophyHuntersChest        = "战利品专用保管箱"
end
