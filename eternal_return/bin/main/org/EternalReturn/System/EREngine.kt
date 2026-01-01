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

        for (ajEntity in AJEntityManager.getAjEntities()) {
            if (ajEntity !is ERAnimal) {
                continue
            }

            val animal = ajEntity
            animal.script()
        }
    }


    private fun physicsDebug(erPlayer: ERPlayer, p: Player, tags: MutableSet<String>) {
        setVecScope().use {
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

                val dir: Vector3 = vec3()
                val pos: Vector3 = vec3()
                getDirNPos(dir, pos, p.getLocation())

                val playerRay = InfStraightLine(x(dir), y(dir), z(dir), x(pos), y(pos) + 1.75, z(pos))

                val poi: Vector3 = vec3()
                val s = System.nanoTime()
                val intersect = getIntersectPoint(poi, playerRay, cylinder)
                p.sendMessage((System.nanoTime() - s).toString() + " ns passed with intersect = " + intersect)
            }
        }
    }

    private fun getDirNPos(dirOut: Vector3, posOut: Vector3, location: Location) {
        setVecScope().use {
            val rotX = location.getYaw().toDouble()
            val rotY = location.getPitch().toDouble()
            val radX = Math.toRadians(rotX)
            val radY = Math.toRadians(rotY)
            val xz = cos(radY)
            val dir: Vector3 = vec3(-xz * sin(radX), -sin(radY), xz * cos(radX))
            norm(dirOut, dir)
            val pos: Vector3 = vec3(location.getX(), location.getY(), location.getZ())
            assign(posOut, pos)
        }
    }
}