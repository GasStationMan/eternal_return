#
# function eternal_return:maps/kiosk/main
# function eternal_return:maps/kiosk/get_selected_place

# 하이퍼루프에 막 들어온 경우 choosing_kiosk 태그 부여

# 태그 추가
execute if entity @s[tag= !choosing_kiosk] at @s run tp @s ~ ~ ~ 0 0
execute if entity @s[tag= !choosing_kiosk] run tag @s add choosing_kiosk

# 플레이어 커서 위치에 따른 버튼 감지 함수
scoreboard players set #get_selected_place.mouse_pointer_limit_width ER.sys 800
scoreboard players set #get_selected_place.mouse_pointer_limit_height ER.sys 250
function eternal_return:maps/kiosk/get_selected_place/mouse_pointer_limit_width__mouse_pointer_limit_height
