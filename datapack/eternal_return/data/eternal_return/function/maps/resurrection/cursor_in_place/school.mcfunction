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

function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:158, dot1_Y: 62, dot2_X:132, dot2_Y: 88, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:132, dot1_Y: 88, dot2_X:140, dot2_Y: 96, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:140, dot1_Y: 96, dot2_X:134, dot2_Y:104, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:134, dot1_Y:104, dot2_X:154, dot2_Y:122, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:154, dot1_Y:122, dot2_X:180, dot2_Y: 96, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:180, dot1_Y: 96, dot2_X:160, dot2_Y: 78, laser_length:200}
function eternal_return:maps/hyper_loop/cursor_in_place/dot_in_poly {dot1_X:160, dot1_Y: 78, dot2_X:158, dot2_Y: 62, laser_length:200}

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

