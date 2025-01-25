## 점프패드 구역 위치별 모션값 설정
# 상위 함수 :function eternal_return:object/tick
# 출력 : 플레이어의 모션값을 추가해서 날린다

# 모션값 조설
    # 공장
        execute if entity @s[tag=zfactory] run tag @a[distance=..1] add v_0_0.8_4.9
    # 항구
        execute if entity @s[tag=zharbor] run tag @a[distance=..1] add v_-2.65_0.8_0.0
    # 고급 주택가
        execute if entity @s[tag=zresidential_area] run tag @a[distance=..1] add v_-3.3_1.5_-3.0
    # 연못1
        execute if entity @s[tag=zpondA_1] run tag @a[distance=..1] add v_-1.3_0.6_0.75
        execute if entity @s[tag=zpondA_2] run tag @a[distance=..1] add v_1.4_1.0_-0.4
    # 연못2
        execute if entity @s[tag=zpondB_1] run tag @a[distance=..1] add v_3.4_0.8_1.8
        execute if entity @s[tag=zpondB_2] run tag @a[distance=..1] add v_-3.5_0.8_-2.1