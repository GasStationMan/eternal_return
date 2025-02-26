## 사이드바 생성
# 상위함수 : function eternal_return:player/frist_join
# 입력 : @s pdb:main args
# 출력 : 개인 스코어보드, 팀 생성

# 스코어보드 생성
    $scoreboard objectives add sidebar.$(UUID0) dummy
    $scoreboard objectives modify sidebar.$(UUID0) numberformat blank
    $scoreboard objectives modify sidebar.$(UUID0) displayname ""

# 색깔 배정
    # 배열에서 가져오기
        data modify storage pdb:main in.team set from storage team colors_copy[0]
        data modify storage pdb:main args.color set from storage team colors_copy[0]
        data remove storage team colors_copy[0]
    # 가져온 색깔로 설정
        function eternal_return:gui/sidebar/set_team_color with storage pdb:main args
    # args Free
        data remove storage pdb:main args.color