function pdb:get_me
data modify storage test credit set from storage pdb:main in.credit


execute on attacker run function pdb:get_me
data modify storage pdb:main in.copy_credit set from storage test credit
data remove storage test credit
execute on attacker run function pdb:save_me