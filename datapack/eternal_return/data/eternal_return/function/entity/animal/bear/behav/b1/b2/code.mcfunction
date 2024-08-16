execute if entity @s[tag= aj.animal_bear.animation.skill.playing] run return run function eternal_return:entity/animal/bear/behav/b1/b2/b3/code
execute if entity @s[tag=aj.animal_bear.animation.move.playing] run function animated_java:animal_bear/animations/move/stop
execute if entity @s[tag=aj.animal_bear.animation.attack.playing] run function animated_java:animal_bear/animations/attack/stop
function animated_java:animal_bear/animations/skill/play
execute on vehicle run effect give @s minecraft:slowness infinite 10
