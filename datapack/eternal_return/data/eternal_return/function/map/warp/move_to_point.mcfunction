## 이동하기
# 상위 함수 : function eternal_return:map/warp/teleport
# 입력 값 : pdb:main in.warp_pos
# 지정된 구역으로 이동

## 이동하기
    $tp @s $(warp_pos)
    # debug
    $tellraw @a [{"selector":"@s"},{"text":"이(가)"},{"text":" $(warp_pos)","color":"green"},{"text":"로 이동하였습니다.","color":"white"}]