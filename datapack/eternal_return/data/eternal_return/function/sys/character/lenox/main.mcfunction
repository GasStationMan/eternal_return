execute if entity @a[tag=lenox] as @a[tag=lenox] run function eternal_return:sys/character/lenox/main2

## 아야 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=lenoxskill] as @a[tag=lenoxskill] unless entity @s[tag=lenox] run tag @s remove lenoxskill
execute if entity @a[tag=lenoxcool] as @a[tag=lenoxcool] unless entity @s[tag=lenox] run tag @s remove lenoxcool
execute if entity @a[scores={lenoxskill=1..}] as @a[scores={lenoxskill=1..}] unless entity @s[tag=lenox] run scoreboard players reset @s lenoxskill