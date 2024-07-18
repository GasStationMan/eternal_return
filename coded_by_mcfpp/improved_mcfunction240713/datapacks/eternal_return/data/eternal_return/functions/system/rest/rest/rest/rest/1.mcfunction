tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
execute on vehicle run kill @s
tp @s ~ ~1 ~
effect clear @s regeneration
tag @s remove rightclick
tag @s remove rest
