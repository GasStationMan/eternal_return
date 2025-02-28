scoreboard players add @s hart_passive_skill 1
effect give @s[tag=!hart] regeneration 1 0
effect give @s[tag=!hart] weakness 1 0

effect give @s[tag=hart,scores={passive_level=1}] regeneration 1 0
effect give @s[tag=hart,scores={passive_level=1}] weakness 1 0
effect give @s[tag=hart,scores={passive_level=2}] regeneration 1 0
effect give @s[tag=hart,scores={passive_level=2}] weakness 1 0
effect give @s[tag=hart,scores={passive_level=3}] regeneration 1 0
effect give @s[tag=hart,scores={passive_level=4}] regeneration 1 0
effect give @s[tag=hart,scores={passive_level=5}] regeneration 1 1

attribute @s[tag=hart,scores={passive_level=1}] entity_interaction_range base set 3.5
attribute @s[tag=hart,scores={passive_level=2}] entity_interaction_range base set 3.6
attribute @s[tag=hart,scores={passive_level=3}] entity_interaction_range base set 3.7
attribute @s[tag=hart,scores={passive_level=4}] entity_interaction_range base set 3.8
attribute @s[tag=hart,scores={passive_level=5}] entity_interaction_range base set 4

execute if score @s hart_passive_skill matches 300.. run tag @s remove hart_passive_skill

execute unless entity @s[tag=hart_passive_skill] run scoreboard players reset @s hart_passive_skill
execute unless entity @s[tag=hart_passive_skill,tag=hart] run attribute @s entity_interaction_range base reset