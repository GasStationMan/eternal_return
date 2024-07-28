# 사운드
playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
# 파티클
function eternal_return:sys/character/particle/main
# 스킬 효과
scoreboard players add @s credit 50
# 태그 제거
tag @s remove ardaskill