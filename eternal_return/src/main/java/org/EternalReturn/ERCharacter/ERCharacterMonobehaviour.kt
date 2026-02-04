package org.EternalReturn.ERCharacter

import org.EternalReturn.ERCharacter.Event.CharacterEvent
import org.EternalReturn.EREntity.EREntityMonobehaviour
import org.EternalReturn.ERPlayer.ERPlayer
import org.EternalReturn.ERPlayer.ERPlayerListener
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourActor
import org.bukkit.entity.LivingEntity
import org.bukkit.entity.Player

abstract class ERCharacterMonobehaviour<T : CharacterEvent> : EREntityMonobehaviour<T>() {
    private lateinit var erCharacter: ERCharacter
    private lateinit var erPlayer: ERPlayer
    private lateinit var player: Player

    private fun __init() {
        if (this.actor !is ERCharacter) {
            throw ClassCastException("Actor가 ERCharacter가 아닙니다.")
        }
        erCharacter = this.actor as ERCharacter
        erPlayer = erCharacter.getERPlayer()
        player = erPlayer.player
    }

    protected fun getERCharacter(): ERCharacter{
        __init();
        return erCharacter;
    }

    protected fun getERPlayer() : ERPlayer{
        __init();
        return erPlayer;
    }

    protected fun getPlayer(): Player {
        __init()
        return player
    }

    protected fun damage(attacker: Player, victim: LivingEntity, dmg: Double) {
        ERPlayerListener.addAPIAttacker(attacker)
        victim.damage(dmg, attacker)
    }

    fun getMonobehavActorList() : MutableList<MonobehaviourActor>{
        return dpEngine.monobehaviourModule.getMonobehavActors();
    }

}