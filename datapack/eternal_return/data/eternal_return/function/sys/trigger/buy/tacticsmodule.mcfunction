# 구매 실패
execute as @s at @s[scores={credit=..199}] run playsound minecraft:block.anvil.land master @s ~ ~ ~ 1 2

# 구매 성공
execute as @s at @s[scores={credit=200..}] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 2
give @s[scores={credit=200..}] prismarine_shard[item_name='{"bold":true,"color":"light_purple","italic":false,"text":"전술 강화 모듈"}'] 1
scoreboard players remove @s[scores={credit=200..}] credit 200