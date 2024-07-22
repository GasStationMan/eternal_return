
#> function eternal_return:maps/hyper_loop/cursor_in_place/graveyard

function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:130, dot1_Y:150, dot2_X:106, dot2_Y:128, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:106, dot1_Y:128, dot2_X: 68, dot2_Y:168, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 68, dot1_Y:168, dot2_X: 86, dot2_Y:184, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 86, dot1_Y:184, dot2_X:102, dot2_Y:168, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:102, dot1_Y:168, dot2_X:108, dot2_Y:172, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:108, dot1_Y:172, dot2_X:130, dot2_Y:150, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

