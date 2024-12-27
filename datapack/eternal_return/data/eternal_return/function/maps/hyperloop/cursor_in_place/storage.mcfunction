
#> function eternal_return:maps/hyper_loop/cursor_in_place/storage

function df_lib:hud/dot_in_poly {dot1_X:130, dot1_Y:186, dot2_X:114, dot2_Y:204, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X:114, dot1_Y:204, dot2_X:142, dot2_Y:226, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X:142, dot1_Y:226, dot2_X:158, dot2_Y:208, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X:158, dot1_Y:208, dot2_X:144, dot2_Y:194, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X:144, dot1_Y:194, dot2_X:142, dot2_Y:196, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X:142, dot1_Y:196, dot2_X:130, dot2_Y:186, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

