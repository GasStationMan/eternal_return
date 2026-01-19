package org.EternalReturn.System

import org.EternalReturn.ERAnimal.ERAJEntity
import org.EternalReturn.ERPlayer.ERPlayer
import org.EternalReturn.ERAnimal.ERAnimalManager
import org.EternalReturn.Util.Monobehaviour.MonobehaviourActor
import org.EternalReturn.Util.physics.Geometry.Cylinder
import org.EternalReturn.Util.physics.Geometry.InfStraightLine
import org.EternalReturn.Util.physics.Geometry.PhysicsEngine
import org.bukkit.entity.Entity
import org.bukkit.entity.Player
import kotlin.math.cos
import kotlin.math.sin

/**
 * Made by Danpung (TDanfung) 
 * 기본적 엔진
 * */
abstract class DPEngine : PhysicsEngine, Runnable {

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