playsound entity.generic.explode player @a ~ ~ ~ 1 0.5
playsound block.amethyst_block.break player @a ~ ~ ~ 2 0.5
particle explosion_emitter ~ ~ ~ 0 0 0 0 1 force
setblock ~ ~ ~ sculk
execute as @a[tag=player,distance=..1.5] at @s run damage @s 10 generic
summon interaction ~ ~ ~ {width:1.1f,height:1.1f,Tags:["meteor","interaction"]}
kill @s