

#> function eternal_return:maps/hyper_loop/cursor_in_place/alley

function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:158, dot1_Y:60, dot2_X:174, dot2_Y: 44, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:174, dot1_Y:44, dot2_X:204, dot2_Y: 74, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:204, dot1_Y:74, dot2_X:180, dot2_Y: 96, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:180, dot1_Y:96, dot2_X:162, dot2_Y: 78, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:162, dot1_Y:78, dot2_X:168, dot2_Y: 72, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:168, dot1_Y:72, dot2_X:158, dot2_Y: 60, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1





