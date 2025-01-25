## CCTV 활성화
# 상위 함수 : function eternal_return:object/cctv/tick
# 입출력 : 없음

# 쿨타임 텍스트 디스플레이 소환
    execute if entity @s[tag=!cooltime] positioned ~ ~3 ~ run function eternal_return:object/cctv/cooltime/summon {sec:10}
    
# 태그
    # CCTV
        tag @s add cooltime
        tag @s add active_cctv
    # 플레이어 로딩 후 태그 제거
        tag @a[tag=done_loading,distance=..3] remove done_loading