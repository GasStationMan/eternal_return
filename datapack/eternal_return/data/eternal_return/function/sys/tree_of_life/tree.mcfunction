# 파티클
particle minecraft:happy_villager ~ ~ ~ 0.4 0.4 0.4 1 5

# 클릭한 플레이어 태그 부여
# 단, 주변에 캐고 있는 플레이어가 없는 경우에만 부여
execute unless entity @a[tag=player,tag=get_tree,distance=..2.5] on target if entity @s[tag=!get_tree] run tag @s add get_tree

# 인터렉션 NBT 제거
data remove entity @s interaction