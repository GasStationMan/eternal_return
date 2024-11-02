# retrun : tag[done_loading]

## 로딩바


    # 틱 레이트
        scoreboard players operation @s loading.tick += @s ptemp
    # 픽셀 갯수 계산
        # 틱당 계산된 픽셀 수 계산
        scoreboard players operation @s loading.pixel = @s loading.tick
        scoreboard players operation @s loading.pixel /= #1000 NUM

        # PAUSE한 경우
        execute if entity @s[tag=loading_pause] run scoreboard players set @s loading.tick 100000
        execute if entity @s[tag=loading_pause] run scoreboard players set @s loading.pixel 100
        

    # type 1 : 로딩바 1개
        execute if entity @s[tag=loading_type1] run function eternal_return:gui/loading/show_bar/type1

    # type 2 : 로딩바 2개
        execute if entity @s[tag=loading_type2] run function eternal_return:gui/loading/show_bar/type2


    # 임시 스토리지 지우기
        #data remove storage minecraft:temp args

    # 종료조건
        execute if score @s loading.pixel matches 200.. run tag @s add done_loading
        execute if score @s loading.pixel matches 200.. run function eternal_return:gui/loading/cancel