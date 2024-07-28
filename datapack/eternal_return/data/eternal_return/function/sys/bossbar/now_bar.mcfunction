
## 배경 움직임
# 열림
execute if score #now.trigger CT1 matches 1 if score #now.bg CT1 matches ..8 run scoreboard players add #now.bg CT1 1

# 닫힘
execute if score #now.trigger CT1 matches 2 if score #now.bg CT1 matches 2.. run scoreboard players remove #now.bg CT1 1

# 텍스트
execute if score #now.bg CT1 matches ..8 run data modify storage text now_char set value '{"text":""}'
execute if score #now.bg CT1 matches 9 run data modify storage text now_char set value '{"text":"곧 루미아 섬으로 이동합니다."}'