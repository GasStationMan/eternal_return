execute if score #timer.day NUM matches 1.. if score #timer.halfday NUM matches 1..2 if score #timer.sec NUM matches 1 if score #timer.tick NUM matches 19 run tag @a add change_daycycle
execute if score #timer.day NUM matches 1 run function eternal_return:sys/game/timeline/b1/code
execute if score #timer.day NUM matches 2 run function eternal_return:sys/game/timeline/b2/code
execute if score #timer.day NUM matches 3 run function eternal_return:sys/game/timeline/b3/code
execute if score #timer.day NUM matches 4 run function eternal_return:sys/game/timeline/b4/code
execute if score #timer.day NUM matches 3..4 if score #timer.halfday NUM matches 1..2 if score #timer.sec NUM matches 59 if score #timer.tick NUM matches 19 run function eternal_return:sys/game/timeline/b5/code
execute if score #timer.day NUM matches 5 run function eternal_return:sys/game/timeline/b6/code
execute if score #timer.day NUM matches 6 if score #timer.halfday NUM matches 1 if score #timer.sec NUM matches 29 if score #timer.tick NUM matches 19 run function eternal_return:sys/game/timeline/b7/code
