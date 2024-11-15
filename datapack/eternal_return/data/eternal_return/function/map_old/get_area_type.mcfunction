## 현재 구역에 대한 상태 확인
$execute store result score #is_areatype CT1 run data get storage minecraft:player_data players[{id:$(id)}].location.type

# 상태별 색상 반환
# 안저구역
$execute if score #is_areatype CT1 matches 0 run function eternal_return:map/set_area_color {id:$(id),place:"$(place)",color:"white"}
# 금지 예정 구역
$execute if score #is_areatype CT1 matches 1 run function eternal_return:map/set_area_color {id:$(id),place:"$(place)",color:"gold"}
# 금지 구역
$execute if score #is_areatype CT1 matches 2 run function eternal_return:map/set_area_color {id:$(id),place:"$(place)",color:"#9E0010"}
# 전장 예정구역
$execute if score #is_areatype CT1 matches 3 run function eternal_return:map/set_area_color {id:$(id),place:"$(place)",color:"yellow"}
# 전장
$execute if score #is_areatype CT1 matches 4 run function eternal_return:map/set_area_color {id:$(id),place:"$(place)",color:"red"}
 
# score free
scoreboard players reset #is_areatype CT1