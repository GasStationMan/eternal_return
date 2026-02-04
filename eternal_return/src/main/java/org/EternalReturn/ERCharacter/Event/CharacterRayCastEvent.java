package org.EternalReturn.ERCharacter.Event;

import org.EternalReturn.EREntity.EREntity;

import java.util.ArrayList;

public class CharacterRayCastEvent implements CharacterEvent{
    public ArrayList<EREntity> hitEntities;
    public CharacterRayCastEvent(ArrayList<EREntity> hitEntities){
        this.hitEntities = hitEntities;
    }
}
