$data modify storage minecraft:temp temp.$(place) set value "$(color)"
$scoreboard players operation @s ER.sys = #ER.place.$(place) ER.sys
