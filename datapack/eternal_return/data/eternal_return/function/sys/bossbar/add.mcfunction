# 보스바 생성
$bossbar add line1.id$(id) ""
$bossbar add line2.id$(id) ""
$bossbar add line3.id$(id) ""
$bossbar add line4.id$(id) ""

# 보스바 투명 텍스쳐로 변경
$bossbar set line1.id$(id) color blue
$bossbar set line2.id$(id) color blue
$bossbar set line3.id$(id) color blue
$bossbar set line4.id$(id) color blue

# 플레이어에게 표시하기
$bossbar set line1.id$(id) players @s
$bossbar set line2.id$(id) players @s
$bossbar set line3.id$(id) players @s
$bossbar set line4.id$(id) players @s