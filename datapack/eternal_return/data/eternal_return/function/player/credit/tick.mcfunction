## 크래딧
# 입출력 : 없음
# 상위 함수 : function eternal_return:player/tick


## 스코어보드 경험치 숫자 연동
    # 플레이어 데이터 불러오기
        function pdb:get_me
    # 크래딧 값 저장하기
        execute store result storage pdb:main in.credit int 1 run scoreboard players get @s credit
    # 레벨 값에 스코어값 저장
        function eternal_return:player/credit/paste_to_level with storage pdb:main in
    # 플레이어 데이터 저장
        function pdb:save_me

