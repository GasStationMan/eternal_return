
score thisHP             is     @s          ER.health
score tempHP             is     #HPTMP      ER.sys
score dmgGet             is     #getDamage  ER.sys
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
entity thisEntity        is     @s

storage HPbar            is     minecraft:temp temp
storage EmptyHPbar       is     minecraft:hp_bar data

function : 
    # 피해량 계산 -> 초기값
    dmgGet = 0
    tempHP = thisEntity nbt Health

    # 히트박스 체력 (가스트) 원상복구 및 피해량 계산
    if tempHP == ..999 :
        dmgGet = 1000
        dmgGet -= tempHP
        thisHP -= dmgGet
        thisEntity nbt Health = 1000

    # 사망 시 0 밑으로 음수 표기 방지
    if thisHP == ..0 on passengers run goto :
        HPbar.HPdata = EmptyHPbar
        thisEntity nbt text = '[{"text":"["},{"text":"0"},{"text":"]\\n"}]'

    # 체력바 표시
    score HP_manage_block is #HP_manage_block ER.sys
    
    function :
        set #HP_manage_block ER.sys 0
        if dmgGet == 1.. run return run \
            set #HP_manage_block ER.sys 1
        
        if isCreatedFirst == 0 run goto :
            HP_manage_block = 1
            isCreatedFirst  = 1

    if HP_manage_block == 1:
        
        FindIDwithThis = ThisID

        execute as Root :
            if FindIDwithThis = @s df_id :
                # 루트 엔티티 찾아서 최대 체력 구하기
                #여기서 thisHP는 Root Entity의 체력을 의미합니다.
                RootHP = thisHP

        # thisHP : 가스트 히트박스 체력
        HPkey = thisHP
        HPkey *= 100
        HPkey /= RootHP

        #storage PRINT is minecraft:print print
        #PRINT.damage = dmgGet
        #function eternal_return:system/print/main with PRINT   

        HPbar.HP = thisHP
        execute on passengers with HPbar :
            $thisEntity nbt text = '[{"text":"["},{"text":"$(HP)"},{"text":"]\\n"}]'
        # free()
        data remove HPbar