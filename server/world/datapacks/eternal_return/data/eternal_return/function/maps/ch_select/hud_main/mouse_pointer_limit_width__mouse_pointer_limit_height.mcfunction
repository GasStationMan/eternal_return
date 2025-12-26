#
# function eternal_return:maps/kiosk/get_selected_place/mouse_pinter_limit_width__mouse_pointer_limit_height

#============================================================#vvv수정vvv#============================================================#
data modify storage minecraft:temp temp set value {id: 0,tree_of_life:"white",vf_blood:"white",random:"white",mithril:"white",meteorite:"white",force_core:"white"}
#============================================================#^^^수정^^^#============================================================#

## vvvv DO NOT MODIFY vvvv
function eternal_return:maps/lib/get_selected_place/preprocessing

#============================================================#vvv수정vvv#============================================================#
#    execute if score #cnt ER.sys matches 0 if function eternal_return:maps/kiosk/cursor_in_place/tree_of_life run \
#        function eternal_return:maps/select_place {place:"tree_of_life",color:"blue"}

    #VV 지우지 말 것
    function eternal_return:maps/kiosk/show_selected with storage minecraft:temp temp
#============================================================#^^^수정^^^#============================================================#
    
#DEBUG for mousePointer vvv
title @a actionbar [{"storage":"minecraft:temp","nbt":"temp.mouseX"},{"text":"  "},{"storage":"minecraft:temp","nbt":"temp.mouseY"}]
#DEBUG for mousePointer ^^^

## vvvv DO NOT MODIFY vvvv
function eternal_return:maps/lib/get_selected_place/postprocessing