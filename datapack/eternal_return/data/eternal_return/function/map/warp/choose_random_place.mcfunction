## 이동할 구역을 지정
# 상위 함수 없음
# 입력 값 : 
# 지정된 구역으로 이동

function pdb:get_me
## 데이터 베이스에 이동할 위치를 지정
    # this.
    execute unless data storage pdb:main in.warp_pos run tag @s add this
    # 랜덤으로 지점 가져오기
    execute store result storage temp warp.num int 1 run random value 1..3
    execute store result storage temp warp.place int 1 run random value 0..16
    

    #execute if entity @s[tag=this] run function eternal_return:map/warp/get_position with storage temp warp
function pdb:save_me

# free
    data remove storage temp warp
    tag @s[tag=this] remove this