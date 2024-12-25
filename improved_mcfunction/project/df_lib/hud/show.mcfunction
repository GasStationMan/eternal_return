import pdb:get_me is pdb:get_me

storage playerUUID       is pdb:main args
storage bossbarStructure is minecraft:temp temp
entity thisEntity is @s

score rotX is #rotX ER.sys
score rotY is #rotY ER.sys




if entity @s[tag=kiosk] :
    function pdb:get_uuid
    bossbarStructure.UUID0 = playerUUID.UUID0
    bossbarStructure.UUID1 = playerUUID.UUID1
    bossbarStructure.UUID2 = playerUUID.UUID2
    bossbarStructure.UUID3 = playerUUID.UUID3

    if entity @s[tag= !choosing_kiosk] at @s run tp @s ~ ~ ~ 0 0
    if entity @s[tag= !choosing_kiosk] run tag @s add choosing_kiosk

    # 메인 함수로 진입
    set #hud_main.mouse_pointer_limit_width ER.sys 800
    set #hud_main.mouse_pointer_limit_height ER.sys 250

    #============================================================#vvv수정vvv#============================================================#
    bossbarStructure.buttons = {tree_of_life:"white",vf_blood:"white",random:"white",mithril:"white",meteorite:"white",force_core:"white"}
    #============================================================#^^^수정^^^#============================================================#

    ## vvvv DO NOT MODIFY vvvv

    #>플레이어 버튼 위치 상수값 세팅
    scoreboard players operation @s ER.sys = #ER.place.null ER.sys

    #>플레이어 회전값 구하기



    rotX = thisEntity nbt Rotation[0] 10
    rotY = thisEntity nbt Rotation[1] 10
    
    # rotX = limwitdth / 2 - rotX

    set #2 ER.sys 2
    op #modifyRotX ER.sys = #hud_main.mouse_pointer_limit_width ER.sys
    op #modifyRotX ER.sys /= #2 ER.sys
    op #modifyRotX ER.sys -= #rotX ER.sys
    op #rotX ER.sys = #modifyRotX ER.sys

    op #rotY ER.sys += #hud_main.mouse_pointer_limit_height ER.sys

    op rotX ER.sys = #rotX ER.sys
    op rotY ER.sys = #rotY ER.sys

    if rotX == ..0 run\
        set #rotX ER.sys 1
    
    if rotX == 800.. run\
        set #rotX ER.sys 800
    
    if rotY == ..0 run\
        set #rotY ER.sys 1
    
    if rotY == 256.. run\
        set #rotY ER.sys 256


    bossbarStructure.x = rotX
    bossbarStructure.y = rotY

    function with bossbarStructure :
        if score #rotX ER.sys matches ..-1 run\
            data modify bossbarStructure.mouseX set value "000"
        $if score #rotX ER.sys matches 0..9 run\
            data modify bossbarStructure.mouseX set value "00$(x)"
        $if score #rotX ER.sys matches 10..99 run\
            data modify bossbarStructure.mouseX set value "0$(x)"
        $if score #rotX ER.sys matches 100..999 run\
            data modify bossbarStructure.mouseX set value "$(x)"

        if score #rotY ER.sys matches ..-1 run \
            data modify bossbarStructure.mouseY set value "000"
        $if score #rotY ER.sys matches 0..9 run \
            data modify bossbarStructure.mouseY set value "00$(y)"
        $if score #rotY ER.sys matches 10..99 run \
            data modify bossbarStructure.mouseY set value "0$(y)"
        $if score #rotY ER.sys matches 100..999 run \
            data modify bossbarStructure.mouseY set value "$(y)"
            
    scoreboard players set #cnt ER.sys 0

    if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/tree_of_life run\
        function eternal_return:maps/select_place {place:"tree_of_life",color:"blue"}
           
    if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/vf_blood run\
        function eternal_return:maps/select_place {place:"vf_blood",color:"blue"}
          
    if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/random run\
        function eternal_return:maps/select_place {place:"random",color:"blue"}
          
    if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/mithril run\
        function eternal_return:maps/select_place {place:"mithril",color:"blue"}
          
    if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/meteorite run\
        function eternal_return:maps/select_place {place:"meteorite",color:"blue"}
           
    if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/force_core run\
        function eternal_return:maps/select_place {place:"force_core",color:"blue"}
            
    function with bossbarStructure :
        $bossbar set minecraft:line5.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [\
            {"font":"minecraft:map/kiosk",  "text":"\u4000"},\
            \
            {"translate":"space.-400",      "font":"minecraft:default"},\
            {"translate":"space.-100",      "font":"minecraft:default"},\
            {"font":"minecraft:map/kiosk",  "text":"\u4001"},\
            {"translate":"space.400",      "font":"minecraft:default"},\
            \
            {"translate":"space.-50",      "font":"minecraft:default"},\
            {"translate":"space.-$(x)",     "font":"minecraft:default"},\
            {"translate":"space.-7",        "font":"minecraft:default"},\
            {"font":"minecraft:map/icon",   "text":"\u1$(mouseY)"},\
            {"translate":"space.$(x)",      "font":"minecraft:default"}\
            ]
        #============================================================#^^^수정^^^#============================================================#
    #DEBUG for mousePointer vvv
    title @a actionbar [{"storage":"minecraft:temp","nbt":"temp.mouseX"},{"text":"  "},{"storage":"minecraft:temp","nbt":"temp.mouseY"}]
    #DEBUG for mousePointer ^^^
    ## vvvv DO NOT MODIFY vvvv
    scoreboard players reset #cnt ER.sys
    scoreboard players reset #rotX ER.sys
    scoreboard players reset #rotY ER.sys
    scoreboard players reset #modifyRotX ER.sys
    scoreboard players reset #hud_main.mouse_pointer_limit_height ER.sys
    scoreboard players reset #hud_main.mouse_pointer_limit_hidth ER.sys
    
    #data remove bossbarStructure

execute if entity @s[tag=!kiosk, tag=choosing_kiosk] :
    function pdb:get_uuid
    bossbarStructure.UUID0 = playerUUID.UUID0
    bossbarStructure.UUID1 = playerUUID.UUID1
    bossbarStructure.UUID2 = playerUUID.UUID2
    bossbarStructure.UUID3 = playerUUID.UUID3
    function with bossbarStructure :
        $bossbar set minecraft:line5.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
    tag @s remove choosing_kiosk
    data remove bossbarStructure