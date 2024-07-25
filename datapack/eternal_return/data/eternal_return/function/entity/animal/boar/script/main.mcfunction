data modify storage minecraft:temp temp set value {animal : "boar", OPTdistance : 20, damage : 5, attackTick : 5, attackDistance : 3}
scoreboard players operation #this.ID ER.sys = @s df_id
function eternal_return:entity/animal/boar/script/b1/code with storage minecraft:temp temp
scoreboard players operation #this.HP ER.sys = @e[type=minecraft:ghast       ,tag=this,tag=ER.animal.hitbox] ER.health
scoreboard players operation #this.MaxHP ER.sys = @e[type=minecraft:zombie      ,tag=this,tag=ER.animal.root  ] ER.health
execute if data entity @e[type=minecraft:zombie      ,tag=this,tag=ER.animal.root  ,limit=1] NoAI run function eternal_return:entity/animal/boar/script/b2/code
execute unless data entity @e[type=minecraft:zombie      ,tag=this,tag=ER.animal.root  ,limit=1] NoAI run function eternal_return:entity/animal/boar/script/b3/code
function eternal_return:entity/animal/class/optimize/main with storage minecraft:temp temp
execute store result storage minecraft:print print.ThisHP int 1 run scoreboard players get #this.HP ER.sys
execute store result storage minecraft:print print.ThisAI int 1 run scoreboard players get #this.AI ER.sys
execute store result storage minecraft:print print.ThisMaxHP int 1 run scoreboard players get #this.MaxHP ER.sys
function eternal_return:system/print/main with storage minecraft:print print
data remove storage minecraft:print print
execute if score #this.HP ER.sys matches 1.. run function eternal_return:entity/animal/boar/script/b4/code
execute if score #this.HP ER.sys matches ..0 run function eternal_return:entity/animal/class/death/main with storage minecraft:temp temp
execute at @s run tp @e[type=minecraft:ghast       ,tag=this,tag=ER.animal.hitbox] ~ ~ ~
data remove storage minecraft:temp temp
scoreboard players set #this.AI ER.sys 0
scoreboard players set #MotionExist ER.sys 0
tag @e[tag=this] remove this
