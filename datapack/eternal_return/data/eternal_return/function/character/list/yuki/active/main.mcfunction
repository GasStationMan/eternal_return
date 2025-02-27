execute if entity @s[tag=Qskill,tag=!active_cool] at @s run function eternal_return:character/list/yuki/active/active
execute if entity @s[tag=yukiskill] run function eternal_return:character/list/yuki/active/skill

## 쿨타임

# LV 1
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=1}] at @s run scoreboard players set @s active_cool 60

# LV 2
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=2}] at @s run scoreboard players set @s active_cool 57

# LV 3
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=3}] at @s run scoreboard players set @s active_cool 54

# LV 4
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=4}] at @s run scoreboard players set @s active_cool 51

# LV 5
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=5}] at @s run scoreboard players set @s active_cool 45