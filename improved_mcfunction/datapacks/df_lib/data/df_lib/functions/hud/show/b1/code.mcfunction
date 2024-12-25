function pdb:get_uuid
data modify storage minecraft:temp temp.UUID0 set from storage pdb:main args.UUID0
data modify storage minecraft:temp temp.UUID1 set from storage pdb:main args.UUID1
data modify storage minecraft:temp temp.UUID2 set from storage pdb:main args.UUID2
data modify storage minecraft:temp temp.UUID3 set from storage pdb:main args.UUID3
execute if entity @s[tag= !choosing_kiosk] at @s run tp @s ~ ~ ~ 0 0
execute if entity @s[tag= !choosing_kiosk] run tag @s add choosing_kiosk
scoreboard players set #hud_main.mouse_pointer_limit_width ER.sys 800
scoreboard players set #hud_main.mouse_pointer_limit_height ER.sys 250
data modify storage minecraft:temp temp.buttons set value {tree_of_life:"white",vf_blood:"white",random:"white",mithril:"white",meteorite:"white",force_core:"white"}
scoreboard players operation @s ER.sys = #ER.place.null ER.sys
execute store result score #rotX ER.sys run data get entity @s Rotation[0] 10
execute store result score #rotY ER.sys run data get entity @s Rotation[1] 10
scoreboard players set #2 ER.sys 2
scoreboard players operation #modifyRotX ER.sys = #hud_main.mouse_pointer_limit_width ER.sys
scoreboard players operation #modifyRotX ER.sys /= #2 ER.sys
scoreboard players operation #modifyRotX ER.sys -= #rotX ER.sys
scoreboard players operation #rotX ER.sys = #modifyRotX ER.sys
scoreboard players operation #rotY ER.sys += #hud_main.mouse_pointer_limit_height ER.sys
scoreboard players operation rotX ER.sys = #rotX ER.sys
scoreboard players operation rotY ER.sys = #rotY ER.sys
execute if score #rotX ER.sys matches ..0 run scoreboard players set #rotX ER.sys 1
execute if score #rotX ER.sys matches 800.. run scoreboard players set #rotX ER.sys 800
execute if score #rotY ER.sys matches ..0 run scoreboard players set #rotY ER.sys 1
execute if score #rotY ER.sys matches 256.. run scoreboard players set #rotY ER.sys 256
execute store result storage minecraft:temp temp.x int 1 run scoreboard players get #rotX ER.sys
execute store result storage minecraft:temp temp.y int 1 run scoreboard players get #rotY ER.sys
function df_lib:hud/show/b1/b1/code with storage minecraft:temp temp
scoreboard players set #cnt ER.sys 0
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/tree_of_life run function eternal_return:maps/select_place {place:"tree_of_life",color:"blue"}
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/vf_blood run function eternal_return:maps/select_place {place:"vf_blood",color:"blue"}
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/random run function eternal_return:maps/select_place {place:"random",color:"blue"}
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/mithril run function eternal_return:maps/select_place {place:"mithril",color:"blue"}
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/meteorite run function eternal_return:maps/select_place {place:"meteorite",color:"blue"}
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/force_core run function eternal_return:maps/select_place {place:"force_core",color:"blue"}
function df_lib:hud/show/b1/b2/code with storage minecraft:temp temp
title @a actionbar [{"storage":"minecraft:temp","nbt":"temp.mouseX"},{"text":"  "},{"storage":"minecraft:temp","nbt":"temp.mouseY"}]
scoreboard players reset #cnt ER.sys
scoreboard players reset #rotX ER.sys
scoreboard players reset #rotY ER.sys
scoreboard players reset #modifyRotX ER.sys
scoreboard players reset #hud_main.mouse_pointer_limit_height ER.sys
scoreboard players reset #hud_main.mouse_pointer_limit_hidth ER.sys
