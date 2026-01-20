package org.EternalReturn.ERCharacter.Character.adriana;

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour;
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent;
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourEvent;

import java.util.AbstractCollection;
import java.util.Collection;
import java.util.List;

public class LitFireOnAttack extends ERCharacterMonobehaviour<CharacterAttackEvent> {

    @Override
    public void start(CharacterAttackEvent event) {
        event.victim.setFireTicks(100);
    }

    @Override
    public void update(Collection<MonobehaviourEvent> event) {

    }
}
