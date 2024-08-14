execute if entity @s[tag= aj.animal_wolf.animation.skill.playing] run return run function eternal_return:entity/animal/wolf/behav/b1/b3/b3/code
function animated_java:animal_wolf/animations/move/stop
function animated_java:animal_wolf/animations/attack/stop
function animated_java:animal_wolf/animations/skill/play
execute on vehicle run effect give @s minecraft:slowness infinite 10
