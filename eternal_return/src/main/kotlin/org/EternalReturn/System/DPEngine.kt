package org.EternalReturn.System

import org.EternalReturn.ERAnimal.ERAnimal
import org.EternalReturn.ERPlayer.ERPlayer
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntity
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntityManager
import org.EternalReturn.Util.physics.Geometry.Cylinder
import org.EternalReturn.Util.physics.Geometry.InfStraightLine
import org.EternalReturn.Util.physics.Geometry.PhysicsEngine
import org.bukkit.entity.Entity
import org.bukkit.entity.Player
import java.util.ArrayList
import kotlin.math.cos
import kotlin.math.sin

/**
 * Made by Danpung (TDanfung) 
 * 기본적 엔진
 * */
abstract class DPEngine : PhysicsEngine, Runnable {

    constructor() : super()
    constructor(bufferSize : Int) : super(bufferSize)

    private val erPlayerHashMap: HashMap<Player, ERPlayer> = SystemManager.getERPlayerHashMap()
    private val leftClickers: ArrayList<ERPlayer> = ArrayList<ERPlayer>()
    private var leftClickersStackIdx : Int = 0


    abstract fun erPlayerTick(erPlayer: ERPlayer);

    abstract fun ajEntityTick(ajEntity: AJEntity);

    abstract fun forRightClickers(erPlayer : ERPlayer);

    override fun run() {
        
        //각 erPlayer에 대해 틱 업데이트
        for (erPlayer in SystemManager.getERPlayerList()) {
            erPlayerTick(erPlayer);
        }

        //좌클릭한 유저 위치에서 레이캐스팅 실시
        for (idx in 0..leftClickersStackIdx - 1) {
            setVecScope().use{
                forRightClickers(leftClickers[idx]);
            }
        }

        leftClickersStackIdx = 0
        //ajEntity 업데이트
        for (ajEntity in AJEntityManager.getAjEntities()) {
            ajEntityTick(ajEntity);
        }

    }

    protected fun rayCheckWithERAnimal(erPlayer: ERPlayer, erAnimal : ERAnimal) : Boolean{

        val pPos: Vector3 = vec3();
        val pDir: Vector3 = vec3();
        getDirNPos(pDir,pPos,erPlayer.player);

        val pRay = InfStraightLine(x(pDir), y(pDir), z(pDir), x(pPos), y(pPos) + 1.75, z(pPos))
        val collider = erAnimal.collider

        if(collider !is Cylinder){
            System.out.println("This collider is not Cylinder!");
            return false;
        }

        val animalPos : Vector3 = getPos(erAnimal.actor);
        collider.setPosition(x(animalPos), y(animalPos), z(animalPos));

        val poi: Vector3 = vec3();
        val bool = fgetIntersectPoint(poi, pRay, collider);
        return bool;
    }

    protected fun rayCheckWithERPlayer(erPlayer: ERPlayer, victimPlayer : ERPlayer) : Boolean{
        return true;
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

    public fun appendLeftClickedPlayer(player: ERPlayer) {
        leftClickers.add(player)
        leftClickersStackIdx++
    }


}