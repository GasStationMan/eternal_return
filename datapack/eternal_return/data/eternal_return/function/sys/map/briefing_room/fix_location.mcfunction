# 캐릭터, 맵 선택이 완료되지 않은 플레이어는 위치 고정
$execute as @a[tag=!wait_bar,tag=!now_bar,tag=!last_waiting,tag=!game_start] at @s run tp @s @e[tag=s_id$(id),limit=1]