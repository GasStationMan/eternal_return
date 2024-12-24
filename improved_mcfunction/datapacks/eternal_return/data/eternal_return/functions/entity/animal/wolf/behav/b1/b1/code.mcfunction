rotate @s facing entity @p[tag=targeted,distance=..20]
data modify entity @s Rotation[1] set value 0.0f
execute on vehicle run scoreboard players remove @s ER.cooltime 1
execute if entity @s[tag= aj.animal_wolf.animation.attack.playing] run return run function eternal_return:entity/animal/wolf/behav/b1/b1/b1/code
execute if entity @s[tag=!aj.animal_wolf.animation.attack.playing] if entity @p[tag=targeted, distance=..4] run return run function eternal_return:entity/animal/wolf/behav/b1/b1/b2/code
execute if score #motionExist ER.sys matches 0 if entity @s[tag= aj.animal_wolf.animation.move.playing] run return run function animated_java:animal_wolf/animations/move/stop
execute if score #motionExist ER.sys matches 1 if entity @s[ tag=!aj.animal_wolf.animation.move.playing, tag=!aj.animal_wolf.animation.attack.playing, tag=!aj.animal_wolf.animation.skill.playing] run return run function animated_java:animal_wolf/animations/move/play
