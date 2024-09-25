##> 함수 반복문


##캐릭터
function eternal_return:sys/character/character
#function eternal_return:sys/character/happychaos/main
function eternal_return:sys/character/jackie/main
function eternal_return:sys/character/nicky/main
function eternal_return:sys/character/luke/main
function eternal_return:sys/character/mai/main
function eternal_return:sys/character/shou/main
function eternal_return:sys/character/charlotte/main
function eternal_return:sys/character/aya/main
function eternal_return:sys/character/yohan/main
function eternal_return:sys/character/heart/main
function eternal_return:sys/character/yuki/main
function eternal_return:sys/character/hyunwoo/main
function eternal_return:sys/character/daniel/main
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
    # 플레이어 설정
    execute as @a at @s run function eternal_return:sys/player/main
    # 채팅 클릭 -> 더 이상 필요 없을 것으로 사료됨.
    execute as @a[tag=player] at @s run function eternal_return:sys/trigger/main
    # GUI 화면
    execute as @a if entity @s[tag=player,tag=ER.gui_on] run function eternal_return:sys/gui/main
    # 맵 창 / 키오스크 / 부활 선택창
    execute as @a[tag=player] at @s run function eternal_return:maps/main

    # 보스바
    #   
    #   이곳에서 정의된 tag functions
    #   add_bossbar()
    #   remve_bossbar()
    #   show_bossbar()
    #   hide_bossbar()
    #   clear_bossbar()
    #   
    execute as @a[tag=player] at @s run function eternal_return:sys/bossbar/main
    
    # 액션바
    #   
    #   이곳에서 정의된 tag functions
    #   show_loading()
    #   get_text()
    #   clear_loading()
    #   loading()
    #   pouse_loading() -> loading()과는 배타적
    # 
    execute as @a[tag=player] run function eternal_return:sys/actionbar/main





## 게임 타임라인
function eternal_return:sys/game/main




## 기물
# 맵
function eternal_return:sys/map/main
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