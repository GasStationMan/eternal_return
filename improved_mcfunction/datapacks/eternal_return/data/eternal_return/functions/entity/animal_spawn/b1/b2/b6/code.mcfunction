function eternal_return:entity/animal/wolf/summon/main {dx:  0 ,   dy: -3,  dz: 0 }
scoreboard players set @s[type=minecraft:marker] ER.cooltime 6000
execute on vehicle run data modify entity @s text set value '[{"text":""}]'
scoreboard players set @s ER.sys 1
