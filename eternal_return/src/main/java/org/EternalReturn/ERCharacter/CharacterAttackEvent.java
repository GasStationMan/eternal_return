package org.EternalReturn.ERCharacter;

import org.bukkit.entity.Entity;

public class CharacterAttackEvent implements CharacterEvent{

    public Entity victim;
    public Entity attacker;

    public CharacterAttackEvent(Entity victim, Entity attacker){
        this.victim = victim;
        this.attacker = attacker;
    }


}
