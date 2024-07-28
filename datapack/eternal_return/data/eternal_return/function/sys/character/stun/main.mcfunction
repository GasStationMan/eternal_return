scoreboard players add @e[tag=stun] stun 1
effect give @e[scores={stun=1..}] slowness infinite 100 true
effect give @e[scores={stun=1..}] weakness infinite 100 true
execute as @e[tag=stun] at @s run particle minecraft:electric_spark ~ ~1 ~ 0.5 0.5 0.5 0.05 5
effect clear @e[scores={stun=20..}] slowness
effect clear @e[scores={stun=20..}] weakness
tag @e[scores={stun=20..}] remove stun
scoreboard players reset @e[scores={stun=20..}] stun