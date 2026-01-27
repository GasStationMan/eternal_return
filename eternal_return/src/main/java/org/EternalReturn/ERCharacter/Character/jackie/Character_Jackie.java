package org.EternalReturn.ERCharacter.Character.jackie;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERPlayer.ERPlayer;

public class Character_Jackie extends ERCharacter {
    public Character_Jackie(ERPlayer erPlayer) {
        super(erPlayer);
        registerMonobehaviour(new Passive());
    }

    @Override
    public String getName() {
        return "Jackie";
    }
}
