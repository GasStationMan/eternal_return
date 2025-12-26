## 좌표 배열에서 위치의 좌표 값 가져오기
# 상위 함수 없음
# 입력 값 : temp warp.place / temp warp.num
# pdb에 이동할 좌표 값 가져오기

## 좌표 값 가져오기
    $data modify storage pdb:main in.warp_pos set from storage map position[$(place)].$(num)