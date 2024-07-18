execute if score #i ER.sys >= #HPkey ER.sys run function eternal_return:entity/hitbox/hitbox/hitbox/hitbox/hitbox/hitbox/0 with storage minecraft:temp temp
execute if score #i ER.sys < #HPkey ER.sys run function eternal_return:entity/hitbox/hitbox/hitbox/hitbox/hitbox/hitbox/1
scoreboard players add #i ER.sys 1
execute store result storage minecraft:temp temp.i int 1 run scoreboard players get #i ER.sys
execute if score #i ER.sys matches ..99 run return run function eternal_return:entity/hitbox/hitbox/hitbox/hitbox/hitbox/1 with storage minecraft:temp temp
