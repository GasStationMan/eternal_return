## 점프 패드 플레이어 감지
execute as @e[tag=jumppad] at @s if entity @a[distance=..1.2] run tag @s add on_pad

# ct2 값을 custommodeldata에 대입
execute as @e[tag=jumppad,scores={ct2=1..9}] store result entity @s ArmorItems[3].components.minecraft:custom_model_data int 1 run scoreboard players get @s ct2

##> 스코어보드 처리

## 게이지가 완충 되었을 때
# 태그 부여
execute as @e[tag=jumppad,scores={ct1=..5,ct2=8}] at @s run function eternal_return:sys/jumppad/get_tag with entity @s ArmorItems[3].components.minecraft:custom_data



# 플레이어와 돼지에게 같은 태그 부여

#> 밟고 있을 때
# 타이머, 게이지 증가
scoreboard players add @e[tag=on_pad] ct1 1
scoreboard players add @e[tag=on_pad,scores={ct1=6..,ct2=..7}] ct2 1
scoreboard players set @e[tag=on_pad,scores={ct1=6..}] ct1 0
# 게이지 0 상태에서 처음 밟았을 때
scoreboard players set @e[tag=on_pad,scores={ct1=0..,ct2=9}] ct2 1

#> 밟지 않을 때
# 타이머 = 0초 & 게이지 = 0
scoreboard players set @e[tag=jumppad,tag=!on_pad,scores={ct1=0..5,ct2=0}] ct2 9
# 타이머, 게이지 감소
scoreboard players remove @e[tag=jumppad,tag=!on_pad,scores={ct1=1..,ct2=1..}] ct1 1
scoreboard players remove @e[tag=jumppad,tag=!on_pad,scores={ct1=..0,ct2=1..8}] ct2 1
scoreboard players set @e[tag=jumppad,tag=!on_pad,scores={ct1=..0,ct2=1..8}] ct1 5


# 돼지가 땅에 닿을때
scoreboard players add @e[tag=jumping,nbt={OnGround:1b}] ct1 1
tp @e[tag=jumping,nbt={OnGround:1b},scores={ct1=2..}] ~ -100 ~
kill @e[tag=jumping,scores={ct1=2..}]

# 플레이어 태우고 내리기
execute as @e[tag=jumppad] at @s run function eternal_return:sys/jumppad/ride with entity @s ArmorItems[3].components.minecraft:custom_data
execute as @a at @s run function eternal_return:sys/jumppad/remove_tag with entity @e[tag=jumping,limit=1,distance=..3,sort=nearest,scores={ct1=1..}] ArmorItems[3].components.minecraft:custom_data
execute as @a at @s if entity @e[tag=jumping,scores={ct1=1..}] run ride @s dismount



# 안 밟을 때 태그 제거
execute as @e[tag=jumppad] at @s if entity @a[distance=1.2..] run tag @s remove on_pad