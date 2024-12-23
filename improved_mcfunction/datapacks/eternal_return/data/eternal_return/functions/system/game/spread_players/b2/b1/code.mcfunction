execute store result score #placeMarkerID ER.placeID run data get entity @s data.id
execute if score #placeMarkerID ER.placeID = #Find_With_This_ID ER.placeID run function eternal_return:system/game/spread_players/b2/b1/b1/code
