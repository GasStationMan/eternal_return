package org.EternalReturn.Util.Behaviour;


import org.EternalReturn.Util.physics.Geometry.GeometryCalculatable;
import org.EternalReturn.Util.physics.Geometry.MatVecCalculator;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;



/**
 * 대부분의 수정 사항은 MonobehaviourActor.registerMonobehaviour()에서 이루어짐.
 * */
public abstract class Monobehaviour<T extends MonobehaviourEvent> extends GeometryCalculatable {

    protected Class<T> eventType;
    protected MonobehaviourActor actor = null;
    private MonobehavState state = MonobehavState.STOP;

    public boolean isRunning() {
        return this.state == MonobehavState.RUNNING;
    }
    
    /**
     * RUNNING : update가 실행되는 상태
     * STOP : update가 종료된 상태
     * */
    private enum MonobehavState{
        RUNNING,
        STOP
    }

    /**
     * MonobehaiourActor.registerMonobehaviour()의 인자로 넣기 위해서만 instantiate할 것.
     * */
    protected Monobehaviour() {
        super(null);
        __getGenericClass();
    }

    @SuppressWarnings("unchecked")
    private void __getGenericClass(){
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
        startMonobehav(eventType.cast(event));
        this.state = MonobehavState.RUNNING;
    }

    public void startMonobehav(T event){
        try(MatVecCalculator.VecScope scope = actor.engine.setVecScope()){
            start(event);
        }//여기서 update()에 사용되었던 임시 벡터들이 모두 free됨.
    }

    public void updateMonobehav(List<MonobehaviourEvent> eventList){
        try(MatVecCalculator.VecScope scope = actor.engine.setVecScope()){
            update(eventList);
        }//여기서 update()에 사용되었던 임시 벡터들이 모두 free됨.
    }

    public abstract void start(T event);
    public abstract void update(List<MonobehaviourEvent> eventList);

    public void stopMonobehav(){
        this.state = MonobehavState.STOP;
    }

    public void runMonobehav(){
        this.state = MonobehavState.RUNNING;
    }

    public MonobehaviourActor getActor(){
        return this.actor;
    }

    public void setMonobehaviourActor(MonobehaviourActor actor) {
        this.actor = actor;
    }
}