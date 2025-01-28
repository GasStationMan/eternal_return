## CCTV 제거
# 상위 함수 : function eternal_return:object/cctv/set
# 입출력 : 없음

# 블럭 제거
    execute as @e[type=armor_stand,tag=cctv,tag=model] at @s run fill ^ ^ ^ ^1 ^3 ^ air
# 모델, 인터렉션 제거
    kill @e[tag=cctv]
    kill @e[tag=cool]