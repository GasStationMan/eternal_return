scoreboard players add @s sissela_active_skill_ready 1
execute if score @s sissela_active_skill_ready matches 1 at @s run tp @s @n[tag=sissela_marker]
effect give @s slowness 1 100 true
effect give @s weakness 1 100 true

execute at @s unless entity @n[tag=sissela_marker,distance=..0.1] run tag @s remove sissela_active_skill_ready
execute at @s unless entity @n[tag=sissela_marker,distance=..0.1] run effect clear @s slowness
execute at @s unless entity @n[tag=sissela_marker,distance=..0.1] run kill @n[tag=sissela_marker]
execute if score @s sissela_active_skill_ready matches 30.. run kill @n[tag=sissela_marker]
execute if score @s sissela_active_skill_ready matches 30.. run effect clear @s slowness
execute if score @s sissela_active_skill_ready matches 30.. run effect clear @s weakness
execute if score @s sissela_active_skill_ready matches 30.. run tag @s remove sissela_active_skill_ready

execute if score @s sissela_active_skill_ready matches 30.. run tag @s add sissela_active_skill

execute unless entity @s[tag=sissela_active_skill_ready] run scoreboard players reset @s sissela_active_skill_ready