package org.EternalReturn.System

import org.EternalReturn.Util.Behaviour.MonobehaviourActor
import org.EternalReturn.Util.physics.Geometry.GeometryEngine

/**
 * Made by Danpung (TDanfung)
 * 기본적 엔진
 * */
abstract class DPEngine : GeometryEngine, Runnable {

    constructor() : super()
    constructor(bufferSize : Int) : super(bufferSize)

    private val monobehaviourActorList = ArrayList<MonobehaviourActor>();

    override fun run() {
        for(actor in monobehaviourActorList){
            actor.tick();
        }
        update();
    }

    fun getMonobehavActors() : MutableList<MonobehaviourActor>{
        return monobehaviourActorList;
    }

    protected abstract fun update();

    public fun registerMonobehaviourActor(actor : MonobehaviourActor){
        monobehaviourActorList.add(actor);
        actor.setDPEngine(this);
    }

}