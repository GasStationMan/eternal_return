execute at @s run tp @s ~ ~ ~ ~ 0
execute at @s run summon marker ~ ~ ~ {Tags:["jenny_move"]}


execute if entity @s run tag @s remove jenny_select
execute if entity @s[tag=blacktea,tag=!jenny_select] run tag @s add jenny_select
execute if entity @s[tag=blacktea] run tag @s add redwine
execute if entity @s[tag=blacktea] run tag @s remove blacktea
execute if entity @s[tag=redwine,tag=!jenny_select] run tag @s add blacktea
execute if entity @s[tag=redwine,tag=!jenny_select] run tag @s remove redwine