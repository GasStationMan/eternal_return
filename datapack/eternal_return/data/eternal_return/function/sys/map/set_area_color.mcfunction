# 플레이어 개인 스토리지 <place_text>에 최종 위치 표기 JSON 출력
$data modify storage player_data players[{id:$(id)}].place_text set value '{"text":"$(place)","color":"$(color)"}'