# 로딩바 채우기
$execute if entity @s[tag=loading1.5] run data modify storage player_data players[{id:$(id)}].loading[$(index)] set value "5*"
$execute if entity @s[tag=loading3] run data modify storage player_data players[{id:$(id)}].loading[$(index)] set value "4+"
$execute if entity @s[tag=loading7,tag=!charge2] if score #$(id).loading.index CT1 matches ..71 run data modify storage player_data players[{id:$(id)}].loading[0][$(index)] set value "3-"
$execute if entity @s[tag=loading7,tag=charge2] if score #$(id).loading.index CT1 matches ..71 run data modify storage player_data players[{id:$(id)}].loading[1][$(index)] set value "3-"