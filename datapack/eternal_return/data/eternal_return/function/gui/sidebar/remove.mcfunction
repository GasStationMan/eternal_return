## 사이드바 제거
# 상위함수 : function eternal_return:player/frist_join
# 입력 : @s pdb:main args
# 출력 : 사이드바, 팀 제거

# 팀 제거
    $team remove $(UUID0)

# 스코어보드 제거
    $scoreboard objectives remove sidebar.$(UUID0)

# 팀 데이터 제거
    # 배열에서 가져오기
        data remove storage pdb:main in.team