## 점프패드 구역 위치별 모션값 설정
# 상위 함수 :function eternal_return:object/tick
# 출력 : 플레이어의 모션값을 추가해서 날린다

# 백터 태그 부여
tag @a[distance=..1] add vector

# 모션값 조절
    # 공장
        execute if entity @s[tag=zfactory] run tag @a[distance=..1] add parabola_-534_82_323_-534_82_372
    # 항구
        execute if entity @s[tag=zharbor] run tag @a[distance=..1] add parabola_-430_82_354_-458_82_354
    # 고급 주택가
        execute if entity @s[tag=zresidential_area] run tag @a[distance=..1] add parabola_-384_81_480_-418_82_446
    # 연못1
        execute if entity @s[tag=zpondA_1] run tag @a[distance=..1] add parabola_-650_82_474_-679_79_495
        execute if entity @s[tag=zpondA_2] run tag @a[distance=..1] add parabola_-661_79_478_-633_82_468
    # 연못2
        execute if entity @s[tag=zpondB_1] run tag @a[distance=..1] add parabola_-622_82_466_-589_82_483
        execute if entity @s[tag=zpondB_2] run tag @a[distance=..1] add parabola_-593_82_484_-630_82_463