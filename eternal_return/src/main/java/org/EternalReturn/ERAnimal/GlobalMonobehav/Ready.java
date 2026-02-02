package org.EternalReturn.ERAnimal.GlobalMonobehav;

import org.EternalReturn.ERAnimal.ERAJEntity;
import org.EternalReturn.ERAnimal.ERAnimalMonobehaviour;
import org.EternalReturn.ERAnimal.Event.ERAnimalAttackedByPlayerEvent;
import org.EternalReturn.ERAnimal.Event.ERAnimalReadyEvent;
import org.EternalReturn.EREntity.Event.EREntityDamagedEvent;
import org.EternalReturn.Util.dpengine.behaviour.MonobehaviourEvent;

import java.util.Collection;

public class Ready extends ERAnimalMonobehaviour<ERAnimalReadyEvent> {

    private ERAJEntity ajEntity;

    @Override
    public void start(ERAnimalReadyEvent event) {
        ajEntity = getERAJEntity();
    }

    @Override
    public void update(Collection<MonobehaviourEvent> eventList) {

        for(MonobehaviourEvent event : eventList){

            if(event instanceof ERAnimalAttackedByPlayerEvent){
                ajEntity.stopAnim();
                stopMonobehav();
                return;
            }

            if(event instanceof ERAnimalReadyEvent){
                ajEntity.playAnim("ready");
            }

        }

    }

}
