# 배열 데이터 바꾸기
    $execute store result score #input.temp NUM run data get storage pdb:main in.character_array[$(length)][$(width)]
    scoreboard players operation #input.temp NUM -= #500 NUM
    $execute store result storage pdb:main in.character_array[$(length)][$(width)] int 1 run scoreboard players get #input.temp NUM