## 오브젝트 함수
# 상위 함수 :function eternal_return:main
# 입출력 없음
# 맵에 배치되는 오브젝트를 관리하는 tick 함수


# 키오스크
    # 인터렉션
        execute as @e[type=interaction,tag=click_interaction,tag=kiosk] run function eternal_return:object/kiosk/tick
    # 플레이어
        execute as @a[tag=use_kiosk] at @s if entity @e[type=interaction,tag=kiosk,distance=2..5,limit=1] run tag @s remove use_kiosk

# 하이퍼루프
    # 인터렉션
        execute as @e[type=interaction,tag=click_interaction,tag=hyperloop] run function eternal_return:object/hyperloop/tick
    # 플레이어
        execute as @a[tag=use_hyperloop] at @s if entity @e[type=interaction,tag=hyperloop,distance=2..5,limit=1] run tag @s remove use_hyperloop

# CCTV
    # 인터렉션
        execute as @e[type=interaction,tag=click_interaction,tag=cctv] run function eternal_return:object/cctv/tick
    # 플레이어
        execute as @a[tag=loading] at @s if entity @e[type=interaction,tag=cctv,distance=2.5..5,limit=1] run function eternal_return:gui/loading/cancel
    # 텍스트 디스플레이 [쿨타임]
        execute as @e[type=text_display,tag=cool] run function eternal_return:object/cctv/cooltime/tick
# 점프패드
    execute as @e[type=armor_stand,tag=jumppad] run function eternal_return:object/jumppad/tick
