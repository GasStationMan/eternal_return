## 게임 시작할 때 무기 획득
execute as @a[tag=adriana] if entity @e[tag=gametime,scores={gametime=1}] run item replace entity @s container.0 with iron_sword[item_name='{"text":"레바테인"}',unbreakable={},rarity="epic",enchantments={levels:{"minecraft:fire_aspect":1}}] 1
execute as @a[tag=adriana] if entity @e[tag=gametime,scores={gametime=1}] run item replace entity @s container.1 with bow[item_name='{"text":"적궁백시"}',unbreakable={},rarity="epic",enchantments={levels:{"minecraft:flame":1}}] 1

## 아드리아나 태그 보유 시 팀 가입
execute as @a[tag=adriana,tag=team1] run team join adriana @s
execute as @a[tag=adriana,tag=team2] run team join adriana @s
execute as @a[tag=adriana,tag=team3] run team join adriana @s
execute as @a[tag=adriana,tag=team4] run team join adriana @s
execute as @a[tag=adriana,tag=team5] run team join adriana @s
execute as @a[tag=adriana,tag=team6] run team join adriana @s
execute as @a[tag=adriana,tag=team7] run team join adriana @s
execute as @a[tag=adriana,tag=team8] run team join adriana @s
execute as @a[tag=adriana,tag=team9] run team join adriana @s
execute as @a[tag=adriana,tag=team10] run team join adriana @s
execute as @a[tag=adriana,tag=team11] run team join adriana @s
execute as @a[tag=adriana,tag=team12] run team join adriana @s
execute as @a[tag=adriana,tag=team13] run team join adriana @s
execute as @a[tag=adriana,tag=team14] run team join adriana @s
execute as @a[tag=adriana,tag=team15] run team join adriana @s
execute as @a[tag=adriana,tag=team16] run team join adriana @s
execute as @a[tag=adriana,tag=team17] run team join adriana @s
execute as @a[tag=adriana,tag=team18] run team join adriana @s