execute if entity @a[tag=yohan] as @a[tag=yohan] run function eternal_return:sys/character/yohan/main2

## 요한 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=yohanskill] as @a[tag=yohanskill] unless entity @s[tag=yohan] run tag @s remove yohanskill
execute if entity @a[tag=yohancool] as @a[tag=yohancool] unless entity @s[tag=yohan] run tag @s remove yohancool
execute if entity @a[scores={yohanskill=1..}] as @a[scores={yohanskill=1..}] unless entity @s[tag=yohan] run scoreboard players reset @s yohanskill