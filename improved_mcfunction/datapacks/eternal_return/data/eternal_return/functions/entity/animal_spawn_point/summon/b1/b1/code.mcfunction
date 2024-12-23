tag @s add this
tag @s add ER
tag @s add ER.spawn
tag @s add ER.spawn.animal
$tag @s add ER.spawn.animal.$(animal)
tp @s ~ ~ ~ ~ 0
data modify entity @s billboard set value "center"
data modify entity @s text set value '{"text":"test"}'
ride @n[type=minecraft:marker,tag=this] mount @s
