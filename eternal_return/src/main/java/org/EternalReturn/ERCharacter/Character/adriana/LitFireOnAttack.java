package org.EternalReturn.ERCharacter.Character.adriana;

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour;
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent;
import org.EternalReturn.Util.Monobehaviour.MonobehaviourEvent;

import java.util.List;

public class LitFireOnAttack extends ERCharacterMonobehaviour<CharacterAttackEvent> {

    @Override
    public void start(CharacterAttackEvent event) {
        event.victim.setFireTicks(100);
    }

    @Override
    public void update(List<MonobehaviourEvent> event) {

    }
}
