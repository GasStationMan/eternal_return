# 구매 실패
execute as @s at @s[scores={credit=..499}] run playsound minecraft:block.anvil.land master @s ~ ~ ~ 1 2

# 구매 성공
execute as @s at @s[scores={credit=500..}] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 2
give @s[scores={credit=500..}] fermented_spider_eye[item_name='{"bold":true,"color":"light_purple","italic":false,"text":"VF 혈액 샘플"}'] 1
scoreboard players remove @s[scores={credit=500..}] credit 500