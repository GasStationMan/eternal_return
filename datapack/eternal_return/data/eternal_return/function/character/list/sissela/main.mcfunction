execute if entity @a[tag=sissela] as @a[tag=sissela] run function eternal_return:sys/character/sissela/main2

## 시셀라 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=sisselaskill] as @a[tag=sisselaskill] unless entity @s[tag=sissela] run tag @s remove sisselaskill
execute if entity @a[scores={sisselaskill=1..}] as @a[scores={sisselaskill=1..}] unless entity @s[tag=sissela] run scoreboard players reset @s sisselaskill