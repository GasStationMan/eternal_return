##> 함수 반복문
tag @a[tag=!player] add player

##캐릭터
function eternal_return:sys/character/character
function eternal_return:sys/character/happychaos/main
function eternal_return:sys/character/jackie
function eternal_return:sys/character/nicky
function eternal_return:sys/character/luke
function eternal_return:sys/character/mai
function eternal_return:sys/character/shou
function eternal_return:sys/character/charlotte
function eternal_return:sys/character/aya
function eternal_return:sys/character/yohan
function eternal_return:sys/character/heart
function eternal_return:sys/character/yuki/main
function eternal_return:sys/character/hyunwoo/main
function eternal_return:sys/character/daniel
function eternal_return:sys/character/laura/main
function eternal_return:sys/character/lenox/main
function eternal_return:sys/character/vianca/main
function eternal_return:sys/character/sissela/main
function eternal_return:sys/character/silvia/main
function eternal_return:sys/character/isol/main
function eternal_return:sys/character/arda/main
function eternal_return:sys/character/katja/main
function eternal_return:sys/character/estell/main
function eternal_return:sys/character/echion/main
function eternal_return:sys/character/elena/main
function eternal_return:sys/character/camilo/main
function eternal_return:sys/character/lidailin/main
function eternal_return:sys/character/magnus/main
function eternal_return:sys/character/adriana/main

function eternal_return:sys/rest/main
function eternal_return:sys/player/rightclick/carrot_rightclick
function eternal_return:sys/player/rightclick/food_rightclick_cool
function eternal_return:sys/player/damagegive
function eternal_return:sys/player/damagetaken
function eternal_return:sys/player/shift

## 플레이어
execute as @a[tag=player] at @s run function eternal_return:sys/player/main
# 채팅 클릭
execute as @a[tag=player_id] at @s run function eternal_return:sys/trigger/main




## 게임 타임라인
function eternal_return:sys/game/main




## 기물
# 보스바
execute as @a[tag=player] at @s run function eternal_return:sys/bossbar/main
# 부시
function eternal_return:sys/player/bush
# 키오스크
function eternal_return:sys/kiosk/main
# 점프패드
function eternal_return:sys/jumppad/main
# 하이퍼 루프
execute as @a[tag=player] at @s run function eternal_return:sys/hyperloop/main
# 생명의 나무
execute as @a[tag=player] at @s run function eternal_return:sys/tree_of_life/main
# 운석
execute as @a[tag=player] at @s run function eternal_return:sys/meteor/main
# 맵
function eternal_return:sys/map/main
# 액션바
execute as @a[tag=player] run function eternal_return:sys/actionbar/main

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
#function eternal_return:sys/game/noarea
#function eternal_return:sys/game/safearea
#function eternal_return:sys/game/last_area
#function eternal_return:sys/game/daytimer


## CC기
function eternal_return:sys/character/stun/main


## 낮밤 변경
#function eternal_return:sys/game/daycycle