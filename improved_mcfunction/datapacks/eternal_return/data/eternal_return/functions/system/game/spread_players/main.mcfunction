scoreboard players set #PlaceID ER.placeID 0
execute as @r[tag=wait_bar, tag != getPlaceID] run function eternal_return:system/game/spread_players/b1/code
execute as @a[tag=wait_bar, tag =getPlaceID] run function eternal_return:system/game/spread_players/b2/code
