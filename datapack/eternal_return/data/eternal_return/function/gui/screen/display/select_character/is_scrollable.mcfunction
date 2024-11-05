## 캐릭터 선택창 스크롤 변경 가능 확인하기

## 스크롤 변동 번호 구하기
    # 정수 입력
        scoreboard players set #1 NUM 1
        scoreboard players set #5 NUM 5
        scoreboard players set #11 NUM 11
    # 숫자 입력 받기
        scoreboard players operation #input.scroll.Up.distance NUM = @s Page.frame
        scoreboard players operation #input.scroll.down.distance NUM = @s Page.frame
    # 스크롤 위 (n-1)*5
        scoreboard players operation #input.scroll.Up.distance NUM -= #1 NUM
        scoreboard players operation #input.scroll.Up.distance NUM *= #5 NUM
    # 스크롤 아래 5n+11
        scoreboard players operation #input.scroll.down.distance NUM *= #5 NUM
        scoreboard players operation #input.scroll.down.distance NUM += #11 NUM


## 스크롤 변동이 필요한지 확인하기
    # 스크롤을 위로 올릴 때
        execute if score @s Page.slot <= #input.scroll.Up.distance NUM run scoreboard players remove @s Page.frame 1
    # 스크롤을 아래로 내릴 때
        execute if score @s Page.slot >= #input.scroll.down.distance NUM run scoreboard players add @s Page.frame 1


# 페이크 플레이어 삭제
    scoreboard players reset #1 NUM
    scoreboard players reset #5 NUM
    scoreboard players reset #11 NUM
    scoreboard players reset #input.scroll.Up.distance NUM
    scoreboard players reset #input.scroll.down.distance NUM