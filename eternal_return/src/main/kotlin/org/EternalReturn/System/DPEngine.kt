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

    protected abstract fun update();

    public fun registerMonobehaviourActor(actor : MonobehaviourActor){
        monobehaviourActorList.add(actor);
        actor.setDPEngine(this);
    }
    /**
     * 플레이어의 위치벡터 + 방향벡터를 얻어온다.
     * No Scoping
     * */
    public fun getDir(entity: Entity) : Vector3{
        val location = entity.location
        val rotX = location.yaw.toDouble()
        val rotY = location.pitch.toDouble()
        val radX = Math.toRadians(rotX)
        val radY = Math.toRadians(rotY)
        val xz = cos(radY)
        return vec3(-xz * sin(radX), -sin(radY), xz * cos(radX))
    }

    public fun getPos(entity: Entity) : Vector3{
        val location = entity.location
        return vec3(location.x, location.y, location.z)
    }

    public fun getDirNPos(dirOut: Vector3, posOut: Vector3, player: Player){
        val location = player.location
        val rotX = location.yaw.toDouble()
        val rotY = location.pitch.toDouble()
        val radX = Math.toRadians(rotX)
        val radY = Math.toRadians(rotY)
        val xz = cos(radY)
        assign(dirOut, -xz * sin(radX), -sin(radY), xz * cos(radX))
        assign(posOut, location.x, location.y, location.z)
    }

}