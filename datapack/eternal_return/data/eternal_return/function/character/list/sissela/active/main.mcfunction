execute if entity @s[tag=Qskill,tag=!active_cool] at @s if entity @s[tag=sissela_passive_skill] run function eternal_return:character/list/sissela/active/active
execute if entity @s[tag=sissela_active_skill_ready] at @s run function eternal_return:character/list/sissela/active/skill_ready
execute if entity @s[tag=sissela_active_skill] at @s run function eternal_return:character/list/sissela/active/skill

## 쿨타임

# LV 1
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=1}] run scoreboard players set @s active_cool 60

# LV 2
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=2}] run scoreboard players set @s active_cool 55

# LV 3
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=3}] run scoreboard players set @s active_cool 50

# LV 4
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=4}] run scoreboard players set @s active_cool 45

# LV 5
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=5}] run scoreboard players set @s active_cool 40