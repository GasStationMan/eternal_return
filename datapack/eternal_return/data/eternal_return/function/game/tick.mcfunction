## 게임
# 상위 함수 : function eternal_return:main
# 입출력 없음
# 게임에 전반적인 시스템을 다루는 프로시저

# 게임 타이머
    function eternal_return:game/game_timer


## 수치 조정
    execute store result score #game.team ct1 if entity @a
    execute store result score #game.player ct1 if entity @e[tag=waiting]

## 브리핑 룸 입장 전 (캐릭터 선택화면)
    # 플레이어
        execute as @a if entity @s[tag=player] run function eternal_return:game/player/character_select

## 브리핑 룸
    # 플레이어
        execute as @a if entity @s[tag=briefing_room,tag=player] run function eternal_return:game/player/briefing_room
    # 시스템
        function eternal_return:game/system/briefing_room

## 인게임
    # 플레이어
        execute as @a[tag=in_game] run function eternal_return:game/player/in_game
    # 시스템
        execute if entity @a[tag=in_game] run function eternal_return:game/system/in_game
        # 게임 중인 플레이어가 없을 때 게임스코어 제거
        execute unless entity @a[tag=in_game] run scoreboard players reset #game.start NUM

## 타임라인
    function eternal_return:game/timeline



## 게임 종료
    #execute if score #