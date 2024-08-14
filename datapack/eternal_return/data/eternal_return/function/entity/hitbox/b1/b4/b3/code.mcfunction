data modify storage minecraft:temp temp.HPdata set from storage minecraft:hp_bar data
scoreboard players set #i ER.sys 0
data modify storage minecraft:temp temp.i set value 0
function eternal_return:entity/hitbox/b1/b4/b3/b2/code with storage minecraft:temp temp
$data modify entity @s text set value '[{"text":"["},{"text":"$(HP)"},{"text":"]\\n"},{"text":"10"},{"translate":"space.2","font":"minecraft:default"},{"storage":"minecraft:temp","nbt":"temp.HPdata","interpret":true,"font":"minecraft:bar"}]'
