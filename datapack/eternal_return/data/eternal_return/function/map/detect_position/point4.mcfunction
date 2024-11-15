function pdb:get_me
# 해당 구역에 진입 및 태그 부여
$execute as @a[$(point1)] at @s run tag @s add $(place_name)
$execute as @a[$(point2)] at @s run tag @s add $(place_name)
$execute as @a[$(point3)] at @s run tag @s add $(place_name)
$execute as @a[$(point4)] at @s run tag @s add $(place_name)
# 해당 구역에 퇴장 시 태그 제거
$execute as @a[tag=$(place_name)] unless entity @s[$(point1)] unless entity @s[$(point2)] unless entity @s[$(point3)] unless entity @s[$(point4)] run tag @s remove $(place_name)
# 개인 스토리지에 위치 저장
$execute if entity @s[tag=$(place_name)] run data modify storage pdb:main in.place set value "$(place_name)"
function pdb:save_me