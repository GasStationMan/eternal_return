## 플레이어 데이터에 최종 좌표 배열 값 순차 입력
# 입력 : @s pdb:main , temp warp.num , map warp.final
# 출력 : @s pdb:main in.warp_pos
# 상위 함수 : function eternal_return:game/briefing_room/tp_to_area/set_player_position

# 데이터 옮기기
    $data modify storage pdb:main in.warp_pos set from storage map warp.final[0].$(num)


# debug
$tellraw @a [{"selector":"@s"},{"text":"이(가) 할당받은 좌표는 "},{"nbt":"in.warp_pos","storage":"pdb:main","color":"blue"},{"text":" 입니다. $(num)","color":"white"}]