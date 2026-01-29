package org.EternalReturn.ERCharacter.Character;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERPlayer.ERPlayer;

public class NullCharacter extends ERCharacter {
    public NullCharacter(ERPlayer erPlayer) {
        super(erPlayer);
    }

    @Override
    public String getName() {
        return "NullCharacter.";
    }
}

