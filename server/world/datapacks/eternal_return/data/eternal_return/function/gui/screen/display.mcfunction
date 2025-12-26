## 페이지 번호별 함수 실행
# 필요 스코어보드 : Page.num >= 0
# 상위 함수 : function eternal_return:gui/screen/tick

function pdb:get_me

    # 빈 화면 (page.num == -1)

    # 처음 입장 했을 때 (page.num == 0)
        execute if score @s Page.num matches 0 run function eternal_return:gui/screen/display/welcome with storage pdb:main args

    # 캐릭터 선택화면 (page.num == 1..2)
        execute if score @s Page.num matches 1..2 run function eternal_return:gui/screen/display/select_character

    # 캐릭 선택 후
        execute if score @s Page.num matches 3 run function eternal_return:gui/screen/display/selected with storage pdb:main args
