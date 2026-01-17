package org.EternalReturn.ERCharacter.Event;

public class CharacterStunEvent implements CharacterEvent{

    public long startStunMillies;
    public long duration;

    public CharacterStunEvent(long duration){
        this.startStunMillies = System.currentTimeMillis();
        this.duration = duration;
    }

}
