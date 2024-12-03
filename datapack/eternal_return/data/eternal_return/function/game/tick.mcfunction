## 브리핑 룸 입장 전 (캐릭터 선택화면)
    # 플레이어
        function eternal_return:game/player/character_select

## 브리핑 룸
    # 플레이어
        execute if entity @s[tag=briefing_room] run function eternal_return:game/player/briefing_room
    # 시스템
        function eternal_return:game/system/briefing_room

## 인게임
    # 플레이어

    # 시스템

    # debug
    #execute as Money5645 at @s run function eternal_return:map/warp/get_place
    #execute as Money5645 at @s run function eternal_return:map/warp/teleport
