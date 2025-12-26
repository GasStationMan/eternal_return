## 플레이어 이동
# 입출력 없음
# 상위 함수 : function eternal_return:game/briefing_room
    
    execute store result storage temp warp.index_count int 1 run scoreboard players get #warp.player.count NUM
    $data modify storage pdb:main in.warp_pos set from storage map warp.initial[$(num)]
    scoreboard players remove #warp.player.count NUM 1
    
    # free
    data remove storage temp warp