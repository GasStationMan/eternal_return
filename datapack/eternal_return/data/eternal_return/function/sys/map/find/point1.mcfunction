# 해당 구역에 진입 및 태그 부여
$tag @s[$(point1)] add $(place_name)
# 해당 구역에 퇴장 시 태그 제거
$execute unless entity @s[tag=$(place_name),$(point1)] run tag @s remove $(place_name)