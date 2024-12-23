
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