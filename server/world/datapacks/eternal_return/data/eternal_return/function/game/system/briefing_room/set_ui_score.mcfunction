## 상단 UI 숫자 고정
# 입출력 없음
# 상위 함수 : function eternal_return:game/briefing_room

# 상단 UI 숫자 고정
    scoreboard players set #timer.trigger NUM 0
    scoreboard players set #timer.halfday NUM 1
    scoreboard players set #timer.min NUM 0
    scoreboard players set #timer.sec NUM 0
    scoreboard players set #timer.tick NUM 0
    scoreboard players set #timer.day NUM 1
    scoreboard players set @a[tag=waiting] bantime 25