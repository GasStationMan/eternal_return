## 게임 시작시 설정값 조정
# 상위 함수 : function eternal_return:game/system/in_game
# 입출력 : 없음

# 게임시작 트리거
    scoreboard players set #game.start NUM 1

# 게임 시간 초기화 
    # 1일차/낮/(저장된 분/초)로 설정
        scoreboard players set #timer.day NUM 1
        scoreboard players set #timer.halfday NUM 1
        function eternal_return:game/system/in_game/day_timer/get_time_each_day
    # 상단 UI 타이머 가동
        scoreboard players set #timer.trigger NUM 1

# 크래딧 틱 설정
    scoreboard players set #credit.tick NUM 0


# 플레이어 설정
    # 스탯 초기화
        scoreboard players set @a[tag=in_game] credit 0
    # 아이템 지급
        execute as @a run function eternal_return:game/player/in_game/start_item
    # 게임모드 변경
        gamemode adventure @a[tag=in_game]