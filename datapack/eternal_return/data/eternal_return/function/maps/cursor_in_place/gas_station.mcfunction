#gas station 시계 방향으로 확인 (input : posOfCursor)  
#순서대로 d1, d2, dx, dy
#(168,48) (146,26) 22 22 
#(146,26) (134,34) 12 -12
#(134,34) (144,44) 20 20
#(144,44) (124,64) 22 22
#(124,64) (138,78) 14 14  
#(138,78) (168,48) 10 10
#return 1 or 0

#> function eternal_return:maps/hyper_loop/cursor_in_place/gas_station

function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:168, dot1_Y:48, dot2_X:144, dot2_Y:24, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:144, dot1_Y:24, dot2_X:136, dot2_Y:36, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:136, dot1_Y:36, dot2_X:144, dot2_Y:44, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:144, dot1_Y:44, dot2_X:124, dot2_Y:64, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:124, dot1_Y:64, dot2_X:138, dot2_Y:78, laser_length:200}
function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X:138, dot1_Y:78, dot2_X:168, dot2_Y:48, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

