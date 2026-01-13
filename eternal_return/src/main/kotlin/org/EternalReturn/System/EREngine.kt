package org.EternalReturn.System

import org.EternalReturn.ERAnimal.Alpha
import org.EternalReturn.ERAnimal.ERAnimal
import org.EternalReturn.ERPlayer.ERPlayer
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntityManager
import org.EternalReturn.Util.Physics.Geometry.Cylinder
import org.EternalReturn.Util.Physics.Geometry.InfStraightLine
import org.EternalReturn.Util.Physics.Geometry.PhysicsEngine
import org.bukkit.Location
import org.bukkit.entity.Entity
import org.bukkit.entity.Player
import java.util.ArrayList
import java.util.Objects
import kotlin.math.cos
import kotlin.math.sin

class EREngine : PhysicsEngine, Runnable {

    constructor() : super()
    constructor(bufferSize : Int) : super(bufferSize)

    private val erPlayerHashMap: HashMap<Player, ERPlayer> = SystemManager.getERPlayerHashMap()
    private val leftClickers: ArrayList<ERPlayer> = ArrayList<ERPlayer>()
    private var leftClickersStackIdx : Int = 0


    override fun run() {
        
        for (erPlayer in SystemManager.getERPlayerList()) {
            val p = erPlayer.player;
            val tags = p.scoreboardTags;
            erPlayer.skill.update();
            erPlayer.motionManager.update(erPlayer, tags);

            if(erPlayer.character == null){
                continue;
            }

            erPlayer.character.script();
            //physicsDebug(erPlayer, p, tags);
        }

        //좌클릭한 유저 위치에서 레이캐스팅 실시
        for (idx in 0..leftClickersStackIdx - 1) {
            setVecScope().use{
                val erPlayer : ERPlayer = leftClickers.get(idx);

                //좌클릭 대상이 AJEntity인지 아닌지 체크
                for (ajEntity in AJEntityManager.getAjEntities()) {
                    if (ajEntity !is ERAnimal) {
                        continue;
                    }

                    val animal = ajEntity;
                    if(rayCheckWithERAnimal(erPlayer, animal)){
                        animal.setHit();
                        break;
                    }
                }


                //좌클릭 대상이 플레이어인지 아닌지 체크
                for(victimPlayer : ERPlayer in erPlayerHashMap.values){
                    if(victimPlayer == erPlayer){ //포인터 비교로 일단 퉁칠거임
                        continue;
                    }

                    rayCheckWithERPlayer(erPlayer, victimPlayer);
                }
            }
        }

        leftClickersStackIdx = 0
        //ajEntity 업데이트
        for (ajEntity in AJEntityManager.getAjEntities()) {
            if (ajEntity !is ERAnimal) {
                continue;
            }
            val animal = ajEntity;
            //회전 디버깅.
            rotationDebug(animal.rootEntity);
            animal.script();
        }



    }

    private fun rayCheckWithERAnimal(erPlayer: ERPlayer, erAnimal : ERAnimal) : Boolean{

        val pPos: Vector3 = vec3();
        val pDir: Vector3 = vec3();
        getDirNPos(pDir,pPos,erPlayer.player);

        val pRay = InfStraightLine(x(pDir), y(pDir), z(pDir), x(pPos), y(pPos) + 1.75, z(pPos))
        val collider = erAnimal.collider

        if(collider !is Cylinder){
            System.out.println("This collider is not Cylinder!");
            return false;
        }

        val poi: Vector3 = vec3();
        val bool = getIntersectPoint(poi, pRay, collider);
        return bool;
    }

    private fun rayCheckWithERPlayer(erPlayer: ERPlayer, victimPlayer : ERPlayer){

    }

    private fun rotationDebug(entity : Entity){
        val tagSet = entity.scoreboardTags
        if(tagSet.contains("rot")){
            tagSet.remove("rot");
            println("rotating!");
            val location : Location = entity.location;
            location.yaw += 45.0f;
            //entity.teleport(location); //무조건 이렇게 하거나
            entity.setRotation(location.yaw + 1.0f, location.pitch); //이게 리소스면에서는 좋음
        }
    }

    private fun physicsDebug(erPlayer: ERPlayer, p: Player, tags: MutableSet<String>) {
        if (!tags.contains("ray")) {
            return
        }
        tags.remove("ray")
        for (animal in AJEntityManager.getAjEntities()) {
            if (animal !is Alpha) {
                continue
            }

            val alpha = animal
            if (alpha.getCollider() !is Cylinder) {
                continue
            }

            val cylinder = alpha.getCollider() as Cylinder

            setVecScope().use {
                val dir: Vector3 = vec3()
                val pos: Vector3 = vec3()
                getDirNPos(dir, pos, p)

                val playerRay = InfStraightLine(x(dir), y(dir), z(dir), x(pos), y(pos) + 1.75, z(pos))
                val poi: Vector3 = vec3()
                val s = System.nanoTime()
                val intersect = getIntersectPoint(poi, playerRay, cylinder)
                p.sendMessage((System.nanoTime() - s).toString() + " ns passed with intersect = " + intersect)
            }
        }
    }

    /**
     * 플레이어의 위치벡터 + 방향벡터를 얻어온다.
     * No Scoping
     * */
    public fun getDir(player: Player) : Vector3{
        val location = player.getLocation()
        val rotX = location.getYaw().toDouble()
        val rotY = location.getPitch().toDouble()
        val radX = Math.toRadians(rotX)
        val radY = Math.toRadians(rotY)
        val xz = cos(radY)
        return vec3(-xz * sin(radX), -sin(radY), xz * cos(radX))
    }

    public fun getPos(player: Player) : Vector3{
        val location = player.getLocation()
        return vec3(location.getX(), location.getY(), location.getZ())
    }

    public fun getDirNPos(dirOut: Vector3, posOut: Vector3, player: Player){
        val location = player.getLocation()
        val rotX = location.getYaw().toDouble()
        val rotY = location.getPitch().toDouble()
        val radX = Math.toRadians(rotX)
        val radY = Math.toRadians(rotY)
        val xz = cos(radY)
        assign(dirOut, -xz * sin(radX), -sin(radY), xz * cos(radX))
        assign(posOut, location.getX(), location.getY(), location.getZ())
    }

    public fun appendLeftClickedPlayer(player: ERPlayer) {
        leftClickers.add(player)
        leftClickersStackIdx++
    }


}