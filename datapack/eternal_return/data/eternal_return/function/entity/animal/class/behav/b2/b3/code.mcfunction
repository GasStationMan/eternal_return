execute at @s facing entity @p[tag=targeted,distance=..20] feet run tp @s ~ ~ ~ ~ 0
$execute if entity @s[tag= aj.animal_$(animal).animation.attack] on vehicle run function eternal_return:entity/animal/class/behav/b2/b3/b1/code
$execute if entity @p[tag=targeted, distance=..$(attackDistance)] run function eternal_return:entity/animal/class/behav/b2/b3/b2/code with storage minecraft:temp temp
$execute if score #motionExist ER.sys matches 0 if entity @s[tag= aj.animal_$(animal).animation.move] run function animated_java:animal_$(animal)/animations/move/stop
$execute if score #motionExist ER.sys matches 1 if entity @s[tag=!aj.animal_$(animal).animation.move, tag=!aj.animal_$(animal).animation.attack, tag=!aj.animal_$(animal).animation.skill] run function animated_java:animal_$(animal)/animations/move/play
