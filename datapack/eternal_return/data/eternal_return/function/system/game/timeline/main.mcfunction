execute if score #timer.day CT1 matches 1.. if score #timer.halfday CT1 matches 1..2 if score #timer.sec CT1 matches 1 if score #timer.tick CT1 matches 19 run tag @a add change_daycycle
execute if score #timer.day CT1 matches 1 run function eternal_return:system/game/timeline/b1/code
execute if score #timer.day CT1 matches 2 run function eternal_return:system/game/timeline/b2/code
execute if score #timer.day CT1 matches 3 run function eternal_return:system/game/timeline/b3/code
execute if score #timer.day CT1 matches 4 run function eternal_return:system/game/timeline/b4/code
execute if score #timer.day CT1 matches 3..4 if score #timer.halfday CT1 matches 1..2 if score #timer.sec CT1 matches 59 if score #timer.tick CT1 matches 19 run function eternal_return:system/game/timeline/b5/code
execute if score #timer.day CT1 matches 5 run function eternal_return:system/game/timeline/b6/code
execute if score #timer.day CT1 matches 6 if score #timer.halfday CT1 matches 1 if score #timer.sec CT1 matches 29 if score #timer.tick CT1 matches 19 run function eternal_return:system/game/timeline/b7/code
