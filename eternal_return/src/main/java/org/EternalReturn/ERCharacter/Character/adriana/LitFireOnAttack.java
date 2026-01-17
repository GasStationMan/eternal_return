package org.EternalReturn.ERCharacter.Character.adriana;

import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent;
import org.EternalReturn.ERCharacter.util.ERMonobehaviour;

public class LitFireOnAttack extends ERMonobehaviour<CharacterAttackEvent> {

    @Override
    public void start(CharacterAttackEvent event) {
        event.victim.setFireTicks(100);
    }

    @Override
    public void update() {

    }
}
