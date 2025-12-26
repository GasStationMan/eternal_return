tp @s ~ ~ ~ ~ 0
data modify entity @s billboard set value "center"
data modify entity @s text set value '{"text":"test"}'
ride @e[type=minecraft:marker,tag=this,limit=1] mount @s
