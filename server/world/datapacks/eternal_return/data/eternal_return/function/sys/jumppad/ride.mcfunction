# 플레이어가 같은 태그를 가진 돼지에게 타기
$execute as @a[tag=$(Tags)] at @s run ride @s mount @e[tag=jumping,tag=$(Tags),limit=1,scores={ct1=0}]