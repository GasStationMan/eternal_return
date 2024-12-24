
storage bossbarStructure is minecraft:temp temp
entity thisEntity is @s


execute if entity @s[tag=kiosk] :

    execute if entity @s[tag= !choosing_kiosk] at @s run tp @s ~ ~ ~ 0 0
    execute if entity @s[tag= !choosing_kiosk] run tag @s add choosing_kiosk

    # 메인 함수로 진입
    scoreboard players set #hud_main.mouse_pointer_limit_width ER.sys 800
    scoreboard players set #hud_main.mouse_pointer_limit_height ER.sys 250
    function :
        #
        # function eternal_return:maps/kiosk/get_selected_place/mouse_pinter_limit_width__mouse_pointer_limit_height

        #============================================================#vvv수정vvv#============================================================#
        data modify storage minecraft:temp temp set value {id: 0,tree_of_life:"white",vf_blood:"white",random:"white",mithril:"white",meteorite:"white",force_core:"white"}
        #============================================================#^^^수정^^^#============================================================#

        ## vvvv DO NOT MODIFY vvvv
        function :
            execute store result storage minecraft:temp temp.id int 1 run scoreboard players get @s player_id

            #>플레이어 버튼 위치 상수값 세팅
            scoreboard players operation @s ER.sys = #ER.place.null ER.sys

            #>플레이어 회전값 구하기
            execute store result score #rotX ER.sys run data get entity @s Rotation[0] 10
            execute store result score #rotY ER.sys run data get entity @s Rotation[1] 10

            scoreboard players set #2 ER.sys 2
            scoreboard players operation #modifyRotX ER.sys = #hud_main.mouse_pointer_limit_width ER.sys
            scoreboard players operation #modifyRotX ER.sys /= #2 ER.sys
            scoreboard players operation #rotX ER.sys -= #modifyRotX ER.sys
            scoreboard players set #temp ER.sys -1
            scoreboard players operation #rotX ER.sys *= #temp ER.sys
            scoreboard players operation #hud_main.mouse_pointer_limit_width ER.sys *= #2 ER.sys
            scoreboard players operation #rotX ER.sys %= #hud_main.mouse_pointer_limit_width ER.sys
            scoreboard players operation #rotY ER.sys %= #hud_main.mouse_pointer_limit_height ER.sys

            scoreboard players operation #get_mouse_pos.x ER.sys = #rotX ER.sys
            scoreboard players operation #get_mouse_pos.y ER.sys = #rotY ER.sys
            function :
                execute store result storage minecraft:temp coord.x int 1 run scoreboard players get #get_mouse_pos.x ER.sys
                execute store result storage minecraft:temp coord.y int 1 run scoreboard players get #get_mouse_pos.y ER.sys
                function eternal_return:maps/lib/get_mouse_pos/b1 with storage minecraft:temp coord
                scoreboard players reset #get_mouse_pos.x ER.sys
                scoreboard players reset #get_mouse_pos.y ER.sys

            scoreboard players set #cnt ER.sys 0

        #============================================================#vvv수정vvv#============================================================#
            execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/tree_of_life run\
                function eternal_return:maps/select_place {place:"tree_of_life",color:"blue"}
            
            execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/vf_blood run\
                function eternal_return:maps/select_place {place:"vf_blood",color:"blue"}
            
            execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/random run\
                function eternal_return:maps/select_place {place:"random",color:"blue"}
            
            execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/mithril run\
                function eternal_return:maps/select_place {place:"mithril",color:"blue"}
            
            execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/meteorite run\
                function eternal_return:maps/select_place {place:"meteorite",color:"blue"}
            
            execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/force_core run\
                function eternal_return:maps/select_place {place:"force_core",color:"blue"}
            
            function eternal_return:maps/kiosk/show_selected with storage minecraft:temp temp
        #============================================================#^^^수정^^^#============================================================#
        #DEBUG for mousePointer vvv
        title @a actionbar [{"storage":"minecraft:temp","nbt":"temp.mouseX"},{"text":"  "},{"storage":"minecraft:temp","nbt":"temp.mouseY"}]
        #DEBUG for mousePointer ^^^

        ## vvvv DO NOT MODIFY vvvv
        function :
            data remove storage minecraft:temp temp
            scoreboard players reset #cnt ER.sys
            scoreboard players reset #rotX ER.sys
            scoreboard players reset #rotY ER.sys
            scoreboard players reset #modifyRotX ER.sys
            scoreboard players reset #hud_main.mouse_pointer_limit_height ER.sys
            scoreboard players reset #hud_main.mouse_pointer_limit_hidth ER.sys

execute if entity @s[tag=!kiosk, tag=choosing_kiosk] run function {tag : choosing_kiosk} :

    bossbarStructure.id = thisEntity score player_id
    function with bossbarStructure :
        $bossbar set minecraft:line5.id$(id) name ""
    $tag @s remove $(tag)
    data remove bossbarStructure