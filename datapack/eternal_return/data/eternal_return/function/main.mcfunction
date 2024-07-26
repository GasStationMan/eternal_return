##> 함수 반복문
tag @a[tag=!player] add player

##캐릭터
function eternal_return:system/character/character
function eternal_return:system/character/happychaos/main
function eternal_return:system/character/jackie
function eternal_return:system/character/nicky
function eternal_return:system/character/luke
function eternal_return:system/character/mai
function eternal_return:system/character/shou
function eternal_return:system/character/charlotte
function eternal_return:system/character/aya
function eternal_return:system/character/yohan
function eternal_return:system/character/heart
function eternal_return:system/character/yuki/main
function eternal_return:system/character/hyunwoo/main
function eternal_return:system/character/daniel
function eternal_return:system/character/laura/main
function eternal_return:system/character/lenox/main
function eternal_return:system/character/vianca/main
function eternal_return:system/character/sissela/main
function eternal_return:system/character/silvia/main
function eternal_return:system/character/isol/main
function eternal_return:system/character/arda/main
function eternal_return:system/character/katja/main
function eternal_return:system/character/estell/main
function eternal_return:system/character/echion/main
function eternal_return:system/character/elena/main
function eternal_return:system/character/camilo/main
function eternal_return:system/character/lidailin/main
function eternal_return:system/character/magnus/main
function eternal_return:system/character/adriana/main

function eternal_return:system/rest/main
function eternal_return:system/player/rightclick/carrot_rightclick
function eternal_return:system/player/rightclick/food_rightclick_cool
function eternal_return:system/player/damagegive
function eternal_return:system/player/damagetaken
function eternal_return:system/player/shift

## 플레이어
execute as @a[tag=player] at @s run function eternal_return:system/player/main
# 채팅 클릭
execute as @a[tag=player_id] at @s run function eternal_return:system/trigger/main




## 게임 타임라인
function eternal_return:system/game/main




## 기물
# 보스바
execute as @a[tag=player] at @s run function eternal_return:system/bossbar/main
# 부시
function eternal_return:system/player/bush
# 키오스크
function eternal_return:system/kiosk/main
# 점프패드
function eternal_return:system/jumppad/main
# 하이퍼 루프
execute as @a[tag=player] at @s run function eternal_return:system/hyperloop/main
# 생명의 나무
execute as @a[tag=player] at @s run function eternal_return:system/tree_of_life/main
# 운석
execute as @a[tag=player] at @s run function eternal_return:system/meteor/main
# 맵
function eternal_return:system/map/main
# 액션바
execute as @a[tag=player] run function eternal_return:system/actionbar/main

# 맵 창/ 키오스크/ 부활 선택창
execute as @a[tag=player] at @s run function eternal_return:maps/main

# 야생동물 업데이트
execute as @e[type=!player,tag=ER] run function eternal_return:entity/main/main

# 벽뚫화살 업데이트
execute as @e[type= minecraft:arrow] at @s run function eternal_return:entity/arrow_pen/main

# 플레이어 야생동물 에딧 모드 진입
#execute as @a[gamemode= creative] at @s run function eternal_return:entity/animal_spawn/

##> 디버그
function eternal_return:debug

## 이전 버전 데이터팩 함수 루프
#function eternal_return:system/game/noarea
#function eternal_return:system/game/safearea
#function eternal_return:system/game/last_area
#function eternal_return:system/game/daytimer


## CC기
function eternal_return:system/character/stun/main


## 낮밤 변경
#function eternal_return:system/game/daycycle