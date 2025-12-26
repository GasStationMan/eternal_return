## 타입 1 : 로딩바 1개

    # UUID 불러오기
        function pdb:get_me
        data modify storage minecraft:temp args set from storage pdb:main args

    # 임시 스토리지에 스코어보드 입력
        execute store result storage minecraft:temp args.score int 1 run scoreboard players get @s loading.pixel


    # 스코어별 표기
        execute if score @s loading.pixel matches ..0 run title @s actionbar {"text":"\u5000","font":"gui/loading/bar","shadow_color":0}
        execute if score @s loading.pixel matches 1..9 run function eternal_return:gui/loading/show_bar/type1/1 with storage minecraft:temp args
        execute if score @s loading.pixel matches 10..99 run function eternal_return:gui/loading/show_bar/type1/01 with storage minecraft:temp args
        execute if score @s loading.pixel matches 100..199 run function eternal_return:gui/loading/show_bar/type1/001 with storage minecraft:temp args
        execute if score @s loading.pixel matches 200.. run title @s actionbar {"text":"\u5200","font":"gui/loading/bar","shadow_color":0}
