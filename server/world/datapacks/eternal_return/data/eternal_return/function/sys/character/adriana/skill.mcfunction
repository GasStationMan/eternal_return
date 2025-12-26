execute if score #timer.day NUM matches 1 \
    if score #timer.halfday NUM matches 1 \
    if score #timer.sec NUM matches 0 \
    if score #timer.tick NUM matches 19 \ 
        run item replace entity @s container.0 with iron_sword[item_name='{"text":"레바테인"}',unbreakable={},rarity="epic",enchantments={levels:{"minecraft:fire_aspect":1}}] 1
execute if score #timer.day NUM matches 1 \
    if score #timer.halfday NUM matches 1 \
    if score #timer.sec NUM matches 0 \
    if score #timer.tick NUM matches 19 \ 
        run item replace entity @s container.1 with bow[item_name='{"text":"적궁백시"}',unbreakable={},rarity="epic",enchantments={levels:{"minecraft:flame":1}}] 1


team join adriana @s[team=!adriana]