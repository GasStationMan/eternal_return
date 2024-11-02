#
#   필요 태그 : EF.letterbox
#   


## 래터박스
    
    # 조각된 호박이 없는 경우
        execute unless data entity @s Inventory[{id:"minecraft:carved_pumpkin",Slot:103b}] run clear @s minecraft:carved_pumpkin
        execute as @e[type=item] if data entity @s Item{id:"minecraft:carved_pumpkin"} run kill @s
        execute unless data entity @s Inventory[{id:"minecraft:carved_pumpkin",Slot:103b}] run item replace entity @s armor.head with carved_pumpkin