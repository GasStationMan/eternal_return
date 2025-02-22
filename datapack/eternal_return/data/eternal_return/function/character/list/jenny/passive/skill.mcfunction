effect clear @s regeneration
effect clear @s fire_resistance
effect clear @s absorption

effect give @s fire_resistance 3 0 true
effect give @s slowness 3 1 true
effect give @s weakness 3 0 true

execute if score @s passive_level matches 1 run effect give @s absorption 3 0
execute if score @s passive_level matches 2 run effect give @s absorption 3 1
execute if score @s passive_level matches 3 run effect give @s absorption 3 2
execute if score @s passive_level matches 4 run effect give @s absorption 3 3
execute if score @s passive_level matches 5 run effect give @s absorption 3 4

scoreboard players reset @s jenny_passive_skill

execute if entity @s[tag=jenny_passive_skill,tag=!passive_cool] if score @s passive_level matches 1 run scoreboard players set @s passive_cool 70
execute if entity @s[tag=jenny_passive_skill,tag=!passive_cool] if score @s passive_level matches 2 run scoreboard players set @s passive_cool 70
execute if entity @s[tag=jenny_passive_skill,tag=!passive_cool] if score @s passive_level matches 3 run scoreboard players set @s passive_cool 70
execute if entity @s[tag=jenny_passive_skill,tag=!passive_cool] if score @s passive_level matches 4 run scoreboard players set @s passive_cool 70
execute if entity @s[tag=jenny_passive_skill,tag=!passive_cool] if score @s passive_level matches 5 run scoreboard players set @s passive_cool 70

tag @s remove jenny_passive_skill