tellraw @a {"text":"새로 고침 완료! 제발 제발 F3 + T !!!!!","color":"green"}
forceload add -561 512 -585 536

# 빈 HPbar
execute unless data storage minecraft:hp_bar data run data modify storage minecraft:hp_bar data set value ["-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0", "-0"]

# 야생동물 관련 스코어보드 생성
scoreboard players set #ER.place.null ER.sys 0
scoreboard players set #ER.place.beach ER.sys 1
scoreboard players set #ER.place.gas_station ER.sys 2
scoreboard players set #ER.place.golmok ER.sys 3
scoreboard players set #ER.place.yanggung ER.sys 4
scoreboard players set #ER.place.school ER.sys 5
scoreboard players set #ER.place.hotel ER.sys 6
scoreboard players set #ER.place.fire ER.sys 7
scoreboard players set #ER.place.police ER.sys 8
scoreboard players set #ER.place.forest ER.sys 9
scoreboard players set #ER.place.pond ER.sys 10
scoreboard players set #ER.place.stream ER.sys 11
scoreboard players set #ER.place.graveyard ER.sys 12
scoreboard players set #ER.place.hospital ER.sys 13
scoreboard players set #ER.place.village ER.sys 14
scoreboard players set #ER.place.cathedral ER.sys 15
scoreboard players set #ER.place.storage ER.sys 16
scoreboard players set #ER.place.port ER.sys 17
scoreboard players set #ER.place.factory ER.sys 18
scoreboard players set #ER.place.jul ER.sys 19

#> 야생동물 체력 및 공격력 설정
#멧돼지
scoreboard players set #ER.animal.boar.health ER.sys 15
scoreboard players set #ER.animal.boar.attack ER.sys 4
scoreboard players set #ER.animal.boar.cooltime ER.sys 120
#곰
scoreboard players set #ER.animal.bear.health ER.sys 45
scoreboard players set #ER.animal.bear.attack ER.sys 6
scoreboard players set #ER.animal.bear.cooltime ER.sys 120
#늑대
scoreboard players set #ER.animal.wolf.health ER.sys 25
scoreboard players set #ER.animal.wolf.attack ER.sys 4
scoreboard players set #ER.animal.wolf.cooltime ER.sys 120
#알파
scoreboard players set #ER.animal.alpha.health ER.sys 100
scoreboard players set #ER.animal.alpha.attack ER.sys 10
scoreboard players set #ER.animal.alpha.cooltime ER.sys 120