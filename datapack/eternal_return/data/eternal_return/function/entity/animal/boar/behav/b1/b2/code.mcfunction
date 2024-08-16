execute if entity @s[tag= aj.animal_boar.animation.skill.playing] run return run function eternal_return:entity/animal/boar/behav/b1/b2/b3/code
execute if entity @s[tag=aj.animal_boar.animation.move.playing] run function animated_java:animal_boar/animations/move/stop
execute if entity @s[tag=aj.animal_boar.animation.attack.playing] run function animated_java:animal_boar/animations/attack/stop
function animated_java:animal_boar/animations/skill/play
execute on vehicle run effect give @s minecraft:slowness infinite 10
