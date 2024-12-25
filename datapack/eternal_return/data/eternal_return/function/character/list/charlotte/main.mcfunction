execute if entity @a[tag=charlotte] as @a[tag=charlotte] run function eternal_return:sys/character/charlotte/main2

## 샬럿 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=charlotteskill] as @a[tag=charlotteskill] unless entity @s[tag=charlotte] run tag @s remove charlotteskill
execute if entity @a[tag=charlottecool] as @a[tag=charlottecool] unless entity @s[tag=charlotte] run tag @s remove charlottecool
execute if entity @a[scores={charlotteskill=1..}] as @a[scores={charlotteskill=1..}] unless entity @s[tag=charlotte] run scoreboard players reset @s charlotteskill