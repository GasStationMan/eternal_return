## 로그
# player_id temp 입력
function eternal_return:temp/input/id

# 로그 생성
execute if entity @s[tag=add_log] run function eternal_return:sys/player/sidebar/add
execute if entity @s[tag=add_log] run data modify storage minecraft:player_data players[{id:1}].log set value ["","","","","","","",""]

# 로그 제거
execute if entity @s[tag=add_log] run function eternal_return:sys/player/sidebar/remove



## 태그 제거
tag @s remove add_log
tag @s remove remove_log

# player_id temp 초기화
#function eternal_return:temp/free/id