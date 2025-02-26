## 플레이어
# 입출력 없음
# 상위 함수 : function eternal_return:main
# 플레이어와 관련된 기능을 다루는 함수

# 허기수치 max
    effect give @s saturation infinite 100 true
# 플레이어 첫입장 시
    execute if entity @s[tag=!player] run function eternal_return:player/frist_join

# 플레이어 재접속 시
    execute if entity @s[tag=player] run function eternal_return:gui/bossbar/leave_game

# 플레이어 고정
    execute at @s if entity @s[tag=player] run function eternal_return:player/freeze_player

# 플레이어 고정
    execute at @s if entity @s[tag=player] run function eternal_return:player/stats

# 부시
    execute if entity @s[tag=player] at @s run function eternal_return:player/bush/tick