## 구역 분할 좌표가 1개인 경우의 태그 및 표기
# 상위 함수 : function eternal_return:map/player/set_tag
# 입력 : (place_name), (point1), (no)
# 출력 : @s pdb:main in.place

# 사용된 구역\
    : 브리핑 룸

## 함수 구문
    # 플레이어 데이터 가져오기
        function pdb:get_me
    # 입/퇴장 시 태그 설정
        # 구역에 진입 및 태그 부여
            $tag @s[$(point1)] add $(place_name)

        # 구역에서 퇴장 시 태그 제거
            $execute unless entity @s[tag=$(place_name),$(point1)] run tag @s remove $(place_name)

    # 플레이어 데이터에 현재 구역 이름 입력
        $execute if entity @s[tag=$(place_name)] run data modify storage pdb:main in.place_no set value $(no)
        $execute if entity @s[tag=$(place_name)] run data modify storage pdb:main in.place set value "$(place_name)"
    # 플레이어 데이터 설정
        function pdb:save_me