# 구매 실패
execute as @s at @s[scores={credit=..199}] run playsound minecraft:block.anvil.land master @s ~ ~ ~ 1 2

# 구매 성공
execute as @s at @s[scores={credit=200..}] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 2
give @s[scores={credit=200..}] oak_sapling[item_name='{"bold":true,"color":"green","text":"생명의 나무"}'] 1
scoreboard players remove @s[scores={credit=200..}] credit 200