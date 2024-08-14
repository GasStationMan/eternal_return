
#> function eternal_return:maps/hyper_loop/cursor_in_place/beach

function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:170, dot1_Y:154, dot2_X:194, dot2_Y:176, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:194, dot1_Y:176, dot2_X:228, dot2_Y:142, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:228, dot1_Y:142, dot2_X:210, dot2_Y:128, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:210, dot1_Y:128, dot2_X:200, dot2_Y:138, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:200, dot1_Y:138, dot2_X:182, dot2_Y:142, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:182, dot1_Y:142, dot2_X:170, dot2_Y:154, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

