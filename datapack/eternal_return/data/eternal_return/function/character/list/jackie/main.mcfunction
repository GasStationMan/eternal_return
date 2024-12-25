execute if entity @a[tag=jackie] as @a[tag=jackie] run function eternal_return:sys/character/jackie/main2

## 재키 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=jackieskill] as @a[tag=jackieskill] unless entity @s[tag=jackie] run tag @s remove jackieskill
execute if entity @a[scores={jackieskill=1..}] as @a[scores={jackieskill=1..}] unless entity @s[tag=jackie] run scoreboard players reset @s jackieskill