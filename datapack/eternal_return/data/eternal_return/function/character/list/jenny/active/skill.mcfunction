scoreboard players add @e[tag=jenny_move] jenny_active_skill 1

execute if entity @s at @s run tp @e[tag=jenny_move,distance=..0.1] ~ ~0.05 ~ ~ ~
execute as @e[tag=jenny_move,scores={jenny_active_skill=1..}] at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.6
execute if entity @s at @s run tp @s @n[tag=jenny_move]
execute as @e[tag=jenny_move,scores={jenny_active_skill=5}] run kill @s


execute if entity @s[tag=blacktea] run effect give @s speed 1 0 true
execute if entity @s[tag=blacktea] run effect give @s weakness 1 0 true
execute if entity @s[tag=blacktea,tag=!hide_in_bush] at @s run particle dust{color:[0.000,0.000,0.000],scale:1} ~ ~ ~ 0.3 0 0.3 0 3 force @a
execute if entity @s[tag=redwine] run effect give @s haste 1 1 true
execute if entity @s[tag=redwine,tag=!hide_in_bush] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~ ~ 0.3 0 0.3 0 3 force @a