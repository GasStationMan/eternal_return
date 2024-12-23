

entity targetPlayer is @a[tag=player,tag=float4.vector2d.detect_circular_sector]

#say [->skill] start
set #i ER.sys 0
execute on passengers at @s positioned ~ ~-1.5 ~ :
    function df_lib:float4/vec2d/detect_circular_sector/main {halfAngle:90,distance:4}
    #vvv loop vvv
    if entity targetPlayer as targetPlayer rotated as @s positioned ^0.25 ^ ^ :
        #say [->skill] -> fly -x
        function :
            if block ^-0.25 ^ ^ minecraft:air run return run tp @s ^0.25 ^ ^ ~ ~
            set #i ER.sys 10
        add #i ER.sys 1
        execute if score #i ER.sys == ..10 as @s rotated as @s positioned ^0.25 ^ ^ run function BACK
        damage @s 10 minecraft:player_attack
        tag @s -= float4.vector2d.detect_circular_sector
#say [->skill] end

