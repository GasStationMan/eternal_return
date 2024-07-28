## 로딩 취소
#> 1.5초
execute if entity @s[tag=loading1.5] run tag @s add clear_loading
#> 3초
execute if entity @s[tag=loading3] run tag @s add clear_loading
#> 7초
# 한 칸도 못 채운 경우
$execute if entity @s[tag=loading7,tag=!charge2] if score #$(id).loading.index CT1 matches ..69 run tag @s add clear_loading
# 한 칸을 채운 경우
$execute if entity @s[tag=loading7,tag=charge2] if score #$(id).loading.index CT1 matches ..69 run tag @s add pause_loading
$execute if entity @s[tag=loading7,tag=charge2] if score #$(id).loading.index CT1 matches ..69 run scoreboard players set #$(id).loading.index CT1 1
$execute if entity @s[tag=loading7,tag=charge2] if score #$(id).loading.index CT1 matches ..69 run data modify storage player_data players[{id:$(id)}].loading[1] set from storage text data[2]
tag @s remove cancel_loading