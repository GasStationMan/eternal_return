execute as @s[scores={credit=30..}] run give @p bread[food={nutrition:1,saturation:1,can_always_eat:true,eat_seconds:1,effects:[{effect:{id:"minecraft:regeneration",amplifier:0,duration:200,show_particles:0b,show_icon:1b},probability:1}]}] 3
execute as @s[scores={credit=30..}] run xp add @s -30 levels
execute as @s[scores={credit=..30}] run tellraw @s ["",{"text":"크레딧이 부족합니다.","color":"red"}]