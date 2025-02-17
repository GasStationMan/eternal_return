# LV 1
execute if entity @s[tag=!passive_cool,scores={passive_level=1}] run attribute @s attack_speed base set 4.4
execute if entity @s[tag=!passive_cool,scores={passive_level=1}] run attribute @s movement_speed base set 0.115

# LV 2
execute if entity @s[tag=!passive_cool,scores={passive_level=2}] run attribute @s attack_speed base set 4.8
execute if entity @s[tag=!passive_cool,scores={passive_level=2}] run attribute @s movement_speed base set 0.117

# LV 3
execute if entity @s[tag=!passive_cool,scores={passive_level=3}] run attribute @s attack_speed base set 5.2
execute if entity @s[tag=!passive_cool,scores={passive_level=3}] run attribute @s movement_speed base set 0.119

# LV 4
execute if entity @s[tag=!passive_cool,scores={passive_level=4}] run attribute @s attack_speed base set 5.6
execute if entity @s[tag=!passive_cool,scores={passive_level=4}] run attribute @s movement_speed base set 0.121

# LV 5
execute if entity @s[tag=!passive_cool,scores={passive_level=5}] run attribute @s attack_speed base set 6
execute if entity @s[tag=!passive_cool,scores={passive_level=5}] run attribute @s movement_speed base set 0.125


execute if score @s[scores={passive_level=1}] markus_skill matches 140.. run tag @s remove markus_skill
execute if score @s[scores={passive_level=2}] markus_skill matches 160.. run tag @s remove markus_skill
execute if score @s[scores={passive_level=3}] markus_skill matches 180.. run tag @s remove markus_skill
execute if score @s[scores={passive_level=4}] markus_skill matches 200.. run tag @s remove markus_skill
execute if score @s[scores={passive_level=5}] markus_skill matches 220.. run tag @s remove markus_skill
execute unless entity @s[tag=markus_skill] run scoreboard players reset @s markus_skill
execute unless entity @s[tag=markus_skill] run attribute @s attack_speed base set 4
execute unless entity @s[tag=markus_skill] run attribute @s movement_speed base set 0.1