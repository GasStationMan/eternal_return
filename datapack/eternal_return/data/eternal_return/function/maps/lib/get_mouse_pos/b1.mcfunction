

#input : #get_mouse_pos.y,
#input : #get_mouse_pos.x,

execute if score #get_mouse_pos.x ER.sys matches ..-1 run \
    data modify storage minecraft:temp temp merge value {mouseX : "000"}
$execute if score #get_mouse_pos.x ER.sys matches 0..9 run \
    data modify storage minecraft:temp temp merge value {mouseX : "00$(x)"}
$execute if score #get_mouse_pos.x ER.sys matches 10..99 run \
    data modify storage minecraft:temp temp merge value {mouseX : "0$(x)"}
$execute if score #get_mouse_pos.x ER.sys matches 100..999 run \
    data modify storage minecraft:temp temp merge value {mouseX : "$(x)"}


execute if score #get_mouse_pos.y ER.sys matches ..-1 run \
    data modify storage minecraft:temp temp merge value {mouseY : "000"}
$execute if score #get_mouse_pos.y ER.sys matches 0..9 run \
    data modify storage minecraft:temp temp merge value {mouseY : "00$(y)"}
$execute if score #get_mouse_pos.y ER.sys matches 10..99 run \
    data modify storage minecraft:temp temp merge value {mouseY : "0$(y)"}
$execute if score #get_mouse_pos.y ER.sys matches 100..999 run \
    data modify storage minecraft:temp temp merge value {mouseY : "$(y)"}

data remove storage minecraft:temp coord
