## 키 감지
# 상위 함수 : function eternal_return:gui/screen/tick
# WASD,SHIFT,SPACE,좌/우클릭,F,Q 키 감지 후 태그 부여

    # W
    execute if predicate eternal_return:is_forward run tag @s add Wkey

    # A
    execute if predicate eternal_return:is_left run tag @s add Akey

    # S
    execute if predicate eternal_return:is_backward run tag @s add Skey

    # D
    execute if predicate eternal_return:is_right run tag @s add Dkey

    # SPACE
    execute if predicate eternal_return:is_jump run tag @s add SPACE
    
    # SHIFT
    execute if predicate eternal_return:is_sneaking run tag @s add SHIFT

    # F
    execute if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data"{tag:"selectmod"} run tag @s add select_Fkey
    execute if entity @s[tag=select_Fkey] run function eternal_return:gui/screen/blank_item
    
    # Q
    execute at @s if data entity @e[type=item,limit=1,distance=..2] Item.components."minecraft:custom_data"{tag:"selectmod"} run tag @s add select_Qkey
    execute if entity @s[tag=select_Qkey] run function eternal_return:gui/screen/blank_item
    execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data"{tag:"selectmod"} run kill @s

    # 우클릭
    execute as @e[tag=standing_point] if data entity @s interaction on target run tag @s add Rclick
    execute as @e[tag=standing_point] if data entity @s interaction run data remove entity @s interaction

    # 좌클릭
    execute as @e[tag=standing_point] if data entity @s attack on attacker run tag @s add Lclick
    execute as @e[tag=standing_point] if data entity @s attack run data remove entity @s attack