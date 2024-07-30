## 캐릭터 태그 없으면 팀 제거
execute if entity @a[tag=player] as @a unless entity @s[tag=team] run team leave @s