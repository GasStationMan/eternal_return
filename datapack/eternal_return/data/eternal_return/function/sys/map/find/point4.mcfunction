# 해당 구역에 진입 및 태그 부여
$execute as @a[$(point1)] at @s run tag @s add $(place_name)
$execute as @a[$(point2)] at @s run tag @s add $(place_name)
$execute as @a[$(point3)] at @s run tag @s add $(place_name)
$execute as @a[$(point4)] at @s run tag @s add $(place_name)
# 해당 구역에 퇴장 시 태그 제거
$execute as @a[tag=$(place_name)] unless entity @s[$(point1)] unless entity @s[$(point2)] unless entity @s[$(point3)] unless entity @s[$(point4)] run tag @s remove $(place_name)