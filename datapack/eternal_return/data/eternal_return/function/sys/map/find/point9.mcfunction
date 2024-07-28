# 해당 구역에 진입 및 태그 부여
$execute as @a[$(point1)] at @s run tag @s add $(place_name)
$execute as @a[$(point2)] at @s run tag @s add $(place_name)
$execute as @a[$(point3)] at @s run tag @s add $(place_name)
$execute as @a[$(point4)] at @s run tag @s add $(place_name)
$execute as @a[$(point5)] at @s run tag @s add $(place_name)
$execute as @a[$(point6)] at @s run tag @s add $(place_name)
$execute as @a[$(point7)] at @s run tag @s add $(place_name)
$execute as @a[$(point8)] at @s run tag @s add $(place_name)
$execute as @a[$(point9)] at @s run tag @s add $(place_name)
# 해당 구역에 퇴장 시 태그 제거
$execute as @a[tag=$(place_name)] unless entity @s[$(point1)] unless entity @s[$(point2)] unless entity @s[$(point3)] unless entity @s[$(point4)] unless entity @s[$(point5)] unless entity @s[$(point6)] unless entity @s[$(point7)] unless entity @s[$(point8)] unless entity @s[$(point9)] at @s run tag @s remove $(place_name)