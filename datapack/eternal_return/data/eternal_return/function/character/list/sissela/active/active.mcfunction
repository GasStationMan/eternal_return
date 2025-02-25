tag @s add sissela_active_skill_ready
summon marker ~ ~ ~ {Tags:["sissela_marker"]}
execute if entity @s at @s run tp @e[tag=sissela_marker,distance=..0.1] ~ ~ ~ ~ ~