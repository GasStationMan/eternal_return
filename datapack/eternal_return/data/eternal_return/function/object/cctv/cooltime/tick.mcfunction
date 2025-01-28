## CCTV CoolDown text display
# 상위 함수 : function eternal_return:object/cctv/tick
# 입출력 없음

# 텍스트 표기 갱신
    execute if entity @s[tag=red] run data modify entity @s text set value '{"color":"#FF0000","score":{"name":"@s","objective":"ct2"}}'
    execute if entity @s[tag=white] run data modify entity @s text set value '{"color":"white","score":{"name":"@s","objective":"ct2"}}'

# 스코어보드
    # tick++
        scoreboard players add @s ct1 1
    # sec++
        execute if score @s ct1 matches 20 run scoreboard players remove @s ct2 1
        execute if score @s ct1 matches 20 run scoreboard players set @s ct1 0

# Kill
    execute if score @s ct2 matches 0 run kill @s