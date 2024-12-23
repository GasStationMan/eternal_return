
score ThisHP             is     @s          ER.health
score HPtemp             is     #HPTMP      ER.sys
score DMG                is     #getDamage  ER.sys
score ThisID             is     @s          df_id
score HPkey              is     #HPkey      ER.sys
score FindIDwithThis     is     #ID         ER.sys
score RootHP             is     #RootHP     ER.sys
score HPRateWith40       is     #HRWP20     ER.sys
score HPRateWith4        is     #HRWP2      ER.sys
score HPSpliterL         is     #HPSPL      ER.sys
score HPSpliterS         is     #HPSPS      ER.sys
score isCreatedFirst     is     @s          ER.sys


entity Root              is     @e[type=minecraft:husk,tag=ER.animal.root]
entity ThisEntity        is     @s

storage HPbar            is     minecraft:temp temp
storage EmptyHPbar       is     minecraft:hp_bar data

function : 
    # 피해량 계산 -> 초기값
    DMG = 0
    HPtemp = ThisEntity nbt Health

    # 히트박스 체력 (가스트) 원상복구 및 피해량 계산
    if HPtemp == ..999 :
        DMG = 1000
        DMG -= HPtemp
        ThisHP -= DMG
        ThisEntity nbt Health = 1000

    # 사망 시 0 밑으로 음수 표기 방지
    if ThisHP == ..0 on passengers run goto :
        HPbar.HPdata = EmptyHPbar
        ThisEntity nbt text = '[{"text":"["},{"text":"0"},{"text":"]\\n"},{"text":"10"},{"translate":"space.2","font":"minecraft:default"},{"storage":"minecraft:temp","nbt":"temp.HPdata","interpret":true,"font":"minecraft:bar"}]'

    # 체력바 표시
    score HP_manage_block is #HP_manage_block ER.sys
    
    function :
        set #HP_manage_block ER.sys 0
        if DMG == 1.. run return run \
            set #HP_manage_block ER.sys 1
        
        if isCreatedFirst == 0 run goto :
            HP_manage_block = 1
            isCreatedFirst  = 1

    if HP_manage_block == 1:
        
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

        HPRateWith40 = 4000
        HPRateWith40 /= RootHP

        
        HPRateWith4 = 400
        HPRateWith4 /= RootHP


        #storage PRINT is minecraft:print print
        #PRINT.damage = DMG
        #function eternal_return:system/print/main with PRINT   

        HPbar.HP = ThisHP
        execute on passengers with HPbar :
            score i is #i ER.sys

            HPbar.HPdata = ["-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0","-0"]

            storage WHILE is minecraft:temp temp
            i = 0
            WHILE.i = 0
            function with WHILE : 

                $if i >= HPkey run data modify HPbar.HPdata[$(i)] set value "-0"
                    
                if i < HPkey with WHILE:
                    HPSpliterL = i
                    HPSpliterL %= HPRateWith40

                    HPSpliterS = i
                    HPSpliterS %= HPRateWith4

                    $if HPSpliterS matches 0 run data modify HPbar.HPdata[$(i)] set value "-2"

                    $if HPSpliterL matches 0 run data modify HPbar.HPdata[$(i)] set value "-0"
                    
                    $unless HPSpliterS matches 0 run data modify HPbar.HPdata[$(i)] set value "-1"

                i += 1
                WHILE.i = i
                if i matches ..99 run function BACK
            $ThisEntity nbt text = '[{"text":"["},{"text":"$(HP)"},{"text":"]\\n"},{"text":"10"},{"translate":"space.2","font":"minecraft:default"},{"storage":"minecraft:temp","nbt":"temp.HPdata","interpret":true,"font":"minecraft:bar"}]'
        # free()
        data remove HPbar