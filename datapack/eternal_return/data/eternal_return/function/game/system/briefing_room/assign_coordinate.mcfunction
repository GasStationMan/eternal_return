## 임시 좌표 배열에서 가져오기
# 입력 : 
# 출력 : 
# 상위 함수 : function eternal_return:game/briefing_room/assign/assign_position

# 플레이어 데이터 불러오기
function pdb:get_me

    # 좌표를 가져올 인덱스 번호 정하기
        execute store result score #map_rand_pos NUM run random value 0..2
    # 좌표 값 저장
        execute if score #map_rand_pos NUM matches 0 run data modify storage pdb:main in.warp_pos set from storage temp pos_list[0][0]
        execute if score #map_rand_pos NUM matches 1 run data modify storage pdb:main in.warp_pos set from storage temp pos_list[0][1]
        execute if score #map_rand_pos NUM matches 2 run data modify storage pdb:main in.warp_pos set from storage temp pos_list[0][2]
    # 부여된 구역 제외
        data remove storage temp pos_list[0]
        #debug\
        tellraw @s {"score":{"name":"#map_rand_pos","objective":"NUM"}}
    # free
        scoreboard players reset #map_rand_pos NUM

# 플레이어 데이터 저장
function pdb:save_me