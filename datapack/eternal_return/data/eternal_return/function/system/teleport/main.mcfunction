


# 플레이어가 워프 포인트를 설정했을 때
execute if data storage player_data players[{warp:{done:0}}].id run function eternal_return:system/teleport/warp_point

# 워프를 할 때
execute as @e[tag=fix_player_id] at @s if entity @a[tag=warp] run function eternal_return:system/teleport/warp

# 플레이어가 워프를 취소할 때
execute as @a[tag=player,tag=cancel_warp] run function eternal_return:system/teleport/player
