execute if entity @a[tag=aya] as @a[tag=aya] run function eternal_return:sys/character/aya/main2

## 아야 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=ayaskill] as @a[tag=ayaskill] unless entity @s[tag=aya] run tag @s remove ayaskill
execute if entity @a[tag=ayacool] as @a[tag=ayacool] unless entity @s[tag=aya] run tag @s remove ayacool
execute if entity @a[scores={ayaskill=1..}] as @a[scores={ayaskill=1..}] unless entity @s[tag=aya] run scoreboard players reset @s ayaskill