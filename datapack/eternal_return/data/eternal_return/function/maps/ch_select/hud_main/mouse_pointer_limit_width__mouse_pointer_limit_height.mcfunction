#
# function eternal_return:maps/ch_select/get_selected_place/mouse_pinter_limit_width__mouse_pointer_limit_height

#============================================================#vvv수정vvv#============================================================#
data modify storage minecraft:temp temp set value {id: 0,tree_of_life:"white",vf_blood:"white",random:"white",mithril:"white",meteorite:"white",force_core:"white"}
#============================================================#^^^수정^^^#============================================================#

## vvvv DO NOT MODIFY vvvv
function eternal_return:maps/get_selected_place/preprocessing

#============================================================#vvv수정vvv#============================================================#
    execute if score #cnt ER.sys matches 0 if function eternal_return:maps/ch_select/cursor_in_place/tree_of_life run \
        function eternal_return:maps/select_place {place:"tree_of_life",color:"blue"}
    
    execute if score #cnt ER.sys matches 0 if function eternal_return:maps/ch_select/cursor_in_place/vf_blood run \
        function eternal_return:maps/select_place {place:"vf_blood",color:"blue"}
    
    execute if score #cnt ER.sys matches 0 if function eternal_return:maps/ch_select/cursor_in_place/random run \
        function eternal_return:maps/select_place {place:"random",color:"blue"}
    
    execute if score #cnt ER.sys matches 0 if function eternal_return:maps/ch_select/cursor_in_place/mithril run \
        function eternal_return:maps/select_place {place:"mithril",color:"blue"}
    
    execute if score #cnt ER.sys matches 0 if function eternal_return:maps/ch_select/cursor_in_place/meteorite run \
        function eternal_return:maps/select_place {place:"meteorite",color:"blue"}
    
    execute if score #cnt ER.sys matches 0 if function eternal_return:maps/ch_select/cursor_in_place/force_core run \
        function eternal_return:maps/select_place {place:"force_core",color:"blue"}
    
    function eternal_return:maps/ch_select/show_selected with storage minecraft:temp temp
#============================================================#^^^수정^^^#============================================================#
#DEBUG for mousePointer vvv
title @a actionbar [{"storage":"minecraft:temp","nbt":"temp.mouseX"},{"text":"  "},{"storage":"minecraft:temp","nbt":"temp.mouseY"}]
#DEBUG for mousePointer ^^^

## vvvv DO NOT MODIFY vvvv
function eternal_return:maps/get_selected_place/postprocessing