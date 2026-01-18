package org.EternalReturn.Util.Monobehaviour;


import org.EternalReturn.System.DPEngine;
import org.EternalReturn.Util.physics.Geometry.PhysicsEngine;
import org.jetbrains.annotations.NotNull;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

public abstract class Monobehaviour<T extends MonobehaviourEvent> {

    protected final Class<T> eventType;
    protected MonobehaviourActor actor = null;
    private MonobehavState state = MonobehavState.STOP;

    public boolean isRunning() {
        return this.state == MonobehavState.RUNNING;
    }

    private enum MonobehavState{
        RUNNING,
        STOP
    }

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

        //System.out.println(eventType);

    }

    public final Class<T> getEventType() {
        return eventType;
    }

    public final void dispatchEvent(MonobehaviourEvent event) {
        if (!eventType.isInstance(event)) {
            throw new IllegalStateException("Wrong event type: " + event.getClass());
        }
        start(eventType.cast(event));
        this.state = MonobehavState.RUNNING;
    }

    public abstract void start(T event);
    public abstract void update(List<MonobehaviourEvent> event);

    public void stopMonobehav(){
        this.state = MonobehavState.STOP;
    }

    public void runMonobehav(){
        this.state = MonobehavState.RUNNING;
    }

    public @NotNull PhysicsEngine getPhysicsEngine(){
        return this.actor.engine;
    }

    public MonobehaviourActor getActor(){
        return this.actor;
    }

    public void setParentNode(MonobehaviourActor actor) {
        this.actor = actor;
    }
}