execute if entity @a[tag=vianca] as @a[tag=vianca] run function eternal_return:sys/character/vianca/main2

## 비앙카 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=viancaskill] as @a[tag=viancaskill] unless entity @s[tag=vianca] run tag @s remove viancaskill
execute if entity @a[tag=viancacool] as @a[tag=viancacool] unless entity @s[tag=vianca] run tag @s remove viancacool
execute if entity @a[scores={viancaskill=1..}] as @a[scores={viancaskill=1..}] unless entity @s[tag=vianca] run scoreboard players reset @s viancaskill