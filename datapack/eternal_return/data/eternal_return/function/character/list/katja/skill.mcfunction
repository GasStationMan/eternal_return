## 카티야 스킬 효과
execute if entity @s[tag=katjaskill] run scoreboard players add @s credit 50

## 카티야 스킬 효과 제거
execute if entity @s[tag=katjaskill] run tag @s remove katjaskill
execute if entity @s[scores={katjakill=1..}] run scoreboard players reset @s katjakill