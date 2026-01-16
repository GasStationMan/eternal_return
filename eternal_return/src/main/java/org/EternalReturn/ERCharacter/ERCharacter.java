package org.EternalReturn.ERCharacter;

import java.util.LinkedList;

public abstract class ERCharacter {

    protected LinkedList<CharacterEvent> submittedEvent = new LinkedList<>();

    public abstract void script();

    public void submitEvent(CharacterEvent event){
        submittedEvent.addLast(event);
    }

    public CharacterEvent consumeEvent(){
        if(submittedEvent.isEmpty()){
            return null;
        }
        return submittedEvent.removeFirst();
    }

}
