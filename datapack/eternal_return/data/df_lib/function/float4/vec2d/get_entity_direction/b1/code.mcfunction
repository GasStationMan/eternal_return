execute store result score #getDirectionX float run data get entity @s Pos[0] 10000
execute store result score #getDirectionY float run data get entity @s Pos[2] 10000
scoreboard players operation #getDirectionX float -= #thisEntityPosX float
scoreboard players operation #getDirectionY float -= #thisEntityPosY float
