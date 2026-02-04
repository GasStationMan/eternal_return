package org.EternalReturn.ERCharacter.Character.adriana;

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour;
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent;
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent;

import java.util.Collection;
import java.util.Objects;

public class LitFireOnAttack extends ERCharacterMonobehaviour<CharacterAttackEvent> {

    @Override
    public void start(CharacterAttackEvent event) {
        Objects.requireNonNull(event.victim.getEntity()).setFireTicks(100);
    }

    @Override
    public void update(Collection<MonobehaviourEvent> event) {

    }
}
