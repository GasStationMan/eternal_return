## 실비아가 새로운 지역에 들어갔을 때 카운트 추가

# 학교
execute as @a[tag=silvia,tag=school,tag=!school_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=school,tag=!school_visit] run tag @s add school_visit

# 소방서
execute as @a[tag=silvia,tag=fire_station,tag=!fire_station_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=fire_station,tag=!fire_station_visit] run tag @s add fire_station_visit

# 주유소
execute as @a[tag=silvia,tag=gas_station,tag=!gas_station_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=gas_station,tag=!gas_station_visit] run tag @s add gas_station_visit

# 양궁장
execute as @a[tag=silvia,tag=archery_range,tag=!archery_range_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=archery_range,tag=!archery_range_visit] run tag @s add archery_range_visit

# 골목길
execute as @a[tag=silvia,tag=alley,tag=!alley_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=alley,tag=!alley_visit] run tag @s add alley_visit

# 경찰서
execute as @a[tag=silvia,tag=police_station,tag=!police_station_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=police_station,tag=!police_station_visit] run tag @s add police_station_visit

# 절
execute as @a[tag=silvia,tag=temple,tag=!temple_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=temple,tag=!temple_visit] run tag @s add temple_visit

# 개울
execute as @a[tag=silvia,tag=stream,tag=!stream_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=stream,tag=!stream_visit] run tag @s add stream_visit

# 연못
execute as @a[tag=silvia,tag=pond,tag=!pond_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=pond,tag=!pond_visit] run tag @s add pond_visit

# 병원
execute as @a[tag=silvia,tag=hospital,tag=!hospital_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=hospital,tag=!hospital_visit] run tag @s add hospital_visit

# 공장
execute as @a[tag=silvia,tag=factory,tag=!factory_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=factory,tag=!factory_visit] run tag @s add factory_visit

# 묘지
execute as @a[tag=silvia,tag=cemetery,tag=!cemetery_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=cemetery,tag=!cemetery_visit] run tag @s add cemetery_visit

# 성당
execute as @a[tag=silvia,tag=chapel,tag=!chapel_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=chapel,tag=!chapel_visit] run tag @s add chapel_visit

# 항구
execute as @a[tag=silvia,tag=dock,tag=!dock_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=dock,tag=!dock_visit] run tag @s add dock_visit

# 창고
execute as @a[tag=silvia,tag=warehouse,tag=!warehouse_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=warehouse,tag=!warehouse_visit] run tag @s add warehouse_visit

# 고급 주택가
execute as @a[tag=silvia,tag=uptown,tag=!uptown_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=uptown,tag=!uptown_visit] run tag @s add uptown_visit

# 숲
execute as @a[tag=silvia,tag=forest,tag=!forest_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=forest,tag=!forest_visit] run tag @s add forest_visit

# 모래사장
execute as @a[tag=silvia,tag=beach,tag=!beach_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=beach,tag=!beach_visit] run tag @s add beach_visit

# 호텔
execute as @a[tag=silvia,tag=hotel,tag=!hotel_visit] run scoreboard players add @s visit 1
execute as @a[tag=silvia,tag=hotel,tag=!hotel_visit] run tag @s add hotel_visit


## 스킬 사용 이펙트, 사운드
execute as @a[tag=silvia,tag=!silviaskill,scores={visit=10}] at @s run function eternal_return:sys/character/particle/main
execute as @a[tag=silvia,tag=!silviaskill,scores={visit=10}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 실비아 패시브 효과
execute as @a[tag=silvia,tag=!silviaskill,scores={visit=10}] run xp add @s 200 levels
execute as @a[tag=silvia,tag=!silviaskill,scores={visit=10..}] run tag @s add silviaskill

## 실비아 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=silviaskill] unless entity @s[tag=silvia] run tag @s remove silviaskill

execute as @a[tag=alley_visit] unless entity @s[tag=silvia] run tag @s remove alley_visit
execute as @a[tag=school_visit] unless entity @s[tag=silvia] run tag @s remove school_visit
execute as @a[tag=fire_station_visit] unless entity @s[tag=silvia] run tag @s remove fire_station_visit
execute as @a[tag=gas_station_visit] unless entity @s[tag=silvia] run tag @s remove gas_station_visit
execute as @a[tag=archery_range_visit] unless entity @s[tag=silvia] run tag @s remove archery_range_visit
execute as @a[tag=police_station_visit] unless entity @s[tag=silvia] run tag @s remove police_station_visit
execute as @a[tag=temple_visit] unless entity @s[tag=silvia] run tag @s remove temple_visit
execute as @a[tag=pond_visit] unless entity @s[tag=silvia] run tag @s remove pond_visit
execute as @a[tag=stream_visit] unless entity @s[tag=silvia] run tag @s remove stream_visit
execute as @a[tag=hospital_visit] unless entity @s[tag=silvia] run tag @s remove hospital_visit
execute as @a[tag=factory_visit] unless entity @s[tag=silvia] run tag @s remove factory_visit
execute as @a[tag=cemetery_visit] unless entity @s[tag=silvia] run tag @s remove cemetery_visit
execute as @a[tag=chapel_visit] unless entity @s[tag=silvia] run tag @s remove chapel_visit
execute as @a[tag=dock_visit] unless entity @s[tag=silvia] run tag @s remove dock_visit
execute as @a[tag=warehouse_visit] unless entity @s[tag=silvia] run tag @s remove warehouse_visit
execute as @a[tag=uptown_visit] unless entity @s[tag=silvia] run tag @s remove uptown_visit
execute as @a[tag=forest_visit] unless entity @s[tag=silvia] run tag @s remove forest_visit
execute as @a[tag=beach_visit] unless entity @s[tag=silvia] run tag @s remove beach_visit
execute as @a[tag=hotel_visit] unless entity @s[tag=silvia] run tag @s remove hotel_visit

execute as @a[scores={visit=1..}] unless entity @s[tag=silvia] run scoreboard players reset @s visit

## 실비아 태그 보유 시 팀 가입
execute as @a[tag=silvia,tag=team1] run team join silvia @s
execute as @a[tag=silvia,tag=team2] run team join silvia @s
execute as @a[tag=silvia,tag=team3] run team join silvia @s
execute as @a[tag=silvia,tag=team4] run team join silvia @s
execute as @a[tag=silvia,tag=team5] run team join silvia @s
execute as @a[tag=silvia,tag=team6] run team join silvia @s
execute as @a[tag=silvia,tag=team7] run team join silvia @s
execute as @a[tag=silvia,tag=team8] run team join silvia @s
execute as @a[tag=silvia,tag=team9] run team join silvia @s
execute as @a[tag=silvia,tag=team10] run team join silvia @s
execute as @a[tag=silvia,tag=team11] run team join silvia @s
execute as @a[tag=silvia,tag=team12] run team join silvia @s
execute as @a[tag=silvia,tag=team13] run team join silvia @s
execute as @a[tag=silvia,tag=team14] run team join silvia @s
execute as @a[tag=silvia,tag=team15] run team join silvia @s
execute as @a[tag=silvia,tag=team16] run team join silvia @s
execute as @a[tag=silvia,tag=team17] run team join silvia @s
execute as @a[tag=silvia,tag=team18] run team join silvia @s
