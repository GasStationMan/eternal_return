## 타입 2 : 로딩바 2개

    # UUID 불러오기
        function pdb:get_me
        data modify storage minecraft:temp args set from storage pdb:main args

    # 임시 스토리지에 스코어보드 입력
        execute store result storage minecraft:temp args.score int 1 run scoreboard players get @s loading.pixel


    # 스코어별 표기
        # 0 이하
        execute if score @s loading.pixel matches ..0 run function eternal_return:gui/loading/show_bar/type2/else/0 with storage minecraft:temp args
        
        # 로딩바 1에서 로딩바 2로 넘어가는 구간
        execute if score @s loading.pixel matches 100..101 run function eternal_return:gui/loading/show_bar/type2/else/100 with storage minecraft:temp args
        # 200~
        execute if score @s loading.pixel matches 200.. run function eternal_return:gui/loading/show_bar/type2/else/200 with storage minecraft:temp args
        # 1 ~ 99
        execute if score @s loading.pixel matches 1..9 run function eternal_return:gui/loading/show_bar/type2/bar1/1 with storage minecraft:temp args
        execute if score @s loading.pixel matches 10..99 run function eternal_return:gui/loading/show_bar/type2/bar1/01 with storage minecraft:temp args
        # 102 ~ 199
        execute if score @s loading.pixel matches 102..199 run function eternal_return:gui/loading/show_bar/type2/bar2/1 with storage minecraft:temp args

    # free
        data remove storage temp args