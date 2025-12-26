## 화면 가운데 표시되는 검은 바
# 입력 값 : @s pdb:main / text, sec
# 상위 함수 : 없음

# 파라미터
    $scoreboard players set @s centerbar.sec $(sec)
    # 예외처리
        execute if score @s centerbar.sec matches ..0 run return run tellraw @s {"text":"양수를 입력하십시오","color":"red"}

# 플레이어 데이터 불러오기
    function pdb:get_me
    # 텍스트
        $data modify storage pdb:main in.cb.text set value $(text)
    # ui 표기
        function eternal_return:gui/bossbar/display/ui/center_bar with storage pdb:main args

# 입력한 데이터 저장하기
    function pdb:save_me
