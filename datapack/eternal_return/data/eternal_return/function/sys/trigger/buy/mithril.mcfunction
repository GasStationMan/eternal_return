# 구매 실패
execute as @s at @s[scores={credit=..249}] run playsound minecraft:block.anvil.land master @s ~ ~ ~ 1 2

# 구매 성공
execute as @s at @s[scores={credit=250..}] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 2
give @s[scores={credit=250..}] tide_armor_trim_smithing_template[item_name='{"bold":true,"color":"light_purple","italic":false,"text":"미스릴"}'] 1
scoreboard players remove @s[scores={credit=250..}] credit 250