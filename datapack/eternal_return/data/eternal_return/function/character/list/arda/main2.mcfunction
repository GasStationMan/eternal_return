## 스킬
execute as @s[tag=get_tree,tag=charge2,tag=done_loading] run tag @s add ardaskill
execute as @s[tag=get_meteor,tag=charge2,tag=done_loading] run tag @s add ardaskill
execute as @s[tag=ardaskill] at @s run function eternal_return:sys/character/arda/skill

## 팀 가입
team join arda @s[team=!arda]