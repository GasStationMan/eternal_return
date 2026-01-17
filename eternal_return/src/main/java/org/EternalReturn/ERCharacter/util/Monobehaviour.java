package org.EternalReturn.ERCharacter.util;

import org.EternalReturn.ERCharacter.ERCharacter;
import org.EternalReturn.ERCharacter.Event.CharacterEvent;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public abstract class Monobehaviour<T extends CharacterEvent> {

    protected final Class<T> eventType;
    protected MonobehaviourActor actor = null;

    @SuppressWarnings("unchecked")
    protected Monobehaviour() {
        //Generic의 superClass를 얻어옴 (CharacterEvent)
        Type superType = getClass().getGenericSuperclass();

        //superType을 ParameterizedType으로 캐스팅하여 제네릭 정보를 얻어오기 위한 준비를 함.
        if (!(superType instanceof ParameterizedType pt)) {
            throw new IllegalStateException("Monobehaviour must be directly parameterized");
        }

        //바로 T에 대한 정보를 가져온다.
        this.eventType = (Class<T>) pt.getActualTypeArguments()[0];
    }

    public final Class<T> getEventType() {
        return eventType;
    }

    public final void dispatchEvent(CharacterEvent event) {
        if (!eventType.isInstance(event)) {
            throw new IllegalStateException("Wrong event type: " + event.getClass());
        }
        start(eventType.cast(event));
    }

    public abstract void start(T event);
    public abstract void update();

    protected boolean isNotEnd(long startTime, long durationTicks){
        return System.currentTimeMillis() - startTime < durationTicks * 50;
    }

    public MonobehaviourActor getActor(){
        return this.actor;
    }

    public void setParentNode(MonobehaviourActor actor) {
        this.actor = actor;
    }
}