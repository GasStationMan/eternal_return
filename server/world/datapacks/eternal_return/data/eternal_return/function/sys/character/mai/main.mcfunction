## 게임 시작할 때 방어구 획득
execute if entity @a[tag=mai] as @a[tag=mai] if score #timer.day NUM matches 1 \
    if score #timer.halfday NUM matches 1 \
    if score #timer.sec NUM matches 0 \
    if score #timer.tick NUM matches 19 \
        run item replace entity @s armor.chest with diamond_chestplate

## 마이 태그 보유 시 팀 가입
execute if entity @a[tag=mai] as @a[tag=mai,team=!mai] run team join mai @s