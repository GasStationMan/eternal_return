execute store result storage minecraft:temp temp.id int 1 run scoreboard players get @s player_id
scoreboard players operation @s ER.sys = #ER.place.null ER.sys
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
function df_lib:hud/allfunction/b1/b1/b1/b1/code
scoreboard players set #cnt ER.sys 0
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/tree_of_life run function eternal_return:maps/select_place {place:"tree_of_life",color:"blue"}
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/vf_blood run function eternal_return:maps/select_place {place:"vf_blood",color:"blue"}
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/random run function eternal_return:maps/select_place {place:"random",color:"blue"}
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/mithril run function eternal_return:maps/select_place {place:"mithril",color:"blue"}
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/meteorite run function eternal_return:maps/select_place {place:"meteorite",color:"blue"}
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/force_core run function eternal_return:maps/select_place {place:"force_core",color:"blue"}
function eternal_return:maps/kiosk/show_selected with storage minecraft:temp temp
