## 게임 시작 전 설정
# 입출력 없음
# 상위 함수 : function eternal_return:game/briefing_room

# 플레이어 태그 변경
    tag @a[tag=waiting] add in_game
    tag @a[tag=waiting] remove waiting

# 게임 시작 5초전 타이머
    scoreboard players set #late_time_sec CT1 7
    scoreboard players set #late_time_tick CT1 0