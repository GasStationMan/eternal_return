execute if entity @a[tag=heart] as @a[tag=heart] run function eternal_return:sys/character/heart/main2

## 하트 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=heartskill] as @a[tag=heartskill] unless entity @s[tag=heart] run tag @s remove heartskill
execute if entity @a[tag=heartcool] as @a[tag=heartcool] unless entity @s[tag=heart] run tag @s remove heartcool
execute if entity @a[scores={heartskill=1..}] as @a[scores={heartskill=1..}] unless entity @s[tag=heart] run scoreboard players reset @s heartskill