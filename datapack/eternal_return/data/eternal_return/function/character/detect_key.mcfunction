## 키 감지
# 상위 함수 : function eternal_return:main
# 입출력 없음
# F키와 Q키를 감지한다


# F키
    # 태그 부여
        execute if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data"{tags:"weapon"} run tag @s add Fskill
        execute if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data"{tags:"weapon"} run tag @s add this.
    execute if entity @s[tag=this.] run item replace entity @s enderchest.0 from entity @s weapon.mainhand
    execute if entity @s[tag=this.] run item replace entity @s weapon.mainhand from entity @s weapon.offhand
    execute if entity @s[tag=this.] run item replace entity @s weapon.offhand from entity @s enderchest.0
    tag @s[tag=this.] remove this.

# Q키
    # 태그 부여
        execute at @s if data entity @e[type=item,distance=..5,limit=1] Item.components."minecraft:custom_data"{tags:"weapon"} run tag @s add Qskill
    # 버린 아이템 회수
        execute at @s if data entity @e[type=item,distance=..5,limit=1] Item.components."minecraft:custom_data"{tags:"weapon"} run data modify entity @e[type=item,distance=..5,limit=1,sort=nearest] PickupDelay set value 0