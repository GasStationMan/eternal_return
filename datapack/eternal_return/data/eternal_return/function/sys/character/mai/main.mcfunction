## 게임 시작할 때 방어구 획득
execute if entity @a[tag=mai] as @a[tag=mai] if score #timer.day CT1 matches 1 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 0 \
    if score #timer.tick CT1 matches 19 \
        run item replace entity @s armor.chest with diamond_chestplate

## 마이 태그 보유 시 팀 가입
execute if entity @a[tag=mai] as @a[tag=mai,team=!mai] run team join mai @s