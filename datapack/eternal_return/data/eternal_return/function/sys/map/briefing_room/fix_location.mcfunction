# 캐릭터, 맵 선택이 완료되지 않은 플레이어는 위치 고정
$execute as @a[tag=first_join] at @s run tp @s @e[tag=s_id$(id),limit=1]