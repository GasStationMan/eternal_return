tag @s add getPlaceID
scoreboard players operation @s ER.placeID = #PlaceID ER.placeID
scoreboard players add #PlaceID ER.placeID 1
execute if score #PlaceID ER.placeID matches ..17 as @r[tag=wait_bar, tag =! getPlaceID] run function eternal_return:system/game/spread_players/b1/code 
