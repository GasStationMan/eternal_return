
#> function eternal_return:maps/hyper_loop/cursor_in_place/forest

function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:180, dot1_Y:140, dot2_X:160, dot2_Y:118, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:160, dot1_Y:118, dot2_X:154, dot2_Y:124, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:154, dot1_Y:124, dot2_X:158, dot2_Y:128, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:158, dot1_Y:128, dot2_X:132, dot2_Y:152, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:132, dot1_Y:152, dot2_X:130, dot2_Y:150, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:130, dot1_Y:150, dot2_X:126, dot2_Y:156, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:126, dot1_Y:156, dot2_X:146, dot2_Y:176, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:146, dot1_Y:176, dot2_X:180, dot2_Y:140, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

