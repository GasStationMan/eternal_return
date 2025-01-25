## CCTV
# 상위 함수 : function eternal_return:object/tick
# 입출력 없음



## 플레이어 우클릭 감지
    # 플레이어가 우클릭 했을 때
        execute if data entity @s[tag=!in_use,tag=!cooltime] interaction at @s on target if entity @s[tag=!use_cctv,distance=..3] run function eternal_return:gui/loading/setup {type:1,tick:60,text:'[{"translate":"space.-96"},{"font":"gui/loading/up","text":"CCTV 시야 접근 중","color":"white"},{"translate":"space.45"}]'}
        execute if data entity @s[tag=!in_use,tag=!cooltime] interaction on target run tag @s add use_cctv
        execute if data entity @s[tag=!in_use,tag=!cooltime] interaction run tag @s add in_use

    # 주위에 플레이어가 존재하지 않을 때
        execute at @s unless entity @p[tag=use_cctv,distance=..3] run data remove entity @s interaction
        execute unless data entity @s[tag=!cooltime] interaction run tag @s remove in_use

    # 쿨타임 중 \
        메시지 출력 : 지금은 사용할 수 없습니다!
    # 오프라인(6일차 낮 이후) \
        메시지 출력 : 최종 안전지대 페이즈 중에는 보안콘솔을 사용할 수 없습니다. 



## 작동 중
    # 작동 되었을 때
        # 쿨타임 표기 생성
            # 작동시간 90초 텍스트 디스플레이 추가
        execute at @s if entity @a[tag=done_loading,distance=..3] run function eternal_return:object/cctv/active
    # 쿨타임 종료
        execute if entity @s[tag=cooltime] unless entity @e[type=text_display,tag=cool,limit=1,sort=nearest] run tag @s remove cooltime


# 모드 변경
    # 일반
        execute if entity @s[tag=!active_cctv] at @s run data modify entity @e[type=armor_stand,sort=nearest,limit=1,tag=model] ArmorItems[3].components."minecraft:custom_model_data".floats[0] set value 0.0f
    # 쿨타임
        execute if entity @s[tag=active_cctv,tag=cooltime] at @s run data modify entity @e[type=armor_stand,sort=nearest,limit=1,tag=model] ArmorItems[3].components."minecraft:custom_model_data".floats[0] set value 2.0f
    # 활성화 중
        execute if entity @s[tag=active_cctv,tag=!cooltime] at @s run data modify entity @e[type=armor_stand,sort=nearest,limit=1,tag=model] ArmorItems[3].components."minecraft:custom_model_data".floats[0] set value 1.0f
    # 오프라인(6일차 이후)
        #data modify entity @e[type=armor_stand,sort=nearest,limit=1,tag=model] ArmorItems[3].components."minecraft:custom_model_data".floats[0] set value 3.0f








# 모드 종류
# custom_model_data => strings:"cctv", floats: 0~4
# 0: 켜진 상태 / 1: 작동 중 / 2: 쿨타임 / 3: 꺼진상태
#execute as @e[tag=cctv,type=armor_stand] store result entity @s ArmorItems[3].components."minecraft:custom_model_data".floats[0] float 1 run scoreboard players set @s NUM 0