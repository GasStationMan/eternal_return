## 플레이어 위치 고정
# 상위 함수 : function eternal_return:player/tick
# 입력 : tag freeze, unfreeze 
# 플레이어의 서 있는 곳에 고정하는 함수


# 위치 고정
    # 플레이어 주변에 마커가 없는 경우 마커소환
    execute if entity @s[tag=freeze] unless entity @e[tag=frz,type=marker,distance=..1,sort=nearest,limit=1] run summon marker ~ ~ ~ {NoGravity:1b,Silent:1b,Tags:["frz"]}
    # 플레이어를 마커에 고정시키기
    execute if entity @s[tag=freeze] run tp @e[tag=frz,type=marker,distance=..1,sort=nearest,limit=1]

# 고정 풀기
    execute if entity @s[tag=unfreeze,tag=freeze] run kill @e[tag=frz,type=marker,distance=..1,sort=nearest,limit=1]

# 태그 제거
    tag @s[tag=unfreeze,tag=freeze] remove freeze
    tag @s[tag=unfreeze] remove unfreeze