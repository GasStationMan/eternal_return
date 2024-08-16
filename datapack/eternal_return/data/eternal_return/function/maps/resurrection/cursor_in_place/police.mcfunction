
#> function eternal_return:maps/hyper_loop/cursor_in_place/police

function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:122, dot1_Y: 62, dot2_X:108, dot2_Y: 50, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:108, dot1_Y: 50, dot2_X: 84, dot2_Y: 74, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X: 84, dot1_Y: 74, dot2_X: 90, dot2_Y: 80, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X: 90, dot1_Y: 80, dot2_X: 82, dot2_Y: 88, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X: 82, dot1_Y: 88, dot2_X: 94, dot2_Y: 98, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X: 94, dot1_Y: 98, dot2_X: 96, dot2_Y: 96, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X: 96, dot1_Y: 96, dot2_X:100, dot2_Y: 98, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:100, dot1_Y: 98, dot2_X:104, dot2_Y: 94, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:104, dot1_Y: 94, dot2_X: 98, dot2_Y: 88, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X: 98, dot1_Y: 88, dot2_X:122, dot2_Y: 62, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

