package org.EternalReturn.ERAnimal.GlobalMonobehav;

import org.EternalReturn.ERAnimal.ERAJEntity;
import org.EternalReturn.ERAnimal.ERAnimalMonobehaviour;
import org.EternalReturn.ERAnimal.Event.ERAnimalAttackedByPlayerEvent;
import org.EternalReturn.ERAnimal.Event.ERAnimalReadyEvent;
import org.EternalReturn.Util.Monobehaviour.MonobehaviourEvent;

import java.util.List;

public class Ready extends ERAnimalMonobehaviour<ERAnimalReadyEvent> {

    private ERAJEntity ajEntity;

    @Override
    public void start(ERAnimalReadyEvent event) {
        ajEntity = getERAJEntity();
    }

    @Override
    public void update(List<MonobehaviourEvent> eventList) {

        for(MonobehaviourEvent event : eventList){

            if(event instanceof ERAnimalAttackedByPlayerEvent){
                ajEntity.stopAnim();
                stopMonobehav();
            }

            if(event instanceof ERAnimalReadyEvent){
                ajEntity.playAnim("ready");
            }

        }

    }

}
