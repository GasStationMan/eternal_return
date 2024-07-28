execute if score #timer.day CT1 matches 1 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 0 \
    if score #timer.tick CT1 matches 19 \ 
        run item replace entity @s container.0 with iron_sword[item_name='{"text":"레바테인"}',unbreakable={},rarity="epic",enchantments={levels:{"minecraft:fire_aspect":1}}] 1
execute if score #timer.day CT1 matches 1 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 0 \
    if score #timer.tick CT1 matches 19 \ 
        run item replace entity @s container.1 with bow[item_name='{"text":"적궁백시"}',unbreakable={},rarity="epic",enchantments={levels:{"minecraft:flame":1}}] 1


team join adriana @s[team=!adriana]