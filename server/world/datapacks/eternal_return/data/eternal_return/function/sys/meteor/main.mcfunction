## 스코어보드
execute as @e[tag=meteor,tag=selected] if score @s ct1 matches ..600 run scoreboard players add @s ct1 1
# 떨어지기 전
execute as @e[tag=meteor] at @s if score @s[tag=selected] ct1 matches ..599 run function eternal_return:sys/meteor/effect/before_impact
# 떨어진 후
execute if score @e[tag=selected,tag=meteor,limit=1] ct1 matches 599 run advancement revoke @a only eternal_return:meteor
execute if score @e[tag=selected,tag=meteor,limit=1] ct1 matches 599 run advancement grant @a only eternal_return:meteor
execute if score @e[tag=selected,tag=meteor,limit=1] ct1 matches 599 run function eternal_return:send_msg {target:"@a",text:'[{"selector":"@e[type=marker,tag=selected]"},{"text":"에 운석이 떨어졌습니다."}]',color:"gold",timer:1}
execute as @e[tag=meteor] at @s if score @s[tag=selected] ct1 matches 600 run function eternal_return:sys/meteor/effect/impact

# 객체별 실행 함수
execute as @e[tag=meteor,tag=interaction] at @s run function eternal_return:sys/meteor/meteor
execute as @e[tag=player] at @s run function eternal_return:sys/meteor/player