package org.EternalReturn.ERCharacter.Debuff;

import org.EternalReturn.ERCharacter.Event.CharacterStunEvent;
import org.EternalReturn.ERCharacter.util.ERMonobehaviour;
import org.bukkit.Location;

public class Stun extends ERMonobehaviour<CharacterStunEvent> {

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
    public void update() {
        if(isNotEnd(startStunMillies,duration)){
            getPlayer().teleport(stunLocation);
        }
    }
}
