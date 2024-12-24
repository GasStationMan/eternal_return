execute store result storage minecraft:temp coord.x int 1 run scoreboard players get #get_mouse_pos.x ER.sys
execute store result storage minecraft:temp coord.y int 1 run scoreboard players get #get_mouse_pos.y ER.sys
function eternal_return:maps/lib/get_mouse_pos/b1 with storage minecraft:temp coord
scoreboard players reset #get_mouse_pos.x ER.sys
scoreboard players reset #get_mouse_pos.y ER.sys
