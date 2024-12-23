tellraw @a {"text":"새로 고침 완료! 제발 제발 F3 + T !!!!!","color":"green"}
forceload add -561 512 -585 536
forceload add -243 485 -243 479


##################### CONFIG ####################

    # 밸런싱을 위해 만든 load 함수

    function eternal_return:config/game
    function eternal_return:config/map
    function eternal_return:config/character

#################################################



## 게임 설정
    # 맵 기본 설정
        function eternal_return:map/init
    # 캐릭터 설정
        function eternal_return:character/init
    # 게임 시간 초기화
        function eternal_return:sys/game/time/start

## 게임 룰
    # 포탈 대기시간 무한
    gamerule playersNetherPortalCreativeDelay 1000000000
    gamerule playersNetherPortalDefaultDelay 1000000000


## 스코어 보드 추가
    # 로딩바
        scoreboard objectives add ptemp dummy
        scoreboard objectives add loading.tick dummy
        scoreboard objectives add loading.pixel dummy
    # 스크린
        scoreboard objectives add Page.slot dummy
        scoreboard objectives add Page.ct dummy
        scoreboard objectives add Page.tick dummy
        scoreboard objectives add Page.sec dummy
        scoreboard objectives add Page.num dummy
        scoreboard objectives add Page.frame dummy
    # 스크롤
        scoreboard objectives add old.scroll.num dummy
        scoreboard objectives add now.scroll.num dummy
    # 나갈 때
        scoreboard objectives add quit minecraft.custom:minecraft.leave_game

    ## 플레이어
        # hp, k/d
        scoreboard objectives add hp health {"text":"♥","color":"red"}
        scoreboard objectives add kill minecraft.killed:minecraft.player
        scoreboard objectives add death deathCount


    # 크레딧
        scoreboard objectives add credit dummy
    # 센터 스코어
        scoreboard objectives add centerbar.tick dummy
        scoreboard objectives add centerbar.sec dummy

    # 정수
        scoreboard objectives add NUM dummy
        # 정수 리스트
            scoreboard players set #1 NUM 1
            scoreboard players set #1000 NUM 1000

    # 금지구역 남은 시간
        scoreboard objectives add bantime dummy
    
    # 쿨타임
        scoreboard objectives add ct1 dummy
        scoreboard objectives add ct2 dummy
        scoreboard objectives add sc dummy


    # 야생동물 관련 스코어보드 생성
        scoreboard objectives add ER.sys dummy
        scoreboard objectives add ER.health dummy
        scoreboard objectives add ER.motionX dummy
        scoreboard objectives add ER.motionY dummy
        scoreboard objectives add ER.motionZ dummy

        scoreboard objectives add ER.cooltime dummy
        scoreboard objectives add df_id dummy

    # 야생동물 체력 및 공격력 및 애니메이션 틱 설정
        # 멧돼지
            scoreboard players set #ER.animal.boar.health ER.sys 37
            scoreboard players set #ER.animal.boar.attack ER.sys 5
            scoreboard players set #ER.animal.boar.cooltime ER.sys 120
            scoreboard players set #ER.animal.boar.skill_effect_tick ER.sys 20
            scoreboard players set #ER.animal.boar.skill_end_tick ER.sys 24
            scoreboard players set #ER.animal.boar.attack_tick_first ER.sys 7
            scoreboard players set #ER.animal.boar.attack_tick_second ER.sys 7
        # 곰
            scoreboard players set #ER.animal.bear.health ER.sys 60
            scoreboard players set #ER.animal.bear.attack ER.sys 6
            scoreboard players set #ER.animal.bear.cooltime ER.sys 120
            scoreboard players set #ER.animal.bear.skill_effect_tick ER.sys 14
            scoreboard players set #ER.animal.bear.skill_end_tick ER.sys 15
            scoreboard players set #ER.animal.bear.attack_tick_first ER.sys 8
            scoreboard players set #ER.animal.bear.attack_tick_second ER.sys 8
        # 늑대
            scoreboard players set #ER.animal.wolf.health ER.sys 25
            scoreboard players set #ER.animal.wolf.attack ER.sys 4
            scoreboard players set #ER.animal.wolf.cooltime ER.sys 120
            scoreboard players set #ER.animal.wolf.skill_effect_tick ER.sys 20
            scoreboard players set #ER.animal.wolf.skill_end_tick ER.sys 30
            scoreboard players set #ER.animal.wolf.attack_tick_first ER.sys 8
            scoreboard players set #ER.animal.wolf.attack_tick_second ER.sys 8
        # 알파
            scoreboard players set #ER.animal.alpha.health ER.sys 150
            scoreboard players set #ER.animal.alpha.attack ER.sys 10
            scoreboard players set #ER.animal.alpha.cooltime ER.sys 120
            scoreboard players set #ER.animal.alpha.skill_effect_tick ER.sys 42
            scoreboard players set #ER.animal.alpha.skill_end_tick ER.sys 65
            scoreboard players set #ER.animal.alpha.attack_tick_first ER.sys 12
            scoreboard players set #ER.animal.alpha.attack_tick_second ER.sys 34

            



    # 하이퍼루프 영역 번호 지정
        scoreboard players set #ER.place.null ER.sys 0
        scoreboard players set #ER.place.beach ER.sys 1
        scoreboard players set #ER.place.gas_station ER.sys 2
        scoreboard players set #ER.place.golmok ER.sys 3
        scoreboard players set #ER.place.yanggung ER.sys 4
        scoreboard players set #ER.place.school ER.sys 5
        scoreboard players set #ER.place.hotel ER.sys 6
        scoreboard players set #ER.place.fire ER.sys 7
        scoreboard players set #ER.place.police ER.sys 8
        scoreboard players set #ER.place.forest ER.sys 9
        scoreboard players set #ER.place.pond ER.sys 10
        scoreboard players set #ER.place.stream ER.sys 11
        scoreboard players set #ER.place.graveyard ER.sys 12
        scoreboard players set #ER.place.hospital ER.sys 13
        scoreboard players set #ER.place.village ER.sys 14
        scoreboard players set #ER.place.cathedral ER.sys 15
        scoreboard players set #ER.place.storage ER.sys 16
        scoreboard players set #ER.place.port ER.sys 17
        scoreboard players set #ER.place.factory ER.sys 18
        scoreboard players set #ER.place.jul ER.sys 19
    
    # 브리핑룸 남은 시간/인원 표기 창
        scoreboard players set #wait.bg ct1 1
        scoreboard players set #wait.bg.tick NUM 1