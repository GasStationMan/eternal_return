## 상단 중앙 ui
# 입출력 없음
# 상위 함수 : function eternal_return:game/briefing_room \
            function eternal_return:game/player/in_game
# 스코어를 텍스트로 변환 후 보스바에 입력





# 숫자 표기 방식 변경
    # 분
        scoreboard players operation #input.number NUM = #timer.min NUM
        function eternal_return:gui/bossbar/display/format_number {type:"two"}
        data modify storage ui_temp temp.time_min set from storage temp format_num
    # 초
        scoreboard players operation #input.number NUM = #timer.sec NUM
        function eternal_return:gui/bossbar/display/format_number {type:"two"}
        data modify storage ui_temp temp.time_sec set from storage temp format_num
    # 팀원 수
        scoreboard players operation #input.number NUM = #game.team ct1
        function eternal_return:gui/bossbar/display/format_number {type:"space"}
        data modify storage ui_temp temp.team set from storage temp format_num
    # 인원 수
        scoreboard players operation #input.number NUM = #game.player ct1
        function eternal_return:gui/bossbar/display/format_number {type:"space"}
        data modify storage ui_temp temp.player set from storage temp format_num
    # 킬
        scoreboard players operation #input.number NUM = @s kill
        function eternal_return:gui/bossbar/display/format_number {type:"space"}
        data modify storage ui_temp temp.kill set from storage temp format_num
    # 데스
        scoreboard players operation #input.number NUM = @s death
        function eternal_return:gui/bossbar/display/format_number {type:"space"}
        data modify storage ui_temp temp.death set from storage temp format_num
    # 일차
        scoreboard players operation #input.number NUM = #timer.day NUM
        function eternal_return:gui/bossbar/display/format_number {type:"space"}
        data modify storage ui_temp temp.day set from storage temp format_num
    # 금지구역 남은시간
        scoreboard players operation #input.number NUM = @s bantime
        function eternal_return:gui/bossbar/display/format_number {type:"two"}
        data modify storage ui_temp temp.bantime set from storage temp format_num
    # 스킬 레벨 
        scoreboard players operation #input.number NUM = @s level
        function eternal_return:gui/bossbar/display/format_number {type:"level"}
        data modify storage ui_temp temp.level set from storage temp format_num
    # 크래딧
        scoreboard players operation #input.number NUM = @s credit
        function eternal_return:gui/bossbar/display/format_number {type:"credit"}
        data modify storage ui_temp temp.credit set from storage temp format_num
    # 공격력
        execute store result score #input.number NUM run data get storage pdb:main in.stats.atk
        function eternal_return:gui/bossbar/display/format_number {type:"atk"}
        data modify storage ui_temp temp.atk set from storage temp format_num
    # 공격 속도
        execute store result score #input.number NUM run data get storage pdb:main in.stats.atk_spds
        execute store result score #input.number2 NUM run data get storage pdb:main in.stats.atk_spdm
        function eternal_return:gui/bossbar/display/format_number {type:"atk_spd"}
        data modify storage ui_temp temp.atk_spd set from storage temp format_num
    # 방어력
        execute store result score #input.number NUM run data get storage pdb:main in.stats.armor
        function eternal_return:gui/bossbar/display/format_number {type:"armor"}
        data modify storage ui_temp temp.armor set from storage temp format_num
    # 방어강도
        execute store result score #input.number NUM run data get storage pdb:main in.stats.armor_tou
        function eternal_return:gui/bossbar/display/format_number {type:"armor_tou"}
        data modify storage ui_temp temp.armor_tou set from storage temp format_num
    # 액티브 쿨타임
        scoreboard players operation #input.number NUM = @s active_cool
        function eternal_return:gui/bossbar/display/format_number {type:"active_cool"}
        data modify storage ui_temp temp.active_cool set from storage temp format_num
    # 패시브 쿨타임
        scoreboard players operation #input.number NUM = @s passive_cool
        function eternal_return:gui/bossbar/display/format_number {type:"passive_cool"}
        data modify storage ui_temp temp.passive_cool set from storage temp format_num


# 스킬 포인트
    function eternal_return:gui/bossbar/display/format/skill_point

# 문자열 표기 방식 변경
    # 프로필 사진 변경
        data modify storage temp int set from storage pdb:main in.character.no
        function eternal_return:gui/screen/format_num with storage temp
        data modify storage ui_temp temp.profile set from storage temp intTotext
    # 현재 구역의 상태 받아오기
        data modify storage temp place.name set from storage pdb:main in.place_name
        data modify storage temp place.color set from storage pdb:main in.place_color
        function eternal_return:gui/bossbar/display/format/place_and_color with storage temp place
# 플레이어별 보스바에 변환된 텍스트 입력
    function eternal_return:gui/bossbar/display/ui/interface with storage pdb:main args

# free
    data remove storage temp intTotext
    data remove storage temp format_num
    #data remove storage ui_temp temp