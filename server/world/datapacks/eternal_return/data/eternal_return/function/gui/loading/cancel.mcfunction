# 로딩바가 재생 중이 아닐 때
execute unless entity @s[tag=loading] run return run tellraw @s {"text":"재생되고 있는 로딩이 없습니다.","color":"red"}

# 로딩중 취소
    tag @s remove loading_type1
    tag @s remove loading_type2
    title @s actionbar ""
    scoreboard players reset @s loading.pixel
    scoreboard players reset @s ptemp
    scoreboard players reset @s loading.tick
    tag @s remove loading