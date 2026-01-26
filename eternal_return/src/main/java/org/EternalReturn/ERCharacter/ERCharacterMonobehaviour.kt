package org.EternalReturn.ERCharacter

import org.EternalReturn.ERCharacter.Event.CharacterEvent
import org.EternalReturn.EREntity.EREntityMonobehaviour
import org.EternalReturn.ERPlayer.ERPlayer
import org.EternalReturn.ERPlayer.ERPlayerListener
import org.EternalReturn.Util.DPEngine.DPEngine
import org.EternalReturn.Util.DPEngine.Behaviour.Monobehaviour
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourActor
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourEvent
import org.EternalReturn.Util.DPEngine.Geometry.Vector3
import org.bukkit.entity.Entity
import org.bukkit.entity.LivingEntity
import org.bukkit.entity.Player
import kotlin.math.cos
import kotlin.math.sin

abstract class ERCharacterMonobehaviour<T : CharacterEvent> : EREntityMonobehaviour<T>() {
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



}