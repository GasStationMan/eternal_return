$data modify storage minecraft:temp temp.buttons.$(place) set value "$(color)"
$scoreboard players operation @s ER.sys = #ER.place.$(place) ER.sys
