package org.EternalReturn.System

import org.EternalReturn.ERAnimal.ERAnimal
import org.EternalReturn.ERPlayer.ERPlayer
import org.EternalReturn.System.ERAnimalSystem.ERAnimalManager
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

    private val erPlayerHashMap: HashMap<Player, ERPlayer> = SystemManager.getERPlayerHashMap();
    private val leftClickers = arrayOfNulls<ERPlayer>(64);
    private var leftClickersStackIdx : Int = 0


    abstract fun erPlayerTick(erPlayer: ERPlayer);

    abstract fun erAnimalTick(animal: ERAnimal);

    abstract fun forRightClickers(erPlayer : ERPlayer);

    override fun run() {
        
        //각 erPlayer에 대해 틱 업데이트
        for (erPlayer in erPlayerHashMap.values) {
            erPlayerTick(erPlayer);
        }

        //좌클릭한 유저 위치에서 레이캐스팅 실시
        for (i in 0 until leftClickersStackIdx) {
            setVecScope().use{
                forRightClickers(leftClickers[i]!!);
            }
        }

        leftClickersStackIdx = 0
        //ajEntity 업데이트
        ERAnimalManager.animalRenderDistanceManage(64);
        for (animal in ERAnimalManager.getERAnimalList()) {
            if(animal.isShown()){
                erAnimalTick(animal);
            }
        }



    }

    protected fun rayCheckWithERAnimal(erPlayer: ERPlayer, erAnimal : ERAnimal) : Boolean{

        if(!erAnimal.isShown){
            return false;
        }

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

    /**
     * @EventHandler 어노테이션 된 함수를 통해서만 호출할 것.
     * */
    public fun submitLeftClickerByEvent(player: ERPlayer) {
        leftClickers[leftClickersStackIdx++] = player;
    }

}