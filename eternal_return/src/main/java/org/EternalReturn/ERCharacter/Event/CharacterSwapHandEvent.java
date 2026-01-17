package org.EternalReturn.ERCharacter.Event;

import org.EternalReturn.ERPlayer.ERPlayer;

public class CharacterSwapHandEvent implements CharacterEvent{
    public ERPlayer player;
    public CharacterSwapHandEvent(ERPlayer player){
        this.player = player;
    }

}
