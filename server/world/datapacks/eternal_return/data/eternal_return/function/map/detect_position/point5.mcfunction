## 구역 분할 좌표가 5개인 경우의 태그 및 표기
# 상위 함수 : function eternal_return:map/player/set_tag
# 입력 : (place_name), (point1), (no)
# 출력 : @s pdb:main in.place

# 사용된 구역\
    : 학교

## 함수 구문
    # 플레이어 데이터 가져오기
        function pdb:get_me
    # 입/퇴장 시 태그 설정
        # 구역에 진입 및 태그 부여
            $execute as @a[$(point1)] at @s run tag @s add $(place_name)
            $execute as @a[$(point2)] at @s run tag @s add $(place_name)
            $execute as @a[$(point3)] at @s run tag @s add $(place_name)
            $execute as @a[$(point4)] at @s run tag @s add $(place_name)
            $execute as @a[$(point5)] at @s run tag @s add $(place_name)
        # 구역에사 퇴장 시 태그 제거
            $execute as @a[tag=$(place_name)] unless entity @s[$(point1)] unless entity @s[$(point2)] unless entity @s[$(point3)] unless entity @s[$(point4)] unless entity @s[$(point5)] run tag @s remove $(place_name)
            
    # 플레이어 데이터에 현재 구역 이름 입력
        $execute if entity @s[tag=$(place_name)] run data modify storage pdb:main in.place_no set value $(no)
        $execute if entity @s[tag=$(place_name)] run data modify storage pdb:main in.place set value "$(place_name)"
    # 플레이어 데이터 설정
        function pdb:save_me