execute store result storage minecraft:temp temp.id int 1 run scoreboard players get @s df_id
scoreboard players set @s ER.animal.this 1
function eternal_return:entity/animal/bear/script/b1/code with storage minecraft:temp temp
execute on passengers run scoreboard players set @s ER.animal.this 1
scoreboard players operation #this.HP ER.sys = @e[type=minecraft:ghast       ,tag=ER.animal.hitbox,scores={ER.animal.this=1}] ER.health
scoreboard players operation #this.MaxHP ER.sys = @e[type=minecraft:zombie      ,tag=ER.animal.root  ,scores={ER.animal.this=1}] ER.health
scoreboard players set #this.AI ER.sys 1
execute if data entity @e[type=minecraft:zombie      ,tag=ER.animal.root  ,scores={ER.animal.this=1},limit=1] NoAI run scoreboard players set #this.AI ER.sys 0
function eternal_return:entity/animal/bear/optimize/main
execute if score #this.HP ER.sys matches 1.. run function eternal_return:entity/animal/bear/script/b2/code
execute if score #this.HP ER.sys matches ..0 run function eternal_return:entity/animal/bear/script/b3/code
execute at @s run tp @e[type=minecraft:ghast       ,tag=ER.animal.hitbox,scores={ER.animal.this=1}] ~ ~ ~
scoreboard players set #this.AI ER.sys 0
scoreboard players set #MotionExist ER.sys 0
scoreboard players set @e[scores={ER.animal.this=1}] ER.animal.this 0
