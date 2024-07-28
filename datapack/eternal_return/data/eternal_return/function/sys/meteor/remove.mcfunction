# 운석 지우기
execute as @e[tag=meteor] at @s run setblock ~ ~ ~ air
kill @e[tag=meteor]
tellraw @s {"text":"운석이 성공적으로 제거되었습니다","color":"green"}