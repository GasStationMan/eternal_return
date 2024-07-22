
#> function eternal_return:maps/hyper_loop/cursor_in_place/pond

function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:116, dot1_Y:118, dot2_X: 96, dot2_Y: 98, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 96, dot1_Y: 98, dot2_X: 84, dot2_Y:112, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 84, dot1_Y:112, dot2_X: 88, dot2_Y:116, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 88, dot1_Y:116, dot2_X: 88, dot2_Y:130, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 88, dot1_Y:130, dot2_X: 76, dot2_Y:142, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 76, dot1_Y:142, dot2_X: 84, dot2_Y:150, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X: 84, dot1_Y:150, dot2_X:116, dot2_Y:118, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

