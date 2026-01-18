package org.EternalReturn.ERCharacter;

import org.EternalReturn.ERCharacter.Event.CharacterEvent;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.ERPlayer.ERPlayerListener;
import org.EternalReturn.Util.Monobehaviour.Monobehaviour;
import org.EternalReturn.Util.Monobehaviour.MonobehaviourEvent;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;

import java.util.List;

public abstract class ERCharacterMonobehaviour<T extends CharacterEvent> extends Monobehaviour<T> {

    private ERCharacter erCharacter;
    private ERPlayer erPlayer;
    private Player player;

    private void __init(){
        if(erCharacter != null){
            return;
        }
        if(!(this.actor instanceof ERCharacter)){
            throw new ClassCastException("Actor가 ERCharacter가 아닙니다.");
        }
        erCharacter = (ERCharacter)this.actor;
        erPlayer = erCharacter.getERPlayer();
        player = erPlayer.getPlayer();
    }

    protected ERCharacter getERCharacter(){
        __init();
        return erCharacter;
    }

    protected ERPlayer getERPlayer(){
        __init();
        return erPlayer;
    }

    protected Player getPlayer(){
        __init();
        return player;
    }

    protected void damage(Player attacker, LivingEntity victim, double dmg){
        ERPlayerListener.addAPIAttacker(attacker);
        victim.damage(dmg, attacker);
    }


    protected boolean isNotEnd(long startTime, long durationTicks){
        return System.currentTimeMillis() - startTime < durationTicks * 50;
    }


    @Override
    public abstract void start(T event);

    @Override
    public abstract void update(List<MonobehaviourEvent> event);
}
