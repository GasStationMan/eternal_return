$function eternal_return:entity/animal/$(animal)/skill/main
$damage @p[tag=targeted] $(damage) minecraft:player_attack
scoreboard players set @s ER.cooltime 240
