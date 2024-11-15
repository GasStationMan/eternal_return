##> 구역별 상태 지정하기
# 상태 받아오기
$data modify storage tmp is.[] set value {type:"$(type)"}

## 구역

## 전장 예정 구역
execute if data storage tmp is[{type:"scheduled_battle_zone"}] run tag @e[tag=zplace,tag=!scheduled_battle_zone,tag=!fix_area_type,tag=safe_area.,sort=random,limit=3] add scheduled_battle_zone
execute if data storage tmp is[{type:"scheduled_battle_zone"}] run tag @e[tag=zplace,tag=scheduled_battle_zone,tag=safe_area.] remove safe_area.
execute if data storage tmp is[{type:"scheduled_battle_zone"}] if entity @e[tag=scheduled_battle_zone] run function eternal_return:send_msg {target:"@a",text:'[{"text":"30초 후에 [ "},{"selector":"@e[tag=scheduled_battle_zone]","color":"yellow"},{"text":" ]에 전장이 활성화됩니다."}]',color:"gold",timer:1}


## 전장 구역
execute if data storage tmp is[{type:"battle_zone"}] run tag @e[tag=zplace,tag=scheduled_battle_zone] add battle_zone
execute if data storage tmp is[{type:"battle_zone"}] run tag @e[tag=zplace,tag=scheduled_battle_zone] remove scheduled_battle_zone
execute if data storage tmp is[{type:"battle_zone"}] if entity @e[tag=battle_zone] run function eternal_return:send_msg {target:"@a",text:'[{"text":"[ "},{"selector":"@e[tag=battle_zone]","color":"red"},{"text":" ]에 전장이 활성화됩니다."}]',color:"gold",timer:1}


## 금지 예정구역
execute if data storage tmp is[{type:"scheduled_restricted_zone"}] run tag @e[tag=zplace,tag=!scheduled_restricted_zone,tag=safe_area.,tag=!fix_area_type,sort=random,limit=3] add scheduled_restricted_zone
execute if data storage tmp is[{type:"scheduled_restricted_zone"}] run tag @e[tag=zplace,tag=scheduled_restricted_zone,tag=safe_area.] remove safe_area.
execute if data storage tmp is[{type:"scheduled_restricted_zone"}] if entity @e[tag=scheduled_restricted_zone] if score #timer.day CT1 matches ..4 run function eternal_return:send_msg {target:"@a",text:'[{"text":"1분 후에 [ "},{"selector":"@e[tag=scheduled_restricted_zone]","color":"white"},{"text":" ]이(가) 금지구역으로 지정됩니다."}]',color:"gold",timer:1}
execute if data storage tmp is[{type:"scheduled_restricted_zone"}] if entity @e[tag=scheduled_restricted_zone] if score #timer.day CT1 matches 5.. run function eternal_return:send_msg {target:"@a",text:'[{"text":"30초 후에 [ "},{"selector":"@e[tag=scheduled_restricted_zone]","color":"white"},{"text":" ]이(가) 금지구역으로 지정됩니다."}]',color:"gold",timer:1}

## 금지 구역
# 태그 추가
execute if data storage tmp is[{type:"restricted_zone"}] run tag @e[tag=zplace,tag=scheduled_restricted_zone,tag=!fix_area_type] add restricted_zone
execute if data storage tmp is[{type:"restricted_zone"}] run tag @e[tag=zplace,tag=scheduled_restricted_zone,tag=!fix_area_type] remove scheduled_restricted_zone
execute if data storage tmp is[{type:"restricted_zone"}] run tag @e[tag=zplace,tag=battle_zone,tag=!fix_area_type] add restricted_zone
execute if data storage tmp is[{type:"restricted_zone"}] run tag @e[tag=zplace,tag=battle_zone,tag=!fix_area_type] remove battle_zone

# 시간별 메시지 보내기
execute if data storage tmp is[{type:"restricted_zone"}] if entity @e[tag=restricted_zone,tag=!fix_area_type] if score #timer.halfday CT1 matches 1 run function eternal_return:send_msg {target:"@a",text:'[{"text":"[ "},{"selector":"@e[tag=restricted_zone,tag=!fix_area_type]","color":"#9E0010"},{"text":" ]이(가) 금지구역으로 지정되었습니다. 5초간 위성 레이더가 작동됩니다."}]',color:"gold",timer:1}
execute if data storage tmp is[{type:"restricted_zone"}] if entity @e[tag=restricted_zone,tag=!fix_area_type] if score #timer.halfday CT1 matches 2 run function eternal_return:send_msg {target:"@a",text:'[{"text":"[ "},{"selector":"@e[tag=restricted_zone,tag=!fix_area_type]","color":"#9E0010"},{"text":" ]이(가) 금지구역으로 지정되었습니다. 항공보급이 도착합니다."}]',color:"gold",timer:1}
# 오류 메시지
execute if data storage tmp is[{type:"restricted_zone"}] unless entity @e[tag=restricted_zone,tag=!fix_area_type] run tellraw @s {"text":"지정된 예정 구역이 없습니다.","color":"red"}
# 한번 지정된 금지구역은 재지정 불가
tag @e[tag=zplace,tag=restricted_zone,tag=!fix_area_type] add fix_area_type

# 스토리지 초기화
data remove storage tmp is