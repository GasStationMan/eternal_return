# 새로운 플레이어 추가
execute if entity @s[tag=!player] run function eternal_return:player/frist_join

# 플레이어가 재접속 할 때
execute if entity @s[tag=player] run function eternal_return:gui/bossbar/leave_game