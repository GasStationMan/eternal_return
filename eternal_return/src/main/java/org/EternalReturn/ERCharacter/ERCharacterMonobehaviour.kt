package org.EternalReturn.ERCharacter

import org.EternalReturn.ERCharacter.Event.CharacterEvent
import org.EternalReturn.ERPlayer.ERPlayer
import org.EternalReturn.ERPlayer.ERPlayerListener
import org.EternalReturn.System.DPEngine
import org.EternalReturn.Util.Behaviour.Monobehaviour
import org.EternalReturn.Util.Behaviour.MonobehaviourActor
import org.EternalReturn.Util.Behaviour.MonobehaviourEvent
import org.EternalReturn.Util.physics.Geometry.Vector3
import org.bukkit.entity.Entity
import org.bukkit.entity.LivingEntity
import org.bukkit.entity.Player
import kotlin.math.cos
import kotlin.math.sin

abstract class ERCharacterMonobehaviour<T : CharacterEvent> : Monobehaviour<T>() {
    private var erCharacter: ERCharacter? = null
    private var erPlayer: ERPlayer? = null
    private var player: Player? = null

    private fun __init() {
        if (erCharacter != null) {
            return
        }
        if (this.actor !is ERCharacter) {
            throw ClassCastException("Actor가 ERCharacter가 아닙니다.")
        }
        erCharacter = this.actor as ERCharacter
        erPlayer = erCharacter!!.getERPlayer()
        player = erPlayer!!.player
    }

    protected fun getERCharacter(): ERCharacter?{
        __init();
        return erCharacter;
    }

    protected fun getERPlayer() : ERPlayer{
        __init();
        return erPlayer!!;
    }

    protected fun getPlayer(): Player? {
        __init()
        return player
    }

    protected fun damage(attacker: Player, victim: LivingEntity, dmg: Double) {
        ERPlayerListener.addAPIAttacker(attacker)
        victim.damage(dmg, attacker)
    }


    protected fun isNotEnd(startTime: Long, durationTicks: Long): Boolean {
        return System.currentTimeMillis() - startTime < durationTicks * 50
    }




    /**
     * 플레이어의 위치벡터 + 방향벡터를 얻어온다.
     * No Scoping
     */
    fun getDir(entity: Entity): Vector3 {
        val location = entity.location
        val radX = Math.toRadians(location.yaw.toDouble())
        val radY = Math.toRadians(location.pitch.toDouble())
        val xz = cos(radY)
        return vec3(-xz * sin(radX), -sin(radY), xz * cos(radX));
    }

    fun getPos(entity: Entity): Vector3 {
        val location = entity.location
        return vec3(location.x, location.y, location.z)
    }

    fun getMonobehavActorList() : MutableList<MonobehaviourActor>{
        return (geometryEngine as DPEngine).getMonobehavActors();
    }

    abstract override fun start(event: T)

    abstract override fun update(event: MutableList<MonobehaviourEvent>)
}