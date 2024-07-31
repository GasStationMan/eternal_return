## 플레이어 초기설정
execute if entity @s[tag=!player] run function eternal_return:sys/player/frist_setting

# 은신
    function eternal_return:sys/player/hide
# 부시
    function eternal_return:sys/player/bush

# 크래딧
    function eternal_return:sys/player/credit

# 기본 포션 효과
    effect give @s saturation infinite 10 true