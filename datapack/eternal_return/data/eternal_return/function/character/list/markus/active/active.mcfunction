tag @s remove markus_skill
tag @s add markus_jump

execute unless entity @s[tag=markus_skill] run scoreboard players reset @s markus_skill
execute unless entity @s[tag=markus_skill] run attribute @s attack_speed base set 4
execute unless entity @s[tag=markus_skill] run attribute @s movement_speed base set 0.1