package org.EternalReturn.ERCharacter.GlobalMonobehav;

import org.EternalReturn.ERCharacter.Event.CharacterStunEvent;
import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour;
import org.EternalReturn.Util.Monobehaviour.MonobehaviourEvent;
import org.bukkit.Location;

import java.util.List;

public class Stun extends ERCharacterMonobehaviour<CharacterStunEvent> {

    private long startStunMillies;
    private long duration;
    private Location stunLocation;

    @Override
    public void start(CharacterStunEvent event) {
        startStunMillies = event.startStunMillies;
        duration = event.duration;
        stunLocation = getPlayer().getLocation();
    }

    @Override
    public void update(List<MonobehaviourEvent> event) {
        if(isNotEnd(startStunMillies,duration)){
            getPlayer().teleport(stunLocation);
        }
    }
}
