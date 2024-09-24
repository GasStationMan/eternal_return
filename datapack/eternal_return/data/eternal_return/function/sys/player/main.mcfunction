## 플레이어 초기설정
execute if entity @s[tag=!player] run function eternal_return:sys/player/frist_setting

# 은신 메커니즘

# 부시 메커니즘
    #플레이어가 부시에 있을 때 -> 플레이어에게 hide tag 부여
    function eternal_return:sys/player/bush
    #플레이어가 부시 내에 있을 때 갑옷의 처리 알고리즘
    function eternal_return:sys/player/hide

# 크래딧 메커니즘 ->
    #스코어보드 -> temp[5].credit -> level 표시기로 붙여넣기
    function eternal_return:sys/player/credit

# 기본 포션 효과
    effect give @s saturation infinite 10 true