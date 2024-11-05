#
#   필요 스코어보드 : Page.num >= 0
#   

## 페이지별 함수 실행
    
    # 빈 화면 : Page.num matches -1
    # 처음 입장 했을 때
        execute if score @s Page.num matches 0 run function eternal_return:gui/screen/display/welcome with storage pdb:main args

    # 캐릭터 선택화면
        execute if score @s Page.num matches 1 run function eternal_return:gui/screen/display/select_character with storage pdb:main args

    # 대기실 입장 전 로딩화면
        execute if score @s Page.num matches 2 run function eternal_return:gui/screen/display/2 with storage pdb:main args