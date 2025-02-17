# 스킬시전자 기준 스킬의 꼭지점 좌표 가져오기
function eternal_return:character/list/markus/active/get_abc_xz

# 삼각형 범위내 감지
execute at @s as @e[type=villager,distance=1..8] run function eternal_return:character/list/markus/active/is_inside

#free
scoreboard players reset #sk.a.x NUM
scoreboard players reset #sk.a.y NUM
scoreboard players reset #sk.b.x NUM
scoreboard players reset #sk.b.y NUM
scoreboard players reset #sk.c.x NUM
scoreboard players reset #sk.c.y NUM

scoreboard players reset #pab
scoreboard players reset #pbc
scoreboard players reset #pca

scoreboard players reset #tmp2
scoreboard players reset #tmp3
scoreboard players reset #tmp4