package org.EternalReturn.ERCharacter.Event;

import org.EternalReturn.EREntity.EREntity;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;

public class CharacterRayCastEvent implements CharacterEvent{
    public ArrayList<@NotNull EREntity> hitEntities;
    public CharacterRayCastEvent(ArrayList<@NotNull EREntity> hitEntities){
        this.hitEntities = hitEntities;
    }
}
