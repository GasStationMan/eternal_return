

#> function eternal_return:maps/hyper_loop/cursor_in_place/alley

function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:144, dot1_Y:24, dot2_X:126, dot2_Y:  6, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:126, dot1_Y: 6, dot2_X: 88, dot2_Y: 44, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X: 88, dot1_Y:44, dot2_X: 98, dot2_Y: 52, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X: 98, dot1_Y:52, dot2_X:106, dot2_Y: 46, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:106, dot1_Y:46, dot2_X:124, dot2_Y: 62, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:124, dot1_Y:62, dot2_X:142, dot2_Y: 44, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:142, dot1_Y:44, dot2_X:134, dot2_Y: 34, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:134, dot1_Y:34, dot2_X:144, dot2_Y: 24, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1


