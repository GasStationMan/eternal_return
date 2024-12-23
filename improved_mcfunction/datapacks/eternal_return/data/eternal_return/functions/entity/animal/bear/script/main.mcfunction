execute store result storage minecraft:temp temp.id int 1 run scoreboard players get @s df_id
tag @s add this
function eternal_return:entity/animal/bear/script/b1/code with storage minecraft:temp temp
execute on passengers run tag @s add this
scoreboard players operation #this.HP ER.sys = @e[type=minecraft:ghast       ,tag=ER.animal.hitbox,tag=this] ER.health
scoreboard players operation #this.MaxHP ER.sys = @e[type=minecraft:husk      ,tag=ER.animal.root  ,tag=this] ER.health
scoreboard players set #this.AI ER.sys 1
execute if data entity @e[type=minecraft:husk      ,tag=ER.animal.root  ,tag=this,limit=1] NoAI run scoreboard players set #this.AI ER.sys 0
function eternal_return:entity/animal/bear/optimize/main
execute if score #this.HP ER.sys matches 1.. run function eternal_return:entity/animal/bear/script/b2/code
execute if score #this.HP ER.sys matches ..0 run function eternal_return:entity/animal/bear/script/b3/code
execute at @s run tp @e[type=minecraft:ghast       ,tag=ER.animal.hitbox,tag=this] ~ ~ ~
tag @e[type=#animal_entity, tag=ER.animal, tag=this] remove this
