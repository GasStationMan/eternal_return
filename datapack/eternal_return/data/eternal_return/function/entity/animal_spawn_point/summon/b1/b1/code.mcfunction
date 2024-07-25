data modify entity @s billboard set value "center"
data modify entity @s text set value '{"text":"test"}'
ride @e[type=minecraft:marker,tag=this,limit=1] mount @s
execute rotated as @s as @e[type=minecraft:marker,tag=this] positioned as @s run tp ~ ~ ~ ~ 0
tag @s add this
$say $(animal) spawn point has been summoned!
tag @s remove this
