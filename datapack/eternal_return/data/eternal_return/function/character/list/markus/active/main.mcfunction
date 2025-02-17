# 스킬 발동
execute if entity @s[tag=Qskill,tag=!active_cool] at @s if entity @s[nbt={OnGround:1b}] run function eternal_return:character/list/markus/active/active

execute if entity @s[tag=markus_jump] at @s run function eternal_return:character/list/markus/active/jump
execute if entity @s[tag=markus_skill] at @s run function eternal_return:character/list/markus/active/skill
execute as @e[tag=markus_hit] at @s if entity @s[tag=markus_hit] run function eternal_return:character/list/markus/active/hit

## 쿨타임

# LV 1
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=1}] at @s if entity @s[nbt={OnGround:1b}] run scoreboard players set @s active_cool 50

# LV 2
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=2}] at @s if entity @s[nbt={OnGround:1b}] run scoreboard players set @s active_cool 45

# LV 3
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=3}] at @s if entity @s[nbt={OnGround:1b}] run scoreboard players set @s active_cool 40

# LV 4
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=4}] at @s if entity @s[nbt={OnGround:1b}] run scoreboard players set @s active_cool 35

# LV 5
execute if entity @s[tag=Qskill,tag=!active_cool,scores={active_level=5}] at @s if entity @s[nbt={OnGround:1b}] run scoreboard players set @s active_cool 30