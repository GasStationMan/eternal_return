

execute store result storage minecraft:temp temp.id int 1 run scoreboard players get @s player_id

#>플레이어 버튼 위치 상수값 세팅
scoreboard players operation @s ER.sys = #ER.place.null ER.sys

#>플레이어 회전값 구하기
execute store result score #rotX ER.sys run data get entity @s Rotation[0] 10
execute store result score #rotY ER.sys run data get entity @s Rotation[1] 10

scoreboard players set #2 ER.sys 2
scoreboard players operation #modifyRotX ER.sys = #hud_main.mouse_pointer_limit_width ER.sys
scoreboard players operation #modifyRotX ER.sys /= #2 ER.sys
scoreboard players operation #rotX ER.sys -= #modifyRotX ER.sys
scoreboard players set #-1 ER.sys -1
scoreboard players operation #rotX ER.sys *= #-1 ER.sys
scoreboard players operation #hud_main.mouse_pointer_limit_width ER.sys *= #2 ER.sys
scoreboard players operation #rotX ER.sys %= #hud_main.mouse_pointer_limit_width ER.sys
scoreboard players operation #rotY ER.sys %= #hud_main.mouse_pointer_limit_height ER.sys

scoreboard players operation #get_mouse_pos.x ER.sys = #rotX ER.sys
scoreboard players operation #get_mouse_pos.y ER.sys = #rotY ER.sys
function eternal_return:maps/lib/get_mouse_pos/x__y

scoreboard players set #cnt ER.sys 0



