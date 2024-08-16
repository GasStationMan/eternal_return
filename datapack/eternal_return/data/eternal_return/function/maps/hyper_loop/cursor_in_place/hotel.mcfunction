
#> function eternal_return:maps/hyper_loop/cursor_in_place/hotel

function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:196, dot1_Y: 84, dot2_X:164, dot2_Y:118, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:164, dot1_Y:118, dot2_X:186, dot2_Y:140, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:186, dot1_Y:140, dot2_X:194, dot2_Y:132, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:194, dot1_Y:132, dot2_X:200, dot2_Y:136, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:200, dot1_Y:136, dot2_X:224, dot2_Y:108, laser_length:200}
function eternal_return:maps/lib/get_selected_place/dot_in_poly {dot1_X:224, dot1_Y:108, dot2_X:196, dot2_Y: 84, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

