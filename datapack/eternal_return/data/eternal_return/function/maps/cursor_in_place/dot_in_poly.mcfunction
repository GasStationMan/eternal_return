
#> function eternal_return:maps/cursor_in_place/dot_in_poly {dot1_X,dot1_Y,dot2_X,dot2_Y,laser_length}
#{rotY, d1.x , d1.y , d2.x , d2.y , laser_length}
#dx = d1.x - d2.x
#dy = d1.y - d2.y
#int result = ((x - d1.x) - (y - d1.y) * (dx/dy)) * ((x - d1.x - laser_length) - (y - d1.y) * (dx/dy))
#return 1 or 0


# {(x - d1.x) - (y - d1.y)*(dx/dy)}*{(x - d1.x - laser_length) - (y - d1.y)*(dx/dy)} < 0 is true?
# 이 함수가 표현하고 싶은 건 위가 전부임

#> 최적화 (Y범위 벗어나면 함수 실행 종료)
$scoreboard players set #max_y ER.sys $(dot1_Y)
$scoreboard players set #min_y ER.sys $(dot2_Y)
execute if score #max_y ER.sys < #min_y ER.sys run scoreboard players operation #max_y ER.sys >< #min_y ER.sys
execute unless score #max_y ER.sys > #rotY ER.sys run return 0
execute unless score #min_y ER.sys <= #rotY ER.sys run return 0

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

execute if score #x1 ER.sys matches ..0 run scoreboard players add #cnt ER.sys 1


