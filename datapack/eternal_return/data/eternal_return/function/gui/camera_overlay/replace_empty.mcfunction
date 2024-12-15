



# 어떤 슬롯에도 투명 UI아이템이 없는 경우
    execute unless items entity @s armor.feet * unless data entity @s Inventory[{components:{"minecraft:hide_tooltip":{}}}] unless items entity @s player.cursor paper[hide_tooltip={}] run function eternal_return:gui/camera_overlay/set_armor_item/feet


# 투명 UI 아이템 제거
    # 마우스 커서/인벤토리/핫바/왼손/바닥
        execute if items entity @s player.cursor paper[hide_tooltip={}] run return run clear @s paper[hide_tooltip={}]
        execute if items entity @s inventory.* paper[hide_tooltip={}] run return run clear @s paper[hide_tooltip={}]
        execute if items entity @s hotbar.* paper[hide_tooltip={}] run return run clear @s paper[hide_tooltip={}]
        execute if items entity @s weapon.* paper[hide_tooltip={}] run return run clear @s paper[hide_tooltip={}]
        execute as @e[type=item,limit=1] if data entity @s Item.components{"minecraft:hide_tooltip":{}} run kill @s