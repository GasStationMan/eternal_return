## 사이드바 생성
# 상위함수 : function eternal_return:player/frist_join
# 입력 : @s pdb:main args
# 출력 : 팀 색깔 및 스코어보드 사이드바 색상 변경


# 팀 색깔 변경
    $team modify $(UUID0) color $(color)
# 스코어보드 사이드바 팀 전용표기
    $scoreboard objectives setdisplay sidebar.team.$(color) sidebar.$(UUID0)