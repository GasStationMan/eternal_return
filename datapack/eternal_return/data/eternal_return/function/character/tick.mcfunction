## 캐릭터 틱
# 상위 함수 : function eternal_return:main
# 입력 값 : @s pdb:main in



## 스킬
    # 스킬 쿨타임
        function eternal_return:character/skill_cool
    # Q키 감지
        function eternal_return:character/detect_key
    
    # 캐릭터별 스킬
        # 나딘
            execute if entity @s[tag=nadine] at @s run function eternal_return:character/list/nadine/active/main
            execute if entity @s[tag=nadine] at @s run function eternal_return:character/list/nadine/passive/main
        # 레녹스
        # 실비아
        # 레온
            execute if entity @s[tag=leon] at @s run function eternal_return:character/list/leon/active/main
            execute if entity @s[tag=leon] at @s run function eternal_return:character/list/leon/passive/main
        # 제니
            execute if entity @s[tag=jenny] at @s run function eternal_return:character/list/jenny/active/main
            execute if entity @s[tag=jenny] at @s run function eternal_return:character/list/jenny/passive/main
        # 카티야
        # 레니
            execute if entity @s[tag=leni,tag=Qskill,tag=!active_cool] run title @s actionbar "뿅!"
            execute if entity @s[tag=leni,tag=Qskill,tag=!active_cool] run scoreboard players set @s active_cool 12
            execute if entity @s[tag=leni,tag=Fskill,tag=!passive_cool] run title @s actionbar "인사해"
            execute if entity @s[tag=leni,tag=Fskill,tag=!passive_cool] run scoreboard players set @s passive_cool 5
        # 다니엘
        # 클로에
        # 매그너스
        # 아드리아나
        # 아이솔
        # 현우
        # 유키
        # 피올로
        # 아르다
        # 비앙카
        # 이안
        # 버니스
        # 시셀라
            execute if entity @s[tag=sissela] at @s run function eternal_return:character/list/sissela/active/main
            execute if entity @s[tag=sissela] at @s run function eternal_return:character/list/sissela/passive/main
        # 루크
        # 재키
        # 바냐
        # 엘레나
            execute if entity @s[tag=elena] at @s run function eternal_return:character/list/elena/active/main
            execute if entity @s[tag=elena] at @s run function eternal_return:character/list/elena/passive/main
        # 나타폰
            execute if entity @s[tag=nathapon] at @s run function eternal_return:character/list/nathapon/active/main
            execute if entity @s[tag=nathapon] at @s run function eternal_return:character/list/nathapon/passive/main
        # 하트
        # 알렉스
        # 셀린
            execute if entity @s[tag=celine] at @s run function eternal_return:character/list/celine/passive/main
            execute if entity @s[tag=celine] at @s run function eternal_return:character/list/celine/active/main
            execute unless entity @s[tag=celine] run tag @s remove celine_t1
        # 쇼우
        # 마커스
            execute if entity @s[tag=markus,scores={active_level=1..}] at @s run function eternal_return:character/list/markus/active/main
            execute if entity @s[tag=markus,scores={passive_level=1..}] at @s run function eternal_return:character/list/markus/passive/main
        # 에스텔

# 쿨타임 대기중입니다 액션바로 추가

function eternal_return:player/damagegive

## CC기
function eternal_return:character/list/stun/main


# FREE
    # 키 태그 제거
        tag @s remove Qskill
        tag @s remove Fskill