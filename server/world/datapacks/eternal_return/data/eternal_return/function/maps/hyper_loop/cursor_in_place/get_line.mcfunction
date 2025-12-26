#gas station 시계 방향으로 확인 (input : posOfCursor)  
#순서대로 d1, d2, dx, dy
#(146,26) (134,34) 22,22
#(134,34) (144,44) 20,20
#(144,44) (124,64) 22,-22
#(124,64) (138,78) 14,14  
#(138,78) (168,48) 10,10
#return 1 or 0
#> #bool ER.sys 반환 (1 또는 0)

#> function eternal_return:maps/hyper_loop/cursor_in_place/get_line {dot1_X,dot1_Y,dot2_X,dot2_Y,laser_length}

# (x - d1.x)/dx > (y - d1.y)/dy

# (x - dot1_X)
scoreboard players operation #x0 ER.sys = #rotX ER.sys
$scoreboard players remove #x0 ER.sys $(dot1_X)

# (x + laser_length - dot1_X)
scoreboard players operation #x1 ER.sys = #rotX ER.sys
$scoreboard players set #temp ER.sys $(laser_length)
scoreboard players operation #x1 ER.sys -= #temp ER.sys
$scoreboard players remove #x1 ER.sys $(dot1_X)


$scoreboard players set #dX ER.sys $(dot1_X)
$scoreboard players set #temp ER.sys $(dot2_X)
scoreboard players operation #dX ER.sys -= #temp ER.sys

$scoreboard players set #dY ER.sys $(dot1_Y)
$scoreboard players set #temp ER.sys $(dot2_Y)
scoreboard players operation #dY ER.sys -= #temp ER.sys

# ((y - dot1_Y)*dX)/(dY)
scoreboard players operation #y ER.sys = #rotY ER.sys
$scoreboard players remove #y ER.sys $(dot1_Y)

scoreboard players operation #y ER.sys *= #dX ER.sys
scoreboard players operation #y ER.sys /= #dY ER.sys

scoreboard players operation #x0 ER.sys -= #y ER.sys
scoreboard players operation #x1 ER.sys -= #y ER.sys
scoreboard players operation #x1 ER.sys *= #x0 ER.sys

$scoreboard players set #max_y ER.sys $(dot1_Y)
$scoreboard players set #min_y ER.sys $(dot2_Y)
execute if score #max_y ER.sys < #min_y ER.sys run scoreboard players operation #max_y ER.sys >< #min_y ER.sys

execute if score #max_y ER.sys > #rotY ER.sys \
        if score #min_y ER.sys <= #rotY ER.sys if score #x1 ER.sys matches ..0 run scoreboard players add #cnt ER.sys 1


