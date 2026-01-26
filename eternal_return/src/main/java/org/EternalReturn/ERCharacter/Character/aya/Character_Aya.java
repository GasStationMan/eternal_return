package org.EternalReturn.ERCharacter.Character.aya;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERPlayer.ERPlayer;

public class Character_Aya extends ERCharacter {
    public Character_Aya(ERPlayer player) {
        super(player);
        this.cooldownSeconds = 1;
    }

    @Override
    public String getName() {
        return "Aya";
    }

}