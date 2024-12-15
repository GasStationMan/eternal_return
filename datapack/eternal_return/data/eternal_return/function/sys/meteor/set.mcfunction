# 임의의 두 마커에 태그 부여
tag @e[tag=meteor,tag=!selected,tag=marker,sort=random,limit=2] add selected
scoreboard players set @e[tag=meteor,tag=selected,tag=marker] ct1 0
# 에러 메시지
execute unless entity @e[tag=selected,tag=meteor,tag=marker] run tellraw @s [{"text":"떨어질 위치가 존재하지 않습니다","color":"red"}]

# 운석 예고 메시지
execute if entity @e[tag=selected,tag=meteor,tag=marker] run advancement revoke @a only eternal_return:meteor_30
execute if entity @e[tag=selected,tag=meteor,tag=marker] run advancement grant @a only eternal_return:meteor_30
execute if entity @e[tag=selected,tag=meteor,tag=marker] run function eternal_return:send_msg {target:"@a",text:'[{"text":"30초 후에 "},{"selector":"@e[type=marker,tag=selected]"},{"text":"에 운석이 떨어집니다."}]',color:"gold",timer:1}