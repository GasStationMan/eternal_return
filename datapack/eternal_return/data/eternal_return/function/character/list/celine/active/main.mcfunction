# 스킬 발동
execute if entity @s[tag=Qskill,tag=!active_cool,scores={celine_Q_count=1..}] at @s if entity @e[tag=celine_facing_last] run function eternal_return:character/list/celine/active/active
execute if entity @s[tag=celine_skill] at @s run function eternal_return:character/list/celine/active/skill

execute unless entity @s[tag=celine_skill] run scoreboard players reset @s celine_R