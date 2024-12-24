execute on vehicle run function eternal_return:entity/animal/wolf/behav/b1/b1/b1/b1/code
execute if score @s aj.attack.frame = #ER.animal.wolf.attack_tick_first ER.sys run return run damage @p[tag=targeted, distance=..4] 5 minecraft:player_attack
execute if score @s aj.attack.frame = #ER.animal.wolf.attack_tick_second ER.sys run return run damage @p[tag=targeted, distance=..4] 5 minecraft:player_attack
