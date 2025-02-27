summon area_effect_cloud ~ ~0.1 ~ {Tags:["elena_passive_marker"]}
summon area_effect_cloud ^ ^ ^-1 {Tags:["elena_passive_marker_hit","elena_passive_marker_hit_1"]}
summon area_effect_cloud ^ ^ ^-2 {Tags:["elena_passive_marker_hit","elena_passive_marker_hit_2"]}

execute as @e[tag=elena_passive_marker] at @s run particle dust{color:[0.000,0.933,1.000],scale:1} ~ ~ ~ 0.2 0 0.2 0.03 3
execute as @e[tag=elena_passive_marker_hit] at @s run effect give @e[distance=..1.5,tag=!elena,scores={passive_level=..2}] slowness 1 0
execute as @e[tag=elena_passive_marker_hit] at @s run effect give @e[distance=..1.5,tag=!elena,scores={passive_level=3..4}] slowness 1 1
execute as @e[tag=elena_passive_marker_hit] at @s run effect give @e[distance=..1.5,tag=!elena,scores={passive_level=5}] slowness 1 2