## hide 태그가 있을 때
# 갑옷 정보 저장
execute if entity @s[tag=!save_armor,tag=hide] run function eternal_return:sys/player/armors/save
# 입었던 갑옷 만큼의 기초방어력 부여
execute if entity @s[tag=!save_armor,tag=hide] store result storage player_data temp[1].armor float 1 run attribute @s generic.armor get
execute if entity @s[tag=!save_armor,tag=hide] run function eternal_return:sys/player/armors/give with storage player_data temp[1]
# 깁옷 슬롯 비우기
execute if entity @s[tag=!save_armor,tag=hide] run function eternal_return:sys/player/armors/clear
# 투명화 부여
effect give @s[tag=!save_armor,tag=hide] invisibility infinite 1 true

# 저장된 사람에게 태그 부여
tag @s[tag=!save_armor,tag=hide] add save_armor


## hide 태그가 없을 때
# 기초 방어력 제거
execute if entity @s[tag=show] run attribute @s generic.armor base set 0
# 갑옷 회수
execute if entity @s[tag=show] run function eternal_return:sys/player/armors/load
# 투명화 제거
effect clear @s[tag=show] invisibility

# 태그 제거
tag @s[tag=show] remove save_armor
tag @s[tag=show] remove hide
tag @s[tag=show] remove show