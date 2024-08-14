execute if entity @s[tag= aj.animal_alpha.animation.skill.playing] run return run function eternal_return:entity/animal/alpha/behav/b1/b2/b3/code
execute if entity @s[tag=aj.animal_alpha.animation.move.playing] run function animated_java:animal_alpha/animations/move/stop
execute if entity @s[tag=aj.animal_alpha.animation.attack.playing] run function animated_java:animal_alpha/animations/attack/stop
function animated_java:animal_alpha/animations/skill/play
execute on vehicle run effect give @s minecraft:slowness infinite 10
