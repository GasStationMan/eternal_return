
execute as @a[tag=player] at @s : 

    #bool 값
    scoreboard players set #onVehicle ER.sys 0
    execute on vehicle run scoreboard players set #onVehicle ER.sys 1


    if score #onVehicle ER.sys matches 0 if entity @s[tag=rightclick,tag=!rest,nbt={SelectedItem:{id:"minecraft:red_bed",count:1}}] :
        tellraw @s {"text":"휴식 중입니다.","color":"yellow"}
        summon minecraft:interaction ~ ~ ~ {Tags:["rest","this"]}
        ride @s mount @e[type=minecraft:interaction,tag=this,limit=1]
        op  @e[type=minecraft:interaction,tag=this] player_id = @s player_id
        tag @e[type=minecraft:interaction,tag=this] remove this
        tag @s remove rightclick
        tag @s add rest
        scoreboard players set #onVehicle ER.sys 1

    if entity @s[tag=rest] :

        effect give @s regeneration infinite 1 true

        if score #onVehicle ER.sys matches 0 :
            tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
            op #playerID ER.sys = @s player_id
            execute as @e[type=minecraft:interaction] if score @s player_id = #playerID ER.sys run kill @s 
            effect clear @s regeneration
            tag @s remove rightclick
            tag @s remove rest
        
        if entity @s[tag=rightclick,nbt={SelectedItem:{id:"minecraft:red_bed",count:1}}] :
            tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
            execute on vehicle run kill @s
            tp @s ~ ~1 ~

            effect clear @s regeneration
            tag @s remove rightclick
            tag @s remove rest

        #if entity @s[scores={restd=0..}] : 
        #    tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
        #    effect clear @s slowness
        #    effect clear @s regeneration
        #    tag @s remove rest
        #
        #if entity @s[scores={resthit=0..}] : 
        #    tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
        #    effect clear @s slowness
        #    effect clear @s regeneration
        #    tag @s remove rest
        #
        #if entity @s[scores={restj=1..}] : 
        #    tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
        #    effect clear @s slowness
        #    effect clear @s regeneration
        #    tag @s remove rest

        

        scoreboard players reset @a[scores={restd=1..}] restd
        scoreboard players reset @a[scores={resthit=1..}] resthit
        scoreboard players reset @a[scores={restj=1..}] restj
