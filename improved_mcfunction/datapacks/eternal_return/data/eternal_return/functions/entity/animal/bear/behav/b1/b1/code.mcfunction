execute on vehicle run scoreboard players remove @s ER.cooltime 1
execute at @s facing entity @p[tag=targeted,distance=..20] feet run tp @s ~ ~ ~ ~ 0
execute if entity @s[tag= aj.animal_bear.animation.attack.playing] on vehicle run function eternal_return:entity/animal/bear/behav/b1/b1/b1/code
execute if entity @p[tag=targeted, distance=..4] run return run function eternal_return:entity/animal/bear/behav/b1/b1/b2/code
execute if score #motionExist ER.sys matches 0 if entity @s[tag= aj.animal_bear.animation.move.playing] run return run function animated_java:animal_bear/animations/move/stop
execute if score #motionExist ER.sys matches 1 if entity @s[ tag=!aj.animal_bear.animation.move.playing, tag=!aj.animal_bear.animation.attack.playing, tag=!aj.animal_bear.animation.skill.playing] run return run function animated_java:animal_bear/animations/move/play
