# 로딩바
execute if entity @s[tag=get_meteor,tag=!charge2,tag=!loading] run function eternal_return:sys/actionbar/loading/set {sec:70,text:'[{"translate":"space.-95"},{"font":"actionbar/up","text":"운석 채집 중","color":"white"},{"translate":"space.58"}]'}
execute if entity @s[tag=get_meteor,tag=charge2] run tag @s remove pause_loading

# 채집 완료
give @s[tag=get_meteor,tag=charge2,tag=done_loading] echo_shard[item_name='{"bold":true,"color":"blue","text":"운석"}'] 1
execute if entity @s[tag=charge2,tag=done_loading] as @e[tag=meteor,tag=interaction,distance=..1.5] at @s run setblock ~ ~ ~ air
execute if entity @s[tag=charge2,tag=done_loading] as @e[tag=meteor,tag=interaction,distance=..1.5] run kill @s
execute if entity @s[tag=charge2,tag=done_loading] run tag @s remove get_meteor
execute if entity @s[tag=done_loading] run tag @s remove done_loading


# 범위 이탈 시 태그 제거
execute if entity @e[tag=meteor,tag=interaction,distance=1.5..10] run tag @s[tag=get_meteor] add cancel_loading
execute if entity @e[tag=meteor,tag=interaction,distance=1.5..10] run tag @s[tag=get_meteor] remove get_meteor
execute if entity @e[tag=meteor,tag=interaction,distance=10..13] run tag @s add clear_loading

# 만약 주변에 먼저 채집 완료한 플레이어가 있는 경우
execute if entity @e[tag=get_meteor,tag=charge2,tag=done_loading,distance=..10] run tag @s add clear_loading
