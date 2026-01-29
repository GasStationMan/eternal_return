package org.EternalReturn.Util.DPEngine.behaviour

import org.EternalReturn.Util.DPEngine.DPEngine

class MonobehaviourModule(val dpEngine: DPEngine) {

    private val monobehaviourActorList = ArrayList<MonobehaviourActor>();

    /**
     * 이벤트가 dispatch된 순서대로 MonobehaviourActor을 추가함.
     * 해당 LinkedList는 run() 내에서 앞에서부터 순서대로 소비됨.
     * */
    private val eventTriggeredActors = ArrayDeque<MonobehaviourActor>();

    /**
     * Running 중인 Monobehaviour을 소유한 MonobehaviourActor를 유지함.
     * */
    private var runningActors = ArrayDeque<MonobehaviourActor>();

    /**
     * 이벤트를 dispatch하고, Monobehaviour들을 업데이트함. <br>
     * 이벤트가 dispatch된 actor들은 기본적으로 runningActors Deque에 삽입.
     * runningActors에서 더 이상 update할 Monobehaviour가 남지 않은 actor의 경우 제거.
     * (즉 실행될 여지가 남아있는 경우, 추가하고 그렇지 않은 경우 추가하지 않음.)
     * */
    fun updateMonobehaviourActors() {

        while (eventTriggeredActors.isNotEmpty()) {
            val actor = eventTriggeredActors.removeFirst();
            //update() 하는 Monobehaviour이 있는가?
            if(actor.isEmptyForRunningMonobehaviour){
                runningActors.addLast(actor);
            }
            actor.dispatchEvents();
        }

        val newRunningActors = ArrayDeque<MonobehaviourActor>()
        while(runningActors.isNotEmpty()){
            val actor = runningActors.removeFirst();
            val hasRunningMonobehav = actor.updateMonobehaviour();
            //여기도 isEmptyForRunningMonobehaviour() 써도 되긴 하는데, 일부러 안 건드림.
            //아무래도 메소드 한번 호출보다야 이미 저장된 값 쓰는 게 더 빠를 테니까.
            if(hasRunningMonobehav){
                newRunningActors.addLast(actor);
            }
        }
        this.runningActors = newRunningActors;
    }

    fun getMonobehavActors() : MutableList<MonobehaviourActor>{
        return monobehaviourActorList;
    }

    fun submitActorWhoTriggeredEvent(actor : MonobehaviourActor){
        eventTriggeredActors.add(actor);
    }

    fun registerMonobehaviourActor(actor : MonobehaviourActor){
        //println("Registering : " + actor.javaClass)
        monobehaviourActorList.add(actor);
        actor.setModule(this);
    }

}