#
# function eternal_return:maps/kiosk/main
#> function eternal_return:maps/kiosk/get_selected_place
# function eternal_return:maps/kiosk/show_selected
# function eternal_return:maps/kiosk/cursor_in_place/..
# function eternal_return:maps/select_place


data modify storage minecraft:temp temp set value {id: 0,tree_of_life:"white",vf_blood:"white",random:"white",mithril:"white",meteorite:"white",force_core:"white"}
execute store result storage minecraft:temp temp.id int 1 run scoreboard players get @s player_id

#>플레이어 버튼 위치 상수값 세팅
scoreboard players operation @s ER.sys = #ER.place.null ER.sys
scoreboard players remove #cnt ER.sys 0

#>플레이어 회전값 구하기
#data modify storage minecraft:temp temp.Rot set from entity @s Rotation
execute store result score #rotX ER.sys run data get entity @s Rotation[0] 10
execute store result score #rotY ER.sys run data get entity @s Rotation[1] 10

scoreboard players remove #rotX ER.sys 400
scoreboard players set #-1 ER.sys -1
scoreboard players operation #rotX ER.sys *= #-1 ER.sys
scoreboard players operation #rotX ER.sys %= #get_selected_place.mouse_pointer_limit_width ER.sys
scoreboard players operation #rotY ER.sys %= #get_selected_place.mouse_pointer_limit_height ER.sys

scoreboard players operation #get_mouse_pos.x ER.sys = #rotX ER.sys
scoreboard players operation #get_mouse_pos.y ER.sys = #rotY ER.sys
function eternal_return:maps/get_mouse_pos/x__y


# 생명의 나무
execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/tree_of_life run \
    function eternal_return:maps/select_place {place:"tree_of_life",color:"blue"}

execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/vf_blood run \
    function eternal_return:maps/select_place {place:"vf_blood",color:"blue"}

execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/random run \
    function eternal_return:maps/select_place {place:"random",color:"blue"}

execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/mithril run \
    function eternal_return:maps/select_place {place:"mithril",color:"blue"}

execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/meteorite run \
    function eternal_return:maps/select_place {place:"meteorite",color:"blue"}

execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/force_core run \
    function eternal_return:maps/select_place {place:"force_core",color:"blue"}

title @a actionbar [{"storage":"minecraft:temp","nbt":"temp.mouseX"},{"text":"  "},{"storage":"minecraft:temp","nbt":"temp.mouseY"}]

scoreboard players set #cnt ER.sys 0
function eternal_return:maps/kiosk/show_selected with storage minecraft:temp temp
data remove storage minecraft:temp temp

scoreboard players reset #cnt ER.sys
scoreboard players reset #rotX ER.sys
scoreboard players reset #rotY ER.sys
scoreboard players reset #get_selected_place.mouse_pointer_limit_height ER.sys
scoreboard players reset #get_selected_place.mouse_pointer_limit_hidth ER.sys
