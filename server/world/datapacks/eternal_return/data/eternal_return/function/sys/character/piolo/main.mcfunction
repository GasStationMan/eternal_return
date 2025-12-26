execute if entity @a[tag=piolo] as @a[tag=piolo] run function eternal_return:sys/character/piolo/main2

## 피올로 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=pioloskill] as @a[tag=pioloskill] unless entity @s[tag=piolo] run tag @s remove pioloskill
execute if entity @a[scores={pioloskill=1..}] as @a[scores={pioloskill=1..}] unless entity @s[tag=piolo] run scoreboard players reset @s pioloskill