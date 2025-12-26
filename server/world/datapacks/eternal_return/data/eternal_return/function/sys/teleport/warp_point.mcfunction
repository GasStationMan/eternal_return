# 마커 소환
function eternal_return:sys/teleport/set/warp_point

# 구역별 플레어어 id 가져오기 및 태그 부여하기
execute as @e[tag=.alley,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.gas_station,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.police_station,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.fire_station,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.stream,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.hospital,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.archery_range,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.school,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.hotel,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.forest,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.cemetery,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.chapel,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.factory,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.beach,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.uptown,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.dock,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.warehouse,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data
execute as @e[tag=.temple,tag=!fix_player_id,limit=1,sort=random] run function eternal_return:sys/teleport/get/player_id with entity @s data