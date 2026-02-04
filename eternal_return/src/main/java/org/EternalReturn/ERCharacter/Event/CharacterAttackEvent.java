package org.EternalReturn.ERCharacter.Event;

import org.EternalReturn.EREntity.EREntity;

public class CharacterAttackEvent implements CharacterEvent{

    public EREntity attacker;
    public EREntity victim;

    public CharacterAttackEvent(EREntity attacker, EREntity victim){
        this.victim = victim;
        this.attacker = attacker;
    }


}
