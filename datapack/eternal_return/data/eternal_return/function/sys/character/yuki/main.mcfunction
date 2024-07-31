execute if entity @a[tag=yuki] as @a[tag=yuki] run function eternal_return:sys/character/yuki/main2

## 아야 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=yukiskill] as @a[tag=yukiskill] unless entity @s[tag=yuki] run tag @s remove yukiskill
execute if entity @a[tag=yukicool] as @a[tag=yukicool] unless entity @s[tag=yuki] run tag @s remove yukicool
execute if entity @a[scores={yukiskill=1..}] as @a[scores={yukiskill=1..}] unless entity @s[tag=yuki] run scoreboard players reset @s yukiskill