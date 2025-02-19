# 스킬 발동
execute if entity @s[tag=Qskill,tag=!active_cool] at @s run function eternal_return:character/list/leon/active/active
execute if entity @s[tag=leon_skill] at @s run function eternal_return:character/list/leon/active/skill



## 쿨타임

# LV 1
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=1}] at @s run scoreboard players set @s active_cool 50

# LV 2
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=2}] at @s run scoreboard players set @s active_cool 47

# LV 3
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=3}] at @s run scoreboard players set @s active_cool 44

# LV 4
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=4}] at @s run scoreboard players set @s active_cool 41

# LV 5
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=5}] at @s run scoreboard players set @s active_cool 35