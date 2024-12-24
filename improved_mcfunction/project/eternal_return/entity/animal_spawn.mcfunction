
#> function eternal_return:entity/animal_spawn

storage animalList  is minecraft:temp temp.animal
storage coolTemp    is minecraft:temp temp

score  lenOfList       is @s ER.sys
score  rootEntityID    is #rootEntityID ER.sys
score  isExist         is #isExist ER.sys

score  summonCool      is @s[type=minecraft:marker] ER.cooltime

score  MaxHP           is #this.MaxHP ER.health

entity rootEntity      is @e[type=minecraft:husk,tag=ER.animal.root] 
entity modelEntity     is @e[type=minecraft:item_display,tag=ER.animal.model]
entity hitboxEntity    is @e[type=minecraft:ghast,tag=ER.animal.hitbox]
entity thisEntity      is @s


animalList = thisEntity nbt data.animal
#lenOfList  = thisEntity nbt data.animal

execute positioned as @s if entity @p[distance=..40] : 
    #>marker 대상으로 실행

    
    if lenOfList == 1.. run goto :

        # 다음 배열 요소를 탐색하기 위해 맨 앞 요소를 맨 뒤로 이동
        if lenOfList == 2.. :
            data modify animalList append from animalList[0]
            data remove animalList[0]

        # 배열의 top의 id 값 대입
        rootEntityID = animalList[0].id
        
        ## find animal root
        isExist = 0
        #기준 : 텍스트 디스플레이 (방향정보 갖고 있음)
        execute on vehicle at @s as rootEntity if score @s df_id = rootEntityID :
            isExist = 1
            # ER.animal.root ER.animal.hitbox 에 this 추가
            execute as hitboxEntity if score @s df_id = rootEntityID run\
                tag @s add this
            
            # #this.MaxHP ER.health : 야생동물들 위치 재조정 후 체력 초기화 용도
            op  #this.MaxHP ER.health = @s ER.health

            #-------------------------- 원래 위치로 복귀 -------------------------- #

            execute if entity @s[tag= ER.animal.bear, distance= 20..] run goto :
                data modify entity @s NoAI set value 1b
                op @e[tag= this, tag= ER.animal.hitbox] ER.health = #this.MaxHP ER.health

                execute on passengers as @e[tag= ER.animal.model] :
                    function animated_java:animal_bear/animations/attack/stop
                    function animated_java:animal_bear/animations/move/stop
                    thisEntity nbt Rotation[0] = animalList[0].Rot[0]
                thisEntity nbt Pos = animalList[0].Pos
                set @s ER.cooltime 400

            execute if entity @s[tag= ER.animal.boar, distance= 20..] run goto :
                data modify entity @s NoAI set value 1b
                op @e[tag= this, tag= ER.animal.hitbox] ER.health = #this.MaxHP ER.health

                execute on passengers as @e[tag= ER.animal.model] :
                    function animated_java:animal_boar/animations/attack/stop
                    function animated_java:animal_boar/animations/move/stop
                    thisEntity nbt Rotation[0] = animalList[0].Rot[0]
                thisEntity nbt Pos = animalList[0].Pos
                set @s ER.cooltime 400

            execute if entity @s[tag= ER.animal.wolf, distance= 20..] run goto :
                data modify entity @s NoAI set value 1b
                op @e[tag= this, tag= ER.animal.hitbox] ER.health = #this.MaxHP ER.health
                execute on passengers as @e[tag= ER.animal.model] :
                    function animated_java:animal_wolf/animations/attack/stop
                    function animated_java:animal_wolf/animations/move/stop
                    thisEntity nbt Rotation[0] = animalList[0].Rot[0]
                thisEntity nbt Pos = animalList[0].Pos
                set @s ER.cooltime 400
            
            execute if entity @s[tag= ER.animal.alpha, distance= 20..] run goto :
                data modify entity @s NoAI set value 1b
                op @e[tag= this, tag= ER.animal.hitbox] ER.health = #this.MaxHP ER.health
                execute on passengers as @e[tag= ER.animal.model] :
                    function animated_java:animal_alpha/animations/attack/stop
                    function animated_java:animal_alpha/animations/move/stop
                    thisEntity nbt Rotation[0] = animalList[0].Rot[0]
                thisEntity nbt Pos = animalList[0].Pos
                set @s ER.cooltime 400

    # 엔티티가 없다면 -> 제거
        if isExist == 0 :
            data remove animalList[0]
            lenOfList -= 1
            

    tag @e[tag=this] remove this




    
    #>쿨타임 다 돌면 + 야생동물 배열 길이가 0이라면 + 플레이어가 근처에 있으면 -> 소환

    if summonCool == ..0 if lenOfList == 0 :
        # 멧돼지
        if entity @s[tag=ER.spawn.animal.boar] if entity @p[distance=0..20] at @s run goto :
            #title @a actionbar [{"text":"HERE"}]
            function eternal_return:entity/animal/boar/summon/main {dx:  0 ,   dy: -3,  dz: 0 }
            summonCool = 6000
            execute on vehicle run data modify entity @s text set value '[{"text":""}]'
            lenOfList = 1

        # 곰
        if entity @s[tag=ER.spawn.animal.bear] if entity @p[distance=0..20] at @s run goto :
            function eternal_return:entity/animal/bear/summon/main {dx:  0 ,   dy: -3,  dz:  0 }
            summonCool = 6000
            execute on vehicle run data modify entity @s text set value '[{"text":""}]'
            lenOfList = 1

        # 늑대
        if entity @s[tag=ER.spawn.animal.wolf] if entity @p[distance=0..20] at @s run goto :
            function eternal_return:entity/animal/wolf/summon/main {dx:  0 ,   dy: -3,  dz: 0 }
            summonCool = 6000
            execute on vehicle run data modify entity @s text set value '[{"text":""}]'
            lenOfList = 1

        #알파
        if entity @s[tag=ER.spawn.animal.alpha] if entity @p[distance=0..20] at @s run goto :
            function eternal_return:entity/animal/alpha/summon/main {dx: 0 ,   dy: -3,  dz:  0 }
            summonCool = 6000
            execute on vehicle run data modify entity @s text set value '[{"text":""}]'
            lenOfList = 1

#쿨타임 계산  
if summonCool == 1.. if lenOfList == ..0 :
    
    score cooltimeTemp is #tmp ER.sys
    
    cooltimeTemp = summonCool
    cooltimeTemp /= 20
    coolTemp.cooltime = cooltimeTemp

    # Cool.cooltime = summonCool / 20
    execute on vehicle with coolTemp :
        $data modify entity @s text set value '[{"text":"$(cooltime)"}]'
    
    summonCool -= 1

    #> 쿨타임 표시기 설정
    

#title @a actionbar [{"text":"nbt = "},{"nbt":"temp","storage":"minecraft:temp"}]



#> 소환 전용 엔티티에게 데이터 입력
thisEntity nbt data.animal = animalList

#set #bool    ER.sys  0
data remove storage minecraft:temp temp

