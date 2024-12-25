# 로딩바
execute if entity @s[tag=get_tree,tag=!charge2,tag=!loading] run function eternal_return:sys/actionbar/loading/set {sec:70,text:'[{"translate":"space.-105"},{"font":"actionbar/up","text":"생명의 나무 채집 중","color":"white"},{"translate":"space.40"}]'}
execute if entity @s[tag=get_tree,tag=charge2] run tag @s remove pause_loading

# 채집 완료
give @s[tag=get_tree,tag=charge2,tag=done_loading] oak_sapling[item_name='{"bold":true,"color":"green","text":"생명의 나무"}'] 1
execute if entity @s[tag=charge2,tag=done_loading] as @e[tag=tree,distance=..2.5] at @s run setblock ~ ~ ~ air
execute if entity @s[tag=charge2,tag=done_loading] as @e[tag=tree,distance=..2.5] run kill @s
execute if entity @s[tag=charge2,tag=done_loading] run tag @s remove get_tree



# 범위 이탈 시 태그 제거
execute if entity @e[tag=tree,distance=2.5..15] run tag @s[tag=get_tree] add cancel_loading
execute if entity @e[tag=tree,distance=2.5..15] run tag @s[tag=get_tree] remove get_tree
execute if entity @e[tag=tree,distance=15..18] run tag @s add clear_loading

# 만약 주변에 먼저 채집 완료한 플레이어가 있는 경우
execute if entity @e[tag=get_tree,tag=charge2,tag=done_loading,distance=..10] run tag @s add clear_loading
