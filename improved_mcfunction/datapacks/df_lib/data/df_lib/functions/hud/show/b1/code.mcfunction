function pdb:get_me
data modify storage minecraft:temp temp.UUID0 set from storage pdb:main args.UUID0
data modify storage minecraft:temp temp.UUID1 set from storage pdb:main args.UUID1
data modify storage minecraft:temp temp.UUID2 set from storage pdb:main args.UUID2
data modify storage minecraft:temp temp.UUID3 set from storage pdb:main args.UUID3
$execute if entity @s[tag=!choosing_$(tag)] at @s run function df_lib:hud/show/b1/b1/code {tag : $(tag)}
scoreboard players operation @s ER.sys = #ER.place.null ER.sys
execute store result score #rotX ER.sys run data get entity @s Rotation[0] 10
execute store result score #rotY ER.sys run data get entity @s Rotation[1] 10
scoreboard players set #2 ER.sys 2
$scoreboard players set #modifyRotX ER.sys $(x)
scoreboard players operation #modifyRotX ER.sys /= #2 ER.sys
scoreboard players operation #modifyRotX ER.sys -= #rotX ER.sys
scoreboard players operation #rotX ER.sys = #modifyRotX ER.sys
$scoreboard players add #rotY ER.sys $(y)
scoreboard players operation #rotY ER.sys /= #2 ER.sys
scoreboard players operation rotX ER.sys = #rotX ER.sys
scoreboard players operation rotY ER.sys = #rotY ER.sys
execute if score #rotX ER.sys matches ..0 run scoreboard players set #rotX ER.sys 1
$execute if score #rotX ER.sys matches $(x).. run scoreboard players set #rotX ER.sys $(x)
execute if score #rotY ER.sys matches ..0 run scoreboard players set #rotY ER.sys 1
$execute if score #rotY ER.sys matches $(y).. run scoreboard players set #rotY ER.sys $(y)
execute store result storage minecraft:temp temp.x int 1 run scoreboard players get #rotX ER.sys
execute store result storage minecraft:temp temp.y int 1 run scoreboard players get #rotY ER.sys
function df_lib:hud/show/b1/b2/code with storage minecraft:temp temp
scoreboard players set #cnt ER.sys 0
$execute if score #cnt ER.sys matches 0 run function $(button_listener_function)
$function $(button_position_function) with storage minecraft:temp temp
scoreboard players reset #cnt ER.sys
scoreboard players reset #rotX ER.sys
scoreboard players reset #rotY ER.sys
scoreboard players reset #modifyRotX ER.sys
data remove storage minecraft:temp temp
