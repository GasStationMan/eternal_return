# function eternal_return:maps/hyper_loop/main
#> function eternal_return:maps/hyper_loop/get_selected_place
#
#   {place : , color : }
#
$data modify storage minecraft:temp temp.$(place) set value "$(color)"
$scoreboard players operation @s ER.sys = #ER.place.$(place) ER.sys