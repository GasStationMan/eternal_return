
#> function eternal_return:maps/hyper_loop/cursor_in_place/temple

function df_lib:hud/dot_in_poly {dot1_X: 98, dot1_Y: 56, dot2_X: 78, dot2_Y: 38, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X: 78, dot1_Y: 38, dot2_X: 26, dot2_Y: 82, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X: 26, dot1_Y: 82, dot2_X: 50, dot2_Y:106, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X: 50, dot1_Y:106, dot2_X: 70, dot2_Y: 88, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X: 70, dot1_Y: 88, dot2_X: 74, dot2_Y: 90, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X: 74, dot1_Y: 90, dot2_X: 86, dot2_Y: 80, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X: 86, dot1_Y: 80, dot2_X: 78, dot2_Y: 72, laser_length:200}
function df_lib:hud/dot_in_poly {dot1_X: 78, dot1_Y: 72, dot2_X: 98, dot2_Y: 56, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

