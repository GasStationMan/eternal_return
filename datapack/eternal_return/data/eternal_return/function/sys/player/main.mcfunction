# 플레이어 자동 넘버링
execute unless score @s[tag=!player_id] player_id matches 0 run function eternal_return:sys/player/numbering

# 은신
function eternal_return:sys/player/hide
# 부시
function eternal_return:sys/player/bush

# 크래딧
function eternal_return:sys/player/credit



# 게임에서 나갔을 때
#function eternal_return:sys/player/leave_game
# 포화 무한 
effect give @s saturation infinite 10 true