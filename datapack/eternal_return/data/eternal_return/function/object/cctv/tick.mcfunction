## CCTV 
# 상위 함수 : function eternal_return:object/tick
# 입출력 없음

# 세 칸내 플레이어가 우클릭 시
    # 일반 모드 / 활성화 된 상태인 경우
        execute if score #timer.day NUM matches ..5 if data entity @s[tag=!cooltime] interaction at @s \
            on target if entity @s[tag=!loading] run \
            function eternal_return:gui/loading/setup {type:1,tick:60,text:'[{"translate":"space.-96"},{"font":"gui/loading/up","text":"CCTV 시야 접근 중","color":"white"},{"translate":"space.45"}]'}
        execute if score #timer.day NUM matches ..5 if entity @s[tag=!cooltime] at @s if entity @a[tag=done_loading,distance=..2.5] run \
            function eternal_return:object/cctv/active
    # 쿨타임 중일 경우
        execute if score #timer.day NUM matches ..5 if data entity @s[tag=cooltime] interaction at @s on target run \ 
            title @s[distance=..2.5] actionbar [{"text": "지금은 사용할 수 없습니다!"}]
    # 6일차 낮 이후 인 경우
        execute if score #timer.day NUM matches 6.. if data entity @s interaction at @s on target run \ 
            title @s[distance=..2.5] actionbar [{"text": "최종 안전지대 페이즈 중에는 보안콘솔을 사용할 수 없습니다."}]

    # 인터렉션 UUID 제거
        data remove entity @s interaction

    # 태그 제거
        # 활성화 태그
        execute at @s unless entity @e[type=text_display,tag=cool,tag=white,limit=1,distance=..5] run tag @s remove active_cctv
        # 쿨타임 태그
        execute at @s unless entity @n[type=text_display,tag=cool,tag=red,limit=1,distance=..5] run tag @s remove cooltime

# 모드 변경
    # 일반
        execute if score #timer.day NUM matches ..5 if entity @s[tag=!active_cctv] on vehicle run \
            data modify entity @s item.components."minecraft:custom_model_data".floats[0] set value 0.0f
    # 쿨타임
        execute if score #timer.day NUM matches ..5 if entity @s[tag=active_cctv,tag=cooltime] on vehicle run \
            data modify entity @s item.components."minecraft:custom_model_data".floats[0] set value 2.0f
    # 활성화 중
        execute if score #timer.day NUM matches ..5 if entity @s[tag=active_cctv,tag=!cooltime] on vehicle run \
            data modify entity @s item.components."minecraft:custom_model_data".floats[0] set value 1.0f
    # 오프라인(6일차 이후)
    execute if score #timer.day NUM matches 6.. on vehicle run \
        data modify entity @s item.components."minecraft:custom_model_data".floats[0] set value 3.0f