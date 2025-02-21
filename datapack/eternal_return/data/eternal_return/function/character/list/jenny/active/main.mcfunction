# 스킬 발동
execute if entity @s[tag=Qskill,tag=!active_cool] at @s run function eternal_return:character/list/jenny/active/active

function eternal_return:character/list/jenny/active/skill



## 쿨타임

# LV 1
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=1}] at @s run scoreboard players set @s active_cool 30

# LV 2
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=2}] at @s run scoreboard players set @s active_cool 27

# LV 3
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=3}] at @s run scoreboard players set @s active_cool 24

# LV 4
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=4}] at @s run scoreboard players set @s active_cool 21

# LV 5
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=5}] at @s run scoreboard players set @s active_cool 15