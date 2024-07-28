# 파티클
particle reverse_portal ~ ~0.1 ~ 0.5 0 0.5 0.03 5 force

# 클릭한 플레이어 태그 부여
# 단, 주변에 캐고 있는 플레이어가 없는 경우에만 부여
execute unless entity @a[tag=player,tag=get_meteor,distance=..1.5] on target if entity @s[tag=!get_meteor] run tag @s add get_meteor

# 인터렉션 NBT 제거
data remove entity @s interaction