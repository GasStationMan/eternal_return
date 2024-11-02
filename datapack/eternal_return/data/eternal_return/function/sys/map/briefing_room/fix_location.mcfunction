# 캐릭터, 맵 선택이 완료되지 않은 플레이어는 위치 고정
tag @s add this
$execute as @e[tag=s_id$(id),limit=1] at @s run tp @a[tag=this] ~ ~-1 ~
tag @s remove this