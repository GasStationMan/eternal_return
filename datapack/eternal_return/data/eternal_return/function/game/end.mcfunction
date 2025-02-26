## 게임 종료
# 상위 함수 : function eternal_return:game
# 입출력 : 없음

# 게임시작 트리거
    scoreboard players set #game.start NUM 0

# 게임 시간 초기화 
    # 1일차/낮/(저장된 분/초)로 설정
        scoreboard players set #timer.day NUM 1
        scoreboard players set #timer.halfday NUM 1
    # 상단 UI 타이머 가동
        scoreboard players set #timer.trigger NUM 1

# 서버 시간 초기화
    scoreboard players set #gametime.min NUM 0
    scoreboard players set #gametime.sec NUM 0
    scoreboard players set #gametime.tick NUM 0

# 오브젝트 초기화
    function eternal_return:object/box/food/remove
    function eternal_return:object/box/epic/remove
    function eternal_return:object/box/mythic/remove
    function eternal_return:object/box/set_box_marker
    function eternal_return:object/kiosk/remove
    function eternal_return:object/tree_of_life/remove
    function eternal_return:object/cctv/remove
    function eternal_return:object/hyperloop/remove

# 플레이어 설정
    tag @a remove player

# 떨어져 있는 아이템 제거
    kill @e[type=item]
