## type 2 로딩바 다시재생

    # 타입 2가 아닌 경우
        execute unless entity @s[tag=loading_type2] run \
            return run tellraw @s {"text":"타입 2가 아닙니다.","color":"red"}
    # 재생 중인 경우
        execute if entity @s[tag=!loading_pause] run \
            return run tellraw @s {"text":"이미 재생 중입니다.","color":"red"}

    # 로딩바 1이 채워지지 않은 경우
        execute if score @s loading.pixel matches ..99 run function eternal_return:gui/loading/cancel

    # 로딩바 1이 채워진 경우
        execute if score @s loading.pixel matches 100.. if entity @s[tag=loading_pause] run \
            return run tag @s remove loading_pause
