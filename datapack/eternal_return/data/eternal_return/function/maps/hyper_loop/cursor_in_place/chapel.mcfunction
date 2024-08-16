
#> function eternal_return:maps/hyper_loop/cursor_in_place/chapel

function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:144, dot1_Y:176, dot2_X:124, dot2_Y:156, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:124, dot1_Y:156, dot2_X:106, dot2_Y:174, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:106, dot1_Y:174, dot2_X:102, dot2_Y:170, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:102, dot1_Y:170, dot2_X: 86, dot2_Y:184, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X: 86, dot1_Y:184, dot2_X:110, dot2_Y:206, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:110, dot1_Y:206, dot2_X:134, dot2_Y:182, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:134, dot1_Y:182, dot2_X:144, dot2_Y:176, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

