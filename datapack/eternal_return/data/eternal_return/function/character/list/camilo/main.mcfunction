execute if entity @a[tag=camilo] as @a[tag=camilo] run function eternal_return:sys/character/camilo/main2

## 카밀로 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=camiloskill] as @a[tag=camiloskill] unless entity @s[tag=camilo] run tag @s remove camiloskill
execute if entity @a[tag=camilocool] as @a[tag=camilocool] unless entity @s[tag=camilo] run tag @s remove camilocool
execute if entity @a[scores={camiloskill=1..}] as @a[scores={camiloskill=1..}] unless entity @s[tag=camilo] run scoreboard players reset @s camiloskill