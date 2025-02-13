## 플레이어의 스탯
# 상위 함수 : function eternal_return:player/tick
# 입력 : @s pdb:main
# 플레이어의 스탯을 저장하는 함수


# 플레이어 정보 불러오기
function pdb:get_me

# 능력치 가져오기
    # 공격력
    execute store result storage pdb:main in.stats.atk int 1 run attribute @s attack_damage get 1
    # 공격속도
        # 자릿 수별로 저장
            scoreboard players set #10 NUM 10
            execute store result storage pdb:main in.stats.atk_spds int 1 run attribute @s attack_speed get 1
            execute store result score #atk_spd_.1 NUM run attribute @s attack_speed get 100
            scoreboard players add #atk_spd_.1 NUM 1
            scoreboard players operation #atk_spd_.1 NUM /= #10 NUM
            scoreboard players operation #atk_spd_.1 NUM %= #10 NUM
            execute store result storage pdb:main in.stats.atk_spdm int 1 run scoreboard players get #atk_spd_.1 NUM
    # 방어력
        execute store result storage pdb:main in.stats.armor int 1 run attribute @s armor get 1
    # 방어강도
        execute store result storage pdb:main in.stats.armor_tou int 1 run attribute @s armor_toughness get 1
        
# 플레이어 데이터 저장
function pdb:save_me