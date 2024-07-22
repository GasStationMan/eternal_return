#
# function eternal_return:maps/kiosk/main
#> function eternal_return:maps/kiosk/get_selected_place
# function eternal_return:maps/kiosk/show_selected
# function eternal_return:maps/kiosk/cursor_in_place/..
# function eternal_return:maps/kiosk/select_place




#>플레이어 버튼 위치 상수값 세팅
scoreboard players operation @s ER.sys = #ER.place.null ER.sys

#>플레이어 회전값 구하기
data modify storage minecraft:temp temp.Rot set from entity @s Rotation
execute store result score #rotX ER.sys run data get storage minecraft:temp temp.Rot[0] 8
execute store result score #rotY ER.sys run data get storage minecraft:temp temp.Rot[1] 8

execute at @s if score #rotX ER.sys matches 750.. run tp @s ~ ~ ~ 74 ~
execute at @s if score #rotX ER.sys matches ..-600 run tp @s ~ ~ ~ -59 ~

#> {posX : x, posY : y} -> {mouseX : 스코어보드(#rotX ER.sys), mouseY : 스코어보드(#rotY ER.sys)}
#> 좌표 변환 : 98 -> 098 , 7 -> 007 이렇게

scoreboard players set #temp ER.sys -1
scoreboard players operation #rotX ER.sys *= #temp ER.sys
scoreboard players set #temp ER.sys 1
scoreboard players operation #rotY ER.sys *= #temp ER.sys
scoreboard players add #rotX ER.sys 410
scoreboard players add #rotY ER.sys 154


execute if score #rotX ER.sys matches 650.. run scoreboard players set #rotX ER.sys 650
execute if score #rotX ER.sys matches ..120 run scoreboard players set #rotX ER.sys 120
execute if score #rotY ER.sys matches 256.. run scoreboard players set #rotY ER.sys 256


execute store result storage minecraft:temp coord.x int 1 run scoreboard players get #rotX ER.sys
execute store result storage minecraft:temp coord.y int 1 run scoreboard players get #rotY ER.sys
data modify storage minecraft:temp coord.scoreboardX set value "#rotX"
data modify storage minecraft:temp coord.scoreboardY set value "#rotY"
data modify storage minecraft:temp coord.posX set value "mouseX"
data modify storage minecraft:temp coord.posY set value "mouseY"
function eternal_return:maps/kiosk/set_player_pos with storage minecraft:temp coord
data remove storage minecraft:temp coord


$data modify storage minecraft:temp temp merge value {id : $(id),tree_of_life:"white",vf_blood:"white",random:"white",mithril:"white",meteorite:"white",force_core:"white"}

# 생명의 나무
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/tree_of_life run \
    function eternal_return:maps/kiosk/select_place {place:"tree_of_life",color:"blue"}

execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/vf_blood run \
    function eternal_return:maps/kiosk/select_place {place:"vf_blood",color:"blue"}

execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/random run \
    function eternal_return:maps/kiosk/select_place {place:"random",color:"blue"}

execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/mithril run \
    function eternal_return:maps/kiosk/select_place {place:"mithril",color:"blue"}

execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/meteorite run \
    function eternal_return:maps/kiosk/select_place {place:"meteorite",color:"blue"}

execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/force_core run \
    function eternal_return:maps/kiosk/select_place {place:"force_core",color:"blue"}

title @a actionbar [{"storage":"minecraft:temp","nbt":"temp.mouseX"},{"text":"  "},{"storage":"minecraft:temp","nbt":"temp.mouseY"}]

scoreboard players set #cnt ER.sys 0
function eternal_return:maps/kiosk/show_selected with storage minecraft:temp temp
data remove storage minecraft:temp temp
