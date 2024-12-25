execute if entity @a[tag=lidailin] as @a[tag=lidailin] run function eternal_return:sys/character/lidailin/main2

## 아야 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=lidailinskill] as @a[tag=lidailinskill] unless entity @s[tag=lidailin] run tag @s remove lidailinskill
execute if entity @a[tag=lidailincool] as @a[tag=lidailincool] unless entity @s[tag=lidailin] run tag @s remove lidailincool
execute if entity @a[scores={lidailinskill=1..}] as @a[scores={lidailinskill=1..}] unless entity @s[tag=lidailin] run scoreboard players reset @s lidailinskill