execute at @s facing entity @p[tag=targeted,distance=..20] feet run tp @s ~ ~ ~ ~ 0
$execute if entity @s[tag= aj.animal_$(animal).animation.attack] on vehicle run function eternal_return:entity/animal/class/behav/behav/behav/behav/0
$execute if entity @p[tag=targeted, distance=..$(attackDistance)] run return run function eternal_return:entity/animal/class/behav/behav/behav/behav/1 with storage minecraft:temp temp
execute if score #motionExist ER.sys matches 0 run return run function eternal_return:entity/animal/class/behav/behav/behav/behav/2 with storage minecraft:temp temp
execute if score #motionExist ER.sys matches 1 run return run function eternal_return:entity/animal/class/behav/behav/behav/behav/3 with storage minecraft:temp temp
