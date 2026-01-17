package org.EternalReturn.ERCharacter.Event;

import org.EternalReturn.ERPlayer.ERPlayer;
import org.bukkit.entity.Entity;

public class CharacterAttackEvent implements CharacterEvent{

    public ERPlayer attacker;
    public Entity victim;

    public CharacterAttackEvent(ERPlayer attacker, Entity victim){
        this.victim = victim;
        this.attacker = attacker;
    }


}
