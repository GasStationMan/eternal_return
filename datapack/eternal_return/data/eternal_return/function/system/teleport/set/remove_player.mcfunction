# 플레이어 id 복사
scoreboard players operation #player_id_temp player_id = @s player_id
 

# 개인 스토리지 워프 기록 삭제
$data remove storage player_data players[{id:$(id)}].warp
# 지정받은 위치의 마커 데이터 삭제
execute as @e[tag=fix_player_id] if score @s player_id = #player_id_temp player_id run function eternal_return:system/teleport/set/remove_player_data

# 태그 삭제
tag @s remove cancel_warp
# 임시 스코어 삭제
scoreboard players reset #player_id_temp player_id
