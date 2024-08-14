
#> function eternal_return:maps/hyper_loop/cursor_in_place/village

function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:168, dot1_Y:154, dot2_X:142, dot2_Y:180, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:142, dot1_Y:180, dot2_X:134, dot2_Y:184, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:134, dot1_Y:184, dot2_X:132, dot2_Y:186, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:132, dot1_Y:186, dot2_X:142, dot2_Y:196, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:142, dot1_Y:196, dot2_X:146, dot2_Y:192, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:146, dot1_Y:192, dot2_X:170, dot2_Y:214, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:170, dot1_Y:214, dot2_X:200, dot2_Y:184, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:200, dot1_Y:184, dot2_X:168, dot2_Y:154, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

