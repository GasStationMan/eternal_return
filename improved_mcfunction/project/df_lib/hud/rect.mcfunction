
#> function df_lib:hud/rect 
#> position : x y dx dy

$set #x ER.sys $(x)
$set #y ER.sys $(y)
$set #dx ER.sys $(dx)
$set #dy ER.sys $(dy)

set #posX1 ER.sys $(x)
set #posY1 ER.sys $(y)

op #posX2 ER.sys = #x ER.sys
op #posX2 ER.sys -= #dx ER.sys
op #posY2 ER.sys = #y ER.sys

op #posX3 ER.sys = #x ER.sys
op #posX3 ER.sys -= #dx ER.sys
op #posY3 ER.sys = #y ER.sys
op #posY3 ER.sys += #dy ER.sys

op #posX4 ER.sys = #x ER.sys
op #posY4 ER.sys = #y ER.sys
op #posY4 ER.sys += #dy ER.sys

storage posStructure is minecraft:temp pos
score posX1 is #posX1 ER.sys
score posY1 is #posY1 ER.sys
score posX2 is #posX2 ER.sys
score posY2 is #posY2 ER.sys
score posX3 is #posX3 ER.sys
score posY3 is #posY3 ER.sys
score posX4 is #posX4 ER.sys
score posY4 is #posY4 ER.sys

posStructure.laser_length = 700

posStructure.dot1_X = posX1
posStructure.dot1_Y = posY1
posStructure.dot2_X = posX2
posStructure.dot2_Y = posY2
function df_lib:hud/dot_in_poly with posStructure

posStructure.dot1_X = posX2
posStructure.dot1_Y = posY2
posStructure.dot2_X = posX3
posStructure.dot2_Y = posY3
function df_lib:hud/dot_in_poly with posStructure

posStructure.dot1_X = posX3
posStructure.dot1_Y = posY3
posStructure.dot2_X = posX4
posStructure.dot2_Y = posY4
function df_lib:hud/dot_in_poly with posStructure

posStructure.dot1_X = posX4
posStructure.dot1_Y = posY4
posStructure.dot2_X = posX1
posStructure.dot2_Y = posY1
function df_lib:hud/dot_in_poly with posStructure

execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1

