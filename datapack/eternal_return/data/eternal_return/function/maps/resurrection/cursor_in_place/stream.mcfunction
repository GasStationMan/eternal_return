
#> function eternal_return:maps/hyper_loop/cursor_in_place/stream

function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 92, dot1_Y:100, dot2_X: 80, dot2_Y: 88, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 80, dot1_Y: 88, dot2_X: 74, dot2_Y: 94, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 74, dot1_Y: 94, dot2_X: 70, dot2_Y: 90, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 70, dot1_Y: 90, dot2_X: 42, dot2_Y:116, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 42, dot1_Y:116, dot2_X: 56, dot2_Y:126, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 56, dot1_Y:126, dot2_X: 60, dot2_Y:122, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 60, dot1_Y:122, dot2_X: 70, dot2_Y:130, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 70, dot1_Y:130, dot2_X: 66, dot2_Y:134, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 66, dot1_Y:134, dot2_X: 74, dot2_Y:140, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 74, dot1_Y:140, dot2_X: 86, dot2_Y:128, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 86, dot1_Y:128, dot2_X: 86, dot2_Y:116, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 86, dot1_Y:116, dot2_X: 82, dot2_Y:112, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 82, dot1_Y:112, dot2_X: 92, dot2_Y:100, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

