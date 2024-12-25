## 쇼우 빵 먹을 때
execute if entity @a[tag=shou] as @a[tag=shou,scores={shou=1..}] run effect give @s regeneration 10 1 true
scoreboard players reset @a[scores={shou=1..}] shou

## 쇼우 태그 보유 시 팀 가입
execute if entity @a[tag=shou] as @a[tag=shou,team=!shou] run team join shou @s