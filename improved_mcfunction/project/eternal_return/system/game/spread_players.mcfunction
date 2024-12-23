


set #PlaceID ER.placeID 0
execute as @r[tag=wait_bar, tag != getPlaceID] :
    tag @s += getPlaceID
    op @s ER.placeID = #PlaceID ER.placeID
    add #PlaceID ER.placeID 1
    execute if score #PlaceID ER.placeID matches ..17 as @r[tag=wait_bar, tag =! getPlaceID] run function BACK
    
execute as @a[tag=wait_bar, tag =getPlaceID] :
    op #Find_With_This_ID ER.placeID = @s ER.placeID
    tag @s += this
    execute as @e[type = minecraft:marker, tag= zplace] positioned as @s :
        execute store result score #placeMarkerID ER.placeID run data get entity @s data.id
        execute if score #placeMarkerID ER.placeID = #Find_With_This_ID ER.placeID :
            tp @a[tag=this,limit=1] ~ ~ ~
            tag @a[tag=this,tag=getPlaceID] -= getPlaceID
            tag @a[tag=this] -= this


