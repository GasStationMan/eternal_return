
#> function eternal_return:entity/animal_spawn

storage ANIMAL is minecraft:temp temp.animal
storage Cool   is minecraft:temp temp

score  LenOfARR             is @s ER.sys
score  ANIMALArrayTopRootID is #this.id ER.sys
score  ThisID               is @s df_id

score Cooltime_To_Summon    is @s[type=minecraft:marker] ER.cooltime

score  MaxHP                is #this.MaxHP ER.health

entity Root_Entity          is @e[type=minecraft:zombie,tag=ER.animal.root] 
entity Model_Entity         is @e[type=minecraft:zombie,tag=ER.animal.model]
entity HitBox_Entity        is @e[type=minecraft:ghast ,tag=ER.animal.hitbox]
entity ThisEntity           is @s


ANIMAL = ThisEntity nbt data.animal

function : 
    #animal 배열에 아무 요소도 없는 경우 : HasNoID 1로
    if LenOfARR matches 0   :
        set #HasNoID ER.sys 1
    
    if LenOfARR matches 1.. :
        set #HasNoID ER.sys 0

        if LenOfARR matches 2.. :
            data modify ANIMAL append from ANIMAL[0]
            data remove ANIMAL[0]

        # 배열의 top의 id 값 대입
        ANIMALArrayTopRootID = ANIMAL[0].id
        
        # find animal root 
        set #isExist ER.sys 0
        execute at @s as Root_Entity if ThisID = ANIMALArrayTopRootID :
            set #isExist ER.sys 1
            # ER.animal.root ER.animal.hitbox 에 this 추가
            execute as HitBox_Entity if ThisID = ANIMALArrayTopRootID run tag @s += this
            op  #this.MaxHP ER.health = @s ER.health


            execute if entity @s[tag= ER.animal.bear, distance= 20..] run goto :
                data modify entity @s NoAI set value 1b
                op @e[tag= this, tag= ER.animal.hitbox] ER.health = #this.MaxHP ER.health
                execute on passengers as @e[tag= ER.animal.model] :
                    if entity @s[tag= aj.animal_bear.animation.attack] run function animated_java:animal_bear/animations/attack/stop
                    if entity @s[tag= aj.animal_bear.animation.move  ] run function animated_java:animal_bear/animations/move/stop
                data modify entity @s Pos set from ANIMAL[0].Pos
                ThisEntity score ER.cooltime = 400

            execute if entity @s[tag= ER.animal.boar, distance= 20..] run goto :
                data modify entity @s NoAI set value 1b
                op @e[tag= this, tag= ER.animal.hitbox] ER.health = #this.MaxHP ER.health
                execute on passengers as @e[tag= ER.animal.model] :
                    if entity @s[tag= aj.animal_boar.animation.attack] run function animated_java:animal_boar/animations/attack/stop
                    if entity @s[tag= aj.animal_boar.animation.move  ] run function animated_java:animal_boar/animations/move/stop
                    tp @s ~ ~ ~ ~ 0
                data modify entity @s Pos set from ANIMAL[0].Pos
                ThisEntity score ER.cooltime = 80

            execute if entity @s[tag= ER.animal.wolf, distance= 20..] run goto :
                data modify entity @s NoAI set value 1b
                op @e[tag= this, tag= ER.animal.hitbox] ER.health = #this.MaxHP ER.health
                execute on passengers as @e[tag= ER.animal.model] :
                    if entity @s[tag= aj.animal_wolf.animation.attack] run function animated_java:animal_wolf/animations/attack/stop
                    if entity @s[tag= aj.animal_wolf.animation.move  ] run function animated_java:animal_wolf/animations/move/stop
                data modify entity @s Pos set from ANIMAL[0].Pos
                ThisEntity score ER.cooltime = 400
            
            execute if entity @s[tag= ER.animal.alpha, distance= 20..] run goto :
                data modify entity @s NoAI set value 1b
                op @e[tag= this, tag= ER.animal.hitbox] ER.health = #this.MaxHP ER.health
                execute on passengers as @e[tag= ER.animal.model] :
                    if entity @s[tag= aj.animal_alpha.animation.attack] run function animated_java:animal_alpha/animations/attack/stop
                    if entity @s[tag= aj.animal_alpha.animation.move  ] run function animated_java:animal_alpha/animations/move/stop
                data modify entity @s Pos set from ANIMAL[0].Pos
                ThisEntity score ER.cooltime = 400

        
        # 엔티티가 없다면 -> 제거
        if score #isExist ER.sys matches 0 :
            data remove ANIMAL[0]
            LenOfARR -= 1

        tag @e[tag=this] remove this




    
    #>쿨타임 다 돌면 + 모두 사망하면 + 플레이어가 근처에 있으면 + 소환
    # 맷돼지

    if Cooltime_To_Summon matches ..0 :
        if score #HasNoID ER.sys matches 1 if entity @p[distance=0..20] at @s[tag=ER.spawn.animal.boar] :
            #title @a actionbar [{"text":"HERE"}]
            function eternal_return:entity/animal/boar/summon/main {dx:  3 ,   dy: -3,  dz: 0 }
            function eternal_return:entity/animal/boar/summon/main {dx: -3 ,   dy: -3,  dz: 0 }
            LenOfARR = 2
            Cooltime_To_Summon = 1200

        # 곰
        if score #HasNoID ER.sys matches 1 if entity @p[distance=0..20] at @s[tag=ER.spawn.animal.bear] :
            function eternal_return:entity/animal/bear/summon/main {dx:  0 ,   dy: -3,  dz:  0 }
            LenOfARR = 1
            Cooltime_To_Summon = 1200

        # 늑대
        if score #HasNoID ER.sys matches 1 if entity @p[distance=0..20] at @s[tag=ER.spawn.animal.wolf] :
            function eternal_return:entity/animal/wolf/summon/main {dx:  3 ,   dy: -3,  dz: 0 }
            function eternal_return:entity/animal/wolf/summon/main {dx: -3 ,   dy: -3,  dz: 0 }
            LenOfARR = 2
            Cooltime_To_Summon = 1200

        #알파
        if score #HasNoID ER.sys matches 1 if entity @p[distance=0..20] at @s[tag=ER.spawn.animal.alpha] :
            function eternal_return:entity/animal/alpha/summon/main {dx: 0 ,   dy: -3,  dz:  0 }
            LenOfARR = 1
            Cooltime_To_Summon = 1200
        
    if Cooltime_To_Summon matches 1.. if score #HasNoID ER.sys matches 1 :
        score temp is #tmp ER.sys
        temp = Cooltime_To_Summon
        temp /= 20
        Cool.cooltime = temp

        execute on vehicle with Cool :
            $ThisEntity nbt text = '[{"text":"$(cooltime)"}]'
        
        Cooltime_To_Summon -= 1


    #> 쿨타임 표시기 설정
    




#> 소환 전용 엔티티에게 데이터 입력
ThisEntity nbt data.animal = ANIMAL

set #HasNoID ER.sys  0
set #bool    ER.sys  0
data remove storage minecraft:temp temp

