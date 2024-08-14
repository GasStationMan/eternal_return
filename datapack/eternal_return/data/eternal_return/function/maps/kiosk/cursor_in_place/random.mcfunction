
#> function eternal_return:maps/hyper_loop/cursor_in_place/beach

function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:289, dot1_Y:141, dot2_X:214, dot2_Y:141, laser_length:700}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:214, dot1_Y:141, dot2_X:214, dot2_Y:238, laser_length:700}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:214, dot1_Y:238, dot2_X:289, dot2_Y:238, laser_length:700}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:289, dot1_Y:238, dot2_X:289, dot2_Y:141, laser_length:700}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1