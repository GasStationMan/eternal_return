
score ThisHP             is     @s          ER.health
score HPtemp             is     #HPTMP      ER.sys
score DMG                is     #getDamage  ER.sys
score ThisID             is     @s          df_id
#score isHPcalculated     is     @s          ER.sys
score HPkey              is     #HPkey      ER.sys
score FindIDwithThis     is     #ID         ER.sys
score RootHP             is     #RootHP     ER.sys
score HPRateWith20       is     #HRWP20     ER.sys
score HPRateWith2        is     #HRWP2      ER.sys
score HPSpliterL         is     #HPSPL      ER.sys
score HPSpliterS         is     #HPSPS      ER.sys

entity Root              is     @e[type=minecraft:zombie,tag=ER.animal.root]
entity ThisEntity        is     @s

storage HPbar            is     minecraft:temp temp


function : 
    #> 피해량 계산
    execute store result HPtemp run data get entity @s Health


    #> 히트박스 체력 (가스트) 원상복구 및 피해량 계산
    if HPtemp matches ..999 :
        DMG = 1000
        DMG -= HPtemp
        ThisHP -= DMG
        ThisEntity nbt Health = 1000

    #> 사망 시 0 밑으로 음수 표기 방지
    if ThisHP matches ..0 on passengers run goto :
        data modify entity @s text set value '[{"text":"["},{"text":"0"},{"text":"]"}]'

    if ThisHP matches 1.. if DMG matches 1..:
        
        FindIDwithThis = ThisID

        execute as Root :
            if FindIDwithThis = @s df_id :
                # 루트 엔티티 찾아서 최대 체력 구하기
                #여기서 ThisHP는 Root Entity의 체력을 의미합니다.
                RootHP = ThisHP

        # ThisHP : 가스트 히트박스 체력
        HPkey = ThisHP
        HPkey *= 100
        HPkey /= RootHP

        HPRateWith20 = 2000
        HPRateWith20 /= RootHP

        
        HPRateWith2 = 200
        HPRateWith2 /= RootHP

        HPbar.HP = ThisHP
        execute on passengers run function with HPbar :
            score i is #i ER.sys

            HPbar.HPdata = ["-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0"]

            #storage PRINT is minecraft:print print
            #score arrlen is #arrlen ER.sys
            #arrlen = HPbar.HPdata
            #PRINT.arrlen = arrlen
            #function eternal_return:system/print/main with PRINT        
            

            i = 0
            storage WHILE is minecraft:temp temp
            function with WHILE : 

                if i >= HPkey with WHILE:
                    $HPbar.HPdata[$(i)] = "-0"
                    
                if i < HPkey :
                    HPSpliterL = i
                    HPSpliterL %= HPRateWith20

                    HPSpliterS = i
                    HPSpliterS %= HPRateWith2

                    if HPSpliterS matches 0 with WHILE :
                        HPbar.HPdata[$(i)] = "-2"

                    if HPSpliterL matches 0 with WHILE :
                        HPbar.HPdata[$(i)] = "-0"
                    
                    unless HPSpliterS matches 0 with WHILE :
                        HPbar.HPdata[$(i)] = "-1"

                i += 1
                WHILE.i = i
                if i matches ..99 run return run function BACK

            $ThisEntity nbt text = '[{"text":"["},{"text":"$(HP)"},{"text":"]\\n"},{"text":"10"},{"translate":"space.2","font":"minecraft:default"},{"storage":"minecraft:temp","nbt":"temp.HPdata","interpret":true,"font":"minecraft:bar"}]'


data remove HPbar