tag @s add this
tag @s add ER
tag @s add ER.animal
tag @s add ER.animal.model
tag @s add ER.animal.bear
scoreboard players operation @s df_id = #TEMPID ER.sys
scoreboard players set @s ER.animal.this 1
ride @s mount @e[type=minecraft:zombie, tag= ER.animal.root, scores={ER.animal.this=1}, limit=1]
