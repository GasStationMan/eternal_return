## 점프패드 함수
# 상위 함수 :function eternal_return:object/tick
# 입출력 없음

## 플레이어 감지
    # 태그 추가
        execute at @s if entity @p[distance=..1] run tag @s add in_use
        execute at @s if entity @p[distance=1..3] run tag @s remove in_use
        
    # 스코어보드 
        # 플레이어가 패드 위에 있을때
            # tick ++1
            execute if score @s ct2 matches ..7 run scoreboard players add @s[tag=in_use] ct1 1
            # 6틱마다 모델넘버 ++1 (custom_model_data : 0~8)
                execute if score @s[tag=in_use] ct1 matches 6.. if score @s ct2 matches ..7 run scoreboard players add @s ct2 1
                execute if score @s[tag=in_use] ct1 matches 6.. if score @s ct2 matches ..7 run scoreboard players set @s ct1 0

        # 플레이어가 패드 위에 없을 때
            # tick --1
            execute if score @s[tag=!in_use] ct2 matches 1.. run scoreboard players remove @s ct1 1
            # 3틱마다 모델넘버 --1
                execute if score @s[tag=!in_use] ct2 matches 1.. if score @s ct1 matches 0 run scoreboard players remove @s ct2 1
                execute if score @s[tag=!in_use] ct2 matches 1.. if score @s ct1 matches ..0 run scoreboard players set @s ct1 2

## 차징이 완료 되었을 때
    # 구역 위치별 플레이어 모션값 설정
        execute if score @s ct2 matches 8 if score @s ct1 matches 6 at @s run function eternal_return:object/jumppad/jump
    # 모델링 넘버 초기화
        execute if score @s ct2 matches 8 if score @s ct1 matches 6 run scoreboard players reset @s ct1
        execute if score @s ct2 matches 8 if score @s ct1 matches 6 run scoreboard players set @s ct2 0

## 모델링 넘버 변경
    execute store result entity @s ArmorItems[3].components."minecraft:custom_model_data".floats[0] float 1 run scoreboard players get @s ct2