
#> function eternal_return:maps/hyper_loop/cursor_in_place/hospital

function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 82, dot1_Y:152, dot2_X: 64, dot2_Y:134, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 64, dot1_Y:134, dot2_X: 68, dot2_Y:130, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 68, dot1_Y:130, dot2_X: 60, dot2_Y:124, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 60, dot1_Y:124, dot2_X: 56, dot2_Y:128, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 56, dot1_Y:128, dot2_X: 48, dot2_Y:122, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 48, dot1_Y:122, dot2_X: 32, dot2_Y:140, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 32, dot1_Y:140, dot2_X: 56, dot2_Y:164, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 56, dot1_Y:164, dot2_X: 60, dot2_Y:162, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 60, dot1_Y:162, dot2_X: 66, dot2_Y:166, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 66, dot1_Y:166, dot2_X: 82, dot2_Y:152, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

