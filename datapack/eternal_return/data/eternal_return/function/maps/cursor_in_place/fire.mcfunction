
#> function eternal_return:maps/hyper_loop/cursor_in_place/fire

function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:138, dot1_Y: 78, dot2_X:124, dot2_Y: 66, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:124, dot1_Y: 66, dot2_X:104, dot2_Y: 84, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:104, dot1_Y: 84, dot2_X:102, dot2_Y: 90, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:102, dot1_Y: 90, dot2_X:106, dot2_Y: 94, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:106, dot1_Y: 94, dot2_X:102, dot2_Y:100, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:102, dot1_Y:100, dot2_X:116, dot2_Y:116, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:116, dot1_Y:116, dot2_X:136, dot2_Y: 96, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:136, dot1_Y: 96, dot2_X:128, dot2_Y: 88, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:128, dot1_Y: 88, dot2_X:138, dot2_Y: 78, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

