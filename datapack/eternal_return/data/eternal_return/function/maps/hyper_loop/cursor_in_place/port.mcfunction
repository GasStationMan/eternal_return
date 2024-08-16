
#> function eternal_return:maps/hyper_loop/cursor_in_place/port

function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:100, dot1_Y:200, dot2_X: 84, dot2_Y:218, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X: 84, dot1_Y:218, dot2_X:122, dot2_Y:248, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:122, dot1_Y:248, dot2_X:140, dot2_Y:228, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:140, dot1_Y:228, dot2_X:112, dot2_Y:204, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:112, dot1_Y:204, dot2_X:108, dot2_Y:208, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:108, dot1_Y:208, dot2_X:100, dot2_Y:200, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

