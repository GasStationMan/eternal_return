# input : (tick), (type)

# 임시 변수 생성
    scoreboard objectives add temp dummy
    # 스코어 지정
    scoreboard players set #max.score temp 200000

# 입력값 저장
    $scoreboard players set #input.tick temp $(tick)
    $scoreboard players set #input.type temp $(type)

    function pdb:get_me
    $data modify storage pdb:main in.loading_text set value $(text)
    function pdb:save_me


## 인수가 적절하지 않는 경우
    # 이미 로딩바가 재생되고 있는 경우
        execute if entity @s[tag=loading] run \
            return run tellraw @s {"text":"이미 로딩 중입니다.","color":"red"}
    # 틱과 타입을 모두 잘못 입력한 경우
        execute if score #input.tick temp matches ..0 unless score #input.type temp matches 1..2 run \
            return run tellraw @s {"text":"틱과 타입이 올바르지 않습니다.","color":"red"}
    # 로딩 타입이 잘못된 경우
        execute unless score #input.type temp matches 1..2 run \
            return run tellraw @s {"text":"올바른 타입이 아닙니다.","color":"red"}
    # 잘못된 틱을 입력한 경우
        execute if score #input.tick temp matches ..0 run \
            return run tellraw @s {"text":"0 이하의 숫자는 적용할 수 없습니다.","color":"red"}
    # 틱이 200을 초과한 경우
        execute if score #input.tick temp matches 201.. run \
            return run tellraw @s {"text":"틱이 200을 초과하였습니다.","color":"red"}

# 태그 추가
    execute if score #input.type temp matches 1 run tag @s add loading_type1
    execute if score #input.type temp matches 2 run tag @s add loading_type2

# 픽셀 수 계산
    scoreboard players operation #max.score temp /= #input.tick temp

## 로딩 시작
    # 태그 부여 -> gui/loading/tick
        tag @s add loading
    # 로딩 스코어 초기화
        scoreboard players set @s loading.tick 0
    # 로딩 스코어에 틱당 픽셀 수 입력
        scoreboard players operation @s ptemp = #max.score temp

#임시 변수 제거
scoreboard objectives remove temp