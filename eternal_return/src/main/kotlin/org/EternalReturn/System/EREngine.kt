package org.EternalReturn.System

import org.EternalReturn.System.ERAnimal.Alpha
import org.EternalReturn.System.ERAnimal.ERAnimal
import org.EternalReturn.System.ERPlayer.ERPlayer
import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntityManager
import org.EternalReturn.Util.Physics.Geometry.Cylinder
import org.EternalReturn.Util.Physics.Geometry.InfStraightLine
import org.EternalReturn.Util.Physics.Geometry.PhysicsEngine
import org.bukkit.Location
import org.bukkit.World
import org.bukkit.entity.Marker
import org.bukkit.entity.Player
import kotlin.math.cos
import kotlin.math.sin

class EREngine : PhysicsEngine, Runnable {

    constructor() : super()
    constructor(bufferSize : Int) : super(bufferSize)

    private val erPlayerHashMap: HashMap<Player, ERPlayer>
    private val markerList: MutableList<Marker>
    private val currentWorld: World? = null

    init {
        erPlayerHashMap = SystemManager.getERPlayerHashMap()
        markerList = ArrayList<Marker>()
    }

    override fun run() {
        for (erPlayer in erPlayerHashMap.values) {
            val p = erPlayer.getPlayer()
            val tags = p.getScoreboardTags()
            erPlayer.getSkill().update()
            erPlayer.getMotionManager().update(erPlayer, tags)
            physicsDebug(erPlayer, p, tags)
        }
        
        //ajEntity 업데이트
        for (ajEntity in AJEntityManager.getAjEntities()) {
            if (ajEntity !is ERAnimal) {
                continue
            }

            val animal = ajEntity
            animal.script()
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


}