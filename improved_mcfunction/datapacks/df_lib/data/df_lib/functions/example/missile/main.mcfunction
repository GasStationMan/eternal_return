execute as @e[type=#projectile,tag=missile] at @s unless entity @n[tag=target,distance=..20] run return run kill @s
execute as @e[type=#projectile,tag=missile] run function df_lib:example/missile/b1/code
