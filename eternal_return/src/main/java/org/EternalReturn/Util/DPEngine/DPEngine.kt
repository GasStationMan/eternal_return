package org.EternalReturn.Util.DPEngine

import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourActor
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourEvent
import org.EternalReturn.Util.DPEngine.Geometry.GeometryEngine
import java.util.LinkedList

/**
 * Made by Danpung (TDanfung)
 * 기본적 엔진
 * */
abstract class DPEngine : GeometryEngine, Runnable {

    constructor() : super()
    constructor(bufferSize : Int) : super(bufferSize)

    private val monobehaviourActorList = ArrayList<MonobehaviourActor>();

    /**
     * 이벤트가 dispatch된 순서대로 MonobehaviourActor을 추가함.
     * 해당 LinkedList는 run() 내에서 앞에서부터 순서대로 소비됨.
     * */
    private val eventTriggeredActors = ArrayDeque<MonobehaviourActor>();




    /**
     * 이벤트를 dispatch하고, Monobehaviour들을 업데이트함. <br>
     *  - 디스패치는 먼저 들어온 순서대로, <br>
     *  - 업데이트는 이미 정해진 순서대로 <br>
     *  처리.
     * */
    override fun run() {

        while (eventTriggeredActors.isNotEmpty()) {
            val actor = eventTriggeredActors.removeFirst()
            actor.dispatchEvents()
        }

        for(actor in monobehaviourActorList){
            actor.updateMonobehaviour();
        }

        update();
    }

    fun getMonobehavActors() : MutableList<MonobehaviourActor>{
        return monobehaviourActorList;
    }

    protected abstract fun update();

    fun submitActorWhoTriggeredEvent(actor : MonobehaviourActor){
        eventTriggeredActors.add(actor);
    }

    fun registerMonobehaviourActor(actor : MonobehaviourActor){
        //println("Registering : " + actor.javaClass)
        monobehaviourActorList.add(actor);
        actor.setDPEngine(this);
    }

}