import pdb:get_uuid is pdb:get_me

storage playerUUID       is pdb:main args
storage bossbarStructure is minecraft:temp temp
entity thisEntity is @s

score rotX is #rotX ER.sys
score rotY is #rotY ER.sys




$if entity @s[tag=$(tag)] run return run function {tag : "$(tag)",x:$(x),y:$(y),button_listener_function:"$(button_listener_function)",button_position_function:"$(button_position_function)"}:

    function pdb:get_uuid
    bossbarStructure.UUID0 = playerUUID.UUID0
    bossbarStructure.UUID1 = playerUUID.UUID1
    bossbarStructure.UUID2 = playerUUID.UUID2
    bossbarStructure.UUID3 = playerUUID.UUID3

    execute if entity @s[tag=!choosing_$(tag)] at @s run function {tag : $(tag)}:
        tp @s ~ ~ ~ 0 0
        tag @s add choosing_$(tag)


    ## vvvv DO NOT MODIFY vvvv

    #>플레이어 버튼 위치 상수값 세팅
    scoreboard players operation @s ER.sys = #ER.place.null ER.sys

    #>플레이어 회전값 구하기
    rotX = thisEntity nbt Rotation[0] 10
    rotY = thisEntity nbt Rotation[1] 10
    
    # rotX = limwitdth / 2 - rotX
    set #2 ER.sys 2
    $set #modifyRotX ER.sys $(x)
    op #modifyRotX ER.sys /= #2 ER.sys
    op #modifyRotX ER.sys -= #rotX ER.sys
    op #rotX ER.sys = #modifyRotX ER.sys

    $add #rotY ER.sys $(y)
    op #rotY ER.sys /= #2 ER.sys

    op rotX ER.sys = #rotX ER.sys
    op rotY ER.sys = #rotY ER.sys

    if rotX == ..0 run\
        set #rotX ER.sys 1
    
    if rotX == $(x).. run\
        set #rotX ER.sys $(x)
    
    if rotY == ..0 run\
        set #rotY ER.sys 1
    
    if rotY == $(y).. run\
        set #rotY ER.sys $(y)


    bossbarStructure.x = rotX
    bossbarStructure.y = rotY

    ## 커서 위치 조정에는 y좌표만 필요 (남은 x좌표는 space.$(x)로 조절할 예정)
    function with bossbarStructure :
        if score #rotY ER.sys matches ..-1 run \
            data modify bossbarStructure.mouseY set value "000"
        $if score #rotY ER.sys matches 0..9 run \
            data modify bossbarStructure.mouseY set value "00$(y)"
        $if score #rotY ER.sys matches 10..99 run \
            data modify bossbarStructure.mouseY set value "0$(y)"
        $if score #rotY ER.sys matches 100..999 run \
            data modify bossbarStructure.mouseY set value "$(y)"
            
    set #cnt ER.sys 0

    ##버튼 감지
    $if score #cnt ER.sys matches 0 run function $(button_listener_function)
    $function $(button_position_function) with bossbarStructure

        #============================================================#^^^수정^^^#============================================================#
    #DEBUG for mousePointer vvv
    #title @a actionbar [{"storage":"minecraft:temp","nbt":"temp.mouseX"},{"text":"  "},{"storage":"minecraft:temp","nbt":"temp.mouseY"}]
    #DEBUG for mousePointer ^^^
    ## vvvv DO NOT MODIFY vvvv
    scoreboard players reset #cnt ER.sys
    scoreboard players reset #rotX ER.sys
    scoreboard players reset #rotY ER.sys
    scoreboard players reset #modifyRotX ER.sys
    data remove bossbarStructure

$if entity @s[tag=!$(tag), tag=choosing_$(tag)] run function {tag : "$(tag)"}:
    function pdb:get_uuid
    bossbarStructure.UUID0 = playerUUID.UUID0
    bossbarStructure.UUID1 = playerUUID.UUID1
    bossbarStructure.UUID2 = playerUUID.UUID2
    bossbarStructure.UUID3 = playerUUID.UUID3
    function with bossbarStructure :
        $bossbar set minecraft:line5.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
    $tag @s remove choosing_$(tag)
    data remove bossbarStructure