## 브리핑 룸 입장 전
    # 플레이어
        # 랜덤으로 캐릭터 선택지점으로 tp
        tp @s[tag=frist_join,tag=!using] @e[tag=!using,tag=standing_point,limit=1,sort=random]

    # 캐릭터 선택지점
        # 플레이어가 칸에 들어온 경우 태그 추가
        execute as @e[tag=standing_point] at @s if entity @p[distance=..1.2,tag=!using] run tag @s add using
        # 플레이어가 칸에서 나간 경우 태그 삭제
        execute as @e[tag=standing_point] at @s unless entity @p[distance=..1.2] run tag @s remove using
        # 들어온 플레이어에게 태그 추가
        execute as @e[tag=standing_point,tag=using] at @s run tag @p[distance=..1.2,tag=!using] add using
        # 나간 플레이어 태그 삭제
        execute as @a[tag=!frist_join] at @s unless entity @e[tag=standing_point,distance=..1.2] run tag @s remove using
        # 들어온 플레이어 위치 고정
        execute as @e[tag=standing_point] at @s run tp @p[distance=..1.2,tag=frist_join,tag=using] ~ ~-1 ~
    
    # 포탈 소리 제거
    stopsound @s * minecraft:block.portal.ambient
    stopsound @s * minecraft:block.portal.trigger

    # 플레이어 효과
    effect give @s invisibility infinite 1 true
    effect give @s resistance infinite 100 true