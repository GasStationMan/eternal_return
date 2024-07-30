## 화면선택 모드
    ## 키 입력

        # F키를 눌렀을 때
        execute if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data"{tag:"selectmod"} run tag @s add select_Fkey
        execute if entity @s[tag=select_Fkey] run function eternal_return:sys/map/briefing_room/waitingplayer/replaceitem_blank
        
        # Q키를 눌렀을(아이템 버릴) 때
        execute at @s if data entity @e[type=item,limit=1,distance=..2] Item.components."minecraft:custom_data"{tag:"selectmod"} run tag @s add select_Qkey
        execute if entity @s[tag=select_Qkey] run function eternal_return:sys/map/briefing_room/waitingplayer/replaceitem_blank
        execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data"{tag:"selectmod"} run kill @s
        
        # 우클릭 했을 때
        execute if score @s clickStick matches 1.. run tag @s add select_rightclick
        execute if score @s clickStick matches 1.. run scoreboard players set @s clickStick 0

    