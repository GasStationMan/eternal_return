execute at @s facing entity @p[tag=targeted,distance=..20] feet run tp @s ~ ~ ~ ~ 0
execute if score #cooltime ER.sys matches 1.. on vehicle run function eternal_return:entity/animal/class/behav/behav/behav/1
$execute if entity @s[tag= aj.animal_$(animal).animation.ready] run function animated_java:animal_$(animal)/animations/ready/stop
$execute if entity @p[tag=targeted, distance=..$(attackDistance)] run function eternal_return:entity/animal/class/behav/behav/behav/2 with storage minecraft:temp temp
function eternal_return:entity/animal/class/behav/behav/behav/3 with storage minecraft:temp temp
execute if score #motionExist ER.sys matches 0 run function eternal_return:entity/animal/class/behav/behav/behav/4 with storage minecraft:temp temp
$execute if entity @s[tag= aj.animal_$(animal).animation.move] run function eternal_return:entity/animal/class/behav/behav/behav/5 with storage minecraft:temp temp
execute if score #motionExist ER.sys matches 1 run function eternal_return:entity/animal/class/behav/behav/behav/6 with storage minecraft:temp temp
