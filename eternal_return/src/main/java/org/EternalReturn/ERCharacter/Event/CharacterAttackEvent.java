package org.EternalReturn.ERCharacter.Event;

import org.EternalReturn.EREntity.EREntity;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.bukkit.entity.Entity;

public class CharacterAttackEvent implements CharacterEvent{

    public EREntity attacker;
    public EREntity victim;

    public CharacterAttackEvent(EREntity attacker, EREntity victim){
        this.victim = victim;
        this.attacker = attacker;
    }


}
