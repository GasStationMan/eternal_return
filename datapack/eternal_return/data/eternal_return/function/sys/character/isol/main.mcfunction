execute if entity @a[tag=isol] as @a[tag=isol] run function eternal_return:sys/character/isol/main2

## 아야 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=isolskill] as @a[tag=isolskill] unless entity @s[tag=isol] run tag @s remove isolskill
execute if entity @a[tag=isolcool] as @a[tag=isolcool] unless entity @s[tag=isol] run tag @s remove isolcool
execute if entity @a[scores={isolskill=1..}] as @a[scores={isolskill=1..}] unless entity @s[tag=isol] run scoreboard players reset @s isolskill