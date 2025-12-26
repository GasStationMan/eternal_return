## 실비아가 새로운 지역에 들어갔을 때 카운트 추가

# 학교
execute if entity @s[tag=school,tag=!school_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=school,tag=!school_visit] run tag @s add school_visit

# 소방서
execute if entity @s[tag=fire_station,tag=!fire_station_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=fire_station,tag=!fire_station_visit] run tag @s add fire_station_visit

# 주유소
execute if entity @s[tag=gas_station,tag=!gas_station_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=gas_station,tag=!gas_station_visit] run tag @s add gas_station_visit

# 양궁장
execute if entity @s[tag=archery_range,tag=!archery_range_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=archery_range,tag=!archery_range_visit] run tag @s add archery_range_visit

# 골목길
execute if entity @s[tag=alley,tag=!alley_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=alley,tag=!alley_visit] run tag @s add alley_visit

# 경찰서
execute if entity @s[tag=police_station,tag=!police_station_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=police_station,tag=!police_station_visit] run tag @s add police_station_visit

# 절
execute if entity @s[tag=temple,tag=!temple_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=temple,tag=!temple_visit] run tag @s add temple_visit

# 개울
execute if entity @s[tag=stream,tag=!stream_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=stream,tag=!stream_visit] run tag @s add stream_visit

# 연못
execute if entity @s[tag=pond,tag=!pond_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=pond,tag=!pond_visit] run tag @s add pond_visit

# 병원
execute if entity @s[tag=hospital,tag=!hospital_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=hospital,tag=!hospital_visit] run tag @s add hospital_visit

# 공장
execute if entity @s[tag=factory,tag=!factory_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=factory,tag=!factory_visit] run tag @s add factory_visit

# 묘지
execute if entity @s[tag=cemetery,tag=!cemetery_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=cemetery,tag=!cemetery_visit] run tag @s add cemetery_visit

# 성당
execute if entity @s[tag=chapel,tag=!chapel_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=chapel,tag=!chapel_visit] run tag @s add chapel_visit

# 항구
execute if entity @s[tag=dock,tag=!dock_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=dock,tag=!dock_visit] run tag @s add dock_visit

# 창고
execute if entity @s[tag=warehouse,tag=!warehouse_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=warehouse,tag=!warehouse_visit] run tag @s add warehouse_visit

# 고급 주택가
execute if entity @s[tag=uptown,tag=!uptown_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=uptown,tag=!uptown_visit] run tag @s add uptown_visit

# 숲
execute if entity @s[tag=forest,tag=!forest_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=forest,tag=!forest_visit] run tag @s add forest_visit

# 모래사장
execute if entity @s[tag=beach,tag=!beach_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=beach,tag=!beach_visit] run tag @s add beach_visit

# 호텔
execute if entity @s[tag=hotel,tag=!hotel_visit] run scoreboard players add @s visit 1
execute if entity @s[tag=hotel,tag=!hotel_visit] run tag @s add hotel_visit


## 스킬 사용 이펙트, 사운드
execute if entity @s[tag=!silviaskill,scores={visit=10}] at @s run function eternal_return:sys/character/particle/main
execute if entity @s[tag=!silviaskill,scores={visit=10}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 실비아 패시브 효과
execute if entity @s[tag=!silviaskill,scores={visit=10}] run xp add @s 200 levels
execute if entity @s[tag=!silviaskill,scores={visit=10..}] run tag @s add silviaskill


## 실비아 태그 보유 시 팀 가입
team join silvia @s[team=!silvia]