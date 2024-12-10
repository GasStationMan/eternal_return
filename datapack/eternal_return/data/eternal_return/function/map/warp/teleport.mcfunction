## 저장된 구역으로 이동
# 상위 함수 없음
# 입력 값 : 
# 지정된 구역으로 이동

function pdb:get_me
## 저장된 구역 이동
    # 저장된 값이 없는 경우 함수 종료
        execute unless data storage pdb:main in.warp_pos run return fail
    # 이동
        function eternal_return:map/warp/move_to_point with storage pdb:main in
    # 저장된 좌표 지우기
        data remove storage pdb:main in.warp_pos

function pdb:save_me