package org.EternalReturn.ERCharacter.Character;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour;
import org.EternalReturn.ERCharacter.Event.CharacterLeftClickEvent;
import org.EternalReturn.ERCharacter.Event.CharacterSwapHandEvent;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourEvent;

import java.util.Collection;

public class NullCharacter extends ERCharacter {
    public NullCharacter(ERPlayer erPlayer) {
        super(erPlayer);
    }

    @Override
    public String getName() {
        return "NullCharacter.";
    }
}

